# Error Handling & Recovery - Network Failures & Graceful Degradation

## Core Principle
Error handling in Hotwire Native operates through graceful degradation to web functionality—not custom native error systems. When components fail, the framework falls back to standard web behavior. Rails remains the source of truth for all error states and recovery paths.

Think of it like progressive enhancement in reverse. Your app should work like a web app when things go wrong, not crash like a native app. Network failures, server errors, and missing features should all degrade gracefully to web experiences that users understand.

## Understanding Error Flow in Hotwire Native

When errors happen in a Hotwire Native app, here's the cascade:

1. **Network errors** → Framework retries automatically → Shows offline page
2. **Server errors** → Rails handles and redirects → iOS follows the redirect
3. **Authentication errors** → Rails returns 401 → iOS clears navigation and shows login
4. **Bridge component errors** → Falls back to web functionality → User barely notices

The key insight: You don't build error handling in iOS. You build it in Rails, and iOS respects it.

## The Philosophy of Graceful Degradation

Traditional iOS apps often show alert dialogs for errors: "Network error. Tap to retry." This is jarring and breaks the user's flow. Hotwire Native instead asks: "What would a web browser do?"

- **Can't reach server?** Show a friendly offline page
- **Form submission failed?** Show Rails validation errors  
- **Camera not available?** Show file upload input
- **Push notifications failed?** Email notifications still work

Your users get a consistent experience whether things work perfectly or fail spectacularly.

## Complete Error Handling Implementation

Let's build error handling that feels natural and web-like, starting with the iOS side that catches and routes errors appropriately.

### 1. iOS Error Handling Setup

This code goes in your SceneDelegate. It catches various types of errors and handles them appropriately:

```swift
// App/SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    // This method is called whenever navigation fails
    func navigator(_ navigator: Navigator, didFailToLoadLocationWithError error: Error) {
        handleNavigationError(error)
    }
    
    private func handleNavigationError(_ error: Error) {
        // Different errors need different handling
        switch error {
        case let urlError as URLError:
            // Network-related errors
            handleNetworkError(urlError)
            
        case let hotwireError as HotwireError:
            // Framework-specific errors
            handleFrameworkError(hotwireError)
            
        default:
            // Everything else
            handleGenericError(error)
        }
    }
    
    private func handleNetworkError(_ error: URLError) {
        switch error.code {
        case .notConnectedToInternet, .networkConnectionLost:
            // No internet connection
            showOfflineMode()
            
        case .timedOut:
            // Request took too long
            showRetryDialog("Request timed out")
            
        case .cannotFindHost, .cannotConnectToHost:
            // Server is down
            showServerUnavailableMessage()
            
        default:
            // Other network errors
            showGenericNetworkError(error)
        }
    }
    
    private func showOfflineMode() {
        // Navigate to your Rails offline page
        // This page should be cached for offline access
        let offlineURL = baseURL.appending(path: "/offline")
        navigator.navigate(to: offlineURL)
    }
    
    private func showRetryDialog(_ message: String) {
        // iOS native alert - use sparingly!
        let alert = UIAlertController(
            title: "Connection Problem",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
            // Retry the current page
            self.navigator.reload()
        })
        
        alert.addAction(UIAlertAction(title: "Go Home", style: .cancel) { _ in
            // Go back to a known good state
            self.navigator.navigate(to: self.baseURL)
        })
        
        window?.rootViewController?.present(alert, animated: true)
    }
}
```

### 2. Rails Error Handling

Now let's build the Rails side. This is where the real error handling logic lives:

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Catch all errors and handle appropriately
  rescue_from StandardError, with: :handle_standard_error
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActionController::ParameterMissing, with: :handle_bad_request
  
  protected
  
  def handle_standard_error(exception)
    # Log the error for debugging
    Rails.logger.error "Application Error: #{exception.message}"
    Rails.logger.error exception.backtrace.join("\n")
    
    # Handle differently for native vs web
    if hotwire_native_app?
      handle_native_app_error(exception)
    else
      handle_web_app_error(exception)
    end
  end
  
  def handle_not_found(exception)
    if hotwire_native_app?
      # Native apps navigate to error page
      redirect_to not_found_path
    else
      # Web apps show 404 page
      render "errors/404", status: :not_found
    end
  end
  
  private
  
  def handle_native_app_error(exception)
    # Different errors need different handling
    case exception
    when ActiveRecord::ConnectionNotEstablished
      # Database is down
      redirect_to database_error_path
      
    when Net::TimeoutError, Timeout::Error
      # External service timeout
      redirect_to timeout_error_path
      
    else
      # Generic server error
      redirect_to server_error_path
    end
  end
