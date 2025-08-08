# Testing & Debugging - Constraint Validation Through Systematic Testing

## Core Principle
Testing Hotwire Native apps requires validating architectural constraints, not just feature functionality. Tests must verify that the three-layer architecture is maintained, URL-driven navigation works correctly, and bridge components enhance rather than replace web functionality. The goal is to ensure you're following the framework's rules, not just that features work.

Think of testing like building code inspection—you're not just checking if the building stands, but if it follows the architectural plans. In Hotwire Native, those plans say Rails owns logic, iOS coordinates navigation, and bridge components pass messages. Your tests validate these boundaries.

## Understanding What We're Really Testing

When you test a traditional iOS app, you verify that buttons work, data saves correctly, and screens transition properly. With Hotwire Native, you're testing something deeper: that your app respects the framework's constraints.

### The Three Constraints We Validate

1. **Architecture Constraint**: Business logic stays in Rails, not iOS
2. **Navigation Constraint**: All navigation goes through URLs and path configuration
3. **Enhancement Constraint**: Bridge components enhance web features, not replace them

Every test you write should validate at least one of these constraints. If a test doesn't check a constraint, it's probably testing the wrong thing.

## Complete Rails Testing Strategy

Let's start with Rails because that's where your logic lives. These tests ensure your Rails app works correctly for both web and native contexts.

### 1. Testing Models (Your Business Logic)

Your models contain the actual business rules. Test them thoroughly because iOS will rely on them:

```ruby
# spec/models/resource_spec.rb
require 'rails_helper'

RSpec.describe Resource, type: :model do
  # Test your validations - iOS can't override these
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should belong_to(:user) }
  end
  
  # Test business logic that iOS will trigger
  describe "state transitions" do
    let(:resource) { create(:resource, status: 'draft') }
    
    it "sends notification when published" do
      # This tests that your logic works regardless of trigger source
      expect(PushNotificationService).to receive(:notify_followers)
      resource.publish!
    end
    
    it "prevents invalid transitions" do
      resource.update!(status: 'archived')
      
      expect {
        resource.publish!
      }.to raise_error(StateMachine::InvalidTransition)
    end
  end
  
  # Test methods that format data for display
  describe "display helpers" do
    it "formats price for display" do
      resource = build(:resource, price_cents: 2999)
      expect(resource.display_price).to eq("$29.99")
    end
  end
end
```

**Why this matters**: iOS will call these methods through web views. If they don't work in Rails tests, they won't work in your iOS app.

### 2. Testing Controllers (Navigation & Responses)

Controllers need to handle both web and native requests appropriately:

```ruby
# spec/controllers/resources_controller_spec.rb
require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  let(:user) { create(:user) }
  
  before { sign_in user }
  
  describe "GET #index" do
    it "renders for web users" do
      get :index
      
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
    end
    
    it "renders for native app users" do
      # Simulate native app request
      request.headers["User-Agent"] = "YourApp/1.0 Hotwire Native iOS"
      
      get :index
      
      expect(response).to have_http_status(:ok)
      # Should still render HTML, not JSON
      expect(response.content_type).to include("text/html")
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) { { resource: { name: "Test Resource" } } }
      
      it "creates resource and redirects" do
        expect {
          post :create, params: valid_params
        }.to change(Resource, :count).by(1)
        
        expect(response).to redirect_to(Resource.last)
      end
      
      it "includes navigation hints for native app" do
        request.headers["User-Agent"] = "YourApp/1.0 Hotwire Native iOS"
        
        post :create, params: valid_params
        
        # Native app should know to dismiss modal
        expect(response.headers["Turbo-Action"]).to be_present
      end
    end
    
    context "with invalid params" do
      let(:invalid_params) { { resource: { name: "" } } }
      
      it "renders new template with errors" do
        post :create, params: invalid_params
        
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
```

**Key insight**: Notice we're not testing iOS behavior—we're testing that Rails provides the right responses for iOS to interpret.

### 3. Testing Path Configuration

This is unique to Hotwire Native. Your path configuration is code and needs tests:

