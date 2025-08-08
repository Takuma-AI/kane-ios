# Memory Orbs - Precise Implementation Plan

## Vision Crystallization
Transform "PAYPAL *ETSYSELLER $47.82" into "Vintage brass lamp from Etsy" through context accumulation. Context doesn't match - it gathers around transactions like memories forming in our minds.

## Architectural Foundation

### Three-Layer Data Model
```
USER INTERFACE (Memories)
    ↑
INTELLIGENCE LAYER (Context Pool)
    ↑
DATA LAYER (Immutable Transactions)
```

**Critical Principle:** Transactions from Plaid are NEVER modified. We layer meaning on top.

## Phase 1: Core Infrastructure (Day 1-2)

### Database Schema

```ruby
# Migration 1: Create Memory Infrastructure
class CreateMemoryOrbsTables < ActiveRecord::Migration[8.0]
  def change
    # Context sources - emails that become searchable context
    create_table :email_contexts do |t|
      t.integer :user_id, null: false
      t.string :from_address
      t.string :subject
      t.decimal :amount, precision: 10, scale: 2
      t.date :order_date
      t.string :merchant
      t.jsonb :line_items  # [{name, price, quantity}]
      t.text :raw_email
      t.datetime :processed_at
      t.timestamps
      
      t.index [:user_id, :amount, :order_date]
      t.index :merchant
    end
    
    # Memories - what users see
    create_table :memories do |t|
      t.integer :transaction_id, null: false
      t.text :description
      t.string :source  # 'email', 'plaid', 'manual'
      t.decimal :confidence, default: 0.0
      t.integer :context_count, default: 0
      t.datetime :formed_at
      t.timestamps
      
      t.index :transaction_id, unique: true
      t.index :formed_at
    end
    
    # Link memories to contexts
    create_table :memory_contexts do |t|
      t.integer :memory_id, null: false
      t.integer :email_context_id, null: false
      t.decimal :relevance_score
      t.timestamps
      
      t.index [:memory_id, :email_context_id], unique: true
    end
    
    # Add memory tracking to transactions
    add_column :transactions, :memory_id, :integer
    add_column :transactions, :pending_memory, :boolean, default: false
    add_index :transactions, :memory_id
  end
end
```

### Core Models

```ruby
# app/models/email_context.rb
class EmailContext < ApplicationRecord
  belongs_to :user
  has_many :memory_contexts
  has_many :memories, through: :memory_contexts
  
  scope :unmatched, -> { left_joins(:memory_contexts).where(memory_contexts: { id: nil }) }
  scope :recent, -> { where('created_at > ?', 30.days.ago) }
  
  def potential_transactions
    user.transactions
        .joins(:account)
        .where('ABS(amount - ?) < ?', amount, 1.0)
        .where(transaction_date: (order_date - 3.days)..(order_date + 3.days))
        .where(memory_id: nil)
  end
end

# app/models/memory.rb
class Memory < ApplicationRecord
  belongs_to :transaction
  has_many :memory_contexts
  has_many :email_contexts, through: :memory_contexts
  
  scope :high_confidence, -> { where('confidence > ?', 0.8) }
  scope :needs_enhancement, -> { where('confidence < ?', 0.5) }
  
  def display_text
    description || transaction.merchant_name
  end
  
  def primary_context
    memory_contexts.order(relevance_score: :desc).first&.email_context
  end
end

# app/models/transaction.rb (enhanced)
class Transaction < ApplicationRecord
  belongs_to :account
  has_one :memory, dependent: :destroy
  
  # Existing pile functionality
  enum :pile, { need: 0, want: 1, kill: 2 }
  
  # Memory-related scopes
  scope :without_memory, -> { where(memory_id: nil) }
  scope :ready_for_memory, -> { without_memory.where('created_at < ?', 1.hour.ago) }
  scope :with_memory, -> { joins(:memory) }
  
  # Interface ONLY shows transactions with memories
  scope :displayable, -> { with_memory }
end
```