end
```

### 3. Error Pages That Work Everywhere

Your error pages need to work in both web and native contexts. Here's how to build them:

```erb
<!-- app/views/errors/offline.html.erb -->
<div class="error-container">
  <div class="error-content">
    <div class="error-icon">📡</div>
    <h1>You're Offline</h1>
    <p>Check your internet connection to get back online.</p>
    
    <% if hotwire_native_app? %>
      <!-- Native app specific content -->
      <div class="offline-tips">
        <h3>What you can do:</h3>
        <ul>
          <li>Check your WiFi or cellular connection</li>
          <li>Try moving to a location with better signal</li>
          <li>Restart the app if problems persist</li>
        </ul>
      </div>
      
      <!-- Cached content if available -->
      <% if current_user && (recent = current_user.recent_resources).any? %>
        <div class="cached-content">
          <h3>Your Recent Items</h3>
          <% recent.each do |resource| %>
            <div class="cached-item">
              <h4><%= resource.name %></h4>
              <p class="text-muted">Last viewed <%= time_ago_in_words(resource.updated_at) %> ago</p>
            </div>
          <% end %>
        </div>
      <% end %>
    <% else %>
      <!-- Web specific content -->
      <button onclick="window.location.reload()" class="btn btn-primary">
        Try Again
      </button>
    <% end %>
  </div>
</div>

<% if hotwire_native_app? %>
  <script>
    // Auto-retry when connection returns
    window.addEventListener('online', function() {
      setTimeout(() => {
        window.location.href = '<%= root_path %>'
      }, 1000)
    })
  </script>
<% end %>
```

### 4. Network Monitoring 

Let's add network monitoring so we can respond to connection changes:

```swift
// App/Services/NetworkMonitor.swift
import Network

class NetworkMonitor: ObservableObject {
    static let shared = NetworkMonitor()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    @Published var isConnected = true
    @Published var connectionType: ConnectionType = .unknown
    
    enum ConnectionType {
        case wifi, cellular, ethernet, unknown
    }
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.connectionType = self?.getConnectionType(path) ?? .unknown
                
                // Notify the app of connection changes
                if path.status == .satisfied {
                    NotificationCenter.default.post(
                        name: .networkBecameAvailable, 
                        object: nil
                    )
                }
            }
        }
        
        monitor.start(queue: queue)
    }
    
    private func getConnectionType(_ path: NWPath) -> ConnectionType {
        if path.usesInterfaceType(.wifi) {
            return .wifi
        } else if path.usesInterfaceType(.cellular) {
            return .cellular
        } else if path.usesInterfaceType(.wiredEthernet) {
            return .ethernet
        } else {
            return .unknown
        }
    }
}

// Extension to handle network changes
extension Notification.Name {
    static let networkBecameAvailable = Notification.Name("networkBecameAvailable")
}
```

### 5. Bridge Component Error Handling

Bridge components need special error handling because they enhance web functionality. When they fail, we fall back gracefully:

```javascript
// app/javascript/controllers/bridge/resilient_form_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "form"
  static targets = ["submit", "fallback"]
  
  connect() {
    super.connect()
    
    // Check if native component is available
    if (!this.enabled) {
      this.enableWebFallback()
    }
  }
  
  // Try to use native feature
  submit() {
    if (this.enabled) {
      try {
        this.send("submit", this.formData)
      } catch (error) {
        console.error("Bridge error:", error)
        this.handleBridgeError()
      }
    } else {
      this.submitViaWeb()
    }
  }
  
  // Native component reported an error
  error(data) {
    console.error("Native error:", data.message)
    
    if (data.fallback) {
      // Native says to use web fallback
      this.enableWebFallback()
    } else {
      // Show error to user
      this.showError(data.message)
    }
  }
  
  handleBridgeError() {
    // Bridge failed, fall back to web
    this.enabled = false
    this.enableWebFallback()
    
    // Try again with web method
    this.submitViaWeb()
  }
  
  enableWebFallback() {
    // Hide native UI elements
    this.element.querySelectorAll('[data-native-only]').forEach(el => {
      el.style.display = 'none'
    })
    
    // Show web UI elements
    this.element.querySelectorAll('[data-web-fallback]').forEach(el => {
      el.style.display = 'block'  
    })
    
    // Notify user if appropriate
    if (this.shouldNotifyUser()) {
      this.showInfo("Using standard form submission")
    }
  }
  
  submitViaWeb() {
    // Standard form submission
    this.element.requestSubmit()
  }
  
  shouldNotifyUser() {
    // Only notify for significant feature degradation
    return this.data.get("notify-on-fallback") === "true"
  }
}
```

### 6. Form Error Display

Rails validation errors should display nicely in both web and native:

```erb
<!-- app/views/shared/_form_errors.html.erb -->
<% if object.errors.any? %>
  <div class="error-messages" role="alert">
    <% if hotwire_native_app? %>
      <!-- Clean native-friendly error display -->
      <div class="error-summary">
        <p class="error-title">Please fix the following:</p>
        <ul class="error-list">
          <% object.errors.full_messages.each do |message| %>
            <li><%= message %></li>
          <% end %>
        </ul>
      </div>
    <% else %>
      <!-- Traditional web error display -->
      <div class="alert alert-danger">
        <h4 class="alert-heading">
          <%= pluralize(object.errors.count, "error") %> prohibited this from being saved:
        </h4>
        <ul class="mb-0">
          <% object.errors.full_messages.each do |message| %>
            <li><%= message %></li>
          <% end %>
        </ul>
      </div>
    <% end %>
  </div>
