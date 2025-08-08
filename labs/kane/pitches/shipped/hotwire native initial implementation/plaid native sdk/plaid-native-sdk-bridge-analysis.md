# Plaid Native SDK Bridge Component Analysis

## Problem Statement
The Kane iOS app successfully wraps the Rails web app using Hotwire Native, but the Plaid SDK integration via Bridge components is not working. The connect button appears but doesn't trigger the native Plaid SDK flow when tapped in the iOS app.

## First Principles of Bridge Components

### Core Architecture Understanding
Bridge components in Hotwire Native follow a **stateless message-passing architecture**:

1. **Web Layer (JavaScript)** → Sends messages via `window.webkit.messageHandlers`
2. **Native Bridge** → Routes messages to registered components
3. **Native Component** → Receives messages, performs native actions
4. **Response Flow** → Native calls back to JavaScript via `reply()`

### Key Constraint: Progressive Enhancement
Bridge components must **enhance, not replace** web functionality. The web layer remains authoritative for business logic and state management.

## Current Implementation Issues

### 1. Incorrect Reply Pattern
The current implementation violates the Hotwire Native bridge component pattern:

```swift
// PlaidLinkComponent.swift - INCORRECT PATTERN
private func handleSuccess(_ success: LinkSuccess, originalMessage: Message) {
    // Wrong: Using UserDefaults as a communication channel
    UserDefaults.standard.set(success.publicToken, forKey: "plaid_public_token")
    
    // Wrong: Not passing data back to JavaScript
    reply(to: "success")
}
```

The correct pattern requires:
1. **Pass data in the reply** - Use `reply(to:data:)` not UserDefaults
2. **JavaScript handles the callback** - The JS controller receives the data
3. **Maintain stateless architecture** - Bridge components don't store state

### 2. JavaScript Controller Pattern Issues
The JavaScript controller doesn't follow the established pattern:

```javascript
// Current implementation - INCORRECT
success() {
    // Trying to read from UserDefaults (won't work)
    const publicToken = this.getNativeValue('plaid_public_token')
}

// Should be:
success(data) {
    // Receive data passed from native reply
    const { publicToken, institutionName } = data
    this.handleSuccess({ publicToken, metadata: { institution: { name: institutionName } } })
}
```

### 3. Callback Pattern Misunderstanding
The implementation misunderstands how callbacks work in bridge components:

```javascript
// Current - callback is never invoked
this.send("openWithToken", { linkToken: this.linkToken })

// Should include a callback for the initial action
this.send("openWithToken", { linkToken: this.linkToken }, () => {
    // This callback is invoked when native calls reply()
    // But for Plaid SDK, we need different events for success/exit
})
```

## Root Cause Analysis

### The Core Issue: Mismatched Communication Pattern

Based on studying the Hotwire Native demo app and best practices:

1. **Bridge components are automatically connected** - Registration in AppDelegate is sufficient
2. **The framework handles message routing** - No manual WebView configuration needed
3. **The issue is in the implementation** - Not the framework setup

### Why It's Not Working

1. **Data isn't passed in replies** → JavaScript can't receive Plaid success data
2. **UserDefaults pattern is wrong** → JavaScript can't access native UserDefaults
3. **Callback pattern is incomplete** → Need separate events for success/exit, not a single callback

## Technical Implementation Plan

### Step 1: Fix the Reply Pattern in Native Component

```swift
// PlaidLinkComponent.swift - CORRECT PATTERN
private func handleSuccess(_ success: LinkSuccess) {
    // Pass data back to JavaScript in the reply
    let data: [String: Any] = [
        "publicToken": success.publicToken,
        "institutionName": success.metadata.institution.name,
        "institutionId": success.metadata.institution.id
    ]
    
    // Send success event with data
    reply(to: "success", data: data)
}

private func handleExit(_ exit: LinkExit) {
    var data: [String: Any] = [:]
    
    if let error = exit.error {
        data["error"] = [
            "errorCode": error.errorCode,
            "errorMessage": error.errorMessage,
            "displayMessage": error.localizedDescription
        ]
    }
    
    // Send exit event with data
    reply(to: "exit", data: data)
}
```

### Step 2: Update JavaScript Controller to Handle Events

