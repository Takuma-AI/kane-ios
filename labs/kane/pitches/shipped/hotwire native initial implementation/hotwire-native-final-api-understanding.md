# Hotwire Native Bridge Component - Final API Understanding

## The Complete Picture

After three rounds of compilation errors, we now have the complete understanding of the Hotwire Native bridge component API.

## The Three Reply Methods

### 1. Reply with No Data
```swift
reply(to: "eventName")
```
Just acknowledges the event occurred.

### 2. Reply with JSON String
```swift
reply(to: "eventName", with: jsonString)
```
Takes a raw JSON string. Requires manual JSON serialization.

### 3. Reply with Encodable Object (Recommended)
```swift
reply(to: "eventName", with: encodableObject)
```
Takes any type conforming to `Encodable`. Framework handles JSON serialization.

## Why `[String: Any]` Doesn't Work

The error "Cannot convert value of type '[String : Any]' to expected argument type 'String'" revealed:
- Swift dictionaries with `Any` values are NOT Encodable
- `Any` doesn't conform to `Encodable` protocol
- The generic overload `reply<T: Encodable>` can't accept `[String: Any]`

## The Correct Pattern

### Define Response Types
```swift
struct SuccessResponse: Encodable {
    let success = true
    let data: String
}

struct ErrorResponse: Encodable {
    let success = false
    let error: ErrorDetails
}

struct ErrorDetails: Encodable {
    let message: String
    let code: Int?
}
```

### Use in Replies
```swift
// Success case
let response = SuccessResponse(data: "value")
reply(to: "action", with: response)

// Error case
let response = ErrorResponse(
    error: ErrorDetails(message: "Failed", code: 500)
)
reply(to: "action", with: response)
```

## Benefits of Encodable Structs

1. **Compile-Time Safety**: Can't accidentally use non-existent properties
2. **Self-Documenting**: Response structure is clear in code
3. **No Manual JSON**: Framework handles serialization correctly
4. **Testable**: Can unit test response structures
5. **Refactorable**: Xcode can rename properties across codebase

## Complete Working Example

```swift
final class ExampleComponent: BridgeComponent {
    override class var name: String { "example" }
    
    // Define all response types
    private struct ActionResponse: Encodable {
        let success: Bool
        let data: ActionData?
        let error: ErrorInfo?
        
        struct ActionData: Encodable {
            let value: String
            let timestamp: Date
        }
        
        struct ErrorInfo: Encodable {
            let message: String
            let recoverable: Bool
        }
    }
    
    override func onReceive(message: Message) {
        switch message.event {
        case "performAction":
            performAction()
        default:
            break
        }
    }
    
    private func performAction() {
        someAsyncOperation { result in
            switch result {
            case .success(let value):
                let response = ActionResponse(
                    success: true,
                    data: .init(value: value, timestamp: Date()),
                    error: nil
                )
                self.reply(to: "performAction", with: response)
                
            case .failure(let error):
                let response = ActionResponse(
                    success: false,
                    data: nil,
                    error: .init(
                        message: error.localizedDescription,
                        recoverable: error.isRecoverable
                    )
                )
                self.reply(to: "performAction", with: response)
            }
        }
    }
}
```

## Migration Guide

### From Dictionary Pattern:
```swift
// OLD - Won't compile
let data: [String: Any] = ["key": "value", "number": 123]
reply(to: "event", with: data)  // ERROR!
```

### To Encodable Pattern:
```swift
// NEW - Type safe and compiles
struct Response: Encodable {
    let key: String
    let number: Int
}
let response = Response(key: "value", number: 123)
reply(to: "event", with: response)  // SUCCESS!
```

## Final Lessons

1. **Read the actual method signatures** - Overloads matter
2. **Use Encodable structs** - Not dictionaries
3. **Let the compiler help** - Type safety prevents runtime errors
4. **Model your API** - Define response types explicitly

This is the complete, correct understanding of the Hotwire Native bridge component reply API.