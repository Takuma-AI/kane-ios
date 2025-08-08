# Authentication & Sessions - Login Flows & Navigation Reset

## Core Principle
Authentication in Hotwire Native is handled by Rails, not iOS. The iOS app manages navigation state changes (clearing stacks on login/logout) while Rails handles all authentication logic. Session cookies persist automatically through the web view.

## Complete Authentication Implementation

### 1. Rails Authentication Setup

```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  
  def new
    # Render login form
  end
  
  def create
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      
      # Native app clears navigation stack
      redirect_to root_path, **navigation_options(:clear_all)
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    reset_session
    
    # Clear everything and go to login
    redirect_to new_session_path, **navigation_options(:clear_all)
  end
  
  private
  
  def navigation_options(action)
    if hotwire_native_app?
      case action
      when :clear_all
        { data: { turbo_action: "clear_all" } }
      when :replace
        { data: { turbo_action: "replace" } }
      else
        {}
      end
    else
      {}
    end
  end
end
```

### 2. Path Configuration for Auth Flows

```ruby
# app/controllers/configurations_controller.rb
def auth_rules
  [
    {
      # Login screen clears navigation stack
      patterns: ["/sessions/new$", "/login$"],
      properties: {
        presentation: "clear_all",
        title: "Sign In",
        hide_nav_bar: true
      }
    },
    {
      # Registration can be modal or clear_all
      patterns: ["/users/new$", "/signup$"],
      properties: {
        presentation: "modal",
        title: "Create Account"
      }
    },
    {
      # Password reset flow
      patterns: ["/password/reset$"],
      properties: {
        presentation: "modal",
        title: "Reset Password"
      }
    },
    {
      # After login, replace root
      patterns: ["^/$"],
      properties: {
        presentation: "replace_root",
        requires_authentication: true
      }
    }
  ]
end
```

### 3. iOS Authentication State Handler

```swift
// App/SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func navigator(_ navigator: Navigator, didFailWithError error: Error) {
        // Handle authentication errors
        if let turboError = error as? TurboError,
           case .requestFailed(let statusCode) = turboError,
           statusCode == 401 {
            handleAuthenticationRequired()
        }
    }
    
    private func handleAuthenticationRequired() {
        // Clear all navigation and go to login
        let loginURL = baseURL.appending(path: "/login")
        navigator.navigate(to: loginURL, action: .clearAll)
    }
}

// App/Helpers/AuthenticationHelper.swift
class AuthenticationHelper {
    static let shared = AuthenticationHelper()
    
    private let keychain = KeychainWrapper()
    
    // Store authentication token if using token-based auth
    func storeAuthToken(_ token: String) {
        keychain.set(token, forKey: "auth_token")
    }
    
    func retrieveAuthToken() -> String? {
        keychain.string(forKey: "auth_token")
    }
    
    func clearAuthentication() {
        keychain.removeObject(forKey: "auth_token")
        clearWebViewCookies()
    }
    
    private func clearWebViewCookies() {
        HTTPCookieStorage.shared.cookies?.forEach { cookie in
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
        
        WKWebsiteDataStore.default().removeData(
            ofTypes: [WKWebsiteDataTypeCookies],
            modifiedSince: Date.distantPast,
            completionHandler: {}
        )
    }
}
```

### 4. Login Form Views

```erb
<!-- app/views/sessions/new.html.erb -->
<div class="auth-container">
  <% if hotwire_native_app? %>
    <!-- Clean native app login -->
    <div class="native-login">
      <h1>Welcome Back</h1>
      
      <%= form_with url: sessions_path, local: true do |form| %>
        <div class="form-group">
          <%= form.email_field :email, 
                              placeholder: "Email",
                              class: "form-control",
                              autofocus: true,
                              autocomplete: "email" %>
        </div>
        
        <div class="form-group">
          <%= form.password_field :password,
                                 placeholder: "Password",
                                 class: "form-control",
                                 autocomplete: "current-password" %>
        </div>
        
        <%= form.submit "Sign In", class: "btn btn-primary btn-block" %>
      <% end %>
      
      <div class="auth-links">
        <%= link_to "Create Account", new_user_path %>
        <%= link_to "Forgot Password?", new_password_reset_path %>
      </div>
    </div>
  <% else %>
    <!-- Full web login with navigation -->
    <%= render "shared/navigation" %>
    <div class="web-login">
      <!-- Web-specific login UI -->
    </div>
  <% end %>
</div>
```

