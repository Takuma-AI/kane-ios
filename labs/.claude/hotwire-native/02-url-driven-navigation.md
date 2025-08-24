# URL-Driven Navigation - Path Configuration, Routing, Presentation Modes

## Core Principle
URLs are commands, not just addresses. Every navigation decision flows through path configuration pattern matching. Rails tells iOS how to present each screen through JSON rules.

Here's the mental shift: In traditional iOS apps, you'd write code like "when user taps this button, present a modal." In Hotwire Native, you say "when the app navigates to a URL ending in /new, present it as a modal." The URL itself carries the navigation instructions.

## Understanding Path Configuration

Path configuration is like Rails routes, but for presentation instead of controllers. It's a JSON file that tells your iOS app how to display each page. Think of it as CSS for navigation—you write rules that match URL patterns and apply presentation styles.

Here's what happens when your iOS app navigates:
1. User taps a link to `/resources/new`
2. Navigator checks path configuration for matching patterns
3. Finds rule: "URLs ending in /new should be modals"  
4. Opens the page as a modal instead of pushing it

The beauty is you control all of this from Rails. Want to change how a screen appears? Update the JSON. No iOS app update needed.

## Complete Rails Path Configuration
```ruby
# app/controllers/configurations_controller.rb
class ConfigurationsController < ApplicationController
  
  def ios_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: ["/new$", "/edit$"],
          properties: {
            context: "modal"
          }
        },
        {
          patterns: [".*"],
          properties: {
            context: "default"
          }
        }
      ]
    }
  end
end
```

**Key Points:**
- The `settings` key is required even if empty
- The `context` property determines presentation (not `presentation`)
- "modal" context presents as a modal
- "default" context pushes onto the navigation stack
- First matching pattern wins
  
## Extended Path Configuration Examples

While the book focuses on the `context` property with "modal" and "default" values, here are additional patterns that are useful in practice:

```ruby
# More comprehensive configuration
def ios_v1
  render json: {
    settings: {},
    rules: [
      # Authentication screens
      {
        patterns: ["/sessions/new$", "/users/sign_in$"],
        properties: {
          context: "modal",
          pull_to_refresh_enabled: false
        }
      },
      # Forms as modals
      {
        patterns: ["/new$", "/edit$"],
        properties: {
          context: "modal"
        }
      },
      # Default navigation
      {
        patterns: [".*"],
        properties: {
          context: "default"
        }
      }
    ]
  }
end
```

## Context Values Explained

### default
```ruby
# Standard push navigation
{ context: "default" }
# Pushes onto navigation stack with back button
```

### modal
```ruby
# Modal presentation
{ context: "modal" }
# Opens as modal overlay, good for forms and focused tasks
```

### clear_all
```ruby
# Clears entire navigation stack
{ presentation: "clear_all" }
# Good for: login/logout, major context switches
```

### pop
```ruby
# Goes back one screen
{ presentation: "pop" }
# Triggered by form submissions with redirect_back
```

## Pattern Matching Deep Dive

### Basic Patterns
```ruby
[
  "/resources$",          # Exact match
  "/resources/\\d+$",     # With ID
  "/resources/.*/edit$",  # Nested route
  "^/$",                  # Root only
  ".*",                   # Catch all
]
```

### Advanced Patterns
```ruby
[
  "/users/(\\d+)/posts/(\\d+)$",  # Multiple captures
  "/api/v\\d+/",                  # Version matching
  "/(new|edit)$",                 # Either/or
  "/(?!api/)",                    # Negative lookahead
]
```

## Rails Implementation Patterns

### Navigation Helpers
```ruby
# app/helpers/navigation_helper.rb
module NavigationHelper
  def link_to_modal(name, path, **options)
    if hotwire_native_app?
      # Path config handles modal presentation
      link_to name, path, options
    else
      # Web needs explicit modal triggers
      link_to name, path, data: { turbo_frame: "modal" }, **options
    end
  end
  
  def navigation_action(action)
    return {} unless hotwire_native_app?
    
    case action
    when :back
      { data: { turbo_action: "pop" } }
    when :replace
      { data: { turbo_action: "replace" } }
    when :clear
      { data: { turbo_action: "clear_all" } }
    else
      {}
    end
  end
end
```

