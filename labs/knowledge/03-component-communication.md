# Component Communication - How Framework Pieces Coordinate

## Core Principle
Hotwire Native components communicate through strict boundaries and protocols. Understanding these communication patterns prevents fighting the framework. Each component has a specific responsibility and they coordinate through well-defined interfaces.

## The Communication Architecture

```
┌─────────────────┐     ┌─────────────────┐
│   SceneDelegate │────▶│    Navigator    │
└─────────────────┘     └─────────────────┘
                               │
                     ┌─────────┴─────────┐
                     ▼                   ▼
              ┌──────────┐        ┌──────────┐
              │ Session  │        │ Session  │
              │  (main)  │        │ (modal)  │
              └──────────┘        └──────────┘
                     │                   │
                     ▼                   ▼
              ┌──────────┐        ┌──────────┐
              │   Visit  │        │   Visit  │
              └──────────┘        └──────────┘
                     │                   │
                     ▼                   ▼
              ┌──────────┐        ┌──────────┐
              │ WebView  │        │ WebView  │
              └──────────┘        └──────────┘
```

## Key Communication Patterns

### 1. SceneDelegate → Navigator
**Initial setup and lifecycle:**
```swift
// App/SceneDelegate.swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private lazy var navigator = Navigator(
        configuration: Configuration(
            name: "main",
            startLocation: baseURL
        )
    )
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession) {
        // SceneDelegate tells Navigator to start
        navigator.navigate(to: baseURL)
    }
}
```

### 2. Navigator → Session
**Navigation delegation:**
```swift
// Framework manages this - understand the flow
extension Navigator {
    func navigate(to url: URL) {
        // 1. Check path configuration
        let properties = pathConfiguration.properties(for: url)
        
        // 2. Decide which session
        if properties.presentation == "modal" {
            modalSession.visit(url, action: .advance)
        } else {
            mainSession.visit(url, action: .advance)
        }
    }
}
```

### 3. Session → Visit → WebView
**The visit lifecycle:**
```swift
// Framework code - for reference only
class Session {
    func visit(_ visitable: Visitable) {
        // Only ONE active visit per session
        currentVisit?.cancel()
        
        // Create new visit
        let visit = Visit(visitable: visitable, delegate: self)
        currentVisit = visit
        
        // Visit takes ownership of web view
        visit.start()
    }
}
```

## Rails-iOS Communication Boundaries

### What Rails Can Tell iOS

**Through Path Configuration:**
```ruby
# Rails tells iOS HOW to present screens
{
  patterns: ["/resources/new$"],
  properties: {
    presentation: "modal",
    title: "New Resource"
  }
}
```

**Through Turbo Actions:**
```erb
<!-- Rails tells iOS WHAT navigation action to perform -->
<%= link_to "Back", :back, data: { turbo_action: "pop" } %>
<%= link_to "Replace", resource_path, data: { turbo_action: "replace" } %>
```

**Through Meta Tags:**
```erb
<!-- Rails provides iOS with app-wide settings -->
<meta name="turbo-native-app" content="true">
<meta name="turbo-visit-control" content="reload">
```

### What iOS Can Tell Rails

**Through User Agent:**
```ruby
# Rails knows it's native app
def hotwire_native_app?
  request.user_agent.to_s.include?("Hotwire Native")
end
```

**Through Custom Headers:**
```swift
// iOS can send app version
webView.customUserAgent = "MyApp/1.0 Hotwire Native iOS"
```

## Session State Machine

Understanding session states prevents communication errors:

```
         ┌──────────┐
         │   Idle   │
         └────┬─────┘
              │ visit()
         ┌────▼─────┐
         │ Loading  │
         └────┬─────┘
              │ page loads
         ┌────▼─────┐
         │  Ready   │◀─────┐
         └────┬─────┘      │
              │            │ navigation
              │            │
         ┌────▼─────┐      │
         │Navigating├──────┘
         └──────────┘
```

## Delegation Patterns

### NavigatorDelegate
```swift
// App/SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func navigator(_ navigator: Navigator, didNavigateTo url: URL) {
        // Track navigation
        Analytics.track("navigation", properties: ["url": url.path])
    }
    
    func navigator(_ navigator: Navigator, didFailWithError error: Error) {
        // Handle navigation failures
        showError(error)
    }
}
```