```ruby
# spec/controllers/configurations_controller_spec.rb
require 'rails_helper'

RSpec.describe ConfigurationsController, type: :controller do
  describe "GET #ios_v1" do
    it "returns valid JSON configuration" do
      get :ios_v1
      
      expect(response).to have_http_status(:ok)
      
      config = JSON.parse(response.body)
      expect(config).to have_key('rules')
      expect(config['rules']).to be_an(Array)
    end
    
    it "includes modal presentation for new/edit paths" do
      get :ios_v1
      
      config = JSON.parse(response.body)
      
      # Find the modal rule
      modal_rule = config['rules'].find { |rule| 
        rule['patterns'].include?('/new$')
      }
      
      expect(modal_rule).to be_present
      expect(modal_rule['properties']['presentation']).to eq('modal')
    end
    
    it "includes authentication flow rules" do
      get :ios_v1
      
      config = JSON.parse(response.body)
      
      # Find auth rule
      auth_rule = config['rules'].find { |rule|
        rule['patterns'].include?('/sessions/new$')
      }
      
      expect(auth_rule).to be_present
      expect(auth_rule['properties']['presentation']).to eq('clear_all')
    end
    
    it "has catch-all rule as last item" do
      get :ios_v1
      
      config = JSON.parse(response.body)
      last_rule = config['rules'].last
      
      expect(last_rule['patterns']).to include('.*')
      expect(last_rule['properties']['presentation']).to eq('push')
    end
  end
end
```

**Why test configuration?** Because path configuration errors break navigation silently. Your app might load but navigation will behave unexpectedly.

### 4. System Tests (Full User Flows)

System tests validate the complete experience, especially navigation patterns:

```ruby
# spec/system/resource_management_spec.rb
require 'rails_helper'

RSpec.describe "Resource management", type: :system do
  let(:user) { create(:user) }
  
  before do
    sign_in user
    # Pretend to be native app
    page.driver.header("User-Agent", "YourApp/1.0 Hotwire Native iOS")
  end
  
  it "completes full CRUD flow with proper navigation" do
    # Start at index
    visit resources_path
    expect(page).to have_content("Resources")
    
    # Click new (should be modal in native)
    click_link "New Resource"
    
    # We're testing the URL changed correctly
    expect(current_path).to eq(new_resource_path)
    
    # Fill form
    fill_in "Name", with: "Integration Test Resource"
    fill_in "Description", with: "Created by system test"
    
    # Submit form
    click_button "Create Resource"
    
    # Should navigate to show page
    resource = Resource.last
    expect(current_path).to eq(resource_path(resource))
    expect(page).to have_content("Integration Test Resource")
    
    # Edit (another modal)
    click_link "Edit"
    expect(current_path).to eq(edit_resource_path(resource))
    
    # Update
    fill_in "Name", with: "Updated Resource"
    click_button "Update Resource"
    
    # Back to show
    expect(current_path).to eq(resource_path(resource))
    expect(page).to have_content("Updated Resource")
    
    # Delete
    accept_confirm do
      click_button "Delete"
    end
    
    # Back to index
    expect(current_path).to eq(resources_path)
    expect(page).not_to have_content("Updated Resource")
  end
  
  it "handles form errors without breaking navigation" do
    visit new_resource_path
    
    # Submit invalid form
    click_button "Create Resource"
    
    # Should stay on new page with errors
    expect(current_path).to eq(resources_path) # Posted to create
    expect(page).to have_content("can't be blank")
    
    # Fix and resubmit
    fill_in "Name", with: "Now Valid"
    click_button "Create Resource"
    
    # Should work now
    expect(page).to have_content("Now Valid")
  end
end
```

**The key**: System tests verify navigation flows work correctly. In Hotwire Native, navigation IS the app behavior.

## iOS Testing (Framework Integration)

