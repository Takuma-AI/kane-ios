# Memory Orbs - Phase 1: Base Case Implementation

## The Problem We're Solving

Raw transaction data from Plaid tells us WHERE money went but not WHAT happened. "PAYPAL *MERCHANT $47.82" is a database entry, not a memory. We're building a semantic layer that transforms transactions into memories - preserving the essential information while making it human-readable.

The key insight: Every transaction already contains the seeds of its own memory. We just need to reveal it. Not by guessing or assuming, but by cleaning up what's already there and enriching it with context when available.

## Why This Architecture

### Why Memories as a Separate Model (Not Just Enhanced Fields)

We're creating `Memory` as a distinct model rather than adding fields to `Transaction` because:
1. **Immutability**: Plaid data should never be modified - it's our source of truth
2. **Evolution**: Memories can evolve as context accumulates without touching original data
3. **Multiplicity**: Future possibility of one transaction → multiple memories (Amazon order with 3 distinct items)
4. **Confidence**: We can track how certain we are about our enhancements

### Why has_many (Not has_one)

While Phase 1 will only create one memory per transaction, we're using `has_many` because:
- Amazon splits shipments but charges once - future feature to split into multiple memories
- Group purchases might separate into individual expenses
- The architectural cost of has_many vs has_one is zero, but the migration cost later would be high

## Git Branch Strategy
```bash
git checkout -b feature/memory-base-case
```

## Part 1: Data Architecture & Background Infrastructure

### Database Schema
```ruby
# Migration 1: Create memories table
class CreateMemories < ActiveRecord::Migration[8.0]
  def change
    create_table :memories do |t|
      t.references :transaction, null: false, foreign_key: true
      t.text :description, null: false
      t.date :transaction_date, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.decimal :confidence, precision: 3, scale: 2, default: 0.3
      t.string :source, default: 'plaid' # 'plaid', 'email', 'enhanced'
      t.datetime :formed_at
      t.timestamps
      
      t.index :transaction_id
      t.index :formed_at
      t.index [:transaction_id, :created_at]
    end
  end
end
```

### Core Models
```ruby
# app/models/memory.rb
class Memory < ApplicationRecord
  belongs_to :transaction
  
  validates :description, presence: true
  validates :amount, presence: true
  validates :transaction_date, presence: true
  
  scope :high_confidence, -> { where('confidence > ?', 0.8) }
  scope :recent_first, -> { order(transaction_date: :desc) }
  
  def display_text
    description
  end
  
  def semantic_date
    # Use Rails' distance_of_time_in_words or a gem like 'human_time'
    case (Date.current - transaction_date).to_i
    when 0 then "today"
    when 1 then "yesterday"
    when 2..6 then "#{transaction_date.strftime('%A')}"
    else
      transaction_date.strftime('%B %-d')
    end
  end
end

# app/models/transaction.rb (enhanced)
class Transaction < ApplicationRecord
  belongs_to :account
  has_many :memories, dependent: :destroy  # NOT has_one - future flexibility
  
  enum :pile, { need: 0, want: 1, kill: 2 }
  
  validates :plaid_transaction_id, presence: true, uniqueness: true
  validates :merchant_name, presence: true
  validates :amount, presence: true
  validates :transaction_date, presence: true
  
  scope :unsorted, -> { where(pile: nil) }
  scope :sorted, -> { where.not(pile: nil) }
  scope :recent_first, -> { order(transaction_date: :desc) }
  scope :without_memory, -> { left_joins(:memories).where(memories: { id: nil }) }
  scope :with_memory, -> { joins(:memories).distinct }
  # No artificial delay - Plaid already delivers transactions hours/days after they occur
  scope :ready_for_memory, -> { without_memory }
  
  # For now, always return the first (and likely only) memory
  def current_memory
    memories.order(created_at: :desc).first
  end
  
  def display_text
    current_memory&.display_text || merchant_name
  end
  
  def semantic_date
    current_memory&.semantic_date || transaction_date.to_s
  end
end
```

## Part 2: Smart Transaction Syncing with Plaid

### Why Plaid Sync (Not Fetch All)

Fetching all recent transactions every 4 hours is wasteful and error-prone. Plaid's `/transactions/sync` endpoint:
- Returns only NEW and UPDATED transactions since last sync
- Handles removed transactions (refunds, corrections)
- Provides a cursor for reliable pagination
- Reduces API calls and processing overhead

This is the difference between "show me everything again" and "what's changed?" - the latter is always more elegant.

### The Hidden Advantage: Natural Processing Time

