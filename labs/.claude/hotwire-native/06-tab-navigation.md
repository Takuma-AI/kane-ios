# Tab Navigation - Multi-Stack Coordination & URL Routing

## Core Principle
Tab navigation in Hotwire Native means multiple independent navigation stacks, each with its own Session and Navigator. Each tab maintains its navigation history. URLs still drive everything—tabs are just different entry points.

## Complete Tab Bar Implementation

### 1. Create Tab Model

```swift
// App/Models/Tabs.swift
import HotwireNative
import UIKit

struct Tabs {
    private static let hikesTab = HotwireTab(
        title: "Hikes",
        image: UIImage(systemName: "figure.walk"),
        selectedImage: UIImage(systemName: "figure.walk.fill"),
        visitableURL: baseURL.appending(path: "/hikes")
    )
    
    private static let profileTab = HotwireTab(
        title: "Profile",
        image: UIImage(systemName: "person"),
        selectedImage: UIImage(systemName: "person.fill"),
        visitableURL: baseURL.appending(path: "/profile")
    )
}

extension HotwireTab {
    static var all: [HotwireTab] {
        [Tabs.hikesTab, Tabs.profileTab]
    }
}
```

### 2. Use HotwireTabBarController in SceneDelegate

```swift
// App/Delegates/SceneDelegate.swift
import HotwireNative
import UIKit

let baseURL = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let tabBarController = HotwireTabBarController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window?.rootViewController = tabBarController
        tabBarController.load()
    }
}
```

**Key Points:**
- `HotwireTabBarController` manages multiple navigation stacks automatically
- Each tab gets its own Navigator and Session
- The `load()` method initializes all tabs from `HotwireTab.all`
- No manual Navigator creation needed - the framework handles it

### 3. Rails Path Configuration for Tabs

```ruby
# app/controllers/configurations_controller.rb
def navigation_rules
  [
    tab_root_rules,
    tab_navigation_rules,
    modal_rules,
    default_rules
  ].flatten
end

private

def tab_root_rules
  # Define tab root paths - these reset the tab's stack
  [
    {
      patterns: ["^/$"],
      properties: {
        presentation: "replace_root",
        tab: "home"
      }
    },
    {
      patterns: ["^/resources$"],
      properties: {
        presentation: "replace_root",
        tab: "resources"
      }
    },
    {
      patterns: ["^/profile$"],
      properties: {
        presentation: "replace_root",
        tab: "profile"
      }
    }
  ]
end

def tab_navigation_rules
  # Navigation within tabs
  [
    {
      patterns: ["/resources/\\d+$"],
      properties: {
        presentation: "push",
        tab: "resources"
      }
    },
    {
      patterns: ["/profile/edit$"],
      properties: {
        presentation: "push",
        tab: "profile"
      }
    }
  ]
end

def modal_rules
  # Modals work across all tabs
  [
    {
      patterns: ["/new$", "/edit$"],
      properties: {
        presentation: "modal"
      }
    }
  ]
end
```

### 3. Handle Deep Links to Specific Tabs

```swift
// App/Delegates/SceneDelegate.swift
extension SceneDelegate {
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL else { return }
        
        handleDeepLink(to: url)
    }
    
    private func handleDeepLink(to url: URL) {
        // Determine which tab should handle this URL
        let path = url.path
        
        let tabIndex: Int
        switch path {
        case let p where p.starts(with: "/resources"):
            tabIndex = 1
        case let p where p.starts(with: "/profile"):
            tabIndex = 2
        default:
            tabIndex = 0
        }
        
        // Switch to appropriate tab
        if let tabBarController = window?.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = tabIndex
            
            // Navigate within that tab
            navigators[tabIndex].navigate(to: url)
        }
    }
}
```

### 4. Rails Helpers for Tab Navigation

```ruby
# app/helpers/tab_navigation_helper.rb
module TabNavigationHelper
  def tab_link_to(name, path, tab:, **options)
    options[:data] ||= {}
    
    if hotwire_native_app?
      # Add tab information for native app
      options[:data][:tab] = tab
    end
    
    # Add active state
    if current_tab?(tab)
      options[:class] = [options[:class], "active"].compact.join(" ")
    end
    
    link_to name, path, options
  end
  
  def current_tab?(tab)
    case tab
    when "home"
      request.path == "/"
    when "resources"
      request.path.start_with?("/resources")
    when "profile"
      request.path.start_with?("/profile")
    else
      false
    end
  end
  
  def render_tab_bar
    return unless hotwire_native_app?
    
    content_tag :nav, class: "native-tab-bar" do
      content_tag :div, class: "tab-indicator" do
        "Current: #{current_tab_name}"
      end
    end
  end
  
  private
  
  def current_tab_name
    if request.path.start_with?("/resources")
      "Resources"
    elsif request.path.start_with?("/profile")
      "Profile"
    else
      "Home"
    end
  end
end
```

### 5. Tab-Aware Forms