Now let's test the iOS side. Remember, we're not testing business logic (that's in Rails)—we're testing framework integration.

### 1. Testing Navigator Integration

The Navigator is the brain of your iOS app. Test that it coordinates correctly:

```swift
// Tests/NavigatorTests.swift
import XCTest
@testable import YourApp
import HotwireNative

class NavigatorTests: XCTestCase {
    var navigator: Navigator!
    var mockDelegate: MockNavigatorDelegate!
    let testURL = URL(string: "https://test.com")!
    
    override func setUp() {
        super.setUp()
        
        let config = Configuration(
            name: "test",
            startLocation: testURL
        )
        navigator = Navigator(configuration: config)
        
        mockDelegate = MockNavigatorDelegate()
        navigator.delegate = mockDelegate
    }
    
    func testBasicNavigation() {
        // Test that navigation goes through proper channels
        let resourceURL = testURL.appending(path: "/resources/123")
        
        navigator.navigate(to: resourceURL)
        
        // Verify delegate was called
        XCTAssertTrue(mockDelegate.didNavigate)
        XCTAssertEqual(mockDelegate.lastURL, resourceURL)
    }
    
    func testModalPresentation() {
        // Configure path rules
        let modalConfig = """
        {
          "rules": [{
            "patterns": ["/new$"],
            "properties": {"presentation": "modal"}
          }]
        }
        """
        
        // Load configuration
        loadPathConfiguration(modalConfig)
        
        // Navigate to new resource
        let newURL = testURL.appending(path: "/resources/new")
        navigator.navigate(to: newURL)
        
        // Verify modal presentation was requested
        XCTAssertEqual(mockDelegate.lastPresentation, .modal)
    }
    
    func testAuthenticationFlow() {
        // Test that 401 triggers login
        let authError = TurboError.requestFailed(statusCode: 401)
        
        // Simulate auth failure
        navigator.handleError(authError)
        
        // Should navigate to login with clear_all
        XCTAssertEqual(mockDelegate.lastURL?.path, "/login")
        XCTAssertEqual(mockDelegate.lastAction, .clearAll)
    }
}

// Mock to verify behavior
class MockNavigatorDelegate: NavigatorDelegate {
    var didNavigate = false
    var lastURL: URL?
    var lastPresentation: NavigationPresentation?
    var lastAction: VisitAction?
    
    func navigator(_ navigator: Navigator, didNavigateTo url: URL) {
        didNavigate = true
        lastURL = url
    }
    
    func navigator(_ navigator: Navigator, didProposeVisit proposal: VisitProposal) {
        lastPresentation = proposal.presentation
        lastAction = proposal.action
    }
}
```

**What we're testing**: Not that navigation works (the framework handles that), but that we're using the framework correctly.

### 2. Testing Bridge Components

Bridge components must remain stateless message passers:

```swift
// Tests/BridgeComponentTests.swift
import XCTest
@testable import YourApp
import HotwireNative

class BridgeComponentTests: XCTestCase {
    var formComponent: FormComponent!
    var mockDelegate: MockBridgeDelegate!
    
    override func setUp() {
        super.setUp()
        formComponent = FormComponent()
        mockDelegate = MockBridgeDelegate()
        formComponent.delegate = mockDelegate
    }
    
    func testConnectMessage() {
        // Test component handles connect properly
        let message = Message(
            component: "form",
            event: "connect",
            data: ["title": "Save", "style": "primary"]
        )
        
        formComponent.onReceive(message: message)
        
        // Should create native button
        XCTAssertNotNil(mockDelegate.lastBarButtonItem)
        XCTAssertEqual(mockDelegate.lastBarButtonItem?.title, "Save")
        
        // Should reply to web
        XCTAssertEqual(mockDelegate.replies.count, 1)
        XCTAssertEqual(mockDelegate.replies.first?.event, "connect")
    }
    
    func testStatelessBehavior() {
        // Components should not store state between messages
        let message1 = Message(
            component: "form",
            event: "updateTitle",
            data: ["title": "First"]
        )
        
        let message2 = Message(
            component: "form",
            event: "updateTitle", 
            data: ["title": "Second"]
        )
        
        formComponent.onReceive(message: message1)
        formComponent.onReceive(message: message2)
        
        // Each message handled independently
        XCTAssertEqual(mockDelegate.replies.count, 2)
        
        // Component should not have stored state
        // This is a constraint test - ensuring statelessness
    }
    
    func testErrorHandling() {
        // Invalid message should not crash
        let badMessage = Message(
            component: "form",
            event: "unknown",
            data: [:]
        )
        
        // Should handle gracefully
        XCTAssertNoThrow(formComponent.onReceive(message: badMessage))
    }
}

class MockBridgeDelegate: BridgeDelegate {
    var lastBarButtonItem: UIBarButtonItem?
    var replies: [Message] = []
    
    var destination: UIViewController {
        return UIViewController() // Mock view controller
    }
    
    func reply(with message: Message) {
        replies.append(message)
    }
}
```

**Critical insight**: We're not testing features, we're testing that components follow the stateless messaging constraint.

### 3. UI Testing (End-to-End Flows)

UI tests verify the complete integration works:

```swift
// UITests/HotwireNativeUITests.swift
import XCTest

class HotwireNativeUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments = ["--uitesting"]
        app.launch()
        
        // Wait for web view to load
        _ = app.webViews.firstMatch.waitForExistence(timeout: 10)
    }
    
    func testResourceCreation() {
        // Navigate to resources
        if app.tabBars.buttons["Resources"].exists {
            app.tabBars.buttons["Resources"].tap()
        }
        
        // Wait for page load
        let resourcesTitle = app.staticTexts["Resources"]
        XCTAssertTrue(resourcesTitle.waitForExistence(timeout: 5))
        
        // Tap new button
        app.buttons["New Resource"].tap()
        
        // Fill form
        let nameField = app.textFields["Name"]
        XCTAssertTrue(nameField.waitForExistence(timeout: 5))
        nameField.tap()
        nameField.typeText("UI Test Resource")
        
        // Submit
        app.buttons["Create Resource"].tap()
        
        // Verify navigation to detail
        let createdResource = app.staticTexts["UI Test Resource"]
        XCTAssertTrue(createdResource.waitForExistence(timeout: 5))
    }
    
    func testTabNavigation() {
        // Test each tab maintains its stack
        
        // Go to resources
        app.tabBars.buttons["Resources"].tap()
        XCTAssertTrue(app.staticTexts["Resources"].waitForExistence(timeout: 5))
        
        // Navigate deeper
        if let firstResource = app.buttons.matching(identifier: "resource-link").firstMatch {
            firstResource.tap()
            Thread.sleep(forTimeInterval: 1)
        }
        
        // Switch tabs
        app.tabBars.buttons["Profile"].tap()
        XCTAssertTrue(app.staticTexts["Profile"].waitForExistence(timeout: 5))
        
        // Return to resources - should maintain position
        app.tabBars.buttons["Resources"].tap()
        
        // Verify we're still in detail view, not index
        XCTAssertFalse(app.staticTexts["Resources"].exists)
    }
    
    func testErrorRecovery() {
        // Simulate network error
        app.launchArguments.append("--simulate-offline")
        app.terminate()
        app.launch()
        
        // Try to navigate
        app.tabBars.buttons["Resources"].tap()
        
        // Should show offline message
        let offlineMessage = app.staticTexts["You're Offline"]
        XCTAssertTrue(offlineMessage.waitForExistence(timeout: 5))
        
        // Should offer retry
        XCTAssertTrue(app.buttons["Try Again"].exists)
    }
}
```

**Key point**: UI tests verify the integration between Rails and iOS works correctly. They're slow but catch real issues.

## JavaScript Testing (Bridge Components)

Don't forget to test your Stimulus controllers that power bridge components:

```javascript
// test/javascript/controllers/bridge/form_controller_test.js
import { Application } from "@hotwired/stimulus"
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"
import FormController from "controllers/bridge/form_controller"

describe("FormController", () => {
  let application
  let controller
  
  beforeEach(() => {
    // Set up DOM
    document.body.innerHTML = `
      <form data-controller="bridge--form"
            data-bridge-form-title="Save"
            data-bridge-form-style="primary">
        <input type="text" name="name">
        <button type="submit">Submit</button>
      </form>
    `
    
    // Start Stimulus
    application = Application.start()
    application.register("bridge--form", FormController)
    
    // Get controller instance
    controller = application.controllers[0]
  })
  
  afterEach(() => {
    application.stop()
  })
  
  test("sends connect message when enabled", () => {
    // Mock the bridge
    controller.enabled = true
    const sendSpy = jest.spyOn(controller, 'send').mockImplementation()
    
    // Trigger connect
    controller.connect()
    
    // Verify message sent
    expect(sendSpy).toHaveBeenCalledWith('connect', {
      title: 'Save',
      style: 'primary'
    })
  })
  
  test("works without bridge", () => {
    // Disable bridge
    controller.enabled = false
    
    // Form should still work
    const form = document.querySelector('form')
    const submitEvent = new Event('submit', { cancelable: true })
    
    // Should not throw
    expect(() => {
      form.dispatchEvent(submitEvent)
    }).not.toThrow()
  })
  
  test("handles native button press", () => {
    controller.enabled = true
    const formSpy = jest.spyOn(controller.element, 'requestSubmit')
    
    // Simulate native button press
    controller.submitButtonPressed()
    
    // Should submit form
    expect(formSpy).toHaveBeenCalled()
  })
})
```

**Important**: Test both enabled (native) and disabled (web) states to ensure progressive enhancement works.

## Debugging Techniques

Testing finds bugs, debugging fixes them. Here's how to debug Hotwire Native effectively.

### 1. Rails Debug Logging

Add logging to understand navigation flow:

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :debug_native_navigation
  
  private
  
  def debug_native_navigation
    if Rails.env.development? && hotwire_native_app?
      Rails.logger.info "="*50
      Rails.logger.info "Native Navigation Debug"
      Rails.logger.info "URL: #{request.url}"
      Rails.logger.info "Method: #{request.method}"
      Rails.logger.info "Referrer: #{request.referrer}"
      Rails.logger.info "Turbo Native: #{request.headers['HTTP_TURBO_NATIVE_APP']}"
      Rails.logger.info "="*50
    end
  end
end
```

### 2. Path Configuration Debugger

Create a tool to test path configuration:

```ruby
# lib/tasks/debug.rake
namespace :debug do
  desc "Test path configuration for a URL"
  task :path_config, [:url] => :environment do |t, args|
    url = args[:url] || "/resources/new"
    
    config = ConfigurationsController.new.send(:navigation_rules)
    
    puts "\nTesting URL: #{url}"
    puts "-" * 50
    
    matched = false
    config.each_with_index do |rule, index|
      rule['patterns'].each do |pattern|
        if url.match?(Regexp.new(pattern))
          puts "✓ Rule #{index}: #{pattern}"
          puts "  Properties: #{rule['properties'].to_json}"
          matched = true
        end
      end
    end
    
    puts "✗ No matching rules!" unless matched
  end
end

# Usage: rails debug:path_config[/resources/123/edit]
```

### 3. iOS Navigation Logger

Add comprehensive logging to iOS:

```swift
// App/Debug/NavigationLogger.swift
#if DEBUG
class NavigationLogger {
    static func logNavigation(_ url: URL, action: VisitAction, presentation: NavigationPresentation?) {
        print("""
        
        🧭 NAVIGATION EVENT
        ├─ URL: \(url.absoluteString)
        ├─ Action: \(action)
        ├─ Presentation: \(presentation?.rawValue ?? "default")
        └─ Time: \(Date())
        
        """)
    }
    
    static func logBridge(component: String, event: String, data: [String: Any]?) {
        print("""
        
        🌉 BRIDGE MESSAGE
        ├─ Component: \(component)
        ├─ Event: \(event)
        ├─ Data: \(data ?? [:])
        └─ Time: \(Date())
        
        """)
    }
    
    static func logError(_ error: Error, context: String) {
        print("""
        
        ❌ ERROR
        ├─ Context: \(context)
        ├─ Error: \(error.localizedDescription)
        ├─ Type: \(type(of: error))
        └─ Time: \(Date())
        
        """)
    }
}
#endif

// Use throughout your app:
NavigationLogger.logNavigation(url, action: .advance, presentation: .push)
```

### 4. Web View Debugging

Enable Safari debugging for web views:

```swift
// In SceneDelegate for debug builds
#if DEBUG
// Enable web inspector
WKWebView.isInspectable = true
#endif
```

Then in Safari:
1. Open Safari
2. Develop menu → Your iOS Simulator
3. Select your web view
4. Use full Safari DevTools

### 5. Bridge Component Debugging

Debug JavaScript bridge communication:

```javascript
// app/javascript/controllers/bridge_controller.js
export default class BridgeController extends BridgeComponent {
  // Add debug logging
  send(event, data = {}) {
    if (this.isDebugEnabled) {
      console.group(`🌉 Bridge: ${this.component}.${event}`)
      console.log('Data:', data)
      console.log('Enabled:', this.enabled)
      console.trace('Call stack')
      console.groupEnd()
    }
    
    super.send(event, data)
  }
  
  get isDebugEnabled() {
    return window.location.search.includes('debug=bridge')
  }
}
```

## Common Testing Pitfalls

### 1. Testing Implementation Instead of Constraints

❌ **Wrong**:
```swift
func testNavigationPushesViewController() {
    // Testing UIKit implementation details
    XCTAssertEqual(navigationController.viewControllers.count, 2)
}
```

✅ **Right**:
```swift
func testNavigationFollowsURLPattern() {
    // Testing framework constraint
    navigator.navigate(to: resourceURL)
    XCTAssertEqual(mockDelegate.lastURL, resourceURL)
}
```

### 2. Testing Business Logic in iOS

❌ **Wrong**:
```swift
func testResourceValidation() {
    // Business logic doesn't belong in iOS
    let resource = Resource(name: "")
    XCTAssertFalse(resource.isValid)
}
```

✅ **Right**:
```ruby
# Test in Rails where logic lives
it "validates presence of name" do
  resource = Resource.new(name: "")
  expect(resource).not_to be_valid
end
```

### 3. Not Testing Both Native and Web Paths

❌ **Wrong**:
```javascript
test("form works with bridge", () => {
  controller.enabled = true
  // Only testing native path
})
```

✅ **Right**:
```javascript
test("form works with and without bridge", () => {
  // Test native path
  controller.enabled = true
  // ... test native behavior
  
  // Test web fallback
  controller.enabled = false
  // ... test web behavior
})
```

## Test Organization Best Practices

### Rails Test Structure
```
spec/
├── models/          # Business logic tests
├── controllers/     # Request/response tests
├── system/          # Full integration tests
├── helpers/         # View helper tests
├── services/        # Service object tests
└── support/         # Shared test helpers
```

### iOS Test Structure
```
Tests/
├── Framework/       # Navigator, Session tests
├── Bridge/          # Bridge component tests
├── Integration/     # Full flow tests
├── Mocks/          # Mock objects
└── Helpers/        # Test utilities
```

### JavaScript Test Structure
```
test/javascript/
├── controllers/     # Stimulus controller tests
│   └── bridge/     # Bridge component tests
├── helpers/        # Test utilities
└── setup.js        # Test configuration
```

## Continuous Integration Setup

Automate your tests to catch constraint violations:

```yaml
# .github/workflows/test.yml
name: Test Suite

on: [push, pull_request]

jobs:
  rails:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
      
      - name: Setup Database
        run: |
          bundle exec rails db:create
          bundle exec rails db:schema:load
      
      - name: Run Rails Tests
        run: |
          bundle exec rspec --format documentation
      
      - name: Check Path Configuration
        run: |
          bundle exec rails runner "
            config = ConfigurationsController.new.send(:navigation_rules)
            raise 'No navigation rules!' if config.empty?
            raise 'No modal rule!' unless config.any? { |r| r['properties']['presentation'] == 'modal' }
          "
  
  ios:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Run iOS Tests
        run: |
          xcodebuild test \
            -scheme YourApp \
            -destination 'platform=iOS Simulator,name=iPhone 14'
      
      - name: Run UI Tests
        run: |
          xcodebuild test \
            -scheme YourAppUITests \
            -destination 'platform=iOS Simulator,name=iPhone 14'
```

## Key Testing Principles

1. **Test constraints, not features** - Validate architecture, not just functionality
2. **Test at the right layer** - Business logic in Rails, coordination in iOS
3. **Test both paths** - Native enhancements AND web fallbacks
4. **Test navigation flows** - URLs and path configuration drive everything
5. **Test error scenarios** - Graceful degradation is critical
6. **Automate everything** - CI catches constraint violations

## Debugging Checklist

When something doesn't work:

1. **Check Rails logs** - Is the request arriving correctly?
2. **Check path configuration** - Does the URL match a rule?
3. **Check iOS console** - Are there navigation errors?
4. **Check Safari inspector** - JavaScript errors in web view?
5. **Check bridge messages** - Are components communicating?
6. **Test in web browser** - Does it work without native?

## Remember

- You're testing that you follow the framework's rules
- Business logic tests belong in Rails
- Navigation tests verify URL-driven flow
- Bridge tests ensure stateless messaging
- Always test progressive enhancement
- Debugging is about finding constraint violations

The goal isn't just working features—it's maintaining the architectural constraints that make Hotwire Native powerful. Test the boundaries, not just the behavior.