Real-world observation: Banks post transactions to Plaid with 10-12+ hour delays (sometimes days). This means:
- When we receive a transaction, the purchase already happened hours/days ago
- Email receipts have already been forwarded and processed
- We can create memories immediately - no artificial waiting needed
- The banking system's latency becomes our context accumulation window

This is serendipitous design - the system constraint (slow bank posting) solves our design challenge (needing time for context to gather).

### Sync Implementation
```ruby
# Migration: Add sync tracking
class AddPlaidSyncTracking < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :plaid_cursor, :string
    add_column :accounts, :last_synced_at, :datetime
    add_column :transactions, :plaid_sync_status, :string # 'added', 'modified', 'removed'
    add_index :accounts, :last_synced_at
  end
end

# app/services/plaid_sync_service.rb
class PlaidSyncService
  def initialize(account)
    @account = account
    @client = Plaid::Client.new(
      env: Rails.env.production? ? :production : :sandbox,
      client_id: Rails.application.credentials.plaid[:client_id],
      secret: Rails.application.credentials.plaid[:secret]
    )
  end
  
  def sync_transactions
    has_more = true
    cursor = @account.plaid_cursor
    all_added = []
    all_modified = []
    all_removed = []
    
    while has_more
      response = fetch_sync_data(cursor)
      
      all_added.concat(response.added)
      all_modified.concat(response.modified)
      all_removed.concat(response.removed)
      
      has_more = response.has_more
      cursor = response.next_cursor
    end
    
    # Process in transaction for data integrity
    ActiveRecord::Base.transaction do
      process_added_transactions(all_added)
      process_modified_transactions(all_modified)
      process_removed_transactions(all_removed)
      
      @account.update!(
        plaid_cursor: cursor,
        last_synced_at: Time.current
      )
    end
    
    { added: all_added.count, modified: all_modified.count, removed: all_removed.count }
  end
  
  private
  
  def fetch_sync_data(cursor)
    @client.transactions_sync(
      access_token: @account.plaid_access_token,
      cursor: cursor
    )
  rescue Plaid::ItemError => e
    handle_plaid_error(e)
  end
  
  def process_added_transactions(plaid_transactions)
    plaid_transactions.each do |plaid_txn|
      transaction = Transaction.find_or_initialize_by(
        plaid_transaction_id: plaid_txn.transaction_id
      )
      
      # Only create if truly new
      next if transaction.persisted?
      
      transaction.assign_attributes(
        account: @account,
        merchant_name: plaid_txn.merchant_name || plaid_txn.name,
        amount: plaid_txn.amount.abs,
        transaction_date: plaid_txn.date,
        location_data: extract_location(plaid_txn),
        plaid_sync_status: 'added'
      )
      
      transaction.save!
    end
  end
  
  def process_modified_transactions(plaid_transactions)
    plaid_transactions.each do |plaid_txn|
      transaction = Transaction.find_by(plaid_transaction_id: plaid_txn.transaction_id)
      next unless transaction
      
      # Update transaction but preserve memory relationship
      transaction.update!(
        merchant_name: plaid_txn.merchant_name || plaid_txn.name,
        amount: plaid_txn.amount.abs,
        transaction_date: plaid_txn.date,
        location_data: extract_location(plaid_txn),
        plaid_sync_status: 'modified'
      )
      
      # Queue memory regeneration if significant changes
      if transaction.memories.any?
        RegenerateMemoryJob.perform_later(transaction.current_memory)
      end
    end
  end
  
  def process_removed_transactions(removed_ids)
    # Soft delete - keep for history but mark as removed
    Transaction.where(plaid_transaction_id: removed_ids).update_all(
      plaid_sync_status: 'removed',
      pile: 'removed'  # Special pile for removed transactions
    )
  end
  
  def extract_location(plaid_txn)
    return {} unless plaid_txn.location
    
    {
      city: plaid_txn.location.city,
      region: plaid_txn.location.region,
      postal_code: plaid_txn.location.postal_code,
      country: plaid_txn.location.country,
      lat: plaid_txn.location.lat,
      lon: plaid_txn.location.lon,
      store_number: plaid_txn.location.store_number
    }.compact
  end
  
  def handle_plaid_error(error)
    case error.error_code
    when 'ITEM_LOGIN_REQUIRED'
      # User needs to re-authenticate
      @account.update!(requires_reauth: true)
      UserMailer.plaid_reauth_required(@account.user).deliver_later
    else
      raise error
    end
  end
end
```

