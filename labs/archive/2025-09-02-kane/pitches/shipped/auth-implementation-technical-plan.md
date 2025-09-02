# Authentication Implementation Technical Plan (Simplified)

## Vision
Add user accounts to KANE with the simplest possible implementation. Anonymous users continue working as today - they upgrade to accounts naturally when they finish sorting and want to save progress.

## Current State Analysis

### Existing Architecture
- **Session-based**: `session[:user_id]` (UUID) + `session[:account_id]` 
- **Account-centric**: One account per session, no user identity
- **Plaid Integration**: `persistent_account_id` for account matching
- **Data Flow**: Session → Account → Transactions

### Key Challenges
- Anonymous sessions with valuable sorting history
- No user model or password authentication  
- Plaid tokens need proper encryption
- Multi-device access currently impossible

## Simplified Implementation (Ships in 2 Days)

### Core Philosophy
- Anonymous users continue working exactly as today
- Users upgrade to accounts only when they finish sorting and want to save progress
- No complex migration - natural upgrade path
- Ship fast, learn fast

### Implementation Overview

### Step 1: User Model (15 minutes)
```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :accounts
  has_many :transactions, through: :accounts
  
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end

# db/migrate/xxx_create_users.rb
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
    
    add_index :users, :email, unique: true
  end
end

# db/migrate/xxx_add_user_to_accounts.rb  
class AddUserToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :user, foreign_key: true, null: true
  end
end
```

### Step 2: Account Model Update (5 minutes)
```ruby
# app/models/account.rb - add one line
class Account < ApplicationRecord
  belongs_to :user, optional: true  # <- Add this line
  has_many :transactions, dependent: :destroy
  # ... rest stays the same
end
```

### Step 3: Controllers (30 minutes)
```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Sign in form
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to transactions_path
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

# app/controllers/users_controller.rb  
class UsersController < ApplicationController
  def new
    # Save progress form (from complete screen)
  end
  
  def create
    @user = User.new(params.permit(:email, :password))
    if @user.save
      # Link current anonymous account to new user
      current_account&.update!(user: @user)
      session[:user_id] = @user.id
      redirect_to transactions_path
    else
      render :new
    end
  end
end

# app/controllers/application_controller.rb - add helper
helper_method :current_user

def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end

def current_account
  if current_user
    current_user.accounts.first
  elsif session[:account_id]
    Account.find_by(id: session[:account_id])  
  end
end
```

### Step 4: Views (30 minutes)
```erb
<!-- app/views/sessions/new.html.erb -->
<!-- Copy from mockups/auth/sign_in.html.erb -->

<!-- app/views/users/new.html.erb -->  
<!-- Copy from mockups/auth/save_progress_clean.html.erb -->

<!-- Update app/views/transactions/complete.html.erb -->
<% if current_user %>
  <p>Nothing new for you.</p>
<% else %>
  <%= link_to "Create Account to Save Your Progress", new_user_path, class: "btn btn-primary" %>
<% end %>

<!-- Update app/views/transactions/connect.html.erb -->
<!-- Add "Log In" link like in mockups/auth/connect_with_login.html.erb -->
```

### Step 5: Routes (5 minutes)
```ruby
# config/routes.rb - add these lines
get '/sign_in', to: 'sessions#new'
post '/sign_in', to: 'sessions#create'  
delete '/sign_out', to: 'sessions#destroy'
get '/sign_up', to: 'users#new'
post '/sign_up', to: 'users#create'
```

### Step 6: Gem (5 minutes)
```ruby
# Gemfile - add this line
gem 'bcrypt'

# Then run: bundle install
```

## That's It!

**Total time: 90 minutes**
**Total complexity: Minimal**

### The Flow

**New Users:**
1. Connect bank → Sort → "Create Account to Save Your Progress" → Done

**Existing Anonymous Users:**  
1. Continue sorting as normal
2. When pile is complete → "Create Account to Save Your Progress"
3. Their current account gets linked to new user account
4. Next visit: sign in normally

### Why This Works

- **Zero disruption** to existing users
- **Natural upgrade path** when users see value
- **Minimal code changes** to existing codebase
- **Ships fast** - we can deploy this in a day

### DHH Principles Applied

- **Boring technology**: Rails sessions, `has_secure_password`, standard patterns
- **Convention over configuration**: RESTful routes, minimal controllers
- **Ship small**: Core auth in 90 minutes vs. complex migration in 6 days
- **Real artists ship**: Get it working, improve later if needed

No complex migration services, no legacy session tracking, no elaborate phases. Just simple Rails authentication that naturally preserves user data when they're ready to save it.