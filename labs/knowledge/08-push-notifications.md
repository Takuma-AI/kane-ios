# Push Notifications - APNs Integration & Deep Linking

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

```swift
// App/SceneDelegate.swift
import UIKit
import HotwireNative
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // ... existing setup ...
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // ... existing setup ...
        
        // Register for push notifications
        registerForPushNotifications()
        
        // Handle notification if app launched from one
        if let notificationResponse = connectionOptions.notificationResponse {
            handleNotificationResponse(notificationResponse)
        }
    }
    
    private func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("Push authorization granted: \(granted)")
            
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}

// App/AppDelegate.swift (Create this file)
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set up notification delegate
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // Handle successful registration
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device token: \(token)")
        
        // Send to Rails
        PushNotificationService.shared.registerToken(token)
    }
    
    // Handle registration failure
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for push: \(error)")
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

### 3. Push Token Registration Service

```swift
// App/Services/PushNotificationService.swift
import Foundation

class PushNotificationService {
    static let shared = PushNotificationService()
    
    private let baseURL = URL(string: "https://yourapp.com")!
    
    func registerToken(_ token: String) {
        // Store token locally first
        UserDefaults.standard.set(token, forKey: "push_token")
        
        // Send to Rails
        Task {
            await sendTokenToServer(token)
        }
    }
    
    private func sendTokenToServer(_ token: String) async {
        let url = baseURL.appending(path: "/api/push_tokens")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Include user authentication if available
        if let authToken = AuthenticationHelper.shared.retrieveAuthToken() {
            request.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        let payload = ["token": token, "platform": "ios"]
        request.httpBody = try? JSONEncoder().encode(payload)
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                print("Token registration response: \(httpResponse.statusCode)")
            }
        } catch {
            print("Failed to register token: \(error)")
        }
    }
}
```

### 4. Rails Push Token Management

```ruby
# app/models/push_token.rb
class PushToken < ApplicationRecord
  belongs_to :user
  
  validates :token, presence: true, uniqueness: true
  validates :platform, inclusion: { in: %w[ios android] }
  
  scope :ios, -> { where(platform: "ios") }
  scope :active, -> { where(active: true) }
end

# app/controllers/api/push_tokens_controller.rb
class Api::PushTokensController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  
  def create
    @push_token = current_user.push_tokens.find_or_initialize_by(
      token: params[:token],
      platform: params[:platform]
    )
    
    @push_token.active = true
    @push_token.last_used_at = Time.current
    
    if @push_token.save
      render json: { status: "registered" }
    else
      render json: { errors: @push_token.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @push_token = current_user.push_tokens.find_by(token: params[:token])
    @push_token&.update(active: false)
    
    head :no_content
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

### 5. Sending Push Notifications from Rails

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

# Use your APNs certificate or key
APNS_CLIENT = Apnotic::Connection.new(
  cert_path: Rails.root.join("config", "certs", "apns_production.pem"),
  url: Rails.env.production? ? "https://api.push.apple.com" : "https://api.development.push.apple.com"
)
```

### 6. Notification Templates

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

### 7. Rich Notifications (Optional)

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

### 8. Testing Push Notifications

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

## Remember

- Rails decides what and when to send
- iOS handles registration and display
- Deep links use standard URL navigation
- Always provide unsubscribe options
- Test with real devices, not just simulator
- Handle token invalidation gracefully