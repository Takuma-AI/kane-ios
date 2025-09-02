# Plaid Native SDK Implementation Guide for KANE

## Overview

This guide provides complete implementation instructions for integrating Plaid's native iOS SDK into the KANE Hotwire Native app. This replaces the problematic web-based OAuth flow with a fully native solution that maintains session state and provides better UX.

## Why Native SDK Over Web OAuth

1. **Session Persistence**: Web OAuth loses session when redirecting between SFSafariViewController and WKWebView
2. **Better UX**: Native UI for all banks, no browser redirects
3. **Unified Flow**: Same experience for OAuth and non-OAuth banks
4. **Reliability**: No redirect URI configuration issues

## Architecture Overview

### Division of Responsibilities

**Native iOS Handles:**
- Opening Plaid Link SDK UI
- User authentication flow (including OAuth)
- Returning public token to Rails

**Rails Server Handles:**
- Creating link tokens
- Exchanging public tokens for access tokens
- Storing encrypted access tokens
- Fetching transactions
- All business logic

**Bridge Component:**
- Passes messages between JavaScript and native
- Maintains stateless communication
- Uses proper Hotwire Native patterns

## Implementation Steps

### 1. Fix the Button Action Binding

The button needs the correct `data-action` attribute:

```erb
<!-- app/views/connect/index.html.erb -->
<button type="button"
        id="connect-button"
        class="connect-button"
        data-bridge--plaid-link-target="connectButton"
        data-connect-target="button"
        data-action="click-><%= hotwire_native_app? ? 'bridge--plaid-link' : 'connect' %>#handleClick"
        disabled>
  Connect
</button>
```

This ensures:
- Native app calls `bridge--plaid-link#handleClick`
- Web browser calls `connect#handleClick`

### 2. Implement the JavaScript Bridge Controller

```javascript
// app/javascript/controllers/bridge/plaid_link_controller.js
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
  
  async initializePlaidLink() {
    console.log("PlaidLinkController: Fetching link token")
    
    try {
      const response = await fetch('/plaid/create_link_token', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      })
      
      const data = await response.json()
      
      if (data.link_token) {
        console.log("PlaidLinkController: Got link token")
        this.linkToken = data.link_token
        this.enableConnectButton()
      }
    } catch (error) {
      console.error('PlaidLinkController: Error initializing:', error)
    }
  }
  
  enableConnectButton() {
    if (this.hasConnectButtonTarget) {
      this.connectButtonTarget.disabled = false
    }
  }
  
  handleClick() {
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
    this.send("openPlaidLink", { linkToken: this.linkToken }, (data) => {
      console.log("PlaidLinkController: Received reply from native:", data)
      
      // Reset button
      if (this.hasConnectButtonTarget) {
        this.connectButtonTarget.textContent = "Connect"
        this.connectButtonTarget.disabled = false
      }
      
      // Handle the response
      if (data.publicToken) {
        this.handleSuccess(data)
      } else if (data.error) {
        this.showError(data.error.displayMessage || data.error.errorMessage || "Connection failed")
      } else if (data.exited) {
        console.log("PlaidLinkController: User exited Plaid Link")
      }
    })
  }
  
  handleSuccess(data) {
    const { publicToken, metadata } = data
    
    // Exchange public token with backend
    this.exchangePublicToken(publicToken, metadata)
  }
  
  async exchangePublicToken(publicToken, metadata) {
    try {
      const response = await fetch('/plaid/exchange_public_token', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ 
          public_token: publicToken,
          institution_name: metadata.institution.name,
          institution_id: metadata.institution.id
        })
      })
      
      if (response.ok) {
        // Navigate to next screen
        window.location.href = '/loading'
      }
    } catch (error) {
      console.error('PlaidLinkController: Error exchanging token:', error)
    }
  }
}
```

### 3. Implement the Native Bridge Component