<% end %>
```

## Error Recovery Patterns

### Automatic Retry with Backoff

When network requests fail, retry intelligently:

```ruby
# app/services/resilient_request_service.rb
class ResilientRequestService
  MAX_RETRIES = 3
  
  def self.fetch(url, options = {})
    retries = 0
    
    begin
      response = HTTP.timeout(10).get(url, options)
      
      if response.status.success?
        response
      else
        raise "Request failed: #{response.status}"
      end
      
    rescue => e
      retries += 1
      
      if retries < MAX_RETRIES
        # Exponential backoff: 1s, 2s, 4s
        sleep(2 ** (retries - 1))
        retry
      else
        # Final failure - handle gracefully
        Rails.logger.error "Request failed after #{MAX_RETRIES} attempts: #{e}"
        nil
      end
    end
  end
end
```

### Offline Queue for Actions

Queue user actions when offline and sync when connection returns:

```ruby
# app/models/offline_action.rb
class OfflineAction < ApplicationRecord
  belongs_to :user
  
  scope :pending, -> { where(synced_at: nil) }
  
  def self.queue(user, action, params)
    create!(
      user: user,
      action: action,
      params: params,
      created_at: Time.current
    )
  end
  
  def sync!
    case action
    when "create_resource"
      Resource.create!(params)
    when "update_resource"
      Resource.find(params["id"]).update!(params.except("id"))
    end
    
    update!(synced_at: Time.current)
  rescue => e
    update!(error: e.message, failed_at: Time.current)
  end
end

# Sync when online
class SyncOfflineActionsJob < ApplicationJob
  def perform(user)
    user.offline_actions.pending.each(&:sync!)
  end
end
```

## Testing Error Scenarios

### Testing Network Failures

```ruby
# test/system/error_handling_test.rb
class ErrorHandlingTest < ApplicationSystemTestCase
  test "handles network timeout gracefully" do
    # Simulate slow network
    page.driver.browser.network_conditions = {
      offline: false,
      latency: 5000,  # 5 second latency
      throughput: 500 # Slow connection
    }
    
    visit resources_path
    
    # Should show timeout message
    assert_text "Request timed out"
    
    # Retry should work
    click_button "Retry"
    assert_text "Resources"
  end
  
  test "shows offline page when disconnected" do
    # Go offline
    page.driver.browser.network_conditions = { offline: true }
    
    visit resources_path
    
    assert_text "You're Offline"
    assert_text "Check your internet connection"
  end
end
```

### Testing Error Recovery

```swift
// Tests/ErrorRecoveryTests.swift
class ErrorRecoveryTests: XCTestCase {
    func testNetworkErrorRecovery() {
        let navigator = Navigator(configuration: testConfig)
        let delegate = MockNavigatorDelegate()
        navigator.delegate = delegate
        
        // Simulate network error
        let error = URLError(.notConnectedToInternet)
        delegate.navigator(navigator, didFailToLoadLocationWithError: error)
        
        // Should navigate to offline page
        XCTAssertEqual(delegate.lastNavigatedURL?.path, "/offline")
    }
}
```

## Common Error Patterns and Solutions

### Authentication Expiry

When sessions expire, handle it gracefully:

```ruby
class ApplicationController < ActionController::Base
  rescue_from AuthenticationError do
    if hotwire_native_app?
      # Send 401 to trigger iOS login flow
      head :unauthorized
    else
      redirect_to login_path, alert: "Please sign in to continue"
    end
  end
end
```

### Rate Limiting

Show friendly messages for rate limits:

```ruby
rescue_from RateLimitExceeded do |exception|
  if hotwire_native_app?
    redirect_to rate_limit_path(retry_after: exception.retry_after)
  else
    render "errors/rate_limit", status: :too_many_requests
  end
end
```

### Service Degradation

When external services fail, degrade features gracefully:

```ruby
def show
  @resource = Resource.find(params[:id])
  
  # Try to load enhanced data
  @recommendations = begin
    RecommendationService.for(@resource)
  rescue ServiceUnavailable
    # Degrade gracefully - just don't show recommendations
    []
  end
end
```

## Key Principles for Error Handling

1. **Fail like the web** - Show pages, not alerts
2. **Degrade gracefully** - Remove features, don't crash
3. **Retry intelligently** - With backoff and limits
4. **Cache for offline** - Show something useful
5. **Log everything** - You'll need it for debugging
6. **Test failure paths** - They're used more than you think

## The User Experience of Errors

Good error handling in Hotwire Native feels like using a well-built website:
- Network errors show a friendly offline page
- Server errors show helpful messages
- Form errors appear inline
- Everything can be retried
- The app never crashes

Bad error handling feels like a broken native app:
- Alert dialogs everywhere
- Cryptic error codes
- Lost user data
- Need to force-quit and restart
- No clear path forward

## Remember

- Rails handles error logic, iOS just displays results
- Always provide fallbacks for native features
- Test with airplane mode and slow networks
- Log errors for debugging but show friendly messages
- When in doubt, do what a web browser would do
- Recovery should be automatic when possible

The goal is an app that handles errors so gracefully that users barely notice when things go wrong. They just see helpful messages and clear next steps, whether they're online or offline, whether features work or fail.