### 5. Biometric Authentication Integration

```swift
// App/Services/BiometricAuthService.swift
import LocalAuthentication

class BiometricAuthService {
    static let shared = BiometricAuthService()
    
    private let context = LAContext()
    
    var biometricType: LABiometryType {
        context.biometryType
    }
    
    var isBiometricAvailable: Bool {
        var error: NSError?
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
    }
    
    func authenticateWithBiometrics(completion: @escaping (Bool, Error?) -> Void) {
        let reason = "Sign in to your account"
        
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
            DispatchQueue.main.async {
                completion(success, error)
            }
        }
    }
}

// App/BridgeComponents/BiometricAuthComponent.swift
final class BiometricAuthComponent: BridgeComponent {
    override class var name: String { "biometric_auth" }
    
    override func onReceive(message: Message) {
        switch message.event {
        case "check_availability":
            checkBiometricAvailability()
        case "authenticate":
            performBiometricAuth()
        default:
            break
        }
    }
    
    private func checkBiometricAvailability() {
        let available = BiometricAuthService.shared.isBiometricAvailable
        let type = BiometricAuthService.shared.biometricType
        
        reply(to: "check_availability", with: [
            "available": available,
            "type": biometricTypeString(type)
        ])
    }
    
    private func performBiometricAuth() {
        BiometricAuthService.shared.authenticateWithBiometrics { [weak self] success, error in
            if success {
                self?.reply(to: "authenticate", with: ["success": true])
            } else {
                self?.reply(to: "authenticate", with: [
                    "success": false,
                    "error": error?.localizedDescription ?? "Unknown error"
                ])
            }
        }
    }
    
    private func biometricTypeString(_ type: LABiometryType) -> String {
        switch type {
        case .faceID: return "face_id"
        case .touchID: return "touch_id"
        default: return "none"
        }
    }
}
```

### 6. JavaScript Bridge for Biometrics

```javascript
// app/javascript/controllers/bridge/biometric_auth_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "biometric_auth"
  static targets = ["biometricButton", "standardForm"]
  
  connect() {
    super.connect()
    
    if (this.enabled) {
      this.checkBiometricAvailability()
    }
  }
  
  checkBiometricAvailability() {
    this.send("check_availability")
  }
  
  // Response from native
  check_availability(data) {
    if (data.available) {
      this.showBiometricOption(data.type)
      
      // Check if user has saved credentials
      if (this.hasSavedCredentials()) {
        this.biometricButtonTarget.classList.remove("hidden")
      }
    }
  }
  
  showBiometricOption(type) {
    const icon = type === "face_id" ? "👤" : "👆"
    const text = type === "face_id" ? "Sign in with Face ID" : "Sign in with Touch ID"
    
    this.biometricButtonTarget.innerHTML = `${icon} ${text}`
  }
  
  authenticateWithBiometric(event) {
    event.preventDefault()
    this.send("authenticate")
  }
  
  // Response from biometric auth
  authenticate(data) {
    if (data.success) {
      // Submit form with saved credentials
      this.autoLogin()
    } else {
      this.showError(data.error)
    }
  }
  
  autoLogin() {
    // Retrieve saved credentials and submit
    const savedEmail = localStorage.getItem("saved_email")
    const savedToken = localStorage.getItem("saved_token")
    
    if (savedEmail && savedToken) {
      // Create and submit form
      const form = this.standardFormTarget
      form.querySelector('[name="email"]').value = savedEmail
      form.querySelector('[name="token"]').value = savedToken
      form.requestSubmit()
    }
  }
  
  hasSavedCredentials() {
    return localStorage.getItem("saved_email") && localStorage.getItem("saved_token")
  }
}
```

