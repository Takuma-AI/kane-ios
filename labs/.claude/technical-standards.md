# Technical Standards

Strong opinions, loosely held. These are the patterns that ship quality software.

## CSS Philosophy

### Semantic Over Utility

We write CSS that describes what things ARE, not what they look like.

```scss
// YES: Semantic - describes purpose
.transaction-amount {
  font-size: 1.5rem;
  font-weight: bold;
  color: var(--color-primary);
}

// NO: Utility soup - describes appearance
<div class="text-xl font-bold text-blue-600">
```

### Why Semantic CSS

- **HTML tells the story**: `<div class="transaction">` not `<div class="p-4 border rounded">`
- **Maintenance is local**: Change `.transaction` in one place
- **Responsive is intentional**: Components decide their own breakpoints
- **Accessibility is built-in**: Screen readers understand semantic names

### CSS Organization

```scss
// app/assets/stylesheets/application.css.scss

// 1. Settings - design tokens
@import "settings/colors";
@import "settings/typography";
@import "settings/spacing";

// 2. Base - element defaults
@import "base/reset";
@import "base/typography";

// 3. Components - reusable patterns  
@import "components/buttons";
@import "components/forms";
@import "components/cards";

// 4. Layouts - page structures
@import "layouts/header";
@import "layouts/sidebar";

// 5. Views - page-specific styles
@import "views/transactions";
@import "views/dashboard";
```

### Component Styles

```scss
// app/assets/stylesheets/components/_transaction.scss

.transaction {
  padding: var(--spacing-base);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-base);
  
  &:hover {
    background: var(--color-surface-hover);
  }
  
  &__amount {
    font-size: var(--text-lg);
    font-weight: 600;
    color: var(--color-primary);
  }
  
  &__merchant {
    color: var(--color-text);
  }
  
  &--pending {
    opacity: 0.6;
  }
}
```

### CSS Rules

- **Never use `!important`** - fix the specificity problem
- **Never use inline styles** - except for truly dynamic values
- **Never use Tailwind** - we're not building utility soup
- **Use CSS custom properties** - for design tokens
- **Use BEM-ish naming** - but don't be religious about it
- **Keep specificity low** - max 2-3 levels deep

## Rails Patterns

### Controllers: Skinny and Focused

```ruby
class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.recent
  end
  
  def create
    @transaction = current_user.transactions.build(transaction_params)
    
    if @transaction.save
      redirect_to @transaction
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def transaction_params
    params.require(:transaction).permit(:amount, :merchant, :category)
  end
end
```

### Models: Domain Logic Lives Here

```ruby
class Transaction < ApplicationRecord
  belongs_to :user
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :merchant, presence: true
  
  scope :recent, -> { order(created_at: :desc).limit(100) }
  scope :needs, -> { where(category: 'need') }
  scope :wants, -> { where(category: 'want') }
  
  def mark_as_need!
    update!(category: 'need')
  end
  
  def percentage_of_income
    (amount / user.monthly_income.to_f * 100).round(2)
  end
end
```

### Views: Presentation Logic

```erb
<!-- app/views/transactions/_transaction.html.erb -->
<div class="transaction" data-transaction-id="<%= transaction.id %>">
  <h3 class="transaction__merchant"><%= transaction.merchant %></h3>
  <p class="transaction__amount">
    <%= number_to_currency(transaction.amount) %>
  </p>
  <div class="transaction__actions">
    <%= button_to "Need", mark_as_need_transaction_path(transaction),
                  method: :patch,
                  class: "button button--primary" %>
  </div>
</div>
```

### Service Objects: Complex Operations

Only when controllers get complex:

```ruby
# app/services/transaction_categorizer.rb
class TransactionCategorizer
  def initialize(transaction)
    @transaction = transaction
  end
  
  def categorize
    return 'need' if essential_merchant?
    return 'want' if luxury_merchant?
    'uncategorized'
  end
  
  private
  
  def essential_merchant?
    ESSENTIAL_MERCHANTS.include?(@transaction.merchant.downcase)
  end
  
  ESSENTIAL_MERCHANTS = ['grocery', 'pharmacy', 'utilities']
end
```

## Database Design

### Principles

- **Start normalized**: Denormalize only when proven necessary
- **Indexes follow usage**: Add them when queries slow
- **Constraints in database**: The database is the last line of defense
- **Migrations are documentation**: Clear up/down, descriptive names

