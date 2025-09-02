# Simple Authentication Implementation

## Vision
Enable users to persist their progress across sessions and devices without friction. Start anonymous, then naturally prompt to save progress after experiencing value.

## Problem
Currently, users lose all their sorting progress when cookies are cleared or when switching devices. The Plaid account IDs stored in sessions don't persist reliably, forcing users to reconnect their bank and re-sort everything. This creates frustration and abandonment.

## Forces at Play
- **Push**: Lost progress when cookies clear, can't access from other devices
- **Pull**: Seamless continuity, pick up where you left off anywhere
- **Anxiety**: "Another app asking for my email", "I just want to try it first"
- **Habit**: People expect to create accounts upfront, not after using an app

## Solution Overview

### Core Flow
1. **Anonymous First**: Auto-generate device UUID on first visit, no auth required
2. **Experience Value**: User connects bank and sorts all transactions
3. **Natural Save Point**: After sorting complete, prompt "Nice work! Save your progress?"
4. **Simple Auth**: Email + password (no verification for MVP)
5. **Cross-Device**: Sign in from any device to resume

### Key Screens

#### 1. Connect Screen Enhancement
- Add subtle "Sign in" link at bottom for returning users
- Link styled to match app aesthetic (white text, 0.7 opacity)
- Position: fixed bottom center

#### 2. Save Progress Screen (New)
- Appears after user sorts all available transactions
- Copy: "Nice work!" / "Save your progress?"
- Form: Email + password fields with underline style
- Primary action: "Save Progress" button
- Secondary: "Skip for now" link (smaller, below)

#### 3. Sign In Screen
- Accessed via "Sign in" link on connect screen
- Title: "KANE" (no tagline)
- Form: Email + password fields
- Single button: "Sign in"
- Minimal, focused design

## Technical Implementation Plan

### Phase 1: User Model & Authentication (Day 1 Morning)

#### 1.1 Create User Model
```bash
rails generate model User email:string:uniq password_digest:string
rails db:migrate
```

#### 1.2 User Model Setup
```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  
  has_many :accounts, dependent: :destroy
  has_many :transactions, through: :accounts
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: :password_required?
  
  before_save :downcase_email
  
  def next_unsorted_transaction
    transactions.where(pile: nil).order(:transaction_date).first
  end
  
  def unsorted_transaction_count
    transactions.where(pile: nil).count
  end
  
  def sorting_complete?
    unsorted_transaction_count.zero?
  end
  
  private
  
  def downcase_email
    self.email = email.downcase
  end
  
  def password_required?
    password_digest.nil? || password.present?
  end
end
```

#### 1.3 Update Account Model
```ruby
# Add to existing migration or create new one
add_reference :accounts, :user, foreign_key: true

# Update app/models/account.rb
class Account < ApplicationRecord
  belongs_to :user, optional: true  # Optional for existing data
  # ... existing code ...
end
```

### Phase 2: Authentication Infrastructure (Day 1 Afternoon)

#### 2.1 Authentication Concern
```ruby
# app/controllers/concerns/authentication.rb
module Authentication
  extend ActiveSupport::Concern
  
  included do
    before_action :set_current_user
    helper_method :current_user, :user_signed_in?
  end
  
  private
  
  def set_current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      # Clear invalid sessions
      session[:user_id] = nil unless @current_user
    end
  end
  
  def current_user
    @current_user
  end
  
  def user_signed_in?
    current_user.present?
  end
  
  def authenticate_user!
    unless user_signed_in?
      session[:return_to] = request.fullpath
      redirect_to new_session_path, alert: "Please sign in to continue"
    end
  end
  
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def sign_out
    session[:user_id] = nil
    @current_user = nil
  end
end
```

#### 2.2 Update ApplicationController
```ruby
class ApplicationController < ActionController::Base
  include Authentication
  # ... existing code ...
end
```

### Phase 3: Anonymous User Tracking (Day 1 Afternoon)

#### 3.1 Device Tracking
```ruby
# app/controllers/concerns/device_tracking.rb
module DeviceTracking
  extend ActiveSupport::Concern
  
  included do
    before_action :ensure_device_id
  end
  
  private
  
  def ensure_device_id
    session[:device_id] ||= SecureRandom.uuid
    cookies.permanent[:device_id] = session[:device_id]
  end
  
  def current_device_id
    session[:device_id]
  end
end

# Add to ApplicationController
class ApplicationController < ActionController::Base
  include Authentication
  include DeviceTracking
  # ...
end
```

### Phase 4: Sessions Controller (Day 2 Morning)

#### 4.1 Routes
```ruby
# config/routes.rb
resource :session, only: [:new, :create, :destroy]
resource :registration, only: [:new, :create]
```