## Part 3: Background Jobs with Solid Queue

### Setup Solid Queue
```ruby
# Gemfile
gem "solid_queue"
gem "openai-ruby" # For GPT-5-mini integration

# config/application.rb
config.active_job.queue_adapter = :solid_queue

# config/solid_queue.yml
default: &default
  dispatchers:
    - polling_interval: 1
      batch_size: 500
  workers:
    - queues: "*"
      threads: 3
      processes: 1

development:
  <<: *default

production:
  <<: *default
  workers:
    - queues: [critical, default]
      threads: 5
      processes: 2
    - queues: [memories, low]
      threads: 3
      processes: 1
```

### Recurring Jobs Configuration
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

development:
  fetch_transactions:
    class: FetchTransactionsJob
    queue: critical
    schedule: every 30 minutes
  
  form_memories:
    class: FormMemoriesJob
    queue: memories
    schedule: every 5 minutes
```

### Background Jobs
```ruby
# app/jobs/sync_transactions_job.rb
class SyncTransactionsJob < ApplicationJob
  queue_as :critical
  
  def perform
    Account.where.not(plaid_access_token: nil).find_each do |account|
      next if account.requires_reauth?
      
      begin
        sync_result = PlaidSyncService.new(account).sync_transactions
        
        Rails.logger.info "Synced account #{account.id}: #{sync_result}"
        
        # Only queue memory formation if we got new transactions
        if sync_result[:added] > 0
          FormMemoriesJob.perform_later
        end
      rescue => e
        Rails.logger.error "Sync failed for account #{account.id}: #{e}"
        Sentry.capture_exception(e) if defined?(Sentry)
      end
    end
  end
end

# app/jobs/form_memories_job.rb
class FormMemoriesJob < ApplicationJob
  queue_as :memories
  
  def perform
    Transaction.ready_for_memory.find_each do |transaction|
      next if transaction.memories.any? # Skip if already has memory
      
      MemoryFormationService.new(transaction).create_memory
    end
  end
