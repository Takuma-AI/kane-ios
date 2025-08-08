# Basic App Setup - Navigator, Session, SceneDelegate

## Core Principle
In Hotwire Native, the web view IS the application. The iOS app is just a thin coordination layer that manages web views through Navigator and Session components. This constraint is the key to the entire architecture.

Think of it this way: You're not building an iOS app with web views. You're putting your Rails app in a native wrapper that knows how to navigate between pages, show modals, and access device features. The Rails app does all the work—the iOS code just coordinates.

## The Three Layers Explained

```
1. Web app (Rails)     → Business logic, UI, navigation rules
2. Navigation shell    → Hotwire Native framework (Navigator, Session)
3. Platform integration → Minimal Swift code for iOS-specific features
```

Let's break down what each layer actually does:

**Layer 1 - Your Rails App:**
This is where ALL your application logic lives. Every screen, every form, every bit of business logic. The Rails app doesn't even know it's being displayed in an iOS app—it just serves HTML like always.

**Layer 2 - Hotwire Native Framework:**
This is the magic layer. It provides Navigator (which manages navigation between screens) and Session (which manages web views). You don't write this code—you just configure it. Think of it as a very smart web browser that knows how to present your pages as native screens.

**Layer 3 - Your iOS Code:**
This should be tiny! Just enough to start the app, point it at your Rails server, and handle iOS-specific features like camera access. If you find yourself writing lots of iOS code, you're probably doing it wrong.

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

Now let's create the iOS app. Don't worry about understanding every line of Swift—I'll explain what matters and you can copy-paste the rest. The SceneDelegate is like the `application.rb` file in Rails—it's where your app starts.

**The entry point - where everything starts:**
```swift
// App/Delegates/SceneDelegate.swift
import UIKit
import HotwireNative

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    // THE core decision: What's your Rails app URL?
    private let baseURL = URL(string: "https://yourapp.com")!
    
    // Navigator manages all navigation and coordinates sessions
    private lazy var navigator = Navigator(
        configuration: Navigator.Configuration(
            name: "main",
            startLocation: baseURL
        )
    )
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigator.rootViewController
        window?.makeKeyAndVisible()
        
        navigator.route(baseURL)
    }
}
```

**What's happening here:**
1. `baseURL` - Change this to your Rails app URL. During development, use `http://localhost:3000`
2. `Navigator.Configuration` - Note the nested type - Configuration is inside Navigator
3. `navigator.route(baseURL)` - Method to start navigation (not `navigate`)
4. Simplified configuration - Advanced features like pathConfigurationURL can be added later
5. The rest is boilerplate—it creates a window and tells the Navigator to load your homepage

That's it! Your iOS app is now ready to display your Rails app. But we need to tell Rails how to handle iOS visitors differently...

## Rails Path Configuration

**Define navigation rules in Rails, not iOS:**
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
        },
        {
          patterns: ["/accounts/\\d+$"],
          properties: {
            presentation: "replace"
          }
        }
      ]
    }
  end
end
```

## Understanding the Framework Components

### Navigator: The Orchestrator
```swift
// Framework manages this - understand but don't modify
class Navigator {
    // Owns the navigation controller
    let rootViewController: UINavigationController
    
    // Manages main and modal sessions
    private var mainSession: Session
    private var modalSession: Session?
    
    // Path configuration determines routing
    let pathConfiguration: PathConfiguration
    
    func navigate(to url: URL) {
        // 1. Consult path configuration
        // 2. Route to appropriate session
        // 3. Session handles the visit
    }
}
```

### Session: Web View Lifecycle Manager
```swift
// Framework code - for reference only
class Session {
    // Owns the WKWebView
    private let webView: WKWebView
    
    // Manages visits (page loads)
    private var currentVisit: Visit?
    
    func visit(_ visitable: Visitable) {
        // Only ONE Visitable can own the web view at a time
        // This is the key constraint
    }
}
```

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

## Common Setup Mistakes

### ❌ Don't: Create custom navigation logic
```swift
// Wrong - Fighting the framework
func customNavigate(to url: URL) {
    let vc = CustomViewController(url: url)
    navigationController?.pushViewController(vc)
}
```

### ✅ Do: Use Navigator.route()
```swift
// Right - Let framework handle it
navigator.route(url)
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