### 7. Session Persistence

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  private
  
  def authenticate_user!
    unless current_user
      if hotwire_native_app?
        # Return 401 for native app to handle
        head :unauthorized
      else
        redirect_to new_session_path
      end
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
```

### 8. Logout Handling

```erb
<!-- app/views/shared/_user_menu.html.erb -->
<div class="user-menu">
  <% if current_user %>
    <span class="user-name"><%= current_user.name %></span>
    
    <%= button_to "Sign Out",
                  session_path,
                  method: :delete,
                  class: "btn btn-link",
                  data: hotwire_native_app? ? { turbo_action: "clear_all" } : {} %>
  <% end %>
</div>
```

## Testing Authentication Flows

### Rails Tests
```ruby
# test/system/authentication_test.rb
class AuthenticationTest < ApplicationSystemTestCase
  test "login flow in native app" do
    user = users(:john)
    
    # Simulate native app
    page.driver.header("User-Agent", "MyApp/1.0 Hotwire Native iOS")
    
    visit new_session_path
    
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign In"
    
    assert_current_path root_path
    assert_text "Welcome back!"
  end
  
  test "logout clears navigation" do
    sign_in users(:john)
    
    click_button "Sign Out"
    
    assert_current_path new_session_path
    # In native app, this would clear navigation stack
  end
end
```

### iOS Tests
```swift
// Tests/AuthenticationTests.swift
class AuthenticationTests: XCTestCase {
    func testAuthenticationRequired() {
        let navigator = Navigator(configuration: testConfig)
        let delegate = MockNavigatorDelegate()
        navigator.delegate = delegate
        
        // Simulate 401 error
        let error = TurboError.requestFailed(statusCode: 401)
        navigator.session(navigator.session, didFailWith: error)
        
        // Should navigate to login
        XCTAssertEqual(delegate.lastNavigatedURL?.path, "/login")
        XCTAssertEqual(delegate.lastAction, .clearAll)
    }
}
```

## Common Authentication Patterns

### Remember Me
```ruby
# Use Rails signed cookies
def create
  if params[:remember_me]
    cookies.signed[:user_id] = { value: user.id, expires: 30.days.from_now }
  end
  session[:user_id] = user.id
end
```

### OAuth Integration
```ruby
# OAuth still works normally
def oauth_callback
  user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
  session[:user_id] = user.id
  
  redirect_to root_path, **navigation_options(:clear_all)
end
```

### Magic Links
```ruby
# Email-based authentication
def send_magic_link
  user = User.find_by(email: params[:email])
  if user
    user.generate_login_token!
    UserMailer.magic_link(user).deliver_later
  end
  
  redirect_to check_email_path
end
```

## Common Mistakes to Avoid

### ❌ Don't Store Passwords in iOS
```swift
// Wrong - Never store passwords
UserDefaults.standard.set(password, forKey: "password")
```

### ✅ Use Rails Sessions
```ruby
# Right - Rails handles authentication
session[:user_id] = user.id
```

### ❌ Don't Create iOS Login Logic
```swift
// Wrong - Authentication logic in iOS
func validateCredentials(email: String, password: String) -> Bool
```

### ✅ Let Rails Validate
```ruby
# Right - Rails does validation
def create
  if user&.authenticate(params[:password])
    # Success
  end
end
```

## Remember

- Rails handles ALL authentication logic
- iOS only manages navigation state changes
- Session cookies persist automatically
- Use clear_all for login/logout flows
- Biometrics are just a convenience layer
- Test both authenticated and unauthenticated states