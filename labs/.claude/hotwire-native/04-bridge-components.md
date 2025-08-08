# Bridge Components vs Native Screens - When to Use Which

## Critical Decision: Bridge Component or Native Screen?

**This is the most important decision in Hotwire Native.** Choose wrong and your implementation will fail.

### Quick Decision Tree
```
User needs native feature
         ↓
Will the web page stay visible?
         ↓
    YES → Bridge Component (enhance web)
     NO → Native Screen (replace web)
         ↓
    Is it a full SDK/UI?
         ↓
    YES → ALWAYS Native Screen
     NO → Check guidelines below
```

## Bridge Components

### Core Principle
Bridge components enable **stateless message passing** between web and native layers. They enhance web functionality with platform capabilities without replacing it. The web page works without them—they add native polish when available.

### When to Use Bridge Components
✅ **Web page stays visible** - Adding native polish to existing UI
✅ **Progressive enhancement** - Feature works without native
✅ **Small native additions** - Haptics, gestures, native buttons
✅ **Simple overlays** - Share sheets, date pickers

### Bridge Component Examples
- Haptic feedback on buttons
- Native navigation bar buttons
- Pull-to-refresh gestures
- Native share functionality
- Camera button (not full camera UI)
- Native keyboard accessories

## Native Screens

### Core Principle
Native screens **completely replace** the web view with native UI. They're triggered by URL patterns in path configuration and handle the entire screen experience.

### When to Use Native Screens
✅ **Full native UI takeover** - SDK needs entire screen
✅ **Third-party SDKs** - Payment processors, auth providers
✅ **Complex native UI** - Camera capture, document scanning
✅ **Hardware integration** - AR, complex gestures
✅ **Web version impossible** - Features that can't work in web view

### Native Screen Examples
- Payment SDKs (Plaid, Stripe)
- Full camera/photo capture
- OAuth authentication flows
- Document scanners
- AR experiences
- Video recording
- Complex native forms

## The Plaid Learning

We discovered this the hard way with Plaid integration:

### ❌ Why Bridge Component Failed for Plaid
1. **Presentation conflict** - Plaid SDK needs full screen, but bridge components enhance visible web pages
2. **Hidden navigation bar** - Made SDK UI appear off-screen
3. **Context confusion** - Web view underneath interfered with SDK
4. **Lifecycle mismatch** - Bridge components die with web page

### ✅ Why Native Screen Works for Plaid
1. **Full control** - Plaid SDK owns entire screen
2. **Clean context** - No web view interference
3. **Proper navigation** - Standard iOS patterns
4. **Independent lifecycle** - Lives outside web page

## Native Screen Implementation Pattern

### 1. Configure Path Rules (Rails)
```ruby
# app/controllers/configurations_controller.rb
def ios_v1
  render json: {
    rules: [
      {
        patterns: ["/plaid/native"],
        properties: {
          view_controller: "plaid"  # Tells iOS to use native screen
        }
      }
    ]
  }
end
```

### 2. Simple Link in Rails View
```erb
<% if hotwire_native_app? %>
  <!-- Just a regular link! No JavaScript needed -->
  <%= link_to "Connect Bank", "/plaid/native", class: "button" %>
<% else %>
  <!-- Web implementation -->
  <button data-controller="plaid">Connect Bank</button>
<% end %>
```

### 3. Native View Controller (iOS)
```swift
// App/ViewControllers/PlaidViewController.swift
import UIKit
import LinkKit

class PlaidViewController: UIViewController {
    private let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        openPlaidLink()
    }
    
    private func openPlaidLink() {
        // Fetch link token from Rails
        fetchLinkToken { [weak self] token in
            let configuration = LinkTokenConfiguration(
                token: token,
                onSuccess: { [weak self] success in
                    self?.handleSuccess(success)
                }
            )
            
            let result = Plaid.create(configuration)
            switch result {
            case .success(let handler):
                handler.open(presentUsing: .viewController(self))
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
}
```

### 4. Register in Navigator (iOS)
```swift
// SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
        // Check if this URL needs a native screen
        if proposal.url.path == "/plaid/native" {
            let plaidVC = PlaidViewController(url: proposal.url)
            return .acceptCustom(plaidVC)
        }
        
        // Default: use web view
        return .accept
    }
}
```

## Complete Bridge Component Implementation

### 1. Create the iOS Bridge Component

**Step by step Xcode setup:**
1. In Xcode, right-click the "BridgeComponents" folder (create it if needed under App/)
2. Choose "New File" → "Swift File"
3. Name it "FormComponent.swift"
4. Make sure it's saved in the BridgeComponents group
5. Add this complete implementation:

