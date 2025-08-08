# Hotwire Native Patterns

Rails does the work. Native apps coordinate. The Rails app IS the iOS/Android app, just wrapped in a native shell.

## Core Philosophy

URLs drive everything. Native enhances web, doesn't replace it. Start with web, add native only where it adds real value.

## When to Use Native

### Use Native Screens When
- Payment SDKs (Plaid, Stripe)
- Full camera/photo capture
- OAuth authentication flows
- Document scanners
- AR experiences

### Use Bridge Components When
- Haptic feedback needed
- Native navigation items
- Pull-to-refresh
- Share sheets
- Simple overlays

## Critical Decision Tree

```
Need native feature?
    ↓
Web page stays visible?
    YES → Bridge Component (enhancement)
    NO → Native Screen (replacement)
```

## Bridge Component Pattern

### Rails Side
```erb
<!-- Conditional rendering for native -->
<div data-controller="<%= hotwire_native_app? ? 'bridge--plaid' : 'plaid-web' %>">
  <button data-action="click-><%= hotwire_native_app? ? 'bridge--plaid' : 'plaid-web' %>#connect">
    Connect Bank
  </button>
</div>
```

### JavaScript Bridge
```javascript
// app/javascript/controllers/bridge/plaid_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "plaid"
  
  connect() {
    super.connect()
    this.send("ready", {}, () => {
      console.log("Native component ready")
    })
  }
  
  handleConnect(event) {
    event.preventDefault()
    this.send("openPlaid", { token: this.token }, (response) => {
      if (response.publicToken) {
        this.handleSuccess(response)
      }
    })
  }
}
```

### Native Side (iOS)
```swift
final class PlaidComponent: BridgeComponent {
    override class var name: String { "plaid" }
    
    override func onReceive(message: Message) {
        switch message.event {
        case "openPlaid":
            guard let data: OpenPlaidData = message.data() else { return }
            openPlaidLink(with: data.token)
        default:
            break
        }
    }
    
    private func handleSuccess(_ result: LinkSuccess) {
        reply(to: "openPlaid", with: PlaidResponse(
            publicToken: result.publicToken
        ))
    }
}
```

## Native Screen Pattern

### Path Configuration
```ruby
# config/routes.rb
namespace :configurations do
  get "ios_v1", to: "native#ios_v1"
end

# app/controllers/configurations/native_controller.rb
def ios_v1
  render json: {
    rules: [
      {
        patterns: ["/new$", "/edit$"],
        properties: { context: "modal" }
      },
      {
        patterns: ["/plaid"],
        properties: { 
          context: "modal",
          identifier: "plaid_native"
        }
      }
    ]
  }
end
```

### iOS Navigation
```swift
// SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func handle(proposal: VisitProposal, from navigator: Navigator) -> ProposalResult {
        switch proposal.properties["identifier"] {
        case "plaid_native":
            return .acceptCustom(PlaidViewController(url: proposal.url))
        default:
            return .accept
        }
    }
}
```

## Common Pitfalls & Solutions

### Session Persistence
Web OAuth in Hotwire Native loses session when redirecting. Solution: Use native SDKs for OAuth.

### Bridge Communication
Always use Encodable structs in Swift, never dictionaries:
```swift
// ✅ Correct
struct Response: Encodable {
    let token: String
}
reply(to: "event", with: Response(token: "abc"))

// ❌ Wrong - Won't compile
reply(to: "event", with: ["token": "abc"])
```

### JavaScript Loading
Bridge controllers in subdirectories need explicit loading:
```javascript
// app/javascript/controllers/index.js
eagerLoadControllersFrom("controllers", application)
eagerLoadControllersFrom("controllers/bridge", application)  // Required!
```

## Testing Patterns

### Development Setup
1. Rails server on local network
2. iOS Simulator pointing to local Rails
3. Console logging in both Rails and Xcode
4. Test navigation flows first, features second

### Debug Points
```javascript
// JavaScript
console.log("🟢 Bridge message sent:", message)

// Swift
print("🔵 Native received:", message.event)
```

## Performance Considerations

### Keep Native Minimal
- Rails renders all UI
- Native only coordinates
- No duplicate business logic
- State lives in Rails

### Cache Aggressively
- Path configurations cached
- Static assets cached
- API responses cached where safe
- Clear cache on app update

## Deployment

### iOS Requirements
- Universal Links for deep linking
- Associated domains configured
- Push notification certificates
- TestFlight for beta testing

### Rails Requirements
- HTTPS in production
- Mobile-optimized views
- Touch-friendly tap targets
- Fast server response times

## Remember

- The web app does the work, native coordinates
- When in doubt, keep it in Rails
- Bridge for enhancement, native screens for replacement
- Start with web, add native only where it adds real value
- Session persistence requires native SDKs for OAuth
- Test on real devices before shipping