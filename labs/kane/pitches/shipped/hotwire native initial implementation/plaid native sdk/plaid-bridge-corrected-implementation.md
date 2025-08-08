# Plaid Bridge Component - Corrected Implementation

Based on the compilation errors and API analysis, here's the corrected implementation that addresses all issues.

## Corrected Native Component (PlaidLinkComponent.swift)

```swift
import HotwireNative
import LinkKit
import UIKit

final class PlaidLinkComponent: BridgeComponent {
    override class var name: String { "plaidLink" }
    
    override func onReceive(message: Message) {
        print("🔗 PlaidLinkComponent: Received event '\(message.event)'")
        
        switch message.event {
        case "connect":
            handleConnect(message: message)
        case "openPlaidLink":
            handleOpenPlaidLink(message: message)
        default:
            print("PlaidLinkComponent: Unknown event '\(message.event)'")
        }
    }
    
    // MARK: - Private
    
    private func handleConnect(message: Message) {
        print("PlaidLinkComponent: Connected and ready")
        reply(to: "connect")
    }
    
    private func handleOpenPlaidLink(message: Message) {
        guard let data: OpenLinkData = message.data() else {
            print("PlaidLinkComponent: Failed to decode link token data")
            return
        }
        
        print("PlaidLinkComponent: Opening Plaid Link with token")
        openPlaidLink(with: data.linkToken)
    }
    
    private func openPlaidLink(with linkToken: String) {
        var configuration = LinkTokenConfiguration(
            token: linkToken,
            onSuccess: { [weak self] success in
                self?.handlePlaidSuccess(success)
            }
        )
        
        configuration.onExit = { [weak self] exit in
            self?.handlePlaidExit(exit)
        }
        
        let result = Plaid.create(configuration)
        
        switch result {
        case .success(let handler):
            guard let viewController = delegate?.destination as? UIViewController else {
                print("PlaidLinkComponent: No view controller available")
                return
            }
            handler.open(presentUsing: .viewController(viewController))
            
        case .failure(let error):
            print("PlaidLinkComponent: Error creating Plaid handler: \(error)")
            // CORRECTED: Use 'with' parameter label
            reply(to: "openPlaidLink", with: ["error": error.localizedDescription])
        }
    }
    
    private func handlePlaidSuccess(_ success: LinkSuccess) {
        print("PlaidLinkComponent: Plaid Link succeeded")
        
        // SIMPLIFIED: Only send properties we know exist
        let data: [String: Any] = [
            "publicToken": success.publicToken,
            "metadata": [
                "institution": [
                    "name": success.metadata.institution.name,
                    "id": success.metadata.institution.id
                ],
                // Remove accounts for now - we'll add back once we verify the structure
            ]
        ]
        
        // CORRECTED: Reply to the original event with success data
        reply(to: "openPlaidLink", with: data)
    }
    
    private func handlePlaidExit(_ exit: LinkExit) {
        print("PlaidLinkComponent: User exited Plaid Link")
        
        var data: [String: Any] = ["exited": true]
        
        // SIMPLIFIED: Only add error info if it exists, with verified properties
        if let error = exit.error {
            data["error"] = [
                // Remove rawValue calls until we verify the type
                "errorMessage": error.errorMessage,
                "displayMessage": error.localizedDescription
            ]
        }
        
        // CORRECTED: Reply to the original event with exit data
        reply(to: "openPlaidLink", with: data)
    }
}

// MARK: - Message Data Types

private extension PlaidLinkComponent {
    struct OpenLinkData: Decodable {
        let linkToken: String
    }
}
```

## Updated JavaScript Controller

Since we're replying to the same event with different data, we need to adjust the JavaScript pattern:

```javascript
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "plaidLink"
  static targets = ["connectButton"]
  
  connect() {
    super.connect()
    console.log("PlaidLinkController: Connected to bridge")
    
    // Notify native component we're ready
    this.send("connect", {}, () => {
      console.log("PlaidLinkController: Native component ready")
      this.initializePlaidLink()
    })
  }
  
  handleConnectClick() {
    console.log("PlaidLinkController: Connect button clicked")
    
    if (!this.linkToken) {
      console.error("PlaidLinkController: No link token available")
      return
    }
    
    // Update button state
    if (this.hasConnectButtonTarget) {
      this.connectButtonTarget.textContent = "Connecting..."
      this.connectButtonTarget.disabled = true
    }
    
    // Send message to native to open Plaid Link
    // The callback will be invoked when native replies
    this.send("openPlaidLink", { linkToken: this.linkToken }, (data) => {
      console.log("PlaidLinkController: Received reply from native:", data)
      
      // Reset button first
      if (this.hasConnectButtonTarget) {
        this.connectButtonTarget.textContent = "Connect"
        this.connectButtonTarget.disabled = false
      }
      
      // Handle the response based on what native sent
      if (data.publicToken) {
        // Success case
        this.handleSuccess(data)
      } else if (data.error) {
        // Error case
        this.showError(data.error.displayMessage || data.error.errorMessage || "Connection failed")
      } else if (data.exited) {
        // User exited without error
        console.log("PlaidLinkController: User exited Plaid Link")
      }
    })
  }
  
  handleSuccess(data) {
    console.log("PlaidLinkController: Success! Exchanging token...")
    
    const { publicToken, metadata } = data
    
    // Exchange public token with backend
    this.exchangePublicToken(publicToken, metadata)
  }
  
  // ... rest of the controller remains the same
}
```

## Key Changes Made

### 1. Fixed Reply Method Signatures
- Changed `reply(to: "error", data: [...])` to `reply(to: "error", with: [...])`
- This matches the actual BridgeComponent API

### 2. Simplified Plaid Data Handling
- Removed assumptions about Account type properties
- Removed rawValue calls on enums we haven't verified
- Only sending data we know exists

### 3. Single Event Reply Pattern
- Both success and exit reply to "openPlaidLink"
- JavaScript callback handles all cases in one place
- Cleaner than separate event methods

### 4. Removed Type Assumptions
- No longer assuming `exit.metadata` is optional
- No longer assuming enums have rawValue
- Will add properties back as we verify them

## Testing Strategy

1. **Start with minimal data** - Just publicToken and institution name
2. **Add properties incrementally** - Test each new property
3. **Log everything** - Understand the actual types
4. **Handle all cases** - Success, error, and user exit

## Next Steps to Verify Plaid Types

Once this compiles and runs, add logging to discover actual types:

```swift
private func handlePlaidSuccess(_ success: LinkSuccess) {
    // Debug logging to understand the actual structure
    print("Success metadata: \(success.metadata)")
    print("Institution: \(success.metadata.institution)")
    
    if let firstAccount = success.metadata.accounts.first {
        print("First account: \(firstAccount)")
        // Log its properties to understand the structure
    }
}
```

This approach ensures we're working with the actual API, not our assumptions about it.