```swift
// App/BridgeComponents/FormComponent.swift
import HotwireNative
import UIKit

final class FormComponent: BridgeComponent {
    // REQUIRED: Name must match JavaScript controller
    override class var name: String { "form" }
    
    // Handle messages from JavaScript
    override func onReceive(message: Message) {
        switch message.event {
        case "connect":
            handleConnect(message)
        case "submitButtonTapped":
            handleSubmitTapped(message)
        case "disconnect":
            handleDisconnect()
        default:
            print("Unknown event: \(message.event)")
        }
    }
    
    private func handleConnect(_ message: Message) {
        guard let data: MessageData = message.data() else { return }
        
        // Create native submit button
        addSubmitButton(title: data.title, style: data.style)
        
        // Tell JavaScript we're connected
        reply(to: "connect")
    }
    
    private func handleSubmitTapped(_ message: Message) {
        // Add haptic feedback
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        
        // Tell JavaScript form was submitted
        reply(to: "submitButtonTapped")
    }
    
    private func handleDisconnect() {
        // Clean up any native UI elements
        removeSubmitButton()
    }
    
    // MARK: - Native UI Management
    
    private func addSubmitButton(title: String, style: String) {
        let button = UIBarButtonItem(
            title: title,
            style: style == "done" ? .done : .plain,
            target: self,
            action: #selector(submitButtonPressed)
        )
        
        delegate?.destination.navigationItem.rightBarButtonItem = button
    }
    
    private func removeSubmitButton() {
        delegate?.destination.navigationItem.rightBarButtonItem = nil
    }
    
    @objc private func submitButtonPressed() {
        // Send message to JavaScript
        send("submitButtonPressed", data: [:])
    }
}

// Message data structure
private struct MessageData: Decodable {
    let title: String
    let style: String
}
```

### 2. Register Bridge Components

**In Xcode, update SceneDelegate.swift:**
```swift
// App/Delegates/SceneDelegate.swift
import UIKit
import HotwireNative

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // ... existing setup code ...
    
    private lazy var navigator = Navigator(
        configuration: Configuration(
            name: "main",
            startLocation: baseURL,
            pathConfigurationURL: baseURL.appending(path: "/configurations/ios-v1.json")
        ),
        // REGISTER YOUR BRIDGE COMPONENTS HERE
        bridgeComponents: [
            FormComponent.self,
            MenuComponent.self,
            ButtonComponent.self
        ]
    )
}
```

### 3. Create JavaScript Controller

**Rails side - create the Stimulus controller:**
```javascript
// app/javascript/controllers/bridge/form_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "form"
  static targets = ["submit"]
  
  connect() {
    super.connect()
    
    if (this.enabled) {
      // Send configuration to native
      this.send("connect", {
        title: this.data.get("title") || "Save",
        style: this.data.get("style") || "done"
      })
    }
  }
  
  disconnect() {
    super.disconnect()
    
    if (this.enabled) {
      this.send("disconnect")
    }
  }
  
  // Called when native button is pressed
  submitButtonPressed() {
    // Native told us button was pressed
    this.submitForm()
  }
  
  submitForm() {
    // Tell native we're submitting
    this.send("submitButtonTapped")
    
    // Submit the form
    this.element.requestSubmit()
  }
}
```

### 4. Use in Rails Views

```erb
<!-- app/views/resources/_form.html.erb -->
<%= form_with model: resource,
              data: {
                controller: "bridge--form",
                bridge_form_title: "Save",
                bridge_form_style: "done"
              } do |form| %>
  
  <div class="form-group">
    <%= form.label :name %>
    <%= form.text_field :name, class: "form-control" %>
  </div>
  
  <!-- Web fallback submit button -->
  <% unless hotwire_native_app? %>
    <%= form.submit "Save", class: "btn btn-primary" %>
  <% end %>
<% end %>
```

## Common Bridge Component Patterns

### Menu Component
```swift
// App/BridgeComponents/MenuComponent.swift
final class MenuComponent: BridgeComponent {
    override class var name: String { "menu" }
    
    override func onReceive(message: Message) {
        guard message.event == "display" else { return }
        guard let items: MenuItems = message.data() else { return }
        
        showActionSheet(with: items.options)
    }
    
    private func showActionSheet(with options: [MenuOption]) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for option in options {
            let action = UIAlertAction(title: option.title, style: .default) { _ in
                self.send("selected", data: ["index": option.index])
            }
            actionSheet.addAction(action)
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        delegate?.destination.present(actionSheet, animated: true)
    }
}

private struct MenuItems: Decodable {
    let options: [MenuOption]
}

private struct MenuOption: Decodable {
    let title: String
    let index: Int
}
```

### Button Component with Haptics
```swift
// App/BridgeComponents/ButtonComponent.swift
final class ButtonComponent: BridgeComponent {
    override class var name: String { "button" }
    
    override func onReceive(message: Message) {
        guard message.event == "tapped" else { return }
        
        // Native enhancement: haptic feedback
        let feedback = UIImpactFeedbackGenerator(style: .light)
        feedback.impactOccurred()
        
        // Confirm to JavaScript
        reply(to: "tapped")
    }
}
```

## JavaScript Bridge Patterns

