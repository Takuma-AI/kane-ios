# Push Notifications - APNs Integration & Deep Linking

## ⚠️ CRITICAL: Cookie Synchronization Required

**The Hotwire Native book states that cookies are automatically synced between WKWebView and URLSession. This is only partially true.** The sync happens AFTER web requests complete, but push notification registration often happens BEFORE any web requests have completed. You MUST manually sync cookies.

## Core Principle
Push notifications connect your Rails app to users through Apple Push Notification service (APNs). Rails decides what to send and when, iOS handles device registration and display. Deep links in notifications navigate through the standard URL-driven flow.

## Complete Push Notification Setup

### 1. Enable Push Notifications in Xcode

**Step-by-step Xcode configuration:**
1. Select your project in the navigator
2. Select your app target
3. Go to "Signing & Capabilities" tab
4. Click "+ Capability"
5. Add "Push Notifications"
6. Add "Background Modes" and check "Remote notifications"

### 2. iOS Push Registration

The push notification permission request happens through a bridge component (shown below). But you need to handle the token registration in AppDelegate:

```swift
// App/Delegates/AppDelegate.swift
import UIKit
import HotwireNative

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register bridge components including NotificationTokenComponent
        Hotwire.registerBridgeComponents([
            NotificationTokenComponent.self
        ])
        return true
    }
    
    // Handle successful registration
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device token: \(token)")
        
        // Send to Rails via view model
        Task { await NotificationTokenViewModel().register(deviceToken) }
    }
    
    // Handle registration failure
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error.localizedDescription)")
    }
}

// Handle notifications when app is in foreground
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Show notification even when app is in foreground
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        handleNotificationResponse(response)
        completionHandler()
    }
    
    private func handleNotificationResponse(_ response: UNNotificationResponse) {
        let userInfo = response.notification.request.content.userInfo
        
        // Extract deep link URL
        if let urlString = userInfo["url"] as? String,
           let url = URL(string: urlString) {
            // Navigate through standard flow
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.navigator.navigate(to: url)
            }
        }
    }
}
```

### 3. Bridge Component for Permission Request

The bridge component receives messages from JavaScript and triggers the native permission request. **Important:** The component triggers on ANY message, not a specific event.

```swift
// App/Components/NotificationTokenComponent.swift
import HotwireNative
import UIKit
import UserNotifications

final class NotificationTokenComponent: BridgeComponent {
    override class var name: String { "notification-token" }
    
    override func onReceive(message: Message) {
        // Trigger on ANY message from JavaScript
        print("🔵 NotificationTokenComponent received message: \(message.event)")
        Task { await requestNotificationPermission() }
    }
    
    private func requestNotificationPermission() async {
        do {
            let center = UNUserNotificationCenter.current()
            let options: UNAuthorizationOptions = [.alert, .sound, .badge]
            if try await center.requestAuthorization(options: options) {
                print("🔵 Permission granted! Registering for remote notifications...")
                await MainActor.run {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("🔴 Permission denied by user")
            }
        } catch {
            print("🔴 Failed to authorize: \(error.localizedDescription)")
        }
    }
}
```

**JavaScript Bridge Controller (Rails app):**
```javascript
// app/javascript/controllers/bridge/notification_token_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "notification-token"
  
  connect() {
    super.connect()
    this.send("connect")  // Simple message to trigger iOS
  }
}
```

**Important:** The JavaScript controller must be in `app/javascript/controllers/bridge/` directory and loaded in your index.js:
```javascript
// app/javascript/controllers/index.js
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

eagerLoadControllersFrom("controllers", application)
eagerLoadControllersFrom("controllers/bridge", application)  // REQUIRED!
```

### 4. Send Token to Rails with Cookie Synchronization

**⚠️ CRITICAL:** You MUST sync cookies from WKWebView to URLSession before making the API call. The book's claim that this happens automatically is misleading - it only happens AFTER web requests complete, but token registration often happens BEFORE.