## Phase 2: Email Ingestion (Day 2-3)

### Action Mailbox Setup

```ruby
# config/application.rb
config.action_mailbox.ingress = :postmark  # or :sendgrid

# app/mailboxes/application_mailbox.rb
class ApplicationMailbox < ActionMailbox::Base
  routing /receipts@/i => :receipts
end

# app/mailboxes/receipts_mailbox.rb
class ReceiptsMailbox < ApplicationMailbox
  def process
    return unless valid_receipt?
    
    user = identify_user
    return unless user
    
    EmailContext.create!(
      user: user,
      from_address: mail.from.first,
      subject: mail.subject,
      raw_email: mail.raw_source,
      amount: extract_amount,
      order_date: extract_date,
      merchant: extract_merchant,
      line_items: extract_items
    )
    
    # Queue matching job
    MatchContextsJob.perform_later(user)
  end
  
  private
  
  def valid_receipt?
    body = mail.text_part&.body || mail.body
    body.to_s.match?(/order|receipt|invoice|total|purchase/i)
  end
  
  def identify_user
    # Match by forwarding address setup
    User.find_by(receipt_email: mail.to.first)
  end
  
  def extract_amount
    # Simple regex for MVP, upgrade to LLM later
    if match = mail.body.to_s.match(/\$(\d+\.?\d*)/i)
      match[1].to_f
    end
  end
end
```

## Phase 3: Context Matching Engine (Day 3-4)

### Matching Service

```ruby
# app/services/context_matcher.rb
class ContextMatcher
  def initialize(transaction)
    @transaction = transaction
  end
  
  def find_best_context
    contexts = gather_contexts
    return nil if contexts.empty?
    
    scored_contexts = contexts.map { |c| [c, calculate_score(c)] }
    best = scored_contexts.max_by(&:last)
    
    best.first if best.last > 0.3  # Minimum confidence threshold
  end
  
  private
  
  def gather_contexts
    EmailContext.where(user: @transaction.account.user)
                .where('ABS(amount - ?) < ?', @transaction.amount, 1.0)
                .where(order_date: date_range)
                .recent
  end
  
  def date_range
    # Transactions usually appear 0-3 days after order
    (@transaction.transaction_date - 7.days)..(@transaction.transaction_date + 1.day)
  end
  
  def calculate_score(context)
    score = 0.0
    
    # Exact amount match (highest weight)
    score += 0.5 if (context.amount - @transaction.amount).abs < 0.01
    
    # Date proximity
    days_apart = (@transaction.transaction_date - context.order_date).abs
    score += [0.3 - (days_apart * 0.05), 0].max
    
    # Merchant similarity
    if context.merchant && @transaction.merchant_name
      score += 0.2 if fuzzy_match(context.merchant, @transaction.merchant_name)
    end
    
    score
  end
  
  def fuzzy_match(str1, str2)
    clean1 = str1.downcase.gsub(/[^a-z0-9]/, '')
    clean2 = str2.downcase.gsub(/[^a-z0-9]/, '')
    
    clean1.include?(clean2) || clean2.include?(clean1) ||
    clean1[0..3] == clean2[0..3]
  end
end
```

### Memory Formation Job