```erb
<!-- Ensure forms submit within the correct tab context -->
<%= form_with model: resource, 
              url: resource_path(resource),
              data: { turbo_action: "advance" } do |form| %>
  
  <!-- Form fields -->
  
  <div class="form-actions">
    <%= form.submit "Save", class: "btn btn-primary" %>
    
    <!-- Cancel stays within tab -->
    <%= link_to "Cancel", 
                resources_path,
                data: { turbo_action: "pop" },
                class: "btn btn-secondary" %>
  </div>
<% end %>
```

### 6. Custom Tab Bar Styling

```swift
// App/Extensions/UITabBar+Styling.swift
extension UITabBarController {
    func styleTabBar() {
        // Customize tab bar appearance
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        
        // Add top border
        let border = CALayer()
        border.backgroundColor = UIColor.separator.cgColor
        border.frame = CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5)
        tabBar.layer.addSublayer(border)
    }
}

// Call in SceneDelegate after creating tab bar
tabBarController.styleTabBar()
```

## Badge Management

### Rails Side - Send Badge Updates
```ruby
# app/models/user.rb
class User < ApplicationRecord
  def unread_notifications_count
    notifications.unread.count
  end
end

# app/views/layouts/application.html.erb
<% if hotwire_native_app? %>
  <script>
    // Send badge updates to native app
    window.updateTabBadge = function(tab, count) {
      if (window.webkit?.messageHandlers?.tabBadge) {
        window.webkit.messageHandlers.tabBadge.postMessage({
          tab: tab,
          count: count
        });
      }
    }
    
    // Update profile tab badge with notification count
    updateTabBadge('profile', <%= current_user.unread_notifications_count %>);
  </script>
<% end %>
```

### iOS Side - Handle Badge Updates
```swift
// Add to SceneDelegate
private func setupBadgeHandling() {
    // Register script message handler
    let userContentController = WKUserContentController()
    userContentController.add(BadgeMessageHandler(tabBarController: tabBarController), name: "tabBadge")
    
    // Apply to all web views
    navigators.forEach { navigator in
        // Configure web views with message handler
    }
}

class BadgeMessageHandler: NSObject, WKScriptMessageHandler {
    weak var tabBarController: UITabBarController?
    
    init(tabBarController: UITabBarController?) {
        self.tabBarController = tabBarController
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String: Any],
              let tab = body["tab"] as? String,
              let count = body["count"] as? Int else { return }
        
        DispatchQueue.main.async {
            self.updateBadge(for: tab, count: count)
        }
    }
    
    private func updateBadge(for tab: String, count: Int) {
        let tabIndex: Int
        switch tab {
        case "home": tabIndex = 0
        case "resources": tabIndex = 1
        case "profile": tabIndex = 2
        default: return
        }
        
        tabBarController?.tabBar.items?[tabIndex].badgeValue = count > 0 ? "\(count)" : nil
    }
}
```

## Testing Tab Navigation

```swift
// Tests/TabNavigationTests.swift
class TabNavigationTests: XCTestCase {
    func testTabCreation() {
        let sceneDelegate = SceneDelegate()
        let tabs = sceneDelegate.createTabs()
        
        XCTAssertEqual(tabs.count, 3)
        XCTAssertEqual(tabs[0].tabBarItem.title, "Home")
        XCTAssertEqual(tabs[1].tabBarItem.title, "Resources")
        XCTAssertEqual(tabs[2].tabBarItem.title, "Profile")
    }
    
    func testDeepLinkRouting() {
        let sceneDelegate = SceneDelegate()
        // Setup scene...
        
        let resourceURL = URL(string: "https://yourapp.com/resources/123")!
        sceneDelegate.handleDeepLink(to: resourceURL)
        
        // Verify correct tab selected
        XCTAssertEqual(tabBarController.selectedIndex, 1)
    }
}
```

## Common Tab Patterns

### Preserving Tab State
```swift
// Each navigator maintains its own state
// No special handling needed - Hotwire Native does this automatically
```

### Cross-Tab Navigation
```ruby
# Navigate to different tab from Rails
def create
  @message = current_user.messages.build(message_params)
  
  if @message.save
    # This will switch to profile tab and navigate
    redirect_to profile_messages_path, notice: "Message sent!"
  else
    render :new
  end
end
```

### Modal Over Tabs
```ruby
# Modals present over all tabs
{
  patterns: ["/settings$"],
  properties: {
    presentation: "modal",
    modal_style: "fullScreen"
  }
}
```

## Common Mistakes to Avoid

### ❌ Don't Share Sessions Between Tabs
```swift
// Wrong - Sharing session
let sharedSession = Session(...)
// All tabs use same session
```

### ✅ Each Tab Gets Own Session
```swift
// Right - Independent sessions
let homeNavigator = Navigator(configuration: homeConfig)
let resourcesNavigator = Navigator(configuration: resourcesConfig)
```

### ❌ Don't Manually Manage Tab State
```swift
// Wrong - Storing state
var currentTabs: [String: URL] = [:]
```

### ✅ Let Navigators Handle State
```swift
// Right - Framework manages state
navigator.navigate(to: url)
```

## Remember

- Each tab is an independent navigation stack
- URLs still drive everything
- Path configuration can specify tab routing
- Modals work across all tabs
- Don't share state between tabs
- Let the framework manage complexity