### SessionDelegate
```swift
// Framework handles most of this
extension Navigator: SessionDelegate {
    func session(_ session: Session, didProposeVisit proposal: VisitProposal) {
        // Navigator decides how to handle the proposal
        navigate(to: proposal.url, action: proposal.action)
    }
    
    func session(_ session: Session, didFailWithError error: Error) {
        // Bubble errors up to app level
        delegate?.navigator(self, didFailWithError: error)
    }
}
```

## Bridge Component Communication

### Web → Native Messages
```javascript
// app/javascript/controllers/bridge_controller.js
export default class extends BridgeComponent {
  static component = "form"
  
  notifyNative() {
    // Send message to native
    this.send("submit", {
      title: this.titleValue,
      enabled: true
    })
  }
}
```

### Native → Web Replies
```swift
// App/BridgeComponents/FormComponent.swift
class FormComponent: BridgeComponent {
    override func onReceive(message: Message) {
        // Process message from web
        switch message.event {
        case "submit":
            handleSubmit(message.data)
            // Reply back to web
            reply(to: "submit", with: ["status": "received"])
        default:
            break
        }
    }
}
```

## Communication Anti-Patterns to Avoid

### ❌ Direct WebView Manipulation
```swift
// Wrong - Bypassing session management
webView.load(URLRequest(url: url))
```

### ✅ Use Session Visit
```swift
// Right - Through proper channels
session.visit(url)
```

### ❌ Custom Navigation Stack
```swift
// Wrong - Fighting the framework
var navigationStack: [URL] = []
func goBack() {
    navigationStack.removeLast()
    // Custom navigation logic
}
```

### ✅ Use Framework Navigation
```swift
// Right - Let Navigator handle it
navigator.pop()
```

### ❌ Storing State in iOS
```swift
// Wrong - State in wrong layer
class AppState {
    static var userPreferences: [String: Any] = [:]
}
```

### ✅ State Lives in Rails
```ruby
# Right - Single source of truth
class User < ApplicationRecord
  store_accessor :preferences, :theme, :notifications_enabled
end
```

## Debugging Communication

### Add Debug Logging
```swift
// App/Helpers/DebugLogger.swift
extension Navigator {
    func debugNavigate(to url: URL) {
        print("🧭 Navigator: Navigating to \(url)")
        print("📋 Properties: \(pathConfiguration.properties(for: url))")
        navigate(to: url)
    }
}

extension Session {
    func debugVisit(_ visitable: Visitable) {
        print("🌐 Session: Visiting \(visitable.visitableURL)")
        print("📍 Current URL: \(webView.url?.absoluteString ?? "nil")")
        visit(visitable)
    }
}
```

### Rails Debug Endpoints
```ruby
# app/controllers/debug_controller.rb
class DebugController < ApplicationController
  def communication
    render json: {
      user_agent: request.user_agent,
      native_app: hotwire_native_app?,
      headers: request.headers.to_h.select { |k, v| k.start_with?("HTTP_") },
      turbo_native_app: request.headers["HTTP_TURBO_NATIVE_APP"]
    }
  end
end
```

## Testing Communication

### Test Navigation Flow
```swift
// Tests/NavigationTests.swift
func testNavigationCommunication() {
    let expectation = expectation(description: "Navigation completes")
    
    navigator.delegate = MockNavigatorDelegate { url in
        XCTAssertEqual(url.path, "/resources")
        expectation.fulfill()
    }
    
    navigator.navigate(to: URL(string: "https://example.com/resources")!)
    
    waitForExpectations(timeout: 5)
}
```

### Test Bridge Communication
```javascript
// test/javascript/bridge_test.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

test("sends message to native", () => {
  const component = new TestBridgeComponent()
  const spy = jest.spyOn(component, 'send')
  
  component.notifyNative({ data: "test" })
  
  expect(spy).toHaveBeenCalledWith("notify", { data: "test" })
})
```

## Key Insights

1. **Components have strict boundaries** - Each does one thing well
2. **Communication flows downward** - SceneDelegate → Navigator → Session → Visit
3. **State flows upward** - Through delegates and callbacks
4. **Rails and iOS communicate through URLs** - Not direct method calls
5. **Bridge components are stateless messengers** - Pass data, don't store it

## Remember

- Never bypass the communication chain
- Let each component do its job
- URLs are the primary communication method
- Delegates handle state changes
- Test communication paths, not implementation details
- When in doubt, check what the framework expects