```swift
// App/ViewModels/NotificationTokenViewModel.swift
import Foundation
import WebKit  // REQUIRED for cookie sync!

class NotificationTokenViewModel {
    private var baseURL: URL {
        #if DEBUG
        return URL(string: "http://localhost:3000")!
        #else
        return URL(string: "https://yourapp.com")!
        #endif
    }
    
    func register(_ deviceToken: Data) async {
        // CRITICAL: Sync cookies BEFORE the API call
        await syncCookiesFromWebView()
        
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        let url = baseURL.appending(path: "notification_tokens")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpShouldHandleCookies = true  // Enable cookie handling
        
        do {
            let body = NotificationToken(token: token)
            request.httpBody = try JSONEncoder().encode(body)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("🔵 Token registration response: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 401 {
                    print("🔴 Authentication failed - cookies may not be synced")
                } else if httpResponse.statusCode != 201 && httpResponse.statusCode != 200 {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("🔴 Error response: \(responseString)")
                    }
                }
            }
        } catch {
            print("🔴 Failed to register token: \(error)")
        }
    }
    
    @MainActor
    private func syncCookiesFromWebView() async {
        // Get cookies from WKWebView's default cookie store
        let cookies = await WKWebsiteDataStore.default().httpCookieStore.allCookies()
        
        // Sync them to URLSession's cookie storage
        for cookie in cookies {
            HTTPCookieStorage.shared.setCookie(cookie)
        }
        
        print("🔵 Synced \(cookies.count) cookies from WKWebView to URLSession")
        
        // Debug: Log session cookies
        let sessionCookies = cookies.filter { $0.name.contains("session") || $0.name == "_your_app_session" }
        for cookie in sessionCookies {
            print("🔵 Session cookie: \(cookie.name) = \(cookie.value.prefix(20))...")
        }
    }
}

// App/Models/NotificationToken.swift
struct NotificationToken: Encodable {
    let token: String
    let platform = "iOS"
}
```

**Why Cookie Sync is Required:**
1. WKWebView (used by Hotwire Native) stores cookies in its own cookie jar
2. URLSession (used for API calls) has a separate cookie jar
3. These don't automatically share cookies
4. The book's automatic sync only happens AFTER web requests complete
5. Push registration often happens BEFORE any web requests have completed

### 5. Rails Push Token Management

**⚠️ CRITICAL Authentication Setup:** The controller MUST use session-based authentication that matches your ApplicationController. Do NOT use `cookies.encrypted[:user_id]` directly.

```ruby
# app/models/notification_token.rb (or push_token.rb)
class NotificationToken < ApplicationRecord
  belongs_to :user
  
  validates :token, presence: true
  validates :platform, inclusion: { in: %w[ios iOS android FCM] }
  
  scope :ios, -> { where(platform: ['ios', 'iOS']) }
  scope :android, -> { where(platform: ['android', 'FCM']) }
  scope :active, -> { where(active: true) }
end

# app/models/user.rb - add association
class User < ApplicationRecord
  has_many :notification_tokens  # or push_tokens
  # ... existing code
end

# app/controllers/notification_tokens_controller.rb
class NotificationTokensController < ApplicationController
  skip_before_action :verify_authenticity_token  # Required for JSON requests
  # IMPORTANT: Skip any redirect actions for API endpoints
  skip_before_action :redirect_signed_out_to_welcome, if: -> { defined?(redirect_signed_out_to_welcome) }
  before_action :authenticate_user!
  
  def create
    Rails.logger.info "🔵 NotificationTokensController#create called"
    
    # Handle both JSON and form params flexibly
    token_params = parse_token_params
    
    unless token_params[:token].present?
      Rails.logger.error "🔴 No token provided"
      render json: { error: "Token is required" }, status: :bad_request
      return
    end
    
    token = current_user.notification_tokens.find_or_initialize_by(
      token: token_params[:token]
    )
    
    token.platform = token_params[:platform].to_s.downcase
    token.active = true
    
    if token.save
      Rails.logger.info "🔵 Token saved for user #{current_user.email}"
      render json: { success: true }, status: :created
    else
      Rails.logger.error "🔴 Token save failed: #{token.errors.full_messages}"
      render json: { errors: token.errors.full_messages }, status: :unprocessable_entity
    end
  rescue => e
    Rails.logger.error "🔴 NotificationTokensController error: #{e.message}"
    render json: { error: e.message }, status: :bad_request
  end
  
  private
  
  def parse_token_params
    if request.content_type =~ /json/
      JSON.parse(request.raw_post).symbolize_keys rescue params
    else
      params.permit(:token, :platform, :device_id).to_h
    end
  end
  
  def authenticate_user!
    # CRITICAL: Use ApplicationController's current_user method
    # This uses session[:user_id], NOT cookies.encrypted[:user_id]
    unless current_user
      Rails.logger.error "🔴 No user found in session"
      Rails.logger.error "🔴 Session ID: #{session[:user_id]}"
      render json: { error: "Unauthorized" }, status: :unauthorized
      return false
    end
    
    Rails.logger.info "🔵 Authenticated as #{current_user.email}"
    true
  end
end

# db/migrate/xxx_create_push_tokens.rb
class CreatePushTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :push_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token, null: false
      t.string :platform, null: false
      t.boolean :active, default: true
      t.datetime :last_used_at
      
      t.timestamps
    end
    
    add_index :push_tokens, :token, unique: true
    add_index :push_tokens, [:user_id, :platform]
  end
end
```