```ruby
# app/jobs/form_memories_job.rb
class FormMemoriesJob < ApplicationJob
  queue_as :memories
  
  def perform(user = nil)
    scope = user ? user.transactions : Transaction
    
    # ALL transactions past 1 hour get memories
    scope.ready_for_memory.find_each do |transaction|
      next if transaction.memory.present?
      
      context = ContextMatcher.new(transaction).find_best_context
      
      if context
        create_rich_memory(transaction, context)
      else
        # ALWAYS create a memory, even without context
        create_basic_memory(transaction)
      end
    end
  end
  
  private
  
  def create_rich_memory(transaction, context)
    memory = Memory.create!(
      transaction: transaction,
      description: generate_description(context),
      source: 'email',
      confidence: 0.8,
      context_count: 1,
      formed_at: Time.current
    )
    
    MemoryContext.create!(
      memory: memory,
      email_context: context,
      relevance_score: 0.8
    )
    
    transaction.update!(memory_id: memory.id)
  end
  
  def create_basic_memory(transaction)
    # Always create a memory with what we have
    description = enhance_merchant_name(transaction)
    
    memory = Memory.create!(
      transaction: transaction,
      description: description,
      source: 'plaid',
      confidence: 0.3,
      formed_at: Time.current
    )
    
    transaction.update!(memory_id: memory.id)
  end
  
  def enhance_merchant_name(transaction)
    # Add minimal context from what we know
    day = transaction.transaction_date.strftime("%A")
    time_of_day = guess_time_of_day(transaction)
    
    "#{day} #{time_of_day} at #{transaction.merchant_name}"
  end
  
  def guess_time_of_day(transaction)
    # Simple heuristics based on merchant type
    case transaction.merchant_name
    when /coffee|starbucks|blue bottle/i then "morning"
    when /lunch|sandwich|salad/i then "afternoon"
    when /dinner|restaurant|bar/i then "evening"
    else ""
    end.strip
  end
  
  def generate_description(context)
    if context.line_items.present?
      items = context.line_items.first(2).map { |i| i['name'] }
      "#{items.join(', ')} from #{context.merchant}"
    else
      "Purchase from #{context.merchant}"
    end
  end
end
```

## Phase 4: Memory-Only Display (Day 4-5)

### Memories Controller

```ruby
# app/controllers/memories_controller.rb
class MemoriesController < ApplicationController
  def index
    # ONLY show transactions that have memories
    @memories = current_user.transactions
                           .displayable  # Only with memories
                           .includes(:memory)
                           .recent_first
    
    # Next memory to sort
    @next_to_sort = @memories.unsorted.first
  end
  
  def update
    @transaction = current_user.transactions.find(params[:id])
    @transaction.sort_to_pile!(params[:pile])
    
    respond_to do |format|
      format.html { redirect_to memories_path }
      format.turbo_stream {
        @next_memory = current_user.transactions.displayable.unsorted.first
        render turbo_stream: [
          turbo_stream.remove(@transaction),
          turbo_stream.update("next-memory", 
            partial: "memories/orb", 
            locals: { transaction: @next_memory })
        ]
      }
    end
  end
end
```

### Memory-Only View

```erb
<!-- app/views/memories/index.html.erb -->
<div class="memories-container">
  <!-- Active sorting interface - ONLY shows memories -->
  <% if @next_to_sort %>
    <div id="next-memory" class="sorting-interface">
      <div class="memory-orb">
        <h3><%= @next_to_sort.memory.display_text %></h3>
        <p class="amount">$<%= @next_to_sort.amount %></p>
      </div>
      
      <div class="sorting-buttons">
        <%= button_to "Need", memory_path(@next_to_sort),
            method: :patch,
            params: { pile: :need },
            class: "btn-need",
            data: { turbo_stream: true } %>
            
        <%= button_to "Want", memory_path(@next_to_sort),
            method: :patch,
            params: { pile: :want },
            class: "btn-want",
            data: { turbo_stream: true } %>
            
        <%= button_to "Kill", memory_path(@next_to_sort),
            method: :patch,
            params: { pile: :kill },
            class: "btn-kill",
            data: { turbo_stream: true } %>
      </div>
    </div>
  <% else %>
    <p class="complete-message">Nothing new for you.</p>
  <% end %>
  
  <!-- Sorted memories -->
  <div class="sorted-memories">
    <% @memories.sorted.each do |transaction| %>
      <div class="memory-orb">
        <h3><%= transaction.memory.display_text %></h3>
        <p class="amount">$<%= transaction.amount %></p>
        <span class="pile-badge pile-<%= transaction.pile %>"><%= transaction.pile&.upcase %></span>
      </div>
    <% end %>
  </div>
</div>
```

