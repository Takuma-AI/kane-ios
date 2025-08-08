# Plaid Native SDK - Correct Bridge Component Implementation

## Following Hotwire Native Best Practices

This implementation follows the patterns established in the Hotwire Native demo app and documentation.

## Complete Native Component (Swift)

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
        // Reply to let JavaScript know we're ready
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
            reply(to: "error", data: ["message": error.localizedDescription])
        }
    }
    
    private func handlePlaidSuccess(_ success: LinkSuccess) {
        print("PlaidLinkComponent: Plaid Link succeeded")
        
        // Prepare success data to send back to JavaScript
        let data: [String: Any] = [
            "publicToken": success.publicToken,
            "metadata": [
                "institution": [
                    "name": success.metadata.institution.name,
                    "id": success.metadata.institution.id
                ],
                "accounts": success.metadata.accounts.map { account in
                    [
                        "id": account.id,
                        "name": account.name,
                        "mask": account.mask ?? "",
                        "type": account.type.rawValue,
                        "subtype": account.subtype?.rawValue ?? ""
                    ]
                }
            ]
        ]
        
        // Send success event with data
        reply(to: "plaidSuccess", data: data)
    }
    
    private func handlePlaidExit(_ exit: LinkExit) {
        print("PlaidLinkComponent: User exited Plaid Link")
        
        var data: [String: Any] = [:]
        
        if let error = exit.error {
            data["error"] = [
                "errorCode": error.errorCode.rawValue,
                "errorMessage": error.errorMessage,
                "displayMessage": error.localizedDescription
            ]
        }
        
        if let metadata = exit.metadata {
            data["metadata"] = [
                "status": metadata.status?.rawValue ?? "unknown",
                "linkSessionId": metadata.linkSessionId,
                "requestId": metadata.requestId
            ]
        }
        
        // Send exit event with data
        reply(to: "plaidExit", data: data)
    }
}

// MARK: - Message Data Types

private extension PlaidLinkComponent {
    struct OpenLinkData: Decodable {
        let linkToken: String
    }
}
```

## Complete JavaScript Controller

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
  
  disconnect() {
    super.disconnect()
    console.log("PlaidLinkController: Disconnected from bridge")
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
      
      if (data.error) {
        console.error('Error creating link token:', data.error)
        this.showError(data.error)
        return
      }
      
      if (data.link_token) {
        console.log("PlaidLinkController: Got link token")
        this.linkToken = data.link_token
        this.enableConnectButton()
      }
    } catch (error) {
      console.error('PlaidLinkController: Error initializing:', error)
      this.showError('Failed to initialize bank connection')
    }
  }
  
  enableConnectButton() {
    if (this.hasConnectButtonTarget) {
      this.connectButtonTarget.disabled = false
      this.connectButtonTarget.addEventListener('click', (e) => {
        e.preventDefault()
        this.handleConnectClick()
      })
    }
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
    this.send("openPlaidLink", { linkToken: this.linkToken })
  }
  
  // Called by native component when Plaid succeeds
  plaidSuccess(data) {
    console.log("PlaidLinkController: Plaid succeeded", data)
    
    const { publicToken, metadata } = data
    
    // Exchange public token with backend
    this.exchangePublicToken(publicToken, metadata)
  }
  
  // Called by native component when user exits Plaid
  plaidExit(data) {
    console.log("PlaidLinkController: User exited Plaid", data)
    
    // Reset button state
    if (this.hasConnectButtonTarget) {
      this.connectButtonTarget.textContent = "Connect"
      this.connectButtonTarget.disabled = false
    }
    
    if (data.error) {
      console.error("PlaidLinkController: Plaid error:", data.error)
      this.showError(data.error.displayMessage || "Connection failed")
    }
  }
  
  // Called by native component on errors
  error(data) {
    console.error("PlaidLinkController: Error from native:", data)
    this.showError(data.message || "An error occurred")
    
    // Reset button state
    if (this.hasConnectButtonTarget) {
      this.connectButtonTarget.textContent = "Connect"
      this.connectButtonTarget.disabled = false
    }
  }
  
  async exchangePublicToken(publicToken, metadata) {
    console.log("PlaidLinkController: Exchanging public token")
    
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
          institution_id: metadata.institution.id,
          accounts: metadata.accounts
        })
      })
      
      if (response.ok) {
        console.log('PlaidLinkController: Token exchange successful')
        // Navigate to next screen
        window.location.href = '/loading'
      } else {
        console.error('PlaidLinkController: Token exchange failed')
        this.showError('Failed to save bank connection')
        
        // Reset button
        if (this.hasConnectButtonTarget) {
          this.connectButtonTarget.textContent = "Connect"
          this.connectButtonTarget.disabled = false
        }
      }
    } catch (error) {
      console.error('PlaidLinkController: Error exchanging token:', error)
      this.showError('Network error')
      
      // Reset button
      if (this.hasConnectButtonTarget) {
        this.connectButtonTarget.textContent = "Connect"
        this.connectButtonTarget.disabled = false
      }
    }
  }
  
  showError(message) {
    // You could show this in a toast, alert, or inline error message
    console.error("PlaidLinkController Error:", message)
    
    // For now, show in button
    if (this.hasConnectButtonTarget) {
      const originalText = this.connectButtonTarget.textContent
      this.connectButtonTarget.textContent = message
      
      setTimeout(() => {
        this.connectButtonTarget.textContent = originalText
      }, 3000)
    }
  }
}
```

