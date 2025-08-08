# Rails-y Mockup Architecture

## Problem with Current Approach
- Fighting Rails conventions with custom routing
- CSS not loading reliably due to layout isolation
- Inline styles everywhere (not maintainable)
- Manual file organization

## Better Approach: Mockups as First-Class Citizens

### Option 1: Mockups as a Namespaced Controller (Recommended)

```ruby
# config/routes.rb
namespace :mockups do
  get '/', to: 'pages#index'
  get '/:page', to: 'pages#show', as: :page
end

# app/controllers/mockups/pages_controller.rb
module Mockups
  class PagesController < ApplicationController
    layout 'mockup'
    
    def index
      @mockups = Dir.glob(Rails.root.join("app/views/mockups/pages/*.html.erb"))
                    .map { |f| File.basename(f, '.html.erb') }
                    .reject { |f| f.start_with?('_') }
    end
    
    def show
      render params[:page]
    end
  end
end
```

### Option 2: High Voltage Gem Approach
```ruby
# Gemfile
gem 'high_voltage', '~> 3.1'

# Then just put static pages in app/views/pages/
# Access via: /pages/sign_in
```

### Option 3: ActionText/Trix for Visual Mockups
- Use Rails' built-in rich text editor
- Store mockups in database
- Version control through ActiveRecord

## Recommended Architecture

### 1. Structure
```
app/
  controllers/
    mockups/
      base_controller.rb    # Shared mockup behavior
      screens_controller.rb # Individual screens
  views/
    mockups/
      screens/
        sign_in.html.erb
        save_progress.html.erb
        connect.html.erb
      shared/
        _header.html.erb
        _form_inputs.html.erb
    layouts/
      mockup.html.erb      # Uses application CSS
  assets/
    stylesheets/
      mockups.scss         # Mockup-specific styles
```

### 2. Leverage Rails Assets Pipeline
```erb
<!-- app/views/layouts/mockup.html.erb -->
<!DOCTYPE html>
<html>
  <head>
    <title>KANE Mockups</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    
    <!-- Use the actual app styles -->
    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= stylesheet_link_tag "mockups", "data-turbo-track": "reload" %>
  </head>
  <body class="mockup-body">
    <%= yield %>
  </body>
</html>
```

### 3. Component-Based Partials
```erb
<!-- app/views/mockups/shared/_auth_input.html.erb -->
<%= content_tag :input, nil,
    type: local_assigns[:type] || 'text',
    placeholder: local_assigns[:placeholder],
    class: 'input-underline',
    required: local_assigns[:required] || false %>

<!-- Usage -->
<%= render 'mockups/shared/auth_input', 
    type: 'email', 
    placeholder: 'your@email.com',
    required: true %>
```

### 4. Use CSS Classes Properly
```scss
// app/assets/stylesheets/mockups.scss
.mockup-body {
  @extend body; // Inherit main app styles
  
  // Override only what's needed
  .input-underline {
    @extend input; // Start with app input styles
    background: transparent;
    border: none;
    border-bottom: 2px solid #444;
    
    &:focus {
      border-bottom-color: var(--color-text);
    }
  }
}
```

### 5. ViewComponent for Reusable Elements
```ruby
# app/components/auth_form_component.rb
class AuthFormComponent < ViewComponent::Base
  def initialize(action:, button_text:, show_skip: false)
    @action = action
    @button_text = button_text
    @show_skip = show_skip
  end
end

# app/components/auth_form_component.html.erb
<%= form_with url: @action, class: 'auth-form' do |f| %>
  <%= f.email_field :email, class: 'input-underline', placeholder: 'your@email.com' %>
  <%= f.password_field :password, class: 'input-underline', placeholder: 'password' %>
  <%= f.submit @button_text, class: 'btn btn-primary' %>
<% end %>
<% if @show_skip %>
  <%= link_to 'Skip for now', '#', class: 'auth-skip' %>
<% end %>
```

## Quick Fix for Current Setup

### 1. Use Application Layout
```ruby
# app/controllers/mockups_controller.rb
class MockupsController < ApplicationController
  layout 'application'  # Use main app layout
  
  before_action :add_mockup_styles
  
  private
  
  def add_mockup_styles
    # This ensures mockup styles load after application styles
    content_for :head do
      stylesheet_link_tag 'mockups'
    end
  end
end
```

### 2. Create Proper Mockup Stylesheet
```scss
// app/assets/stylesheets/mockups.scss
// Import variables and mixins from main app
@import "application";

// Mockup-specific overrides
.mockup-container {
  max-width: 375px;
  margin: 0 auto;
  min-height: 100vh;
}

// Reuse existing classes with modifications
.input-underline {
  @extend .form-control; // If you have one
  background: transparent;
  border: none;
  border-bottom: 2px solid #444;
}
```

### 3. Use Rails Helpers
```erb
<!-- Instead of inline styles -->
<%= text_field_tag :email, nil, 
    class: 'input-underline',
    placeholder: 'your@email.com',
    required: true,
    autofocus: true %>

<%= button_tag 'Sign in', 
    class: 'btn btn-primary',
    type: 'submit' %>
```

## Benefits of Rails-y Approach
1. **CSS Actually Works** - Uses asset pipeline properly
2. **Reusable Components** - Partials and helpers
3. **Maintainable** - No inline styles
4. **Discoverable** - Standard Rails patterns
5. **Hot Reloading** - Changes reflect immediately
6. **Production-Ready** - Same code can become real views

## Migration Path
1. Move mockups to proper controller structure
2. Extract inline styles to stylesheet
3. Use partials for repeated elements
4. Leverage Rails form helpers
5. Inherit from application styles

This approach treats mockups as real Rails views that happen to have hardcoded data, rather than fighting the framework with custom solutions.