## Phase 5: Background Processing (Day 5-6)

### Solid Queue Configuration

```yaml
# config/recurring.yml
production:
  fetch_transactions:
    class: FetchTransactionsJob
    queue: critical
    schedule: every 4 hours
  
  form_memories:
    class: FormMemoriesJob
    queue: memories
    schedule: every 15 minutes
  
  match_contexts:
    class: MatchContextsJob
    queue: matching
    schedule: every hour
  
  enhance_memories:
    class: EnhanceMemoriesJob
    queue: low
    schedule: every 6 hours
```

### Critical Background Jobs

```ruby
# app/jobs/fetch_transactions_job.rb
class FetchTransactionsJob < ApplicationJob
  def perform
    User.with_plaid_access.find_each do |user|
      user.accounts.each do |account|
        transactions = PlaidService.fetch_recent(account)
        
        transactions.each do |plaid_txn|
          Transaction.find_or_create_by(
            plaid_transaction_id: plaid_txn.transaction_id
          ) do |t|
            t.account = account
            t.merchant_name = plaid_txn.merchant_name || plaid_txn.name
            t.amount = plaid_txn.amount.abs
            t.transaction_date = plaid_txn.date
          end
        end
      end
    end
    
    # Trigger memory formation
    FormMemoriesJob.perform_later
  end
end

# app/jobs/match_contexts_job.rb  
class MatchContextsJob < ApplicationJob
  def perform
    # Try to match unmatched contexts to transactions
    EmailContext.unmatched.find_each do |context|
      transactions = context.potential_transactions
      
      if transaction = transactions.first
        matcher = ContextMatcher.new(transaction)
        if matcher.find_best_context == context
          FormMemoriesJob.perform_later(nil, transaction.id, context.id)
        end
      end
    end
  end
end
```

## Phase 6: LLM Enhancement (Day 6-7)

### Memory Enhancement Service

```ruby
# app/services/memory_enhancer.rb
class MemoryEnhancer
  def initialize(memory)
    @memory = memory
    @transaction = memory.transaction
  end
  
  def enhance
    return if @memory.confidence > 0.8  # Already good
    
    enhanced_text = if @memory.primary_context
      enhance_with_context
    else
      enhance_with_llm
    end
    
    @memory.update!(
      description: enhanced_text,
      confidence: [@memory.confidence + 0.2, 1.0].min
    )
  end
  
  private
  
  def enhance_with_context
    context = @memory.primary_context
    items = context.line_items.first(3).map { |i| i['name'] }
    
    if items.any?
      "#{items.join(', ')}"
    else
      "#{context.merchant} purchase"
    end
  end
  
  def enhance_with_llm
    # Only in production, use GPT-4o-mini for cost
    return @memory.description unless Rails.env.production?
    
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{
          role: "system",
          content: "Transform this transaction into a 5-10 word memory. Focus on what was purchased, not where."
        }, {
          role: "user", 
          content: "Merchant: #{@transaction.merchant_name}, Amount: $#{@transaction.amount}, Date: #{@transaction.transaction_date.strftime('%A')}"
        }],
        max_tokens: 20,
        temperature: 0.3
      }
    )
    
    response.dig("choices", 0, "message", "content").strip
  rescue => e
    Rails.logger.error "LLM enhancement failed: #{e}"
    @memory.description  # Fallback to original
  end
end
```

## Hotwire Native Bridge Components

### Native-Aware Display

```erb
<!-- app/views/transactions/_memory_orb.html.erb -->
<div class="memory-orb" 
     data-controller="<%= hotwire_native_app? ? 'bridge--memory' : 'memory' %>"
     data-transaction-id="<%= transaction.id %>">
  
  <% if transaction.memory %>
    <h3 class="memory-text"><%= transaction.memory.display_text %></h3>
    <p class="original-merchant"><%= transaction.merchant_name %></p>
  <% else %>
    <h3 class="merchant-name"><%= transaction.merchant_name %></h3>
  <% end %>
  
  <p class="amount">$<%= transaction.amount %></p>
  
  <% if hotwire_native_app? %>
    <!-- Native gets enhanced interaction -->
    <div data-bridge-transaction-data="<%= transaction.to_json %>"></div>
  <% end %>
</div>
```