## HTML View

```erb
<!-- app/views/connect/index.html.erb -->
<% content_for :title, "Connect" %>

<div class="kane-container kane-container--centered" 
     data-controller="<%= hotwire_native_app? ? 'bridge--plaid-link' : 'connect' %>">
  
  <button type="button"
          id="connect-button"
          class="connect-button"
          data-bridge--plaid-link-target="connectButton"
          disabled>
    Connect
  </button>
  
  <% if Rails.env.development? %>
    <div class="dev-info">
      <p>Native app: <%= hotwire_native_app? %></p>
      <p>Controller: <%= hotwire_native_app? ? 'bridge--plaid-link' : 'connect' %></p>
    </div>
  <% end %>
</div>

<% unless hotwire_native_app? %>
  <!-- Load Plaid Link for web browsers -->
  <script src="https://cdn.plaid.com/link/v2/stable/link-initialize.js"></script>
<% end %>
```

## CSS for Native Apps

```css
/* app/assets/stylesheets/native.css */

/* Hide loading states that native handles */
[data-bridge-components~="plaidLink"]
.plaid-loading-state {
  display: none !important;
}

/* Native-specific button styles */
[data-bridge-components~="plaidLink"]
.connect-button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}
```

## Key Differences from Original Implementation

1. **No UserDefaults** - Data flows through bridge replies
2. **Proper event names** - Following Hotwire conventions (camelCase events)
3. **Complete data passing** - All relevant data sent in replies
4. **Error handling** - Proper error states and user feedback
5. **Button state management** - Visual feedback during operations
6. **Graceful degradation** - Falls back to web implementation

## Testing the Implementation

1. **Verify bridge registration**:
   ```swift
   // In AppDelegate
   print("Registered components: \(Hotwire.registeredBridgeComponents)")
   ```

2. **Check message flow**:
   - Add console.log in JavaScript for all events
   - Add print statements in Swift for all messages
   - Verify data is passed correctly

3. **Test error cases**:
   - Invalid link token
   - User cancellation
   - Network errors

4. **Verify cleanup**:
   - Component disconnects properly
   - No memory leaks
   - Button state resets

## Common Pitfalls to Avoid

1. **Don't use side channels** - All data through bridge messages
2. **Don't store state** - Bridge components are stateless
3. **Don't assume timing** - Messages are asynchronous
4. **Don't skip error handling** - Users need feedback
5. **Don't forget web fallback** - Must work without native