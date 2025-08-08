# Deployment & Distribution - Rails-Centric with iOS Coordination

## Core Principle
Deployment in Hotwire Native is Rails-centric with iOS coordination—not independent app releases. The Rails app drives functionality, with iOS releases primarily for framework updates, new platform features, or configuration changes. Most features deploy instantly through Rails, while iOS updates happen rarely and carefully.

Think of it like this: Your Rails app is a live TV broadcast that can change content instantly. The iOS app is the TV set—it only needs updates when you want new channels (features) or better reception (performance). The content (your app's functionality) updates through the broadcast, not by buying a new TV.

## Understanding Deployment Dependencies

In traditional iOS development, every feature requires an app store release. With Hotwire Native, this changes dramatically. Let's understand what deploys where:

### What Deploys Through Rails (Instantly)
- All business logic changes
- UI/UX updates 
- New screens and flows
- Navigation patterns (path configuration)
- Feature toggles
- Content updates
- Bug fixes in business logic

### What Requires iOS Release (App Store)
- Hotwire Native framework updates
- New native screens (camera, maps, etc.)
- Bridge component native code
- Push notification setup
- New iOS permissions
- Performance improvements
- Bundle ID or configuration URL changes

**The key insight**: 90% of your changes deploy through Rails. iOS releases are rare events for platform updates.

## Complete Rails Deployment Setup

Let's start with Rails since that's where most deployment happens.

### 1. Environment Configuration

Your Rails app needs to handle different iOS environments:

```ruby
# config/environments/production.rb
Rails.application.configure do
  # Force SSL for security
  config.force_ssl = true
  
  # Secure session cookies
  config.session_store :cookie_store, 
    key: '_yourapp_session',
    secure: true,
    httponly: true,
    same_site: :lax  # Allow iOS app to send cookies
  
  # Cache path configuration for performance
  config.action_controller.perform_caching = true
  config.cache_store = :redis_cache_store
  
  # Enable compression
  config.middleware.use Rack::Deflater
  
  # Hotwire Native specific settings
  config.hotwire_native = {
    enabled: true,
    force_update_version: "1.0.0"  # Force update below this version
  }
end

# config/environments/staging.rb
Rails.application.configure do
  # Similar to production but different URLs
  config.force_ssl = true
  
  # Allow TestFlight builds to connect
  config.hosts << "staging.yourapp.com"
  
  # More verbose logging for debugging
  config.log_level = :debug
end
```

### 2. Feature Flags for iOS Versions

Control feature rollout based on iOS app version:

```ruby
# app/models/feature_flag.rb
class FeatureFlag
  # Define features and their requirements
  FEATURES = {
    camera_enhancement: {
      min_ios_version: "1.2.0",
      min_web_version: nil,  # Always available on web
      description: "Advanced camera with filters"
    },
    offline_mode: {
      min_ios_version: "1.3.0",
      min_web_version: nil,  # Not available on web
      description: "Work without internet connection"
    },
    ar_viewer: {
      min_ios_version: "1.4.0",
      min_web_version: nil,
      description: "Augmented reality features"
    },
    smart_notifications: {
      min_ios_version: "1.1.0",
      min_web_version: "1.0.0",  # Also needs web support
      description: "AI-powered notification timing"
    }
  }.freeze
  
  def self.enabled?(feature_name, context = {})
    feature = FEATURES[feature_name]
    return false unless feature
    
    if context[:ios_version]
      # Check iOS version requirement
      ios_version_sufficient?(context[:ios_version], feature[:min_ios_version])
    elsif context[:web]
      # Check if available on web
      feature[:min_web_version].nil? || 
        web_version_sufficient?(feature[:min_web_version])
    else
      false
    end
  end
  
  private
  
  def self.ios_version_sufficient?(current, required)
    return true if required.nil?
    
    Gem::Version.new(current) >= Gem::Version.new(required)
  rescue ArgumentError
    false
  end
  
  def self.web_version_sufficient?(required)
    # Your web versioning logic
    true
  end
end

# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :feature_enabled?
  
  def feature_enabled?(feature_name)
    if hotwire_native_app?
      FeatureFlag.enabled?(
        feature_name, 
        ios_version: request.headers['X-App-Version']
      )
    else
      FeatureFlag.enabled?(feature_name, web: true)
    end
  end
  
  # Use in views
  # <% if feature_enabled?(:camera_enhancement) %>
  #   <%= link_to "Enhanced Camera", camera_path %>
  # <% else %>
  #   <%= link_to "Basic Camera", basic_camera_path %>
  # <% end %>
end
```

### 3. Version Compatibility Checking

Ensure iOS app compatibility with Rails:

```ruby
# app/controllers/api/version_controller.rb
class Api::VersionController < ApplicationController
  skip_before_action :authenticate_user!
  
  def check
    ios_version = request.headers['X-App-Version'] || '0.0.0'
    
    compatibility = VersionCompatibility.check(ios_version)
    
    render json: {
      ios_version: ios_version,
      rails_version: Rails.application.config.version,
      compatible: compatibility[:compatible],
      minimum_version: compatibility[:minimum_version],
      recommended_version: compatibility[:recommended_version],
      force_update: compatibility[:force_update],
      update_url: app_store_url,
      message: compatibility[:message]
    }
  end
  
  private
  
  def app_store_url
    "https://apps.apple.com/app/idYOURAPPID"
  end
end

# app/models/version_compatibility.rb
class VersionCompatibility
  COMPATIBILITY = {
    minimum: "1.0.0",     # Absolute minimum
    recommended: "1.3.0", # Has all current features
    force_below: "0.9.0"  # Force update below this
  }.freeze
  
  def self.check(ios_version)
    version = Gem::Version.new(ios_version) rescue Gem::Version.new("0.0.0")
    minimum = Gem::Version.new(COMPATIBILITY[:minimum])
    recommended = Gem::Version.new(COMPATIBILITY[:recommended])
    force_threshold = Gem::Version.new(COMPATIBILITY[:force_below])
    
    if version < force_threshold
      {
        compatible: false,
        force_update: true,
        minimum_version: COMPATIBILITY[:minimum],
        recommended_version: COMPATIBILITY[:recommended],
        message: "This version is no longer supported. Please update to continue."
      }
    elsif version < minimum
      {
        compatible: false,
        force_update: false,
        minimum_version: COMPATIBILITY[:minimum],
        recommended_version: COMPATIBILITY[:recommended],
        message: "Please update for the best experience."
      }
    elsif version < recommended
      {
        compatible: true,
        force_update: false,
        minimum_version: COMPATIBILITY[:minimum],
        recommended_version: COMPATIBILITY[:recommended],
        message: "An update is available with new features."
      }
    else
      {
        compatible: true,
        force_update: false,
        minimum_version: COMPATIBILITY[:minimum],
        recommended_version: COMPATIBILITY[:recommended],
        message: "You're up to date!"
      }
    end
  end
end
```

## iOS Build Configuration

Now let's set up the iOS side for multiple environments.

### 1. Build Configurations in Xcode

**Setting up configurations:**
1. In Xcode, select your project
2. Select the project (not target) in the editor
3. Go to Info tab
4. Under Configurations, you'll see Debug and Release
5. Click + to add new configurations:
   - Duplicate Release, name it "Staging"
   - Duplicate Debug, name it "Development"

### 2. Environment-Specific Code

```swift
// App/Configuration/AppConfiguration.swift
import Foundation

enum Environment {
    case development
    case staging
    case production
    
    static var current: Environment {
        #if DEVELOPMENT
        return .development
        #elseif STAGING
        return .staging
        #else
        return .production
        #endif
    }
}

struct AppConfiguration {
    static let shared = AppConfiguration()
    
    let environment: Environment
    let baseURL: URL
    let pathConfigurationURL: URL
    let bundleIdentifier: String
    
    private init() {
        self.environment = Environment.current
        
        switch environment {
        case .development:
            self.baseURL = URL(string: "http://localhost:3000")!
            self.bundleIdentifier = "com.yourcompany.app.dev"
            
        case .staging:
            self.baseURL = URL(string: "https://staging.yourapp.com")!
            self.bundleIdentifier = "com.yourcompany.app.staging"
            
        case .production:
            self.baseURL = URL(string: "https://yourapp.com")!
            self.bundleIdentifier = "com.yourcompany.app"
        }
        
        self.pathConfigurationURL = baseURL.appending(path: "/configurations/ios-v1.json")
    }
    
    // Version information
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }
    
    var buildNumber: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }
    
    var fullVersion: String {
        "\(appVersion) (\(buildNumber))"
    }
    
    // Detect TestFlight
    var isTestFlight: Bool {
        guard let receiptURL = Bundle.main.appStoreReceiptURL else { return false }
        return receiptURL.lastPathComponent == "sandboxReceipt"
    }
    
    // Detect Debug builds
    var isDebugBuild: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}
```

### 3. Update SceneDelegate for Environments

```swift
// App/SceneDelegate.swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private lazy var navigator = Navigator(
        configuration: Configuration(
            name: AppConfiguration.shared.environment.name,
            startLocation: AppConfiguration.shared.baseURL,
            pathConfigurationURL: AppConfiguration.shared.pathConfigurationURL
        )
    )
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigator.rootViewController
        window?.makeKeyAndVisible()
        
        // Configure for environment
        configureForEnvironment()
        
        // Start navigation
        navigator.navigate(to: AppConfiguration.shared.baseURL)
    }
    
    private func configureForEnvironment() {
        // Add visual indicators for non-production
        if AppConfiguration.shared.environment != .production {
            addEnvironmentIndicator()
        }
        
        // Check version compatibility
        checkVersionCompatibility()
        
        // Configure logging
        configureLogging()
    }
    
    private func addEnvironmentIndicator() {
        let label = UILabel()
        label.text = AppConfiguration.shared.environment.displayName
        label.backgroundColor = AppConfiguration.shared.environment.color
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 50, width: 100, height: 25)
        label.layer.cornerRadius = 12.5
        label.clipsToBounds = true
        
        window?.addSubview(label)
    }
    
    private func checkVersionCompatibility() {
        Task {
            do {
                try await VersionChecker.shared.checkCompatibility()
            } catch {
                handleVersionError(error)
            }
        }
    }
}
```

### 4. Version Checking Service

```swift
// App/Services/VersionChecker.swift
import Foundation

class VersionChecker {
    static let shared = VersionChecker()
    
    func checkCompatibility() async throws {
        let url = AppConfiguration.shared.baseURL.appending(path: "/api/version/check")
        
        var request = URLRequest(url: url)
        request.setValue(AppConfiguration.shared.appVersion, forHTTPHeaderField: "X-App-Version")
        request.setValue("Hotwire Native iOS", forHTTPHeaderField: "User-Agent")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw VersionError.invalidResponse
        }
        
        if httpResponse.statusCode != 200 {
            throw VersionError.serverError(httpResponse.statusCode)
        }
        
        let versionInfo = try JSONDecoder().decode(VersionInfo.self, from: data)
        
        if versionInfo.forceUpdate {
            throw VersionError.forceUpdateRequired(versionInfo.message)
        }
        
        if !versionInfo.compatible {
            // Show update prompt but don't force
            await showUpdatePrompt(message: versionInfo.message, url: versionInfo.updateUrl)
        }
    }
    
    private func showUpdatePrompt(message: String, url: String?) async {
        await MainActor.run {
            let alert = UIAlertController(
                title: "Update Available",
                message: message,
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "Update", style: .default) { _ in
                if let urlString = url, let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            })
            
            alert.addAction(UIAlertAction(title: "Later", style: .cancel))
            
            // Find top view controller and present
            if let topVC = UIApplication.shared.keyWindow?.rootViewController {
                topVC.present(alert, animated: true)
            }
        }
    }
}

struct VersionInfo: Codable {
    let iosVersion: String
    let railsVersion: String
    let compatible: Bool
    let minimumVersion: String
    let recommendedVersion: String
    let forceUpdate: Bool
    let updateUrl: String?
    let message: String
}

enum VersionError: LocalizedError {
    case invalidResponse
    case serverError(Int)
    case forceUpdateRequired(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Unable to check version compatibility"
        case .serverError(let code):
            return "Server error: \(code)"
        case .forceUpdateRequired(let message):
            return message
        }
    }
}
```

## TestFlight Distribution

TestFlight is your beta testing platform. Here's how to configure it properly.

### 1. TestFlight Detection and Configuration

```swift
// App/Services/TestFlightDetector.swift
class TestFlightDetector {
    static var isTestFlight: Bool {
        guard let receiptURL = Bundle.main.appStoreReceiptURL else { return false }
        return receiptURL.lastPathComponent == "sandboxReceipt"
    }
    
    static var isDebugBuild: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    static var buildEnvironment: String {
        if isDebugBuild {
            return "Debug"
        } else if isTestFlight {
            return "TestFlight"
        } else {
            return "App Store"
        }
    }
    
    static func configureFeedback() {
        if isTestFlight {
            // Enable shake for feedback
            UIApplication.shared.applicationSupportsShakeToEdit = true
            
            // Add feedback button to navigation
            NotificationCenter.default.addObserver(
                forName: UIApplication.didBecomeActiveNotification,
                object: nil,
                queue: .main
            ) { _ in
                addFeedbackButton()
            }
        }
    }
    
    private static func addFeedbackButton() {
        // Add floating feedback button for TestFlight builds
        let button = UIButton(type: .system)
        button.setTitle("📝", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 30
        button.frame = CGRect(x: UIScreen.main.bounds.width - 80, y: 100, width: 60, height: 60)
        
        button.addTarget(self, action: #selector(showFeedback), for: .touchUpInside)
        
        UIApplication.shared.keyWindow?.addSubview(button)
    }
    
    @objc private static func showFeedback() {
        // Show feedback form
        let feedbackURL = AppConfiguration.shared.baseURL.appending(path: "/feedback/testflight")
        
        if let navigator = (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.viewControllers.first {
            // Navigate to feedback form
        }
    }
}
```

### 2. Rails TestFlight Support

```ruby
# app/controllers/feedback_controller.rb
class FeedbackController < ApplicationController
  def testflight
    @feedback = Feedback.new(
      source: 'testflight',
      ios_version: request.headers['X-App-Version'],
      user: current_user
    )
  end
  
  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    @feedback.metadata = {
      ios_version: request.headers['X-App-Version'],
      build_number: request.headers['X-Build-Number'],
      testflight: request.headers['X-TestFlight-Build'] == 'true',
      device_model: request.headers['X-Device-Model']
    }
    
    if @feedback.save
      FeedbackMailer.testflight_feedback(@feedback).deliver_later
      redirect_to root_path, notice: "Thanks for your feedback!"
    else
      render :testflight
    end
  end
  
  private
  
  def feedback_params
    params.require(:feedback).permit(:title, :description, :category)
  end
end
```

## App Store Release Process

### 1. Pre-Release Checklist

Create an automated checklist:

```ruby
# lib/tasks/ios_release.rake
namespace :ios do
  desc "Pre-release checklist for iOS app"
  task :prerelease => :environment do
    puts "🚀 iOS Pre-Release Checklist"
    puts "=" * 50
    
    # 1. Check path configuration
    check_task "Path configuration valid" do
      config = ConfigurationsController.new.ios_v1
      rules = JSON.parse(config)['rules']
      rules.any? && rules.last['patterns'].include?('.*')
    end
    
    # 2. Check API endpoints
    check_task "API endpoints responding" do
      endpoints = [
        '/api/version/check',
        '/configurations/ios-v1.json',
        '/api/push_tokens'
      ]
      
      endpoints.all? do |endpoint|
        Rails.application.routes.recognize_path(endpoint)
        true
      rescue
        false
      end
    end
    
    # 3. Check feature flags
    check_task "Feature flags configured" do
      FeatureFlag::FEATURES.all? do |name, config|
        config[:min_ios_version].present? || config[:min_web_version].present?
      end
    end
    
    # 4. Check error pages
    check_task "Error pages exist" do
      %w[404 500 offline].all? do |page|
        File.exist?(Rails.root.join("public/#{page}.html")) ||
        File.exist?(Rails.root.join("app/views/errors/#{page}.html.erb"))
      end
    end
    
    # 5. Performance check
    check_task "Performance benchmarks pass" do
      # Run your performance tests
      system("bundle exec rspec spec/performance --tag ios_critical")
    end
    
    puts "\n✅ All checks passed! Ready for iOS release."
  end
  
  def check_task(name)
    print "Checking #{name}... "
    if yield
      puts "✅"
      true
    else
      puts "❌"
      raise "Check failed: #{name}"
    end
  end
end
```

### 2. Deployment Scripts

Automate the deployment process:

```bash
#!/bin/bash
# scripts/deploy_ios.sh

set -e  # Exit on error

echo "🚀 Starting iOS Release Process"
echo "================================"

# 1. Run pre-release checks
echo "📋 Running pre-release checks..."
bundle exec rake ios:prerelease

# 2. Deploy Rails updates first
echo "🌐 Deploying Rails updates..."
git push production main
heroku run rails db:migrate --app yourapp-production

# 3. Verify Rails deployment
echo "✅ Verifying Rails deployment..."
curl -f https://yourapp.com/api/version/check || exit 1

# 4. Build iOS app
echo "📱 Building iOS app..."
cd ios
xcodebuild -workspace YourApp.xcworkspace \
           -scheme YourApp \
           -configuration Release \
           -archivePath ../build/YourApp.xcarchive \
           archive

# 5. Export for App Store
echo "📦 Exporting for App Store..."
xcodebuild -exportArchive \
           -archivePath ../build/YourApp.xcarchive \
           -exportOptionsPlist ExportOptions.plist \
           -exportPath ../build/

# 6. Upload to App Store Connect
echo "⬆️ Uploading to App Store Connect..."
xcrun altool --upload-app \
             -f ../build/YourApp.ipa \
             -t ios \
             -u "$APP_STORE_USERNAME" \
             -p "$APP_STORE_PASSWORD"

echo "✅ iOS app uploaded successfully!"
echo "📝 Remember to:"
echo "  - Submit for review in App Store Connect"
echo "  - Update release notes"
echo "  - Notify the team"
```

### 3. Production Monitoring

Monitor your deployed app:

```ruby
# app/models/app_metrics.rb
class AppMetrics
  def self.track_ios_usage
    ios_sessions = Session.where("user_agent LIKE ?", "%Hotwire Native%")
                          .group("DATE(created_at)")
                          .count
    
    ios_versions = Session.where("user_agent LIKE ?", "%Hotwire Native%")
                          .group(:app_version)
                          .count
    
    {
      daily_sessions: ios_sessions,
      version_distribution: ios_versions,
      total_ios_users: User.joins(:sessions)
                           .where("sessions.user_agent LIKE ?", "%Hotwire Native%")
                           .distinct
                           .count
    }
  end
  
  def self.slow_requests_report
    SlowRequest.where("user_agent LIKE ?", "%Hotwire Native%")
               .group(:path)
               .average(:duration)
               .sort_by { |path, duration| -duration }
               .first(10)
  end
end

# app/controllers/admin/metrics_controller.rb
class Admin::MetricsController < Admin::BaseController
  def ios
    @metrics = AppMetrics.track_ios_usage
    @slow_requests = AppMetrics.slow_requests_report
    @version_compatibility = check_version_distribution
  end
  
  private
  
  def check_version_distribution
    versions = Session.where("user_agent LIKE ?", "%Hotwire Native%")
                      .group(:app_version)
                      .count
    
    versions.map do |version, count|
      {
        version: version,
        count: count,
        percentage: (count.to_f / versions.values.sum * 100).round(1),
        status: version_status(version)
      }
    end
  end
  
  def version_status(version)
    compatibility = VersionCompatibility.check(version)
    
    if compatibility[:force_update]
      'critical'
    elsif !compatibility[:compatible]
      'outdated'
    elsif version < VersionCompatibility::COMPATIBILITY[:recommended]
      'updateable'
    else
      'current'
    end
  end
end
```

## Rollback Strategies

Sometimes you need to rollback Rails changes while iOS apps are in the wild:

```ruby
# lib/rollback_safety.rb
class RollbackSafety
  def self.can_rollback_to?(git_sha)
    # Get active iOS versions
    active_versions = Session.where("created_at > ?", 24.hours.ago)
                             .where("user_agent LIKE ?", "%Hotwire Native%")
                             .pluck(:app_version)
                             .uniq
    
    # Check each version's compatibility with target commit
    active_versions.all? do |version|
      check_version_compatibility_with_commit(version, git_sha)
    end
  end
  
  private
  
  def self.check_version_compatibility_with_commit(ios_version, git_sha)
    # Your logic to determine if this iOS version
    # can work with the Rails code at git_sha
    # 
    # This might check:
    # - Required API endpoints exist
    # - Path configuration format matches
    # - No breaking changes in URLs
    
    true # Simplified example
  end
end

# Usage in deployment
if RollbackSafety.can_rollback_to?(target_sha)
  puts "✅ Safe to rollback"
  # Proceed with rollback
else
  puts "❌ Rollback would break iOS apps"
  # Need to coordinate iOS update first
end
```

## Key Deployment Principles

1. **Rails leads, iOS follows** - Deploy features through Rails whenever possible
2. **Version everything** - Track iOS versions to manage compatibility
3. **Feature flag liberally** - Control rollout based on app versions
4. **Monitor actively** - Track iOS-specific metrics and errors
5. **Coordinate carefully** - iOS releases need Rails compatibility
6. **Rollback safely** - Consider active iOS versions before Rails rollbacks

## Common Deployment Patterns

### Progressive Feature Rollout
```ruby
# Start with newest iOS versions
if ios_version >= "1.3.0"
  # New feature available
elsif ios_version >= "1.2.0"  
  # Degraded experience
else
  # Basic functionality only
end
```

### Emergency iOS Update
```ruby
# Force update for critical issues
if ios_version < "1.0.5"
  render json: {
    force_update: true,
    message: "Critical security update required"
  }, status: 426 # Upgrade Required
end
```

### A/B Testing Across Versions
```ruby
# Test features by iOS version
if ios_version >= "1.2.0" && ab_test_enabled?(:new_navigation)
  # Show experimental navigation
else
  # Show standard navigation
end
```

## Remember

- Rails deploys continuously, iOS deploys rarely
- Most features ship through Rails instantly
- iOS updates are for platform features only
- Version compatibility is critical
- Monitor iOS-specific metrics
- Feature flags enable safe rollout
- TestFlight is your friend for beta testing
- Always have a rollback plan

The power of Hotwire Native is that your Rails app can evolve daily while iOS apps in the App Store remain stable. Use this power wisely by maintaining compatibility and monitoring actively.