# The Elegant Rails Approach

## Forget Delays - Show Everything, Enhance Progressively

The DHH way: **Don't hide data from users. Show what you have, improve it when you can.**

## Core Principle

```ruby
# Every transaction is visible immediately
# Memories are progressive enhancement
# Receipts match async and update the view

class Transaction < ApplicationRecord
  has_one :memory
  
  def display_text
    memory&.text || plaid_merchant_name
  end
end
```

That's it. No delays, no hiding, no complex state machines.

## Plaid Sync (The Right Way)

```ruby
# app/models/plaid_sync.rb
class PlaidSync < ApplicationRecord
  # Store the cursor for incremental updates
  belongs_to :account
  
  def sync!
    response = PlaidClient.sync(
      access_token: account.access_token,
      cursor: cursor  # Nil on first sync
    )
    
    # Process new transactions
    response.added.each do |txn|
      Transaction.create!(
        plaid_id: txn.transaction_id,
        amount: txn.amount,
        merchant_name: txn.merchant_name,
        # ...
      )
    end
    
    # Handle modifications
    response.modified.each do |txn|
      Transaction.find_by(plaid_id: txn.transaction_id)
                 &.update!(amount: txn.amount, ...)
    end
    
    # Handle removals
    response.removed.each do |txn|
      Transaction.find_by(plaid_id: txn.transaction_id)
                 &.destroy
    end
    
    # Save cursor for next sync
    update!(cursor: response.next_cursor)
    
    # Continue if more data
    sync! if response.has_more
  end
end
```

## The Entire Memory System

```ruby
# app/jobs/enrich_transaction_job.rb
class EnrichTransactionJob < ApplicationJob
  def perform(transaction)
    # Try to find a matching receipt
    receipt = EmailReceipt.where(
      amount: transaction.amount,
      date: (transaction.date - 3.days)..(transaction.date + 3.days)
    ).first
    
    # Generate memory
    text = if receipt
      "#{receipt.line_items.first} from #{receipt.merchant}"
    else
      # Simple LLM enhancement
      enhance_with_context(transaction)
    end
    
    # Create or update memory
    Memory.find_or_create_by(transaction: transaction).update!(
      text: text,
      source: receipt ? 'receipt' : 'plaid'
    )
  end
  
  private
  
  def enhance_with_context(transaction)
    # Dead simple context
    time_of_day = transaction.date.hour < 12 ? "Morning" : "Afternoon"
    "#{time_of_day} at #{transaction.merchant_name}"
  end
end
```

## The View (Turbo Streams)

```erb
<!-- app/views/transactions/index.html.erb -->
<%= turbo_stream_from "transactions" %>

<div id="transactions">
  <% @transactions.each do |transaction| %>
    <%= render transaction %>
  <% end %>
</div>

<!-- app/views/transactions/_transaction.html.erb -->
<%= turbo_frame_tag transaction do %>
  <div class="memory-orb">
    <h3><%= transaction.display_text %></h3>
    <p>$<%= transaction.amount %></p>
    
    <div class="actions">
      <%= button_to "Need", sort_path(transaction, pile: :need) %>
      <%= button_to "Want", sort_path(transaction, pile: :want) %>
      <%= button_to "Kill", sort_path(transaction, pile: :kill) %>
    </div>
  </div>
<% end %>
```

## When Memories Update (The Magic)

```ruby
# app/models/memory.rb
class Memory < ApplicationRecord
  belongs_to :transaction
  
  after_commit :broadcast_update
  
  private
  
  def broadcast_update
    broadcast_replace_to "transactions",
      target: transaction,
      partial: "transactions/transaction",
      locals: { transaction: transaction }
  end
end
```

## The Beautiful Flow

1. **Plaid webhook** → Sync new transactions → Show immediately
2. **User sees** → "PAYPAL *ETSYSELLER $47.82" (not ideal but honest)
3. **Email arrives** → Parse receipt → Match to transaction
4. **Memory updates** → Turbo broadcasts → "Vintage brass lamp from Etsy"
5. **User sees update** → Transaction smoothly morphs into memory

No delays. No hidden state. Just progressive enhancement.

## The Entire Sync System

```ruby
# app/controllers/webhooks_controller.rb
class WebhooksController < ApplicationController
  def plaid
    case params[:webhook_type]
    when "SYNC_UPDATES_AVAILABLE"
      SyncTransactionsJob.perform_later(params[:item_id])
    end
    head :ok
  end
end

# app/jobs/sync_transactions_job.rb
class SyncTransactionsJob < ApplicationJob
  def perform(item_id)
    account = Account.find_by(plaid_item_id: item_id)
    sync = PlaidSync.find_or_create_by(account: account)
    
    sync.sync!
    
    # Enrich all new transactions
    account.transactions.without_memory.each do |txn|
      EnrichTransactionJob.perform_later(txn)
    end
  end
end
```

## What Makes This Elegant

1. **No hidden state** - Everything visible immediately
2. **Progressive enhancement** - Memories improve over time
3. **Turbo Streams** - Updates feel magical, not jarring
4. **Simple models** - Transaction has display_text, that's it
5. **Async everything** - But user never waits
6. **Cursor-based sync** - Only fetch what's new

## The User Experience

```
10:00 AM: See "PAYPAL *ETSYSELLER $47.82" (okay, not great)
10:32 AM: Smoothly updates to "Vintage brass lamp from Etsy" (magic!)
```

The transaction was never hidden. It just got better.

## Why This is The Rails Way

- **Show don't hide** - Users can handle imperfect data
- **Progressive enhancement** - Make it better over time
- **Simple abstractions** - display_text method, nothing more
- **Leverage the framework** - Turbo Streams for real-time updates
- **Boring code** - Anyone can understand this in 5 minutes

## The Entire Implementation

```
Models: ~100 lines
Jobs: ~100 lines  
Controllers: ~50 lines
Views: ~50 lines
---
Total: ~300 lines
```

No state machines. No complex timing. No merchant intelligence tables.

Just show what you have, make it better when you can.

That's the DHH way.