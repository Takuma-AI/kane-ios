# Basic App Setup

## Core Principle
Hotwire Native renders HTML from your Rails server in an embedded web view, packaged inside a native app. Most of your logic will remain on the server, with the apps acting as thin clients to your HTML.

## Architecture

The app consists of three parts:

**Your Rails Server:**
All business logic, UI, and state management lives here. The Rails app serves HTML just like it does for web browsers.

**Hotwire Native Framework:**
Provides Navigator and Session components that manage navigation and web views. You configure this layer but don't modify it.

**Your Native Code:**
Minimal Swift/Kotlin code to configure the framework and add native features when needed.

## iOS Project Organization

Before we dive into code, let's organize our iOS project like a Rails app. As the Hotwire Native book recommends: "By keeping them in line with each other, I have one less context switch to make when swapping back and forth between the codebases."

**WHEN TO ORGANIZE:** Do this at the very beginning of your project, right after creating the Xcode project. This prevents broken references and makes all subsequent development cleaner.

**Recommended folder structure:**
```
App/
├── Controllers/     # View controllers (like Rails app/controllers)
├── Models/         # Data models (like Rails app/models)
├── Views/          # Custom views and UI (like Rails app/views)
├── Delegates/      # AppDelegate and SceneDelegate
├── Resources/      # Assets, LaunchScreen, Info.plist
├── BridgeComponents/  # Bridge components for native features
├── Services/       # Network, auth, and other services
└── ViewControllers/   # If you need native screens
```

**In Xcode, organize your files like this:**
1. Right-click the main folder and select "New Group"
2. Name folders with capitalized camel case (Controllers, not controllers)
3. Move existing files to appropriate folders:
   - AppDelegate.swift → Delegates/
   - SceneDelegate.swift → Delegates/
   - Assets.xcassets → Resources/
   - Info.plist → Resources/