```swift
// BridgeComponents/PlaidLinkComponent.swift
import HotwireNative
import LinkKit
import UIKit

final class PlaidLinkComponent: BridgeComponent {
    override class var name: String { "plaidLink" }
    
    override func onReceive(message: Message) {
        switch message.event {
        case "connect":
            // Bridge is ready
            reply(to: "connect")
            
        case "openPlaidLink":
            guard let data: OpenLinkData = message.data() else { return }
            openPlaidLink(with: data.linkToken)
            
        default:
            print("Unknown event: \(message.event)")
        }
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
            guard let viewController = delegate?.destination as? UIViewController else { return }
            handler.open(presentUsing: .viewController(viewController))
            
        case .failure(let error):
            let errorResponse = PlaidErrorResponse(error: error.localizedDescription)
            reply(to: "openPlaidLink", with: errorResponse)
        }
    }
    
    private func handlePlaidSuccess(_ success: LinkSuccess) {
        let successResponse = PlaidSuccessResponse(
            publicToken: success.publicToken,
            metadata: PlaidMetadata(
                institution: PlaidInstitution(
                    name: success.metadata.institution.name,
                    id: success.metadata.institution.id
                )
            )
        )
        
        reply(to: "openPlaidLink", with: successResponse)
    }
    
    private func handlePlaidExit(_ exit: LinkExit) {
        var exitResponse = PlaidExitResponse(exited: true)
        
        if let error = exit.error {
            exitResponse.error = PlaidError(
                errorMessage: error.errorMessage,
                displayMessage: error.localizedDescription
            )
        }
        
        reply(to: "openPlaidLink", with: exitResponse)
    }
}

// MARK: - Message Data Types
private extension PlaidLinkComponent {
    struct OpenLinkData: Decodable {
        let linkToken: String
    }
    
    // Response types must be Encodable
    struct PlaidSuccessResponse: Encodable {
        let publicToken: String
        let metadata: PlaidMetadata
    }
    
    struct PlaidMetadata: Encodable {
        let institution: PlaidInstitution
    }
    
    struct PlaidInstitution: Encodable {
        let name: String
        let id: String
    }
    
    struct PlaidExitResponse: Encodable {
        let exited: Bool
        var error: PlaidError?
    }
    
    struct PlaidError: Encodable {
        let errorMessage: String
        let displayMessage: String
    }
    
    struct PlaidErrorResponse: Encodable {
        let error: String
    }
}
```

### 4. Register the Bridge Component

```swift
// AppDelegate.swift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register bridge components
        Hotwire.registerBridgeComponents([
            PlaidLinkComponent.self
        ])
        
        return true
    }
}
```

### 5. Ensure Plaid SDK is Added to Project

In your `Package.swift` or via Xcode:
```swift
dependencies: [
    .package(url: "https://github.com/plaid/plaid-link-ios", from: "6.2.1")
]
```

## Critical Implementation Notes

### 1. Bridge Component API
- Use `reply(to:with:)` NOT `reply(to:data:)`
- The `with` parameter accepts Encodable types only
- Never use `[String: Any]` - always use proper Encodable structs

### 2. Message Flow
```
JavaScript sends → Native receives → Native performs action → Native replies → JavaScript callback
```
- Reply to the SAME event name
- Use different data to indicate success/error/exit

### 3. Error Handling
- Always handle SDK creation failure
- Provide user feedback for all states
- Reset button state on error

### 4. Testing Checklist
- [ ] Button enables after link token received
- [ ] Click opens native Plaid UI
- [ ] Success returns public token
- [ ] Token exchange works
- [ ] Navigation to /loading succeeds
- [ ] Exit/cancel resets button
- [ ] Error shows message

## Debugging Tips

### Console Logs to Check
1. Xcode Console:
   - "🚀 AppDelegate: Bridge components registered!"
   - "🔗 PlaidLinkComponent: Received event 'connect'"
   - "PlaidLinkComponent: Opening Plaid Link with token"

2. Safari Web Inspector:
   - "PlaidLinkController: Connected to bridge"
   - "PlaidLinkController: Got link token"
   - "PlaidLinkController: Connect button clicked"

### Common Issues
1. **Button doesn't enable**: Check if link token request succeeds
2. **Click does nothing**: Verify data-action attribute is correct
3. **Bridge not connected**: Check component registration in AppDelegate
4. **Reply fails**: Ensure using Encodable structs, not dictionaries

## Summary

This implementation:
- Maintains the same Rails backend
- Works for both web and native
- Handles all authentication types (OAuth included)
- Provides better UX with native UI
- Solves session persistence issues

The key is using Hotwire Native bridge components correctly with proper message passing patterns and Encodable types for responses.