### Form Navigation Control
```ruby
# app/controllers/resources_controller.rb
class ResourcesController < ApplicationController
  def create
    @resource = Resource.new(resource_params)
    
    if @resource.save
      if hotwire_native_app?
        # Let path config determine presentation
        redirect_to @resource
      else
        # Web might want turbo frame response
        redirect_to @resource, status: :see_other
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @resource.update(resource_params)
      # Modal forms should dismiss after success
      redirect_to @resource, **navigation_action(:back)
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
```

### Dynamic Navigation Rules
```ruby
# For user-specific navigation patterns
def navigation_rules
  rules = base_rules
  
  if current_user&.beta_features?
    rules.unshift({
      patterns: ["/beta/"],
      properties: {
        view_controller: "BetaViewController"
      }
    })
  end
  
  rules
end
```

## Testing Navigation Patterns

### Console Testing
```ruby
# In Rails console
config = ConfigurationsController.new.send(:navigation_rules)

# Test a URL
url = "/resources/123/edit"
matching_rule = config.find { |rule| 
  rule[:patterns].any? { |pattern| 
    url.match?(Regexp.new(pattern)) 
  }
}
puts matching_rule[:properties]
# => { presentation: "modal" }
```

### System Tests
```ruby
# test/system/navigation_test.rb
class NavigationTest < ApplicationSystemTestCase
  test "edit forms open as modals in native app" do
    # Simulate native app
    page.driver.header("User-Agent", "MyApp/1.0 Hotwire Native iOS")
    
    visit resources_path
    click_link "Edit", match: :first
    
    # Verify we're on edit page
    assert_current_path edit_resource_path(resources(:first))
    
    # In real app, this would be modal
    # Path config handles presentation
  end
end
```

## Common Navigation Patterns

### Authentication Flow
```ruby
# Clear stack on login/logout
class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to new_session_path, **navigation_action(:clear)
  end
end
```

### Multi-Step Forms
```ruby
# Replace instead of push for steps
class OnboardingController < ApplicationController
  def step_two
    if hotwire_native_app?
      redirect_to onboarding_step_two_path, **navigation_action(:replace)
    else
      redirect_to onboarding_step_two_path
    end
  end
end
```

### Tab Navigation
```ruby
# Each tab maintains its own navigation stack
{
  patterns: ["/resources$", "/profile$", "/settings$"],
  properties: {
    presentation: "push",
    tab_root: true  # Custom property for tab handling
  }
}
```

## Debugging Navigation

### Add Debug Endpoint
```ruby
# config/routes.rb
if Rails.env.development?
  get "debug/navigation/:path", to: "debug#navigation"
end

# app/controllers/debug_controller.rb
class DebugController < ApplicationController
  def navigation
    path = "/" + params[:path]
    rules = ConfigurationsController.new.send(:navigation_rules)
    
    matches = rules.filter_map do |rule|
      patterns = rule[:patterns].select { |pattern| 
        path.match?(Regexp.new(pattern)) 
      }
      
      { patterns: patterns, properties: rule[:properties] } if patterns.any?
    end
    
    render json: {
      path: path,
      matches: matches,
      first_match: matches.first
    }
  end
end
```

## Advanced Patterns

### Conditional Navigation
```ruby
def show
  @resource = Resource.find(params[:id])
  
  if @resource.requires_native_features? && hotwire_native_app?
    redirect_to native_resource_path(@resource)
  else
    # Regular show view
  end
end
```

### External Links
```ruby
# Force external links to open in modal
{
  patterns: ["^https?://(?!#{Rails.application.config.host})"],
  properties: {
    presentation: "modal",
    modal_style: "fullScreen"
  }
}
```

## Common Mistakes to Avoid

### ❌ Don't hardcode navigation in iOS
```swift
// Wrong - Navigation logic in wrong place
if url.path.contains("edit") {
    presentModal(...)
}
```

### ✅ Do use path configuration
```ruby
# Right - Single source of truth
{
  patterns: ["/edit$"],
  properties: { presentation: "modal" }
}
```

### ❌ Don't fight the framework
```erb
<!-- Wrong - Custom navigation controls -->
<a href="#" onclick="window.history.back()">Back</a>
```

### ✅ Do use framework patterns
```erb
<!-- Right - Let Hotwire Native handle it -->
<%= link_to "Back", :back, data: { turbo_action: "pop" } %>
```

## Remember

- URLs drive everything - treat them as commands
- Path configuration is your router - define all rules there
- First pattern match wins - order matters
- Rails controls navigation - iOS just presents
- Test patterns in Rails console first
- Keep iOS code navigation-agnostic