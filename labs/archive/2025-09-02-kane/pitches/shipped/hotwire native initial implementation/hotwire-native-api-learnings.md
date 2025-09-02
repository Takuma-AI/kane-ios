# Hotwire Native API Learnings - Real Implementation Details

## Key Discovery: The Compilation Errors Revealed Critical API Misunderstandings

### 1. BridgeComponent Reply API

**What We Got Wrong:**
```swift
// INCORRECT - This doesn't exist
reply(to: "error", data: ["message": error.localizedDescription])
```

**Actual API from Source Code:**
```swift
// CORRECT - Note the 'with' parameter label
reply(to: "error", with: ["message": error.localizedDescription])

// The method signatures are:
reply(to event: String)                           // Reply with original message
reply(to event: String, with jsonData: String)    // Reply with JSON string
reply(to event: String, with data: T)             // Reply with Encodable data
```

**Key Learning:** The Hotwire Native bridge component API uses `with` as the parameter label for data, not `data`. This is a subtle but critical difference that breaks compilation.

### 2. Understanding Message Reply Pattern

From studying the BridgeComponent source, the reply mechanism works as follows:

1. **Message Caching**: When a message is received, it's cached by event name
2. **Reply References Original**: When you reply to an event, it finds the cached message
3. **Data Replacement**: The reply replaces the jsonData of the original message

This means:
- You can only reply to events you've received
- The reply maintains the original message structure
- Data passed in reply becomes the response payload

### 3. Plaid SDK Type Misunderstandings

**What We Assumed (Incorrectly):**
```swift
// WRONG - These assumptions about Plaid types were incorrect
account.type.rawValue              // Account doesn't have 'type'
account.subtype?.rawValue          // Subtype isn't optional in this way
error.errorCode.rawValue           // ErrorCode might not have rawValue
exit.metadata?                     // Metadata might not be optional
```

**The Reality:**
The Plaid SDK types are more opaque than expected. We need to:
1. Check actual property names on Account
2. Understand the actual optional/non-optional nature
3. Not assume all enums have rawValue

### 4. Critical Pattern: Reply Must Reference Received Event

Looking at the demo app pattern:
```swift
// FormComponent.swift from demo
private func handleConnectEvent(message: Message) {
    guard let data: MessageData = message.data() else { return }
    configureBarButton(with: data.submitTitle)
}

// Later, when button is tapped:
reply(to: Event.connect.rawValue)  // Replies to the original 'connect' event
```

**Key Insight:** You reply to the event that initiated the action, not with a new event name.

### 5. Correct Implementation Pattern

Based on our learnings, here's the corrected pattern:

```swift
override func onReceive(message: Message) {
    switch message.event {
    case "openPlaidLink":
        // Store this message event for reply
        handleOpenPlaidLink(message: message)
    default:
        break
    }
}

private func handlePlaidSuccess(_ success: LinkSuccess) {
    // Create data dictionary with actual available properties
    let data: [String: Any] = [
        "publicToken": success.publicToken,
        "institutionName": success.metadata.institution.name,
        "institutionId": success.metadata.institution.id
    ]
    
    // Reply to the original event that opened Plaid
    reply(to: "openPlaidLink", with: data)
}
```

### 6. JavaScript Side Adjustments

The JavaScript needs to handle the reply callback:

```javascript
// Send the message with a callback
this.send("openPlaidLink", { linkToken: this.linkToken }, (data) => {
    // This callback is invoked when native calls reply()
    if (data.publicToken) {
        this.handleSuccess(data)
    } else if (data.error) {
        this.handleError(data)
    }
})
```

## Updated Understanding of Bridge Component Lifecycle

1. **JavaScript sends message** → Native receives in `onReceive`
2. **Native performs action** → Async operation (Plaid SDK)
3. **Action completes** → Native calls `reply(to: originalEvent, with: data)`
4. **JavaScript callback invoked** → With the data from reply

## What This Means for Our Implementation

1. **Fix method signatures**: Change all `reply(to:data:)` to `reply(to:with:)`
2. **Simplify Plaid data extraction**: Only send what we can actually access
3. **Use single callback pattern**: Reply to the original event with success/error data
4. **Remove assumptions about types**: Test what properties actually exist

## Lessons for Future Bridge Components

1. **Always check the actual API**: Don't assume method signatures
2. **Study the demo components**: They show the correct patterns
3. **Keep data simple**: Only send what you need
4. **Test incrementally**: Verify each property exists before using
5. **Use the callback pattern**: One event → one reply with all outcomes

## Next Steps

1. Fix all `reply` method calls to use `with:`
2. Simplify Plaid data extraction to only verified properties
3. Update JavaScript to use single callback pattern
4. Test with minimal data first, then add properties
5. Document the actual Plaid SDK types once verified