4. Delete the default ViewController.swift (we won't use it)

**IMPORTANT: File references must change throughout your code!**
When you organize files into folders, all Swift file references update automatically within your code. However, configuration references need manual updates:

**Before organizing:**
```swift
// App/SceneDelegate.swift (was at root level)
// Info.plist reference in Build Settings: "YourApp/Info.plist"
```

**After organizing:**
```swift
// App/Delegates/SceneDelegate.swift (now in Delegates folder)
// Info.plist reference in Build Settings: "App/Resources/Info.plist"
```

**Update these references:**
1. In Xcode Build Settings, search for "Info.plist" and update the path to `App/Resources/Info.plist`
2. File comments should reflect new paths: `// App/BridgeComponents/FormComponent.swift`
3. When creating new files, always include the folder in the path
4. Test imports still work after moving files (Swift handles this automatically)

This organization makes it easy to find things when switching between Rails and iOS code. When you need a controller in Rails, you look in `app/controllers`. When you need one in iOS, you look in `App/Controllers`.

## Clean Up iOS Template Code

**DELETE these files and code that come with the default iOS template:**

### 1. Delete ViewController.swift
The template includes a default `ViewController.swift` that we don't need. Hotwire Native provides its own view controllers.
- Right-click `ViewController.swift` → Delete → Move to Trash

### 2. Remove Storyboard References
iOS templates use Storyboards by default. Hotwire Native doesn't need them:
- Delete `Main.storyboard` (right-click → Delete → Move to Trash)
- In `Info.plist`, remove these keys:
  - `UISceneStoryboardFile` (under Scene Configuration)
  - `UIMainStoryboardFile` (if present)

### 3. Clean Up SceneDelegate
The template SceneDelegate has storyboard code. Replace the entire contents with our Hotwire Native setup (shown below).

### 4. Clean Up AppDelegate
The template AppDelegate often has unnecessary code. You'll need:
```swift
// App/Delegates/AppDelegate.swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Hotwire Native doesn't need any setup here
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
```

### 5. Remove ContentView.swift (if using SwiftUI template)
If you accidentally created a SwiftUI project, delete `ContentView.swift` and any SwiftUI preview files.

**WHY DELETE ALL THIS?**
- Hotwire Native manages all view controllers through the web
- Storyboards conflict with URL-driven navigation
- The default ViewController assumes you're building traditional iOS UI
- We want a thin iOS wrapper, not a full native app

### What NOT to Add
When coming from traditional iOS development, resist the urge to add:
- **Custom UIViewControllers** - Use Hotwire Native's VisitableViewController
- **Storyboards or XIBs** - Everything is URL-driven
- **Core Data models** - Data lives in Rails
- **Network code** - Rails handles all API calls
- **Business logic** - Keep it in Rails where it belongs
- **Custom navigation code** - Navigator handles everything

Remember: If you're writing lots of Swift code, you're probably fighting the framework!

## Complete SceneDelegate Implementation

The SceneDelegate is where your app starts. Here's the complete implementation:

```swift
// SceneDelegate.swift
import HotwireNative
import UIKit

// Define the base URL outside the class (as shown in the book)
let baseURL = URL(string: "http://localhost:3000")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    // Navigator configuration with .init shorthand
    private let navigator = Navigator(configuration: .init(
        name: "main",
        startLocation: baseURL.appending(path: "hikes")
    ))
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window?.rootViewController = navigator.rootViewController
        navigator.start()
    }
}
```

**What's happening here:**
1. `baseURL` - During development use `http://localhost:3000`, in production use your Rails app URL
2. Navigator configuration requires `name` and `startLocation`
3. `navigator.start()` initiates the first visit
4. The window's rootViewController is set to the navigator's rootViewController
5. That's it - your Rails app is now displaying in iOS!

## Understanding the Framework Components

### Navigator: The Orchestrator
The Navigator component from Hotwire Native manages all navigation and coordinates sessions. It:
- Owns the navigation controller (rootViewController)
- Manages main and modal sessions
- Routes visits based on path configuration
- Handles the navigation stack (push/pop/replace)

You configure it but don't modify its internals. The framework handles all the complexity.

### Session: Web View Lifecycle Manager
Sessions manage the WKWebView and its lifecycle:
- Each session owns one web view
- Only ONE Visitable can own the web view at a time (key constraint!)
- Manages visits (page loads)
- Handles JavaScript bridge communication

### Key Constraint to Remember
**Web view ownership is exclusive** - Only one Visitable at a time can own a web view. This is why navigation works the way it does - the framework manages transferring ownership as you navigate.

## Setting Up Your Rails App

### 1. Add iOS-Specific Layouts
```erb
<!-- app/views/layouts/application.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <title><%= content_for(:title) || "YourApp" %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    
    <!-- Hotwire Native specific -->
    <meta name="turbo-native-app" content="true">
    
    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= javascript_include_tag "application", "data-turbo-track": "reload", type: "module" %>
  </head>
  
  <body>
    <!-- Hide navigation in native app -->
    <% unless hotwire_native_app? %>
      <%= render "shared/navigation" %>
    <% end %>
    
    <%= yield %>
  </body>
</html>
```

### 2. Helper Methods
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :hotwire_native_app?
  
  def hotwire_native_app?
    request.user_agent.to_s.include?("Hotwire Native")
  end
end
```

### 3. Conditional UI Elements
```erb
<!-- Show different UI for native vs web -->
<% if hotwire_native_app? %>
  <!-- Native app gets system navigation -->
  <%= link_to "Back", :back, data: { turbo_action: "pop" } %>
<% else %>
  <!-- Web gets full navigation -->
  <%= render "shared/breadcrumbs" %>
<% end %>
```

## Common Setup Patterns

### Modal Presentations
```ruby
# Configure modals in path configuration
{
  patterns: ["/resources/new$", "/resources/\\d+/edit$"],
  properties: {
    presentation: "modal",
    title: "Edit Resource"
  }
}
```

### Authentication Flows
```ruby
# Clear navigation stack on login/logout
{
  patterns: ["/sessions/new$"],
  properties: {
    presentation: "clear_all",
    title: "Sign In"
  }
}
```

### Tab Bar Setup (Foundation Only)
```swift
// Will be expanded in Tab Navigation module
let tabBarController = UITabBarController()
tabBarController.viewControllers = [
    createNavigator(for: "resources", title: "Resources"),
    createNavigator(for: "profile", title: "Profile")
]
window?.rootViewController = tabBarController
```

## Key Constraints to Remember

1. **Web view ownership is exclusive** - Only one Visitable at a time
2. **URLs drive everything** - Navigation happens through URLs, not method calls
3. **Rails owns the logic** - iOS code just coordinates
4. **Path configuration is your router** - Define rules in JSON, not Swift

## Testing Your Setup

### 1. Verify Path Configuration Loads
```bash
curl https://yourapp.com/configurations/ios-v1.json
```

### 2. Test Navigation Patterns
- Tap a link → Should navigate (push or modal based on config)
- Submit a form → Should follow redirect
- Press back → Should pop view controller

### 3. Check Native App Detection
```erb
<!-- Add to any view -->
<% if hotwire_native_app? %>
  <p>✅ Native app detected</p>
<% end %>
```

## Path Configuration (Foundation)

While detailed path configuration comes later, know that Rails will define navigation rules:

```ruby
# app/controllers/configurations_controller.rb
class ConfigurationsController < ApplicationController
  def ios_v1
    render json: {
      rules: [
        {
          patterns: ["/new$", "/edit$"],
          properties: {
            presentation: "modal"
          }
        }
      ]
    }
  end
end
```

Then connect it in your SceneDelegate:
```swift
private let navigator = Navigator(configuration: .init(
    name: "main",
    startLocation: baseURL.appending(path: "hikes"),
    pathConfigurationURL: baseURL.appending(path: "configurations/ios_v1.json")
))
```

## Common Setup Mistakes

### ❌ Don't: Create custom navigation logic
```swift
// Wrong - Fighting the framework
func customNavigate(to url: URL) {
    let vc = CustomViewController(url: url)
    navigationController?.pushViewController(vc)
}
```

### ✅ Do: Use Navigator methods
```swift
// Right - Let framework handle it
navigator.start() // For initial visit
// Navigation happens automatically through link clicks
```

### ❌ Don't: Store state in iOS
```swift
// Wrong - State in wrong place
class UserManager {
    static var currentUser: User?
}
```

### ✅ Do: Keep state in Rails
```ruby
# Right - Single source of truth
class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
```

## Next Steps

With basic setup complete:
1. Configure URL-driven navigation patterns
2. Add bridge components for enhanced functionality
3. Implement native screens where needed
4. Set up authentication flows

Remember: Start with the minimum iOS code possible. Let Rails do the heavy lifting.