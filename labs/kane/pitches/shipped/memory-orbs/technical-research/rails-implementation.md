# Memory Orbs - Rails Implementation

## Simple Rails Architecture

```
app/
├── models/
│   ├── transaction.rb       # Plaid transactions
│   ├── email_receipt.rb     # Parsed receipts
│   └── memory.rb            # Generated memories
│
├── jobs/
│   ├── fetch_transactions_job.rb    # Pull from Plaid
│   ├── parse_receipt_job.rb         # Process emails
│   ├── match_receipts_job.rb        # Link receipts to transactions
│   └── generate_memory_job.rb       # Create memory text
│
└── controllers/
    ├── webhooks_controller.rb       # Plaid webhooks
    └── emails_controller.rb         # Inbound email (Action Mailbox)
```

## The Models

```ruby
# app/models/transaction.rb
class Transaction < ApplicationRecord
  belongs_to :account
  has_one :email_receipt
  has_one :memory
  
  scope :unmatched, -> { where(email_receipt_id: nil) }
  scope :recent, -> { where(date: 7.days.ago..) }
  
  def needs_memory?
    memory.nil? || memory.stale?
  end
end

# app/models/email_receipt.rb
class EmailReceipt < ApplicationRecord
  belongs_to :transaction, optional: true
  
  scope :unmatched, -> { where(transaction_id: nil) }
  
  def potential_matches
    Transaction.unmatched
      .where(amount: (amount - 1)..(amount + 1))
      .where(date: (date - 3.days)..(date + 3.days))
  end
end

# app/models/memory.rb
class Memory < ApplicationRecord
  belongs_to :transaction
  
  def display_text
    text || transaction.merchant_name  # Fallback to Plaid
  end
end
```

## The Jobs (Solid Queue)

```ruby
# app/jobs/fetch_transactions_job.rb
class FetchTransactionsJob < ApplicationJob
  queue_as :default
  
  def perform(account)
    # Fetch latest from Plaid
    transactions = PlaidService.fetch_transactions(account)
    
    transactions.each do |plaid_txn|
      txn = Transaction.find_or_create_by(plaid_id: plaid_txn.id) do |t|
        t.amount = plaid_txn.amount
        t.date = plaid_txn.date
        t.merchant_name = plaid_txn.merchant_name
        # ... other fields
      end
      
      # Queue memory generation
      GenerateMemoryJob.perform_later(txn) if txn.needs_memory?
    end
    
    # Try to match any unmatched receipts
    MatchReceiptsJob.perform_later
  end
end

# app/jobs/parse_receipt_job.rb
class ParseReceiptJob < ApplicationJob
  queue_as :receipts
  
  def perform(inbound_email)
    # Parse email for receipt data
    parser = ReceiptParser.new(inbound_email.body)
    
    if parser.valid_receipt?
      receipt = EmailReceipt.create!(
        amount: parser.amount,
        date: parser.date,
        merchant: parser.merchant,
        line_items: parser.line_items,
        raw_email: inbound_email.raw
      )
      
      # Try to match immediately
      MatchReceiptsJob.perform_later(receipt)
    end
  end
end

# app/jobs/match_receipts_job.rb  
class MatchReceiptsJob < ApplicationJob
  queue_as :matching
  
  def perform(receipt = nil)
    receipts = receipt ? [receipt] : EmailReceipt.unmatched.recent
    
    receipts.each do |r|
      match = r.potential_matches.first  # Simple: take first match
      
      if match
        r.update!(transaction: match)
        GenerateMemoryJob.perform_later(match)
      end
    end
  end
end

# app/jobs/generate_memory_job.rb
class GenerateMemoryJob < ApplicationJob
  queue_as :memories
  
  def perform(transaction)
    memory_text = if transaction.email_receipt
      # Use receipt line items
      items = transaction.email_receipt.line_items
      "#{items.first(2).join(', ')} from #{transaction.email_receipt.merchant}"
    else
      # Use Plaid enriched data
      time = transaction.date.strftime("%A %l%p").strip
      "#{time} at #{transaction.merchant_name}"
    end
    
    # Optional: Enhance with LLM
    if Rails.env.production?
      memory_text = LLMService.enhance(memory_text, transaction)
    end
    
    Memory.create!(
      transaction: transaction,
      text: memory_text,
      source: transaction.email_receipt ? 'receipt' : 'plaid'
    )
  end
end
```

## Controllers