### Migration Patterns

```ruby
class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :merchant, null: false
      t.string :category
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
      
      t.index [:user_id, :created_at]
      t.index :category
    end
  end
end
```

## Turbo & Stimulus Patterns

### Turbo Frames: Surgical Updates

```erb
<!-- app/views/transactions/index.html.erb -->
<turbo-frame id="transactions">
  <%= render @transactions %>
</turbo-frame>

<!-- Update just the frame -->
<%= link_to "Next Page", transactions_path(page: 2),
            data: { turbo_frame: "transactions" } %>
```

### Stimulus: Sprinkles of JavaScript

```javascript
// app/javascript/controllers/transaction_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["amount", "category"]
  
  markAsNeed() {
    this.categoryTarget.textContent = "Need"
    this.element.classList.add("transaction--need")
  }
}
```

```erb
<div class="transaction" 
     data-controller="transaction"
     data-transaction-id="<%= transaction.id %>">
  <span data-transaction-target="amount">
    <%= number_to_currency(transaction.amount) %>
  </span>
  <button data-action="transaction#markAsNeed">Need</button>
</div>
```

## Testing Philosophy

### Test What Matters

```ruby
# spec/models/transaction_spec.rb
RSpec.describe Transaction do
  it "requires an amount" do
    transaction = Transaction.new(amount: nil)
    expect(transaction).not_to be_valid
  end
  
  it "calculates percentage of income" do
    user = User.new(monthly_income: 5000)
    transaction = Transaction.new(amount: 100, user: user)
    expect(transaction.percentage_of_income).to eq(2.0)
  end
end
```

### System Tests for Critical Paths

```ruby
# spec/system/transactions_spec.rb
RSpec.describe "Transactions" do
  it "creates a new transaction" do
    visit new_transaction_path
    fill_in "Amount", with: "25.50"
    fill_in "Merchant", with: "Coffee Shop"
    click_button "Create"
    
    expect(page).to have_content("$25.50")
    expect(page).to have_content("Coffee Shop")
  end
end
```

## Code Quality Standards

### Clarity Over Cleverness

```ruby
# YES: Clear intent
def can_afford?(amount)
  available_balance >= amount
end

# NO: Clever but unclear
def can_afford?(amount)
  (balance - pending_transactions.sum(:amount)) >= amount rescue false
end
```

### Early Returns Over Nested Conditions

```ruby
# YES: Early returns
def process_transaction
  return unless valid?
  return if duplicate?
  return unless user.can_afford?(amount)
  
  complete_transaction
end

# NO: Nested nightmare
def process_transaction
  if valid?
    if !duplicate?
      if user.can_afford?(amount)
        complete_transaction
      end
    end
  end
end
```

### Boring Technology Wins

- Rails defaults over custom solutions
- PostgreSQL over exotic databases
- ERB over complex templating
- Stimulus over React (unless truly needed)
- CSS over CSS-in-JS
- Boring works. Boring scales. Boring is debuggable at 3am.

## Security Standards

### Never Trust Input

```ruby
# Always sanitize
def set_transaction
  @transaction = current_user.transactions.find(params[:id])
end

# Never expose internals
def transaction_params
  params.require(:transaction).permit(:amount, :merchant)
  # Never: params.require(:transaction).permit!
end
```

### Never Log Sensitive Data

```ruby
# config/initializers/filter_parameter_logging.rb
Rails.application.config.filter_parameters += [
  :password, :token, :api_key, :credit_card
]
```

## Performance Guidelines

### Optimize When Measured

- Don't guess, measure with `rack-mini-profiler`
- N+1 queries are the usual suspect
- Cache only repeated, expensive operations
- Background jobs for anything over 500ms

### Common Patterns

```ruby
# Prevent N+1
@transactions = Transaction.includes(:user, :category).recent

# Cache expensive calculations
Rails.cache.fetch("user_#{user.id}_monthly_total") do
  user.transactions.this_month.sum(:amount)
end

# Background anything slow
TransactionAnalysisJob.perform_later(transaction)
```

## Remember

These aren't rules for rules' sake. They're patterns that ship software that works, maintains, and scales.

When in doubt:
- Choose boring
- Choose clear
- Choose Rails conventions
- Choose semantic meaning
- Choose what you can debug at 3am

The best code is code that doesn't surprise anyone, including you in six months.