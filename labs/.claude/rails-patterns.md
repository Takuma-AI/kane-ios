# Rails Patterns for Labs

Rails is the default choice. Not because it's perfect, but because it's complete, mature, and lets us focus on the product instead of the plumbing.

## Rails Philosophy in Labs

### Convention Over Configuration
Trust the framework. Rails has opinions for a reason. When Rails has a way, use it. Fighting the framework is a rabbit hole.

### Boring Technology Wins
- Start with Rails defaults
- Add gems only when pain is real
- Prefer Rails patterns over new abstractions
- Choose boring solutions that work

### The Rails Stack
```bash
rails new [product-name] --css=sass --skip-jbuilder
cd [product-name]
bundle add hotwire-rails
```

That's it. Everything else comes when needed, not before.

## Building Patterns

### Interface First, Always
The interface IS the product. Everything else supports what users see.

```erb
<!-- Phase 1: Hardcoded in view -->
<div class="transactions">
  <div class="transaction">
    <h3>Starbucks</h3>
    <p>$4.50</p>
    <button>Need</button>
    <button>Want</button>
    <button>Kill</button>
  </div>
</div>

<!-- Phase 2: With data (later) -->
<% @transactions.each do |transaction| %>
  <div class="transaction">
    <h3><%= transaction.merchant %></h3>
    <p><%= transaction.display_amount %></p>
    <!-- buttons -->
  </div>
<% end %>
```

### Progressive Implementation
Phase 1: Hardcoded views
Phase 2: Simple models
Phase 3: Add behavior as needed

Never build infrastructure before interface.

### Controllers Stay Skinny
```ruby
# Good - Simple and clear
class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.pending
  end
  
  def sort
    @transaction = current_user.transactions.find(params[:id])
    @transaction.sort_to(params[:pile])
    redirect_to transactions_path
  end
end

# Bad - Business logic in controller
class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user: current_user)
                              .where(sorted_at: nil)
                              .includes(:merchant)
    @needs = @transactions.where(pile: 'need')
    @wants = @transactions.where(pile: 'want')
    # More logic that belongs in models...
  end
end
```

### Models Own Logic
```ruby
class Transaction < ApplicationRecord
  scope :pending, -> { where(sorted_at: nil) }
  scope :sorted, -> { where.not(sorted_at: nil) }
  
  def sort_to(pile)
    update!(pile: pile, sorted_at: Time.current)
  end
  
  def display_amount
    "$#{amount}"
  end
end
```

## Hotwire Integration

### Turbo Frames for Partial Updates
```erb
<%= turbo_frame_tag "transaction_#{transaction.id}" do %>
  <%= render transaction %>
<% end %>
```

### Stimulus for JavaScript Sprinkles
```javascript
// app/javascript/controllers/flash_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => this.element.remove(), 3000)
  }
}
```

## Testing What Matters

### System Tests for User Flows
```ruby
test "user can sort transactions" do
  visit transactions_path
  
  within "#transaction_1" do
    click_button "Need"
  end
  
  assert_text "Transaction sorted"
end
```

### Unit Tests for Business Logic
```ruby
test "transaction calculates kill percentage" do
  user = User.new(kill_pile: 1000, want_pile: 500)
  assert_equal 200, user.contribution_amount # 20% of moved funds
end
```

## Development Workflow

### Incremental Progress
```bash
# Start fresh
rails server

# Build incrementally
# See it working in browser
# Commit working state

# Before shipping
rails test
git add -p
git commit -m "Ship [feature]: [what it enables]"
```

### Database Philosophy
- Start with SQLite (default)
- Migrate to PostgreSQL when needed
- Don't optimize prematurely
- Indexes when queries slow, not before

## Code Style

### Rails Way
- RESTful routes
- Follow naming conventions
- Use Rails helpers
- Embrace Active Record
- Delete code fearlessly

### Clarity Over Cleverness
```ruby
# Good - Clear intent
def needs_sorting?
  sorted_at.nil?
end

# Bad - Too clever
def needs_sorting?
  !sorted_at?
end
```

## Common Patterns

### Form Objects When Forms Get Complex
```ruby
# app/models/transaction_sort.rb
class TransactionSort
  include ActiveModel::Model
  
  attr_accessor :transaction_id, :pile, :user
  
  def save
    transaction.sort_to(pile)
    user.update_contribution
  end
end
```

### Service Objects for Complex Operations
```ruby
# app/services/plaid_sync.rb
class PlaidSync
  def initialize(user)
    @user = user
  end
  
  def perform
    # Complex sync logic
  end
end
```

## Remember

- Convention over configuration
- Build what you see in the UI
- Start simple, enhance gradually
- Ship working software when it teaches
- If Rails has a way, use it
- The best code is no code
- Delete fearlessly
- Real artists ship