```ruby
# app/controllers/webhooks_controller.rb
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def plaid
    case params[:webhook_type]
    when 'TRANSACTIONS'
      # New transactions available
      account = Account.find_by(plaid_item_id: params[:item_id])
      FetchTransactionsJob.perform_later(account)
    end
    
    head :ok
  end
end

# Using Action Mailbox for email receipts
# app/mailboxes/receipts_mailbox.rb
class ReceiptsMailbox < ApplicationMailbox
  def process
    ParseReceiptJob.perform_later(inbound_email)
  end
end
```

## Database Schema

```ruby
# db/migrate/xxx_create_memory_orbs_tables.rb
class CreateMemoryOrbsTables < ActiveRecord::Migration[8.0]
  def change
    # Add to existing transactions table
    add_column :transactions, :email_receipt_id, :integer
    add_column :transactions, :memory_id, :integer
    
    create_table :email_receipts do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.date :date
      t.string :merchant
      t.json :line_items
      t.text :raw_email
      t.integer :transaction_id
      t.timestamps
    end
    
    create_table :memories do |t|
      t.integer :transaction_id, null: false
      t.text :text
      t.string :source  # 'receipt', 'plaid', 'manual'
      t.json :context   # Store what was used to generate
      t.timestamps
    end
    
    add_index :email_receipts, [:amount, :date]
    add_index :email_receipts, :transaction_id
    add_index :memories, :transaction_id
  end
end
```

## Background Processing Setup

```ruby
# config/initializers/solid_queue.rb
Rails.application.configure do
  config.solid_queue.connects_to = { database: { writing: :queue } }
  
  config.solid_queue.queues = {
    default: { poll_interval: 1 },
    receipts: { poll_interval: 5 },
    matching: { poll_interval: 10 },
    memories: { poll_interval: 5 }
  }
end

# config/recurring.yml (for scheduled jobs)
fetch_transactions:
  class: FetchAllAccountsJob
  queue: default
  schedule: every 4 hours

match_unmatched:
  class: MatchReceiptsJob
  queue: matching
  schedule: every hour

cleanup_old_unmatched:
  class: CleanupUnmatchedJob
  queue: default
  schedule: every day at 3am
```

## Simple Services

```ruby
# app/services/receipt_parser.rb
class ReceiptParser
  def initialize(email_body)
    @body = email_body
  end
  
  def valid_receipt?
    # Check for receipt indicators
    @body.include?('total') || @body.include?('order')
  end
  
  def amount
    # Extract amount with regex or LLM
    @body.match(/\$(\d+\.\d{2})/)[1].to_f
  end
  
  def line_items
    # For MVP: Just use GPT-4 to extract
    LLMService.extract_items(@body)
  end
end

# app/services/llm_service.rb
class LLMService
  def self.enhance(text, transaction)
    client = OpenAI::Client.new
    
    prompt = "Transform this transaction into a memory: #{text}. 
              Amount: $#{transaction.amount}. 
              Keep it under 10 words."
    
    response = client.completions(
      model: "gpt-4o-mini",
      prompt: prompt,
      max_tokens: 50
    )
    
    response.dig("choices", 0, "text").strip
  end
end
```

## The UI Flow

```erb
<!-- app/views/transactions/index.html.erb -->
<div class="memory-orbs">
  <% @transactions.each do |transaction| %>
    <div class="orb">
      <% if transaction.memory %>
        <!-- Rich memory -->
        <h3><%= transaction.memory.display_text %></h3>
        <p class="amount">$<%= transaction.amount %></p>
        
        <% if transaction.email_receipt %>
          <div class="line-items">
            <% transaction.email_receipt.line_items.each do |item| %>
              <span><%= item %></span>
            <% end %>
          </div>
        <% end %>
      <% else %>
        <!-- Fallback to Plaid -->
        <h3><%= transaction.merchant_name %></h3>
        <p class="amount">$<%= transaction.amount %></p>
      <% end %>
      
      <!-- Need/Want/Kill buttons -->
      <div class="sorting-buttons">
        <%= button_to "Need", sort_transaction_path(transaction, pile: :need) %>
        <%= button_to "Want", sort_transaction_path(transaction, pile: :want) %>
        <%= button_to "Kill", sort_transaction_path(transaction, pile: :kill) %>
      </div>
    </div>
  <% end %>
</div>
```

## What Makes This Simple

1. **Solid Queue** handles all background work (built into Rails 8)
2. **Action Mailbox** handles inbound emails (built into Rails)
3. **Simple matching** - just amount + date
4. **Progressive enhancement** - Show Plaid immediately, upgrade when receipt matched
5. **No complex state machines** - Just linked records

## MVP Simplifications

- Skip Gmail API - use Action Mailbox forwarding
- Skip complex matching - first match wins
- Skip LLM for parsing - use regex for amount/date
- Skip real-time - batch process every hour
- Skip user corrections initially - just log them

The whole system is maybe 500 lines of code total.