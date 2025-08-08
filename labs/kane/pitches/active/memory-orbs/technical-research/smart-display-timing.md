# Smart Display Timing - When to Show Transactions

## The Problem
Show transactions too early → "PAYPAL *ETSYSELLER" (bad experience)
Wait too long → User wonders where their purchase went

## The Solution: Graduated Display

```ruby
class Transaction < ApplicationRecord
  # Smart visibility scopes
  scope :ready_to_show, -> {
    where(
      # Show immediately if:
      # 1. Has a memory already
      # 2. Is a known good merchant (not PayPal/Amazon)
      # 3. Been waiting > 24 hours
      
      "(memories.id IS NOT NULL) OR 
       (merchant_name NOT IN (?)) OR 
       (created_at < ?)",
       AMBIGUOUS_MERCHANTS,
       24.hours.ago
    ).includes(:memory)
  }
  
  AMBIGUOUS_MERCHANTS = [
    'PAYPAL', 'AMAZON', 'ETSY', 'EBAY', 
    'SQUARE', 'STRIPE', 'SHOPIFY'
  ]
  
  def display_status
    if memory.present?
      :ready           # Has memory, show it
    elsif ambiguous_merchant? && age < 24.hours
      :pending         # Still waiting for receipt
    else
      :ready          # Show with Plaid data
    end
  end
  
  def ambiguous_merchant?
    AMBIGUOUS_MERCHANTS.any? { |m| merchant_name.include?(m) }
  end
  
  def age
    Time.current - created_at
  end
end
```

## Display Rules

### Show Immediately
```ruby
# 1. Physical merchants with clear names
"Blue Bottle Coffee" → Show right away
"Trader Joe's" → Show right away

# 2. Transactions with instant matches
PayPal + Receipt already matched → Show with memory

# 3. Recurring/known patterns
"Netflix" → Always just Netflix, show it
```

### Hold for 2-4 Hours
```ruby
# Online merchants that usually email receipts quickly
"Amazon" → Wait 2 hours for receipt
"Target.com" → Wait 2 hours
"DoorDash" → Wait 1 hour (quick emails)
```

### Hold for 24 Hours
```ruby
# Payment processors that hide real merchant
"PayPal *SOMETHING" → Wait 24 hours
"Square *SQ" → Wait 24 hours
"ETSY" → Wait 24 hours
```

## User Experience Flow

```erb
<!-- app/views/transactions/index.html.erb -->
<div class="transactions">
  <!-- Ready transactions -->
  <% @transactions.ready_to_show.each do |txn| %>
    <div class="memory-orb">
      <%= render 'memory_orb', transaction: txn %>
    </div>
  <% end %>
  
  <!-- Pending section (optional) -->
  <% if @pending_transactions.any? %>
    <div class="pending-section">
      <p><%= @pending_transactions.count %> purchases processing...</p>
      <details>
        <summary>View pending</summary>
        <% @pending_transactions.each do |txn| %>
          <div class="pending-item">
            <%= txn.merchant_name %> - $<%= txn.amount %>
            <small>Waiting for receipt...</small>
          </div>
        <% end %>
      </details>
    </div>
  <% end %>
</div>
```

## The Controller

```ruby
class TransactionsController < ApplicationController
  def index
    # Main feed - only "ready" transactions
    @transactions = current_user.transactions
                                .ready_to_show
                                .recent
                                .includes(:memory, :email_receipt)
    
    # Pending (collapsed by default)
    @pending_transactions = current_user.transactions
                                        .pending_receipt
                                        .recent
  end
end
```

## Background Job Strategy

```ruby
class ProcessTransactionJob < ApplicationJob
  def perform(transaction)
    case transaction.age
    when 0..2.hours
      # First 2 hours: Check every 15 minutes
      MatchReceiptsJob.perform_later(transaction)
      ProcessTransactionJob.set(wait: 15.minutes).perform_later(transaction)
      
    when 2.hours..24.hours  
      # 2-24 hours: Check every hour
      MatchReceiptsJob.perform_later(transaction)
      ProcessTransactionJob.set(wait: 1.hour).perform_later(transaction)
      
    else
      # After 24 hours: Give up, generate basic memory
      GenerateMemoryJob.perform_later(transaction, fallback: true)
    end
  end
end
```

## Smart Defaults by Merchant Type

```ruby
class MerchantIntelligence
  RECEIPT_TIMING = {
    # Fast email receipts (< 1 hour)
    fast: ['Amazon', 'DoorDash', 'Uber', 'Apple'],
    
    # Medium speed (1-4 hours)
    medium: ['Target', 'Walmart', 'Best Buy'],
    
    # Slow or unreliable (wait 24 hours)
    slow: ['PayPal', 'Etsy', 'Small merchants'],
    
    # Never sends receipts (show immediately)
    never: ['Gas stations', 'Restaurants', 'Coffee shops']
  }
  
  def self.expected_receipt_time(merchant_name)
    case merchant_name
    when /amazon/i then 30.minutes
    when /paypal/i then 24.hours
    when /starbucks/i then 0 # Show immediately
    else 2.hours # Default buffer
    end
  end
end
```

## Progressive Disclosure

### Hour 0-2: "Processing"
```
"3 new purchases processing..."
[Collapse to show if user wants]
```

### Hour 2-24: "Enriching"
```
"PayPal purchase - checking for details..."
[Show basic info, indicate waiting]
```

### Hour 24+: "Ready"
```
"PayPal $47.82"
[Show what we have, stop waiting]
```

## The Magic Moment

Instead of:
```
10:00 AM: "PAYPAL *ETSYSELLER $47.82" appears (frustrating)
```

We get:
```
10:00 AM: [Hidden - waiting for receipt]
10:32 AM: "Vintage brass lamp from Etsy" appears (magical!)
```

## Configuration

```ruby
# config/kane.yml
transaction_display:
  ambiguous_merchants:
    - PAYPAL
    - AMAZON
    - SQUARE
    
  hold_periods:
    default: 2.hours
    paypal: 24.hours
    amazon: 4.hours
    
  force_show_after: 24.hours
  
  check_intervals:
    0_to_2_hours: 15.minutes
    2_to_24_hours: 1.hour
```

## Key Insights

1. **Not all transactions are equal** - Coffee shops can show immediately, PayPal should wait
2. **Most receipts arrive quickly** - 80% within 2 hours if they're coming
3. **Users prefer complete info** - Better to wait 2 hours for "Vintage lamp" than show "PAYPAL" immediately
4. **But not too long** - After 24 hours, show what we have
5. **Progressive disclosure** - Show count of pending, details on demand

This creates a magical experience where transactions "develop" like Polaroids - the ambiguous ones resolve into clear memories just when you need them.