# Critical iOS Patterns - Must-Know for AI Agents

## 🚨 Critical: These patterns will break your app if done wrong

### 1. Navigator Initialization

**✅ CORRECT - Use start() for initial navigation:**
```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession) {
    window?.rootViewController = navigator.rootViewController
    navigator.start()  // NOT navigate()!
}
```

**❌ WRONG - Will cause crashes:**
```swift
navigator.navigate(to: baseURL)  // NO! Use start()
navigator.route(baseURL)         // NO! Use start()
```

### 2. File Organization (Do IMMEDIATELY after project creation)

**Critical timing: BEFORE writing any code!**

```
App/
├── Controllers/      # View controllers
├── Models/          # Data models  
├── Views/           # SwiftUI views
├── Delegates/       # AppDelegate, SceneDelegate
├── Resources/       # Assets, Info.plist, LaunchScreen
├── Components/      # Bridge components
└── ViewModels/      # For SwiftUI data fetching
```

**After organizing, YOU MUST:**
1. Update Info.plist path in Build Settings: `App/Resources/Info.plist`
2. Delete default ViewController.swift
3. Remove storyboard references from Info.plist

### 3. Rails Detection Pattern

**Always provide web fallbacks:**
```ruby
# app/controllers/concerns/hotwire_native.rb
def hotwire_native_app?
  request.user_agent.to_s.match?(/(Turbo|Hotwire) Native/)
end
```

```erb
<% if hotwire_native_app? %>
  <!-- Native-optimized content -->
<% else %>
  <!-- Web fallback -->
<% end %>
```

### 4. NavigatorDelegate for Native Screens

**The ONLY way to route native screens:**
```swift
extension SceneDelegate: NavigatorDelegate {
    func handle(proposal: VisitProposal, from navigator: Navigator) -> ProposalResult {
        // Path config sets view_controller property
        switch proposal.viewController {
        case "map": 
            return .acceptCustom(MapController(url: proposal.url))
        default:
            return .accept  // Web view
        }
    }
}
```

**ProposalResult options:**
- `.accept` - Standard web view (99% of screens)
- `.acceptCustom(UIViewController)` - Native screen
- `.reject` - Cancel navigation

### 5. Bridge Component Registration

**Must register in Navigator configuration:**
```swift
private let navigator = Navigator(configuration: .init(
    name: "main",
    startLocation: baseURL,
    pathConfigurationURL: baseURL.appending(path: "configurations/ios_v1.json")
), bridgeComponents: [
    ButtonComponent.self,
    FormComponent.self  // Names must match JS
])
```

**Component naming MUST match:**
```swift
// iOS
class ButtonComponent: BridgeComponent {
    override class var name: String { "button" }  // Must match JS
}
```

```javascript
// Rails
export default class extends BridgeComponent {
    static component = "button"  // Must match iOS
}
```

### 6. Path Configuration Requirements

**Must be publicly accessible:**
```ruby
# config/routes.rb
get "configurations/ios_v1", to: "configurations#ios_v1"

# app/controllers/configurations_controller.rb
class ConfigurationsController < ApplicationController
  skip_before_action :authenticate_user!  # CRITICAL!
  
  def ios_v1
    render json: {
      settings: {},  # Required even if empty
      rules: [
        {
          patterns: ["/new$", "/edit$"],
          properties: {
            context: "modal"  # NOT "presentation"!
          }
        }
      ]
    }
  end
end
```

### 7. Tab Bar Implementation

**Use HotwireTabBarController, not UITabBarController:**
```swift
// SceneDelegate.swift
private let tabBarController = HotwireTabBarController()

func scene(_ scene: UIScene, willConnectTo session: UISceneSession) {
    window?.rootViewController = tabBarController
    tabBarController.load()  // Loads from HotwireTab.all
}

// Tabs.swift
extension HotwireTab {
    static var all: [HotwireTab] {
        [hikesTab, profileTab]
    }
}
```

### 8. Common Critical Mistakes

**These WILL break your app:**

1. **Wrong navigator method:** Using `navigate()` instead of `start()` on initial load
2. **Missing Info.plist path update:** After file reorganization
3. **Unauthenticated path config:** Forgetting `skip_before_action :authenticate_user!`
4. **Wrong property names:** Using "presentation" instead of "context"
5. **Mismatched bridge names:** JS and iOS component names don't match
6. **Missing baseURL constant:** Not defining it outside SceneDelegate class
7. **Wrong URL for development:** Using localhost instead of actual IP

### 9. Development URLs

```swift
// Development - use your Mac's IP
let baseURL = URL(string: "http://192.168.1.100:3000")!

// Production
let baseURL = URL(string: "https://yourapp.com")!
```

### 10. Testing Requirements

**Simulator limitations:**
- Push notifications DON'T work properly
- Camera requires physical device
- Some gestures behave differently

**Always test on physical device for:**
- Push notifications
- Camera/photo features
- Performance
- Haptic feedback
- Deep linking

### 11. SwiftUI + Hotwire Native

**Bridge SwiftUI views with UIHostingController:**
```swift
class MapController: UIHostingController<MapView> {
    convenience init(url: URL) {
        let view = MapView()
        self.init(rootView: view)
    }
}
```

### 12. Essential Debugging

**Check these when things break:**

```swift
// Verify path config loaded
print("Path config rules: \(navigator.pathConfiguration.rules)")

// Check user agent
print("User agent: \(webView.customUserAgent)")

// Verify bridge component registration
print("Registered components: \(Hotwire.registeredBridgeComponents)")
```

## Remember

- **Start with navigator.start(), never navigate()**
- **Organize files BEFORE writing code**
- **Update Info.plist path in Build Settings**
- **Always provide web fallbacks with hotwire_native_app?**
- **Test on real devices for production features**
- **Match bridge component names exactly**
- **Use "context" not "presentation" in path config**

These aren't suggestions - they're requirements. Get them wrong and your app won't work.