```javascript
// plaid_link_controller.js - CORRECT PATTERN
export default class extends BridgeComponent {
  static component = "plaidLink"
  
  async connect() {
    super.connect()
    
    // Get link token from server
    const response = await fetch('/plaid/create_link_token', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    })
    
    const data = await response.json()
    if (data.link_token) {
      this.linkToken = data.link_token
      this.enableConnectButton()
    }
  }
  
  openPlaidLink() {
    // Send message to open native Plaid SDK
    // No callback here - events come separately
    this.send("openWithToken", { linkToken: this.linkToken })
  }
  
  // Called by native when Plaid succeeds
  success(data) {
    const { publicToken, institutionName, institutionId } = data
    this.exchangePublicToken(publicToken)
  }
  
  // Called by native when user exits
  exit(data) {
    if (data.error) {
      console.error("Plaid error:", data.error)
      this.showError(data.error.displayMessage || "Connection failed")
    }
  }
}
```

### Step 3: Remove UserDefaults Pattern Completely

```swift
// PlaidLinkComponent.swift
final class PlaidLinkComponent: BridgeComponent {
    override class var name: String { "plaidLink" }
    
    override func onReceive(message: Message) {
        switch message.event {
        case "openWithToken":
            guard let data: LinkTokenData = message.data() else { return }
            openPlaidLink(with: data.linkToken)
        default:
            print("Unknown event: \(message.event)")
        }
    }
    
    private func openPlaidLink(with linkToken: String) {
        var configuration = LinkTokenConfiguration(
            token: linkToken,
            onSuccess: { [weak self] success in
                self?.handleSuccess(success)
            }
        )
        
        configuration.onExit = { [weak self] exit in
            self?.handleExit(exit)
        }
        
        let result = Plaid.create(configuration)
        switch result {
        case .success(let handler):
            guard let viewController = delegate?.destination as? UIViewController else { return }
            handler.open(presentUsing: .viewController(viewController))
        case .failure(let error):
            print("Error creating Plaid handler: \(error)")
        }
    }
}
```

### Step 4: Follow the Event Pattern from Demo App

Looking at the FormComponent example, the pattern is:

1. **Initial connect event** - Sets up the component with configuration
2. **Subsequent events** - Handle state changes or actions
3. **Reply to events** - Send data back to JavaScript

For Plaid, we need:
- `connect` event: Initialize with any configuration
- `openWithToken` event: Open Plaid SDK with token
- `success` reply: Send back public token and metadata
- `exit` reply: Send back error information if any

## Why Current OAuth Approach Works

The OAuth implementation works because it:
- Uses standard URL navigation (not bridge components)
- Relies on deep links (system-level, not WebView messages)
- Doesn't require WebView message passing

## Recommended Implementation

### Follow Hotwire Native Best Practices

1. **Keep bridge components simple** - Only handle UI enhancement
2. **Pass data in replies** - Never use UserDefaults or other side channels
3. **Use established patterns** - Follow the demo app examples
4. **Test incrementally** - Verify message passing at each step

### Correct Implementation Steps

1. **Fix Native Component**:
   - Remove all UserDefaults usage
   - Pass data in reply() calls
   - Follow the FormComponent pattern

2. **Fix JavaScript Controller**:
   - Remove getNativeValue attempts
   - Implement success/exit methods that receive data
   - Handle token exchange in JavaScript

3. **Verify Registration**:
   - Component is registered in AppDelegate ✓
   - Component name matches JavaScript ✓
   - User agent includes bridge component ?

4. **Debug Message Flow**:
   - Add logging to verify messages are sent
   - Check native onReceive is called
   - Verify replies reach JavaScript

## Key Insights from Best Practices

1. **Bridge components are automatically wired** - Hotwire handles the plumbing
2. **Data must flow through replies** - Not side channels like UserDefaults
3. **Follow established patterns** - The demo app shows the way
4. **Keep components focused** - UI enhancement only, business logic stays in Rails
5. **Graceful degradation** - Web functionality must work without native

## Testing Strategy

1. Add extensive logging to verify message flow
2. Test bridge communication with simple component first
3. Verify WebView has message handlers configured
4. Use Safari Web Inspector to debug JavaScript side
5. Use Xcode debugger for native side

## Conclusion

The issue is not with Hotwire Native framework setup but with the implementation pattern. The current code violates the core principle of bridge components by trying to use UserDefaults as a communication channel instead of the proper reply() mechanism. By following the established patterns from the demo app and documentation, the Plaid integration should work correctly.

The fix is straightforward: pass data through the bridge component's reply mechanism, not through side channels. This maintains the stateless, message-passing architecture that makes bridge components reliable and testable.