#### 4.2 Sessions Controller
```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
    # Renders sign in form
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user&.authenticate(params[:password])
      sign_in(user)
      
      # Associate any anonymous accounts with this user
      associate_anonymous_accounts(user)
      
      redirect_to session.delete(:return_to) || root_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  private
  
  def associate_anonymous_accounts(user)
    # Find accounts created with this device_id but no user
    device_accounts = Account.where(
      device_id: current_device_id,
      user_id: nil
    )
    
    device_accounts.update_all(user_id: user.id)
  end
end
```

#### 4.3 Registrations Controller
```ruby
# app/controllers/registrations_controller.rb
class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
    @user = User.new
    # This is shown after sorting is complete
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in(@user)
      
      # Associate anonymous accounts
      associate_anonymous_accounts(@user)
      
      flash[:notice] = "Progress saved! You can now sign in from any device."
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
  def associate_anonymous_accounts(user)
    Account.where(
      device_id: current_device_id,
      user_id: nil
    ).update_all(user_id: user.id)
  end
end
```

### Phase 5: Update Existing Controllers (Day 2 Afternoon)

#### 5.1 PlaidController Updates
```ruby
# app/controllers/plaid_controller.rb
def exchange_public_token
  # ... existing code ...
  
  # Modified account creation to track device_id
  account = if user_signed_in?
    current_user.accounts.find_or_create_from_plaid(
      plaid_account, access_token, institution_id
    )
  else
    # Anonymous account with device tracking
    Account.find_or_create_from_plaid(
      plaid_account, access_token, institution_id
    ).tap do |acc|
      acc.update(device_id: current_device_id)
    end
  end
  
  # ... rest of method ...
end
```

#### 5.2 TransactionsController Updates
```ruby
# app/controllers/transactions_controller.rb
class TransactionsController < ApplicationController
  def index
    @transaction = next_unsorted_transaction
    
    if @transaction.nil?
      if user_signed_in? || session[:prompted_to_save]
        redirect_to complete_path
      else
        # First time completing, prompt to save
        session[:prompted_to_save] = true
        redirect_to new_registration_path
      end
    end
  end
  
  private
  
  def next_unsorted_transaction
    if user_signed_in?
      current_user.next_unsorted_transaction
    else
      # Anonymous user - find by device_id
      Transaction.joins(:account)
                 .where(accounts: { device_id: current_device_id })
                 .where(pile: nil)
                 .order(:transaction_date)
                 .first
    end
  end
end
```

### Phase 6: Views Implementation (Day 2 Afternoon)

#### 6.1 Sign In View
```erb
<!-- app/views/sessions/new.html.erb -->
<div class="auth-container">
  <h1 class="auth-title">KANE</h1>
  
  <%= form_with url: session_path, local: true, class: "auth-form" do |f| %>
    <%= f.email_field :email, 
        placeholder: "your@email.com",
        required: true,
        autofocus: true,
        class: "input-underline" %>
        
    <%= f.password_field :password,
        placeholder: "password",
        required: true,
        class: "input-underline" %>
        
    <%= f.submit "Sign in", class: "btn btn-primary" %>
  <% end %>
</div>
```

#### 6.2 Save Progress View
```erb
<!-- app/views/registrations/new.html.erb -->
<div class="auth-container">
  <h2 class="auth-subtitle">Nice work!</h2>
  <p class="auth-prompt">Save your progress?</p>
  
  <%= form_with model: @user, url: registration_path, local: true, class: "auth-form" do |f| %>
    <% if @user.errors.any? %>
      <div class="auth-errors">
        <%= @user.errors.full_messages.to_sentence %>
      </div>
    <% end %>
    
    <%= f.email_field :email,
        placeholder: "your@email.com",
        required: true,
        autofocus: true,
        class: "input-underline" %>
        
    <%= f.password_field :password,
        placeholder: "create password",
        required: true,
        class: "input-underline" %>
        
    <%= f.submit "Save Progress", class: "btn btn-primary" %>
  <% end %>
  
  <%= link_to "Skip for now", complete_path, class: "auth-skip" %>
</div>
```

#### 6.3 Update Connect View
```erb
<!-- Add to app/views/connect/index.html.erb -->
<div class="auth-signin-link">
  <%= link_to "Sign in", new_session_path %>
</div>
```

### Phase 7: Styling (Day 3 Morning)