### 5. Setting Up APNs Authentication

#### Create APNs Key on Apple Developer Portal

1. Go to [developer.apple.com](https://developer.apple.com/account)
2. Navigate to **Keys** (not Certificates)
3. Click the **+** button to create a new key
4. Name your key (e.g., "Push Notifications")
5. Check **Apple Push Notifications service (APNs)**
6. Click **Continue** then **Register**
7. Download the `.p8` file (you can only download once!)
8. Note the **Key ID** (shown on the page)
9. Note your **Team ID** (top right of the page)

#### Add to Rails Credentials

```bash
rails credentials:edit
```

Add the following structure:

```yaml
apns:
  key_id: "ABC123DEF4"  # Your Key ID from step 8
  team_id: "XYZ789GHI0"  # Your Team ID from step 9
  key: |
    -----BEGIN PRIVATE KEY-----
    [paste the entire contents of your .p8 file here]
    -----END PRIVATE KEY-----
```

The same key works for both development and production, and for all your apps under the same team.

### 6. Sending Push Notifications from Rails

```ruby
# Gemfile
gem 'apnotic' # For APNs
gem 'sidekiq' # For background jobs

# app/services/push_notification_service.rb
class PushNotificationService
  def self.send_to_user(user, title:, body:, url: nil, data: {})
    user.push_tokens.ios.active.each do |token|
      PushNotificationJob.perform_later(
        token: token.token,
        title: title,
        body: body,
        url: url,
        data: data
      )
    end
  end
  
  def self.send_to_tokens(tokens, title:, body:, url: nil, data: {})
    tokens.each do |token|
      PushNotificationJob.perform_later(
        token: token,
        title: title,
        body: body,
        url: url,
        data: data
      )
    end
  end
end

# app/jobs/push_notification_job.rb
class PushNotificationJob < ApplicationJob
  queue_as :push_notifications
  
  def perform(token:, title:, body:, url: nil, data: {})
    notification = build_notification(token, title, body, url, data)
    
    APNS_CLIENT.push(notification)
  rescue => e
    Rails.logger.error "Push notification failed: #{e.message}"
    # Handle invalid tokens
    if e.message.include?("BadDeviceToken")
      PushToken.find_by(token: token)&.update(active: false)
    end
  end
  
  private
  
  def build_notification(token, title, body, url, data)
    notification = Apnotic::Notification.new(token)
    
    notification.alert = {
      title: title,
      body: body
    }
    
    notification.sound = "default"
    notification.badge = 1
    
    # Custom data including deep link
    notification.custom_payload = data.merge(
      url: url || Rails.application.routes.url_helpers.root_url
    )
    
    notification
  end
end

# config/initializers/apns.rb
require 'apnotic'

# Use APNs Authentication Key (.p8) - simpler and more reliable than certificates
credentials = Rails.application.credentials.dig(:apns)

if credentials
  APNS_CLIENT = Apnotic::Connection.new(
    auth_method: :token,
    cert_path: Rails.root.join("config", "certs", "AuthKey_#{credentials[:key_id]}.p8"),
    key_id: credentials[:key_id],
    team_id: credentials[:team_id],
    url: Rails.env.production? ? "https://api.push.apple.com" : "https://api.sandbox.push.apple.com"
  )
end
```

### 7. Notification Templates

```ruby
# app/models/concerns/notifiable.rb
module Notifiable
  extend ActiveSupport::Concern
  
  def send_push_notification(event)
    case event
    when :new_message
      PushNotificationService.send_to_user(
        self,
        title: "New Message",
        body: "You have a new message",
        url: messages_url
      )
    when :resource_updated
      PushNotificationService.send_to_user(
        self,
        title: "Resource Updated",
        body: "Your resource has been updated",
        url: resource_url(resource)
      )
    end
  end
end

# Usage in models
class User < ApplicationRecord
  include Notifiable
  
  has_many :push_tokens
  
  after_commit :notify_followers, on: :update
  
  private
  
  def notify_followers
    followers.each do |follower|
      follower.send_push_notification(:user_updated)
    end
  end
end
```

### 8. Rich Notifications (Optional)

```swift
// Create Notification Service Extension in Xcode
// File → New → Target → Notification Service Extension

// NotificationService.swift
import UserNotifications

class NotificationService: UNNotificationServiceExtension {
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            // Modify the notification content here
            
            // Download image if provided
            if let imageURLString = request.content.userInfo["image_url"] as? String,
               let imageURL = URL(string: imageURLString) {
                downloadImage(from: imageURL) { [weak self] image in
                    if let image = image,
                       let attachment = self?.saveImageToDocuments(image) {
                        bestAttemptContent.attachments = [attachment]
                    }
                    contentHandler(bestAttemptContent)
                }
            } else {
                contentHandler(bestAttemptContent)
            }
        }
    }
}
```

### 9. Testing Push Notifications

```ruby
# test/services/push_notification_service_test.rb
class PushNotificationServiceTest < ActiveSupport::TestCase
  test "sends notification to user tokens" do
    user = users(:john)
    token = user.push_tokens.create!(token: "test_token", platform: "ios")
    
    assert_enqueued_with(job: PushNotificationJob) do
      PushNotificationService.send_to_user(
        user,
        title: "Test",
        body: "Test notification"
      )
    end
  end
end

# Manual testing in Rails console
user = User.first
PushNotificationService.send_to_user(
  user,
  title: "Hello from Rails",
  body: "This is a test notification",
  url: "https://yourapp.com/resources/123"
)
```

## Common Push Patterns

### Actionable Notifications
```swift
// Define notification actions
let likeAction = UNNotificationAction(
    identifier: "LIKE_ACTION",
    title: "Like",
    options: .foreground
)

let replyAction = UNTextInputNotificationAction(
    identifier: "REPLY_ACTION",
    title: "Reply",
    options: [],
    textInputButtonTitle: "Send",
    textInputPlaceholder: "Type your reply..."
)

let category = UNNotificationCategory(
    identifier: "MESSAGE",
    actions: [likeAction, replyAction],
    intentIdentifiers: []
)

UNUserNotificationCenter.current().setNotificationCategories([category])
```

### Silent Push for Background Updates
```ruby
# Silent push to update app content
notification.content_available = true
notification.priority = 5 # Low priority
# No alert, sound, or badge
```

### Badge Management
```ruby
# Update badge count
class User < ApplicationRecord
  def unread_count
    messages.unread.count + notifications.unread.count
  end
  
  def update_badge
    push_tokens.ios.active.each do |token|
      notification = Apnotic::Notification.new(token.token)
      notification.badge = unread_count
      APNS_CLIENT.push(notification)
    end
  end
end
```

## Common Mistakes to Avoid

### ❌ Don't Store Sensitive Data
```ruby
# Wrong - Sensitive data in notification
notification.custom_payload = {
  password: user.password
}
```

### ✅ Use References
```ruby
# Right - Just send ID
notification.custom_payload = {
  message_id: message.id,
  url: message_url(message)
}
```

### ❌ Don't Spam Users
```ruby
# Wrong - Too many notifications
user.followers.each do |follower|
  10.times { send_notification(follower) }
end
```

### ✅ Batch and Throttle
```ruby
# Right - Smart notifications
class NotificationThrottler
  def self.can_notify?(user, type)
    last_sent = user.last_notification_at(type)
    last_sent.nil? || last_sent < 1.hour.ago
  end
end
```

## Troubleshooting Guide (Based on Real Experience)

### Problem: 401 Unauthorized When POSTing Token

**Symptoms:**
- User is logged in through WKWebView
- Token POST fails with 401
- Rails logs show no user in session

**Root Cause:** Cookie synchronization issue. WKWebView and URLSession have separate cookie stores.

**Solution:**
1. Add manual cookie sync in NotificationTokenViewModel before API call
2. Ensure using `session[:user_id]` not `cookies.encrypted[:user_id]` in Rails
3. Add logging to verify cookies are being synced

**Debug Steps:**
```swift
// In NotificationTokenViewModel
print("🔵 Cookies before sync: \(HTTPCookieStorage.shared.cookies?.count ?? 0)")
await syncCookiesFromWebView()
print("🔵 Cookies after sync: \(HTTPCookieStorage.shared.cookies?.count ?? 0)")
```

```ruby
# In Rails controller
Rails.logger.info "Session keys: #{session.keys}"
Rails.logger.info "Cookies: #{cookies.to_h.keys}"
Rails.logger.info "Request headers: #{request.headers.env.select { |k,v| k.start_with?('HTTP_') }}"
```

### Problem: Bridge Component Not Triggering

**Symptoms:**
- JavaScript connects but iOS never receives message
- No permission dialog appears
- Console shows bridge connected but no native response

**Root Causes & Solutions:**

1. **Wrong directory structure:**
   - Must be in `app/javascript/controllers/bridge/` 
   - NOT `app/javascript/controllers/`

2. **Not loading bridge controllers:**
   ```javascript
   // app/javascript/controllers/index.js
   eagerLoadControllersFrom("controllers/bridge", application)  // ADD THIS
   ```

3. **Wrong naming convention:**
   - File: `notification_token_controller.js` (underscores)
   - HTML: `data-controller="bridge--notification-token"` (double dash)
   - Swift: `override class var name: String { "notification-token" }` (single dash)

### Problem: Token Saves But Notifications Don't Arrive

**Symptoms:**
- Token POSTs successfully (201 response)
- Database has token record
- But push notifications never appear

**Debug Checklist:**

1. **Check APNs environment:**
   ```ruby
   # config/initializers/apns.rb
   development = Rails.env.local? || Rails.env.development?
   url = development ? "https://api.sandbox.push.apple.com" : "https://api.push.apple.com"
   ```

2. **Verify token format:**
   ```swift
   // Correct format (hex string)
   deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
   
   // Wrong format (base64 or raw data)
   deviceToken.base64EncodedString()  // DON'T DO THIS
   ```

3. **Test notification sending:**
   ```ruby
   # Rails console
   user = User.find_by(email: "test@example.com")
   token = user.notification_tokens.ios.active.first
   
   # Check token format (should be hex, no spaces/brackets)
   puts "Token: #{token.token}"
   puts "Length: #{token.token.length}"  # Should be 64 for iOS
   
   # Send test notification
   PushNotificationService.send_test(token.token)
   ```

### Problem: Notifications Work in Development but Not Production

**Common Causes:**

1. **Wrong APNs URL:**
   - Development: `https://api.sandbox.push.apple.com`
   - Production: `https://api.push.apple.com`

2. **Missing or incorrect credentials:**
   ```bash
   # Check production credentials
   rails credentials:edit --environment production
   ```

3. **Bundle ID mismatch:**
   - Ensure iOS bundle ID matches what's in Apple Developer portal
   - Check push notification capability is enabled for production

### HTML Trigger Patterns

**Working pattern (what we discovered):**
```erb
<!-- Place in any authenticated view -->
<% if current_user %>
  <div data-controller="bridge--notification-token" style="display: none;"></div>
<% end %>
```

**Why `<meta>` tags might not work:**
- Some Stimulus setups don't scan meta tags
- Div elements are more reliable for controller attachment

## The Critical Insights We Learned

1. **Cookie sync is NOT automatic for immediate API calls** - The book is misleading here
2. **Use consistent authentication** - session[:user_id] everywhere
3. **Bridge components can be simple** - Just send any message to trigger
4. **Directory structure matters** - bridge/ subdirectory is often required
5. **Debug with extensive logging** - You can't see what's happening otherwise

## Remember

- Always test with real devices when possible
- Simulator push notifications require special setup
- Cookie synchronization is the #1 failure point
- When in doubt, add more logging
- The book's examples may need adaptation for your setup
- Rails decides what and when to send
- iOS handles registration and display
- Deep links use standard URL navigation
- Always provide unsubscribe options
- Handle token invalidation gracefully