end
```

## Part 4: Memory Formation Service with AI

### Why AI Here (And Why It's Optional)

The AI isn't making things up - it's cleaning up what's already there. "STARBUCKS STORE #1234" becomes "Starbucks coffee". The merchant is preserved, just made readable. 

We use AI as an enhancement, not a requirement. If OpenAI is down, we still create memories with basic string cleaning. The system degrades gracefully - better to have "STARBUCKS #1234" than nothing.

### AI-Enhanced Memory Service
```ruby
# app/services/memory_formation_service.rb
class MemoryFormationService
  def initialize(transaction)
    @transaction = transaction
  end
  
  def create_memory
    memory = @transaction.memories.build(
      amount: @transaction.amount,
      transaction_date: @transaction.transaction_date,
      formed_at: Time.current
    )
    
    # Try AI enhancement, fallback to basic
    enhanced = enhance_with_ai
    
    if enhanced[:success]
      memory.description = enhanced[:description]
      memory.confidence = enhanced[:confidence]
      memory.source = 'enhanced'
    else
      memory.description = basic_enhancement
      memory.confidence = 0.3
      memory.source = 'plaid'
    end
    
    memory.save!
    memory
  end
  
  private
  
  def enhance_with_ai
    return { success: false } unless Rails.env.production? || Rails.env.development?
    
    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai_api_key)
    
    prompt = build_prompt
    
    response = client.chat(
      parameters: {
        model: "gpt-5-mini",
        messages: [
          {
            role: "system",
            content: system_prompt
          },
          {
            role: "user",
            content: prompt
          }
        ],
        max_tokens: 30,
        temperature: 0.3
      }
    )
    
    description = response.dig("choices", 0, "message", "content").strip
    
    {
      success: true,
      description: description,
      confidence: calculate_confidence(description)
    }
  rescue => e
    Rails.logger.error "AI enhancement failed: #{e}"
    { success: false }
  end
  
  def system_prompt
    <<~PROMPT
      You transform transaction data into clearer memories. Keep the merchant identity clear while making it more human-readable.
      
      Guidelines:
      - Be concise (3-8 words max)
      - ALWAYS preserve the merchant name or recognizable shorthand
      - Remove corporate suffixes (LLC, INC, STORE #1234)
      - Don't make assumptions about what was purchased unless obvious
      - Don't assume patterns (no "ritual", "usual", "regular")
      - Add neighborhood/location ONLY for local, non-chain businesses
      - Keep brand names intact (Uber, Amazon, Target, etc.)
      
      Examples:
      "BLUE BOTTLE COFFEE #456" → "Blue Bottle coffee"
      "AMAZON.COM*M12CD5" → "Amazon order"
      "UBER *TRIP" → "Uber ride"
      "TARGET STORE #1234" → "Target purchase"
      "PEQUOD'S PIZZA" in Chicago → "Pequod's Pizza in Chicago"
      "LOCAL BOOKSTORE" in Pilsen → "Bookstore in Pilsen"
      "STARBUCKS STORE #789" → "Starbucks coffee"
      "PAYPAL *MERCHANT" → "PayPal payment"
    PROMPT
  end
  
  def build_prompt
    location = @transaction.location_data
    
    parts = [
      "Merchant: #{@transaction.merchant_name}",
      "Amount: $#{@transaction.amount}",
      "Date: #{@transaction.transaction_date.strftime('%A, %B %d')}",
    ]
    
    # Include full location context for AI to decide what's relevant
    if location.present?
      location_parts = []
      location_parts << location[:city] if location[:city]
      location_parts << location[:region] if location[:region]
      location_parts << "#{location[:postal_code]}" if location[:postal_code]
      
      # If we have coordinates, we could later reverse geocode to neighborhood
      if location[:lat] && location[:lon]
        location_parts << "[#{location[:lat]}, #{location[:lon]}]"
      end
      
      parts << "Location: #{location_parts.join(', ')}" unless location_parts.empty?
    end
    
    parts.join("\n")
  end
  
  def calculate_confidence(description)
    # Higher confidence if description differs significantly from merchant name
    return 0.7 if description.downcase != @transaction.merchant_name.downcase
    0.4
  end
  
  def basic_enhancement
    # Fallback when AI is unavailable
    merchant = @transaction.merchant_name
    
    # Clean up merchant name but preserve identity
    cleaned = merchant.gsub(/\*.*$/, '')  # Remove * suffixes
                     .gsub(/\s+#\d+/, '')  # Remove store numbers
                     .gsub(/\s+(LLC|INC|CORP)$/i, '')  # Remove corporate suffixes
                     .strip
    
    # Simple cleanup for known patterns
    case cleaned.downcase
    when /^paypal/
      "PayPal payment"
    when /^uber/
      "Uber ride"
    when /^lyft/
      "Lyft ride"
    when /^amazon/
      "Amazon order"
    when /^target/
      "Target purchase"
    when /^starbucks/
      "Starbucks coffee"
    else
      cleaned
    end
  end
end
```

### Add location_data to transactions
```ruby
# Migration to add location data
class AddLocationDataToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :transactions, :location_data, :jsonb, default: {}
    add_index :transactions, :location_data, using: :gin
  end
end
```

## Part 5: UI Updates - Only Show What Has Meaning

### The Key Decision: Process Immediately, Show When Ready

Based on real-world observation: **transactions already arrive 10-12+ hours late from banks via Plaid**. By the time we see them:
- The purchase happened yesterday or days ago
- Email receipts have already arrived
- The transaction has settled at the bank

This natural latency is our friend. We can:
1. **Process immediately** when transactions arrive (no artificial delay)
2. **Create memories instantly** (they're already "aged" by the banking system)
3. **Show immediately** because context has had time to accumulate

The banking system's delay is doing the work we thought we needed to engineer. Users won't see "raw" transactions because by the time Plaid delivers them, we can process them instantly into memories.

### Controllers
```ruby
# app/controllers/transactions_controller.rb
class TransactionsController < ApplicationController
  def index
    # Only show transactions that have memories
    @transactions = current_user.transactions
                               .with_memory
                               .includes(:memories)
                               .unsorted
                               .recent_first
    
    @next_to_sort = @transactions.first
    
    if @next_to_sort.nil?
      redirect_to complete_path
    end
  end
  
  def update
    @transaction = current_user.transactions.find(params[:id])
    @transaction.sort_to_pile!(params[:pile])
    
    respond_to do |format|
      format.html { redirect_to transactions_path }
      format.turbo_stream {
        @next_transaction = current_user.transactions
                                       .with_memory
                                       .unsorted
                                       .first
        
        render turbo_stream: [
          turbo_stream.remove(@transaction),
          turbo_stream.update("next-transaction", 
            partial: "transactions/card", 
            locals: { transaction: @next_transaction })
        ]
      }
    end
  end
end
```

### Views
```erb
<!-- app/views/transactions/index.html.erb -->
<% content_for :title, "Sort Transactions" %>

<div class="sorting-interface">
  <% if @next_to_sort %>
    <div id="next-transaction" class="transaction-card">
      <%= render "transactions/card", transaction: @next_to_sort %>
    </div>
    
    <div class="sorting-buttons">
      <%= button_to "Need", transaction_path(@next_to_sort),
          method: :patch,
          params: { pile: :need },
          class: "btn-need",
          data: { turbo_stream: true } %>
          
      <%= button_to "Want", transaction_path(@next_to_sort),
          method: :patch,
          params: { pile: :want },
          class: "btn-want",
          data: { turbo_stream: true } %>
          
      <%= button_to "Kill", transaction_path(@next_to_sort),
          method: :patch,
          params: { pile: :kill },
          class: "btn-kill",
          data: { turbo_stream: true } %>
    </div>
  <% else %>
    <p class="complete-message">Nothing new for you.</p>
  <% end %>
</div>

<!-- app/views/transactions/_card.html.erb -->
<div class="transaction-content">
  <h3 class="transaction-description">
    <%= transaction.display_text %>
  </h3>
  
  <div class="transaction-meta">
    <span class="amount">$<%= transaction.amount %></span>
    <span class="date"><%= transaction.semantic_date %></span>
  </div>
  
  <% if transaction.current_memory&.confidence&.< 0.5 %>
    <p class="original-merchant"><%= transaction.merchant_name %></p>
  <% end %>
</div>
```

## Part 6: Production Migration Strategy

### The Challenge

We have existing users with existing transactions. We can't just flip a switch and hide everything until memories form. The migration needs to be invisible to users while transforming the entire data model underneath.

### Migration Plan for Existing Data

```ruby
# lib/tasks/memory_migration.rake
namespace :memories do
  desc "Create memories for all existing transactions"
  task migrate_existing: :environment do
    puts "Starting memory migration for existing transactions..."
    
    batch_size = 100
    total = Transaction.count
    processed = 0
    
    Transaction.find_in_batches(batch_size: batch_size) do |batch|
      batch.each do |transaction|
        next if transaction.memories.any?
        
        begin
          # Create basic memory without AI to avoid costs
          transaction.memories.create!(
            description: transaction.merchant_name,
            amount: transaction.amount,
            transaction_date: transaction.transaction_date,
            confidence: 0.2,
            source: 'migration',
            formed_at: Time.current
          )
          
          processed += 1
        rescue => e
          puts "Failed to create memory for transaction #{transaction.id}: #{e}"
        end
      end
      
      puts "Processed #{processed}/#{total} transactions..."
    end
    
    puts "Migration complete! Created memories for #{processed} transactions."
    
    # Queue job to enhance memories gradually
    puts "Queueing enhancement job..."
    EnhanceExistingMemoriesJob.perform_later
  end
end

# app/jobs/enhance_existing_memories_job.rb
class EnhanceExistingMemoriesJob < ApplicationJob
  queue_as :low
  
  def perform
    # Enhance memories in small batches to control API costs
    Memory.where(source: 'migration')
          .where('confidence < ?', 0.5)
          .limit(50)
          .each do |memory|
      
      service = MemoryFormationService.new(memory.transaction)
      enhanced = service.send(:enhance_with_ai)
      
      if enhanced[:success]
        memory.update!(
          description: enhanced[:description],
          confidence: enhanced[:confidence],
          source: 'enhanced'
        )
      end
      
      sleep 0.1 # Rate limiting
    end
    
    # Re-queue if more memories need enhancement
    if Memory.where(source: 'migration').exists?
      self.class.perform_later
    end
  end
end
```

### Deployment Steps

```markdown
## Deployment Checklist

### Pre-deployment
1. [ ] Create feature branch: `git checkout -b feature/memory-base-case`
2. [ ] Run migrations locally and test
3. [ ] Verify Solid Queue setup
4. [ ] Add OpenAI API key to credentials

### Deployment Steps
1. [ ] Deploy code without running migrations
2. [ ] Run migration to create memories table
3. [ ] Run migration to add location_data to transactions
4. [ ] Run `rails memories:migrate_existing` to create basic memories
5. [ ] Start Solid Queue workers
6. [ ] Monitor FormMemoriesJob execution
7. [ ] Verify UI shows memories correctly

### Rollback Plan
1. [ ] Disable Solid Queue workers
2. [ ] Deploy previous version
3. [ ] Memories table can stay - won't affect old code
4. [ ] Re-enable when ready to retry

### Monitoring
- [ ] Check Solid Queue dashboard
- [ ] Monitor OpenAI API usage
- [ ] Track memory creation rate
- [ ] Watch for errors in logs
```

## Testing Strategy

```ruby
# test/services/memory_formation_service_test.rb
class MemoryFormationServiceTest < ActiveSupport::TestCase
  setup do
    @transaction = transactions(:coffee_purchase)
  end
  
  test "creates memory with basic enhancement when AI unavailable" do
    service = MemoryFormationService.new(@transaction)
    memory = service.create_memory
    
    assert memory.persisted?
    assert_equal @transaction.amount, memory.amount
    assert memory.description.present?
  end
  
  test "handles merchant name patterns" do
    @transaction.update!(merchant_name: "STARBUCKS STORE #1234")
    service = MemoryFormationService.new(@transaction)
    memory = service.create_memory
    
    assert_includes ["Coffee stop", "Morning coffee"], memory.description
  end
end

# test/models/memory_test.rb
class MemoryTest < ActiveSupport::TestCase
  test "semantic date for today" do
    memory = memories(:todays_purchase)
    assert_equal "today", memory.semantic_date
  end
  
  test "semantic date for yesterday" do
    memory = memories(:yesterdays_purchase)
    travel_to Date.current + 1.day do
      assert_equal "yesterday", memory.semantic_date
    end
  end
  
  test "semantic date for this week" do
    memory = memories(:monday_purchase)
    travel_to memory.transaction_date + 3.days do
      assert_equal memory.transaction_date.strftime('%A'), memory.semantic_date
    end
  end
end
```

## Future Enhancements (Not This Week)

- Email context ingestion via Action Mailbox
- Context pools from multiple sources
- Confidence scoring improvements
- Memory splitting for multi-item purchases
- Photo receipt OCR
- Calendar integration

## Success Metrics

### Week 1 Goals
- [ ] All transactions get memories within 1 hour
- [ ] 50%+ memories enhanced beyond merchant name
- [ ] Semantic dates display correctly
- [ ] Background jobs run reliably
- [ ] No degradation in sorting UX

### Technical Health
- [ ] API costs under $10/day
- [ ] Memory formation < 5 seconds per transaction
- [ ] Zero data corruption
- [ ] Graceful AI fallbacks

## Critical Analysis: Is This the Right Solution?

### What's Elegant About This Approach

1. **Immutability**: Original data never changes - we only add layers
2. **Graceful Degradation**: Works without AI, works without email context, always works
3. **Progressive Enhancement**: Start simple, get smarter over time
4. **User Trust**: They see consistent, enhanced data or nothing - no jarring transitions

### What Could Be Simpler

**Alternative considered**: Just clean merchant names in the view layer with a helper. Why we didn't:
- No confidence tracking
- No evolution over time  
- No foundation for context enrichment
- Mixing presentation with data concerns

**Alternative considered**: One mega-prompt to OpenAI with all context. Why we didn't:
- Single point of failure
- Expensive and slow
- Can't improve incrementally
- No fallback options

### What We're Not Thinking About (Potential Issues)

1. ~~**The 1-hour delay**: New transactions won't appear immediately.~~
   - **Resolved**: Plaid already delivers transactions 10-12+ hours late
   - **New approach**: Process immediately since they're already "aged"
   - **Benefit**: By the time we see them, email receipts have arrived

2. **Memory regeneration**: When Plaid updates a transaction, should we rebuild the memory?
   - **Current approach**: Queue for regeneration
   - **Risk**: Losing user edits (future feature)

3. **Cost scaling**: Every transaction hits OpenAI API
   - **Mitigation**: Caching common merchants
   - **Future**: Build our own merchant cleaning dataset

4. **International transactions**: Currency, language, merchant names
   - **Not addressed yet**: Assuming USD and English
   - **Future need**: Multi-currency support

### Why This Architecture Fits Like a Glove

The problem is semantic enhancement without losing truth. This solution:
- Never destroys data (transactions immutable)
- Always progresses forward (memories only get better)
- Fails gracefully (basic cleaning when AI fails)
- Scales naturally (more context = better memories)

It's not the simplest possible solution, but it's the simplest solution that preserves optionality for the future while shipping value today.

## Remember

This is the foundation. We're building the rails (pun intended) that Memory Orbs will run on. Every transaction becomes a memory, even if it's just a slightly better merchant name. The magic comes from accumulation over time.

The elegance isn't in complexity - it's in having exactly the right structure for the problem. Like a well-designed database schema, if it feels right on day one, it'll still feel right on day 1000.