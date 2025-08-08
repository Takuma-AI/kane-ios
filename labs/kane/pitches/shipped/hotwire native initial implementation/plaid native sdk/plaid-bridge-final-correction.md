# Plaid Bridge Component - Final Correction

## The Final API Understanding

The compilation error revealed another layer of the API:
- `reply(to:with:)` with `[String: Any]` doesn't work
- There are two overloads:
  1. `reply(to: String, with jsonData: String)` - Takes JSON string
  2. `reply<T: Encodable>(to: String, with data: T)` - Takes Encodable type

Since `[String: Any]` is not Encodable (because `Any` isn't Encodable), we need to either use Encodable structs or convert to JSON manually.

## Solution 1: Using Encodable Structs (Recommended)

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
            // Use Encodable struct
            let errorResponse = PlaidErrorResponse(error: error.localizedDescription)
            reply(to: "openPlaidLink", with: errorResponse)
        }
    }
    
    private func handlePlaidSuccess(_ success: LinkSuccess) {
        print("PlaidLinkComponent: Plaid Link succeeded")
        
        // Use Encodable struct for success response
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
        print("PlaidLinkComponent: User exited Plaid Link")
        
        // Use Encodable struct for exit response
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
    
    // Response types that are Encodable
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

## Solution 2: Using JSON String (Alternative)

If you prefer to work with dictionaries, convert to JSON:

```swift
private func handlePlaidSuccess(_ success: LinkSuccess) {
    print("PlaidLinkComponent: Plaid Link succeeded")
    
    let data: [String: Any] = [
        "publicToken": success.publicToken,
        "metadata": [
            "institution": [
                "name": success.metadata.institution.name,
                "id": success.metadata.institution.id
            ]
        ]
    ]
    
    // Convert dictionary to JSON string
    if let jsonData = try? JSONSerialization.data(withJSONObject: data),
       let jsonString = String(data: jsonData, encoding: .utf8) {
        reply(to: "openPlaidLink", with: jsonString)
    }
}
```

## Why Solution 1 is Better

1. **Type Safety**: Compiler verifies all properties exist
2. **No Manual JSON**: Framework handles serialization
3. **Clear API Contract**: Response types are documented in code
4. **Easier Testing**: Can unit test response structures

## JavaScript Side Remains the Same

The JavaScript doesn't change - it still receives the data in the callback:

```javascript
this.send("openPlaidLink", { linkToken: this.linkToken }, (data) => {
    console.log("PlaidLinkController: Received reply from native:", data)
    
    if (data.publicToken) {
        this.handleSuccess(data)
    } else if (data.error) {
        this.showError(data.error.displayMessage || data.error.errorMessage || "Connection failed")
    } else if (data.exited) {
        console.log("PlaidLinkController: User exited Plaid Link")
    }
})
```

## Key Learning: The Three Reply Options

1. `reply(to: "event")` - Reply with no data
2. `reply(to: "event", with: "json string")` - Reply with JSON string
3. `reply(to: "event", with: encodableObject)` - Reply with Encodable (recommended)

Never use `[String: Any]` with the third option - it won't compile!