### Base Bridge Controller
```javascript
// app/javascript/controllers/bridge_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class BridgeController extends BridgeComponent {
  // Helper to check if we're in native app
  get isNativeApp() {
    return this.enabled
  }
  
  // Safe message sending
  sendMessage(event, data = {}) {
    if (this.enabled) {
      this.send(event, data)
    }
  }
  
  // Log for debugging
  logBridge(message) {
    if (this.isNativeApp) {
      console.log(`[Bridge: ${this.component}] ${message}`)
    }
  }
}
```

### Menu Controller
```javascript
// app/javascript/controllers/bridge/menu_controller.js
import BridgeController from "../bridge_controller"

export default class extends BridgeController {
  static component = "menu"
  static values = { options: Array }
  
  open(event) {
    event.preventDefault()
    
    if (this.isNativeApp) {
      // Native menu
      this.send("display", {
        options: this.optionsValue.map((option, index) => ({
          title: option,
          index: index
        }))
      })
    } else {
      // Web fallback
      this.showWebMenu()
    }
  }
  
  // Native menu selection
  selected(data) {
    const selectedOption = this.optionsValue[data.index]
    this.handleSelection(selectedOption)
  }
  
  handleSelection(option) {
    // Process the selection
    console.log(`Selected: ${option}`)
  }
  
  showWebMenu() {
    // Web-based menu implementation
  }
}
```

## Bridge Component Best Practices

### 1. Always Provide Web Fallbacks
```erb
<div data-controller="bridge--button">
  <% if hotwire_native_app? %>
    <!-- Native will enhance this -->
    <div data-action="click->bridge--button#tap">
      Tap me
    </div>
  <% else %>
    <!-- Web gets standard button -->
    <button class="btn btn-primary">Click me</button>
  <% end %>
</div>
```

### 2. Keep Components Stateless
```swift
// ❌ Wrong - Storing state
class BadComponent: BridgeComponent {
    var userSelections: [String] = [] // Don't do this!
}

// ✅ Right - Stateless message passing
class GoodComponent: BridgeComponent {
    override func onReceive(message: Message) {
        // Process and forward, don't store
        send("processed", data: message.data)
    }
}
```

### 3. Graceful Enhancement Pattern
```javascript
// Progressive enhancement approach
export default class extends BridgeComponent {
  static component = "camera"
  
  connect() {
    super.connect()
    
    if (this.enabled) {
      // Hide web UI, native will handle
      this.element.querySelector('.web-upload').hidden = true
    }
  }
  
  openCamera() {
    if (this.enabled) {
      this.send("requestCamera")
    } else {
      // Fall back to file input
      this.element.querySelector('input[type=file]').click()
    }
  }
}
```

## Testing Bridge Components

### iOS Testing
```swift
// Tests/BridgeComponentTests.swift
class FormComponentTests: XCTestCase {
    func testMessageHandling() {
        let component = FormComponent()
        let mockDelegate = MockBridgeDelegate()
        component.delegate = mockDelegate
        
        // Test message handling
        let message = Message(
            component: "form",
            event: "connect",
            data: ["title": "Save", "style": "done"]
        )
        
        component.onReceive(message: message)
        
        XCTAssertNotNil(mockDelegate.addedBarButtonItem)
    }
}
```

### JavaScript Testing
```javascript
// test/javascript/bridge/form_controller_test.js
import { Application } from "@hotwired/stimulus"
import FormController from "bridge/form_controller"

describe("FormController", () => {
  let application
  
  beforeEach(() => {
    document.body.innerHTML = `
      <form data-controller="bridge--form"
            data-bridge-form-title="Save">
        <input type="text" name="name">
      </form>
    `
    
    application = Application.start()
    application.register("bridge--form", FormController)
  })
  
  test("sends connect message when enabled", () => {
    const controller = application.controllers[0]
    const sendSpy = jest.spyOn(controller, 'send')
    
    controller.connect()
    
    expect(sendSpy).toHaveBeenCalledWith('connect', {
      title: 'Save',
      style: 'done'
    })
  })
})
```

## Common Mistakes to Avoid

### ❌ Don't Create Stateful Components
```swift
// Wrong - Maintaining state
class StatefulComponent: BridgeComponent {
    var currentData: [String: Any] = [:]
}
```

### ✅ Do Pass Messages
```swift
// Right - Stateless forwarding
class StatelessComponent: BridgeComponent {
    override func onReceive(message: Message) {
        processAndForward(message.data)
    }
}
```

### ❌ Don't Replace Web Functionality
```javascript
// Wrong - Native-only features
if (this.enabled) {
  this.doSomething()
} else {
  throw new Error("Native only!")
}
```

### ✅ Do Enhance Progressively
```javascript
// Right - Works everywhere
this.doSomething() // Core functionality

if (this.enabled) {
  this.addNativeEnhancement() // Extra polish
}
```

## Remember

- Bridge components are messengers, not managers
- Always provide web fallbacks
- State lives in Rails, not bridge components
- Test both native and web paths
- Progressive enhancement over replacement
- Keep messages simple and focused