### Bridge Controller

```javascript
// app/javascript/controllers/bridge/memory_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "memory"
  
  connect() {
    super.connect()
    const transactionId = this.element.dataset.transactionId
    const hasMemory = this.element.querySelector('.memory-text')
    
    this.send("connect", { 
      transactionId,
      hasMemory: !!hasMemory,
      confidence: this.element.dataset.confidence || "0"
    })
  }
  
  // Native can request memory refresh
  refresh() {
    fetch(`/transactions/${this.element.dataset.transactionId}/memory`, {
      headers: { "Accept": "application/json" }
    })
    .then(response => response.json())
    .then(data => {
      this.send("memoryUpdated", data)
    })
  }
}
```

## Critical Implementation Details

### 1. Data Integrity
- NEVER modify plaid_transaction_id, amount, or transaction_date
- Memories are additive layers, not replacements
- Keep raw email content for future reprocessing

### 2. Performance Optimization
```ruby
# Indexes are critical
add_index :email_contexts, [:user_id, :amount, :order_date]
add_index :transactions, [:account_id, :transaction_date]
add_index :memories, :formed_at
```

### 3. Graceful Degradation
- Show Plaid data immediately
- Enhance when context arrives
- Never block on missing context

### 4. User Trust
- High confidence: Show memory boldly
- Low confidence: Show with original merchant visible
- No match: Just show enhanced Plaid data

## Testing Strategy

### Critical Paths to Test
1. Email arrives → Context created → Memory forms
2. Transaction without receipt → Basic memory after 1 hour
3. Ambiguous merchant → Hidden for 24 hours → Shows
4. Late receipt → Memory updates retroactively

### Test Data Seeds
```ruby
# db/seeds.rb
user = User.create!(email: "test@example.com", password: "password")
account = user.accounts.create!(/* plaid data */)

# Create mix of transactions
10.times do |i|
  Transaction.create!(
    account: account,
    plaid_transaction_id: "test_#{i}",
    merchant_name: ["PAYPAL *ETSY", "AMAZON", "BLUE BOTTLE"].sample,
    amount: rand(10..200),
    transaction_date: i.days.ago
  )
end

# Create some email contexts
EmailContext.create!(
  user: user,
  amount: 47.82,
  merchant: "Etsy",
  line_items: [{ name: "Vintage brass lamp", price: 47.82 }],
  order_date: 2.days.ago
)
```

## Launch Readiness Checklist

- [ ] Database migrations run successfully
- [ ] Email forwarding tested with real receipts
- [ ] Memory formation job runs every 15 minutes
- [ ] Ambiguous merchants hidden appropriately
- [ ] Memories display within 1 hour
- [ ] Manual test: PayPal → Email → Memory flow
- [ ] Production: LLM enhancement working
- [ ] Hotwire Native: Bridge components responding

## Success Metrics

### Week 1 Goals
- 50%+ transactions get memories (via email match)
- Memory formation < 2 hours for matched receipts
- Zero Plaid data corruption
- Users understand pending vs ready states

### Future Enhancements (Not Week 1)
- Photo receipt OCR
- Calendar event correlation
- SMS receipt parsing
- Location-based context
- Weather correlation
- Social expense detection

## Remember

This is a meditation on money, not a budgeting app. Every technical decision should enhance the feeling of recognition - that moment when "PAYPAL *ETSYSELLER" becomes "Vintage brass lamp" and the purchase transforms from transaction to memory.

The magic is in the accumulation of context, not forced matching. Let memories form naturally, like dust around stars becoming planets.