#### 7.1 Authentication Styles
```scss
// app/assets/stylesheets/authentication.css
.auth-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 32px 20px;
  text-align: center;
  max-width: 375px;
  margin: 0 auto;
}

.auth-title {
  font-size: 48px;
  font-weight: 700;
  letter-spacing: -0.02em;
  margin-bottom: 64px;
  color: var(--color-text);
  font-family: 'GameFont', monospace;
}

.auth-subtitle {
  font-size: 28px;
  font-weight: 500;
  margin-bottom: 16px;
  color: var(--color-text);
  font-family: 'GameFont', monospace;
}

.auth-prompt {
  font-size: 18px;
  opacity: 0.8;
  margin-bottom: 48px;
  color: var(--color-text);
  font-family: 'GameFont', monospace;
}

.auth-form {
  width: 100%;
  max-width: 280px;
}

.input-underline {
  width: 100%;
  padding: 20px 4px;
  font-size: 24px;
  font-family: 'GameFont', monospace;
  background: transparent;
  border: none;
  border-bottom: 2px solid #444444;
  color: var(--color-text);
  margin-bottom: 32px;
  text-align: center;
  outline: none;
  -webkit-appearance: none;
  appearance: none;
  transition: border-color 0.3s ease;
}

.input-underline:focus {
  border-bottom-color: var(--color-text);
}

.input-underline:last-of-type {
  margin-bottom: 48px;
}

.auth-errors {
  color: var(--color-kill);
  margin-bottom: 24px;
  font-size: 14px;
}

.auth-skip {
  display: inline-block;
  margin-top: 32px;
  color: var(--color-text);
  text-decoration: none;
  font-size: 14px;
  opacity: 0.5;
  transition: opacity 0.2s ease;
}

.auth-skip:hover {
  opacity: 0.7;
}

.auth-signin-link {
  position: fixed;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
}

.auth-signin-link a {
  color: var(--color-text);
  text-decoration: none;
  font-family: 'GameFont', monospace;
  font-size: 16px;
  opacity: 0.7;
  transition: opacity 0.2s ease;
}

.auth-signin-link a:hover {
  opacity: 1;
}
```

### Phase 8: Migration Strategy (Day 3 Afternoon)

#### 8.1 Add device_id to accounts
```ruby
class AddDeviceIdToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :device_id, :string
    add_index :accounts, :device_id
  end
end
```

#### 8.2 Data Migration for Existing Accounts
```ruby
# lib/tasks/auth_migration.rake
namespace :auth do
  desc "Migrate existing accounts to user-based system"
  task migrate_accounts: :environment do
    # This is optional - existing accounts remain anonymous
    # Users can claim them by signing in from same device
    puts "Migration complete. Existing accounts remain anonymous until claimed."
  end
end
```

## Testing Plan

### Manual Testing Flow
1. **Anonymous User Path**
   - Visit site → Connect bank → Sort all transactions
   - Should see "Save Progress" prompt
   - Create account → Verify data persists
   - Sign out → Sign in → Verify data restored

2. **Returning User Path**
   - Click "Sign in" on connect screen
   - Enter credentials → Should skip to transactions
   - Verify can resume sorting

3. **Cross-Device Testing**
   - Create account on device A
   - Sign in on device B
   - Verify same data appears

### Automated Tests
```ruby
# test/integration/authentication_flow_test.rb
class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "anonymous user can sort then save progress" do
    # Connect bank as anonymous
    post plaid_exchange_public_token_path, params: { public_token: "test" }
    assert_response :success
    
    # Sort transactions
    patch transaction_path(transactions(:unsorted)), params: { pile: "need" }
    assert_redirected_to transactions_path
    
    # Complete sorting redirects to registration
    get transactions_path
    assert_redirected_to new_registration_path
    
    # Create account
    post registration_path, params: {
      user: { email: "test@example.com", password: "password" }
    }
    assert_redirected_to root_path
    
    # Verify account associated
    user = User.find_by(email: "test@example.com")
    assert_equal 1, user.accounts.count
  end
end
```

## Deployment Considerations

### Environment Variables
```bash
# No new environment variables needed
# Uses Rails default session handling
```

### Database
- Run migrations before deploying
- No data loss - existing anonymous accounts continue working
- Users can claim accounts by signing in from same device

### Performance
- Minimal overhead - just session lookups
- No external services required
- Cookie-based sessions scale well

## Success Metrics
- **Account Creation Rate**: % of users who save progress after sorting
- **Return Rate**: % of users who sign in again
- **Cross-Device Usage**: % using multiple devices
- **Session Persistence**: Average time between sign-ins

## Future Enhancements
1. **Password Reset**: Add "Forgot password?" with email reset
2. **Email Verification**: Confirm email ownership (post-MVP)
3. **OAuth**: Add "Sign in with Apple/Google" 
4. **Session Management**: "Sign out everywhere" option
5. **Account Settings**: Change email/password

## Architecture Decisions

### Why Not Magic Links?
- Requires email service (Postmark, SendGrid, etc)
- Breaks PWA flow (opens in default browser)
- More complex implementation
- Users expect immediate access

### Why Device-First?
- Zero friction to try the product
- Natural save point after value delivered
- Graceful upgrade path
- Works offline (device UUID)

### Why Simple Password?
- Familiar pattern users trust
- No external dependencies
- Works in all contexts (PWA, web)
- Can enhance security later

## Remember
- The goal is persistence, not security theater
- Every step before value delivery loses users
- Anonymous-first respects user agency
- Simple implementation ships faster