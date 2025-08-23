# Memory Orbs - System Design Document

## Overview

Memory Orbs transforms cryptic bank transactions into meaningful memories by building a rich context layer from multiple data sources. The system uses a three-layer architecture that preserves transaction integrity while progressively enhancing them with contextual intelligence.

## Core Architecture

### Three-Layer Data Model

```
┌─────────────────────────────────────────────────────────┐
│                    USER INTERFACE                       │
│                 Memories (What Users See)               │
└─────────────────────────────────────────────────────────┘
                            ↑
                    Context Seeking
                            ↑
┌─────────────────────────────────────────────────────────┐
│               INTELLIGENCE LAYER                         │
│          Context Pool (Multi-Source Intelligence)        │
│  Email │ Calendar │ Messages │ Photos │ Location │ ...  │
└─────────────────────────────────────────────────────────┘
                            ↑
                    Source of Truth
                            ↑
┌─────────────────────────────────────────────────────────┐
│                    DATA LAYER                           │
│            Plaid Transactions (Immutable)               │
└─────────────────────────────────────────────────────────┘
```

### Key Principles

1. **Transactions are immutable** - Never modify Plaid data
2. **Context accumulates** - Multiple sources build understanding
3. **Memories form after one hour** - Allows context to settle
4. **Progressive enhancement** - Start basic, improve over time
5. **User corrections teach** - System learns from feedback

## Database Schema

### Core Tables

```ruby
# Immutable transaction data from Plaid
create_table :plaid_transactions do |t|
  t.references :account, null: false
  t.string :plaid_transaction_id, null: false, index: { unique: true }
  t.string :merchant_name
  t.decimal :amount, precision: 10, scale: 2
  t.date :transaction_date
  t.string :category_primary
  t.string :category_detailed
  t.boolean :pending, default: false
  t.json :raw_data  # Full Plaid response
  t.timestamps
  
  t.index [:account_id, :transaction_date]
  t.index [:merchant_name, :amount]
end

# User-facing enriched memories
create_table :memories do |t|
  t.references :plaid_transaction, null: false, index: { unique: true }
  
  # Original data (for reference)
  t.string :original_merchant
  t.decimal :original_amount, precision: 10, scale: 2
  t.date :transaction_date
  
  # Enhanced data
  t.string :description        # Auto-generated or user-provided
  t.string :user_description   # User override
  t.decimal :confidence_level, default: 0.0
  t.boolean :auto_generated, default: true
  t.boolean :user_modified, default: false
  
  # Context tracking
  t.integer :context_count, default: 0
  t.datetime :formed_at        # When memory was created
  t.datetime :last_enhanced_at # Last context improvement
  
  # User organization
  t.integer :pile  # need/want/kill
  t.datetime :sorted_at
  t.string :tags, array: true, default: []
  t.text :notes
  
  t.timestamps
  
  t.index :confidence_level
  t.index :formed_at
  t.index [:pile, :transaction_date]
end

# Polymorphic context from any source
create_table :contexts do |t|
  t.references :user, null: false
  t.references :source, polymorphic: true  # EmailContext, CalendarContext, etc.
  
  # Core matching fields (optimized for queries)
  t.string :merchant, index: true
  t.decimal :amount, precision: 10, scale: 2, index: true
  t.daterange :date_range  # PostgreSQL range type
  t.string :payment_method
  
  # Rich context data
  t.jsonb :items       # Line items, products, etc.
  t.jsonb :metadata    # Source-specific data
  t.string :participants, array: true
  t.string :location
  t.string :event_type
  
  # Quality and usage
  t.decimal :confidence, default: 0.5
  t.integer :usage_count, default: 0
  t.boolean :user_verified, default: false
  t.datetime :last_used_at
  t.datetime :expires_at
  
  t.timestamps
  
  t.index :date_range, using: :gist
  t.index :items, using: :gin
  t.index [:merchant, :amount]
  t.index [:user_id, :usage_count]
end

# Links memories to contexts used
create_table :memory_contexts do |t|
  t.references :memory, null: false
  t.references :context, null: false
  t.decimal :relevance_score
  t.boolean :primary, default: false
  t.datetime :used_at
  
  t.index [:memory_id, :context_id], unique: true
  t.index [:context_id, :used_at]
end
```

### Context Source Tables

```ruby
# Email receipts and order confirmations
create_table :email_contexts do |t|
  t.references :user
  t.string :from_address
  t.string :subject
  t.string :order_number
  t.decimal :order_total, precision: 10, scale: 2
  t.date :order_date
  t.jsonb :line_items  # [{name, price, quantity}, ...]
  t.text :raw_content
  t.timestamps
end

# Calendar events
create_table :calendar_contexts do |t|
  t.references :user
  t.string :event_title
  t.datetime :event_time
  t.string :venue
  t.string :attendees, array: true
  t.string :event_type  # dinner, meeting, travel, etc.
  t.timestamps
end

# SMS/iMessage receipts and money discussions
create_table :message_contexts do |t|
  t.references :user
  t.string :sender
  t.text :content
  t.decimal :mentioned_amount, precision: 10, scale: 2
  t.datetime :message_time
  t.string :thread_id
  t.timestamps
end

# Photo receipts and location data
create_table :photo_contexts do |t|
  t.references :user
  t.string :photo_id
  t.datetime :taken_at
  t.point :location  # PostgreSQL point type
  t.string :detected_text  # OCR results
  t.string :detected_merchant
  t.decimal :detected_amount, precision: 10, scale: 2
  t.timestamps
end
```

## Models

### Transaction Model

```ruby
class PlaidTransaction < ApplicationRecord
  belongs_to :account
  has_one :memory, dependent: :destroy
  
  # Never modify Plaid data directly
  attr_readonly :plaid_transaction_id, :amount, :merchant_name, :transaction_date
  
  scope :without_memory, -> { left_joins(:memory).where(memories: { id: nil }) }
  scope :ready_for_memory, -> { without_memory.where('created_at < ?', 1.hour.ago) }
  scope :pending, -> { where(pending: true) }
  
  def seek_context
    ContextSeeker.new(self).find_relevant_contexts
  end
  
  def ready_for_memory_formation?
    !pending && memory.nil? && created_at < 1.hour.ago
  end
end
```

### Memory Model

```ruby
class Memory < ApplicationRecord
  belongs_to :plaid_transaction
  has_many :memory_contexts, dependent: :destroy
  has_many :contexts, through: :memory_contexts
  
  scope :high_confidence, -> { where('confidence_level > ?', 0.8) }
  scope :needs_review, -> { where('confidence_level < ?', 0.5) }
  scope :auto_generated, -> { where(auto_generated: true) }
  scope :user_modified, -> { where(user_modified: true) }
  
  # What users see
  def display_description
    user_description || description || plaid_transaction.merchant_name
  end
  
  def context_suggestions
    contexts.order('memory_contexts.relevance_score DESC').limit(3)
  end
  
  def apply_context(context)
    memory_contexts.update_all(primary: false)
    memory_contexts.find_or_create_by(context: context).update!(primary: true)
    
    self.description = MemoryNarrator.new([context]).generate
    self.confidence_level = context.confidence
    save!
    
    context.increment!(:usage_count)
    ContextLearner.learn_from_confirmation(self, context)
  end
  
  def check_for_late_context
    return if user_modified?
    return if formed_at < 7.days.ago
    
    new_contexts = plaid_transaction.seek_context
      .reject { |c| context_ids.include?(c.id) }
    
    if new_contexts.any? && new_contexts.first.confidence > confidence_level
      enhance_with_context(new_contexts.first)
    end
  end
end
```

### Context Model

```ruby
class Context < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true
  has_many :memory_contexts
  has_many :memories, through: :memory_contexts
  
  scope :unused, -> { where(usage_count: 0) }
  scope :fresh, -> { where('created_at > ?', 30.days.ago) }
  scope :expired, -> { where('expires_at < ?', Time.current) }
  scope :relevant_to, ->(txn) {
    where(merchant: txn.merchant_name)
      .where('date_range @> ?::date', txn.transaction_date)
  }
  
  def mark_used_by(memory)
    increment!(:usage_count)
    update!(last_used_at: Time.current)
  end
  
  def confidence_for(transaction)
    score = confidence
    
    # Exact amount match boosts confidence
    score *= 1.5 if (amount - transaction.amount).abs < 0.01
    
    # Date proximity affects confidence
    days_apart = (transaction.transaction_date - date_range.first).abs
    score *= (1.0 - (days_apart * 0.1))
    
    # Usage history affects confidence
    score *= 0.9 ** usage_count
    
    [score, 1.0].min
  end
end
```

## Services

### Memory Formation Service

```ruby
class MemoryFormationService
  def self.form_memories
    PlaidTransaction.ready_for_memory.find_each do |transaction|
      new(transaction).form_memory
    end
  end
  
  def initialize(transaction)
    @transaction = transaction
  end
  
  def form_memory
    contexts = gather_contexts
    
    memory = Memory.create!(
      plaid_transaction: @transaction,
      original_merchant: @transaction.merchant_name,
      original_amount: @transaction.amount,
      transaction_date: @transaction.transaction_date,
      
      description: generate_description(contexts),
      confidence_level: calculate_confidence(contexts),
      auto_generated: true,
      context_count: contexts.size,
      formed_at: Time.current
    )
    
    # Link contexts
    contexts.each_with_index do |context, index|
      MemoryContext.create!(
        memory: memory,
        context: context,
        relevance_score: context.confidence_for(@transaction),
        primary: index == 0,
        used_at: Time.current
      )
      context.mark_used_by(memory)
    end
    
    # Notify if low confidence
    MemoryNotificationJob.perform_later(memory) if memory.confidence_level < 0.5
    
    memory
  end
  
  private
  
  def gather_contexts
    seeker = ContextSeeker.new(@transaction)
    
    # Look in multiple time windows
    contexts = []
    
    # Pre-existing contexts (orders placed before charge)
    contexts += seeker.find_pre_existing_contexts
    
    # Same-day contexts (receipts after charge)
    contexts += seeker.find_same_day_contexts
    
    # Near-future contexts (delayed receipts)
    contexts += seeker.find_near_future_contexts
    
    # Rank and return top matches
    seeker.rank_contexts(contexts).take(5)
  end
  
  def generate_description(contexts)
    return nil if contexts.empty?
    MemoryNarrator.new(contexts).generate
  end
  
  def calculate_confidence(contexts)
    return 0.0 if contexts.empty?
    contexts.first.confidence_for(@transaction)
  end
end
```

### Context Seeker Service

```ruby
class ContextSeeker
  def initialize(transaction)
    @txn = transaction
  end
  
  def find_relevant_contexts
    contexts = []
    
    # Level 1: Exact matches
    contexts += find_exact_matches
    
    # Level 2: Individual item matches
    contexts += find_item_matches
    
    # Level 3: Combination matches
    contexts += find_combination_matches
    
    # Level 4: Fuzzy matches
    contexts += find_fuzzy_matches
    
    rank_contexts(contexts)
  end
  
  def rank_contexts(contexts)
    contexts.map do |context|
      score = 100.0
      
      # Amount matching
      amount_diff = (@txn.amount - context.amount).abs
      score -= amount_diff * 10 if context.amount
      
      # Merchant similarity
      if context.merchant && @txn.merchant_name
        similarity = merchant_similarity(context.merchant, @txn.merchant_name)
        score += similarity * 50
      end
      
      # Date proximity
      if context.date_range
        days_apart = (@txn.transaction_date - context.date_range.first).abs
        score -= days_apart * 5
      end
      
      # Source credibility
      score += source_credibility_score(context)
      
      # Usage history
      score -= context.usage_count * 10
      score += 30 if context.user_verified?
      
      # Freshness
      age_days = (Time.current - context.created_at) / 1.day
      score -= age_days * 2
      
      context.confidence = [score / 200.0, 1.0].min
      context
    end.sort_by(&:confidence).reverse
  end
  
  private
  
  def source_credibility_score(context)
    case context.source_type
    when "EmailContext" then 40      # Actual receipts
    when "PhotoContext" then 35      # OCR'd receipts
    when "CalendarContext" then 20   # Planned events
    when "MessageContext" then 15    # Informal mentions
    else 0
    end
  end
  
  def merchant_similarity(merchant1, merchant2)
    # Simple string similarity (could use Levenshtein distance)
    m1 = merchant1.downcase.gsub(/[^a-z0-9]/, '')
    m2 = merchant2.downcase.gsub(/[^a-z0-9]/, '')
    
    return 1.0 if m1 == m2
    return 0.8 if m1.include?(m2) || m2.include?(m1)
    return 0.5 if m1[0..2] == m2[0..2]
    0.0
  end
  
  def find_exact_matches
    Context.where(user: @txn.account.user)
           .where(amount: @txn.amount)
           .relevant_to(@txn)
           .fresh
  end
  
  def find_item_matches
    Context.where(user: @txn.account.user)
           .where("items @> ?", [{price: @txn.amount}].to_json)
           .relevant_to(@txn)
           .fresh
  end
  
  def find_combination_matches
    # Look for contexts where items sum to transaction amount
    Context.where(user: @txn.account.user)
           .relevant_to(@txn)
           .fresh
           .select do |context|
             next false unless context.items.present?
             
             combinations = context.items.combination(2).to_a +
                          context.items.combination(3).to_a
             
             combinations.any? do |combo|
               sum = combo.sum { |item| item['price'].to_f }
               (sum - @txn.amount).abs < 2.0
             end
           end
  end
  
  def find_fuzzy_matches
    # Tax-adjusted matches, nearby amounts
    Context.where(user: @txn.account.user)
           .where("ABS(amount - ?) < ?", @txn.amount, 5.0)
           .relevant_to(@txn)
           .fresh
  end
end
```

### Context Builder Services

```ruby
# Base class for context builders
class ContextBuilder
  def self.build_from(source)
    new(source).build
  end
  
  def initialize(source)
    @source = source
  end
  
  protected
  
  def create_context(attributes)
    Context.create!(
      source: @source,
      user: @source.user,
      confidence: calculate_initial_confidence,
      expires_at: 30.days.from_now,
      **attributes
    )
  end
end

# Email context builder
class EmailContextBuilder < ContextBuilder
  def build
    return unless valid_receipt?
    
    create_context(
      merchant: extract_merchant,
      amount: extract_total,
      items: extract_line_items,
      payment_method: extract_payment_method,
      date_range: order_date..(order_date + 7.days),
      metadata: {
        order_number: @source.order_number,
        from: @source.from_address,
        subject: @source.subject
      }
    )
  end
  
  private
  
  def valid_receipt?
    @source.order_total.present? || @source.line_items.present?
  end
  
  def extract_merchant
    # Parse from email or use sender domain
    @source.from_address.split('@').last.split('.').first.capitalize
  end
  
  def extract_line_items
    @source.line_items.map do |item|
      {
        name: item['name'],
        price: item['price'].to_f,
        quantity: item['quantity'] || 1
      }
    end
  end
  
  def calculate_initial_confidence
    confidence = 0.5
    confidence += 0.2 if @source.order_number.present?
    confidence += 0.1 if @source.line_items.any?
    confidence += 0.1 if @source.order_total.present?
    confidence
  end
end

# Calendar context builder
class CalendarContextBuilder < ContextBuilder
  def build
    return unless relevant_event?
    
    create_context(
      merchant: extract_venue,
      participants: @source.attendees,
      event_type: categorize_event,
      date_range: event_window,
      location: @source.venue,
      metadata: {
        event_title: @source.event_title,
        calendar_id: @source.calendar_id
      }
    )
  end
  
  private
  
  def relevant_event?
    # Only build context for events that might have transactions
    @source.venue.present? || 
    @source.event_title.match?(/dinner|lunch|coffee|shopping|travel/i)
  end
  
  def extract_venue
    # "Dinner at Nobu" -> "Nobu"
    if match = @source.event_title.match(/at\s+([^,]+)/i)
      match[1].strip
    else
      @source.venue
    end
  end
  
  def categorize_event
    case @source.event_title.downcase
    when /dinner/ then 'dinner'
    when /lunch/ then 'lunch'
    when /coffee/ then 'coffee'
    when /flight|travel/ then 'travel'
    else 'event'
    end
  end
  
  def event_window
    # Transactions typically happen during or shortly after events
    start_time = @source.event_time
    end_time = @source.event_time + 4.hours
    start_time.to_date..end_time.to_date
  end
end
```

## Background Jobs

### Scheduled Jobs

```ruby
# app/jobs/memory_formation_job.rb
class MemoryFormationJob < ApplicationJob
  queue_as :memories
  
  # Runs every 5 minutes
  def perform
    MemoryFormationService.form_memories
  end
end

# app/jobs/late_context_enhancement_job.rb
class LateContextEnhancementJob < ApplicationJob
  queue_as :low_priority
  
  # Runs every hour
  def perform
    Memory.where('formed_at > ?', 7.days.ago)
          .where(user_modified: false)
          .find_each(&:check_for_late_context)
  end
end

# app/jobs/context_expiration_job.rb
class ContextExpirationJob < ApplicationJob
  queue_as :maintenance
  
  # Runs daily
  def perform
    Context.expired.destroy_all
    
    # Also clean up unused old contexts
    Context.where('created_at < ?', 60.days.ago)
           .where(usage_count: 0)
           .destroy_all
  end
end

# app/jobs/fetch_plaid_transactions_job.rb
class FetchPlaidTransactionsJob < ApplicationJob
  queue_as :critical
  
  # Runs every 4 hours or on webhook
  def perform(account = nil)
    accounts = account ? [account] : Account.active
    
    accounts.each do |acc|
      transactions = PlaidService.fetch_recent_transactions(acc)
      
      transactions.each do |plaid_txn|
        PlaidTransaction.find_or_create_by(
          plaid_transaction_id: plaid_txn['transaction_id']
        ) do |t|
          t.account = acc
          t.merchant_name = plaid_txn['merchant_name'] || plaid_txn['name']
          t.amount = plaid_txn['amount']
          t.transaction_date = plaid_txn['date']
          t.pending = plaid_txn['pending']
          t.raw_data = plaid_txn
        end
      end
    end
  end
end
```

### Event-Driven Jobs

```ruby
# Triggered by email arrival (Action Mailbox)
class ProcessEmailReceiptJob < ApplicationJob
  queue_as :contexts
  
  def perform(inbound_email)
    return unless receipt_email?(inbound_email)
    
    email_context = EmailContext.create!(
      user: identify_user(inbound_email),
      from_address: inbound_email.from,
      subject: inbound_email.subject,
      order_number: extract_order_number(inbound_email),
      order_total: extract_total(inbound_email),
      line_items: extract_line_items(inbound_email),
      order_date: extract_order_date(inbound_email),
      raw_content: inbound_email.raw
    )
    
    EmailContextBuilder.build_from(email_context)
  end
end

# Triggered by calendar sync
class ProcessCalendarEventJob < ApplicationJob
  queue_as :contexts
  
  def perform(calendar_event)
    calendar_context = CalendarContext.create!(
      user: calendar_event.user,
      event_title: calendar_event.title,
      event_time: calendar_event.start_time,
      venue: calendar_event.location,
      attendees: calendar_event.attendees.map(&:name)
    )
    
    CalendarContextBuilder.build_from(calendar_context)
  end
end
```

## API Endpoints

### Memories API

```ruby
class Api::MemoriesController < ApplicationController
  def index
    memories = current_user.memories
                          .includes(:plaid_transaction, :contexts)
                          .order(transaction_date: :desc)
                          .page(params[:page])
    
    render json: memories, include: [:contexts]
  end
  
  def update
    memory = current_user.memories.find(params[:id])
    
    if params[:context_id]
      # User selected a different context
      context = current_user.contexts.find(params[:context_id])
      memory.apply_context(context)
    elsif params[:description]
      # User provided custom description
      memory.update!(
        user_description: params[:description],
        user_modified: true
      )
    end
    
    render json: memory
  end
  
  def suggestions
    memory = current_user.memories.find(params[:id])
    contexts = memory.plaid_transaction.seek_context
    
    render json: {
      suggestions: contexts.map { |c|
        {
          id: c.id,
          description: MemoryNarrator.new([c]).generate,
          confidence: c.confidence,
          source: c.source_type
        }
      }
    }
  end
end
```

### Webhooks

```ruby
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # Plaid webhook
  def plaid
    case params[:webhook_type]
    when 'TRANSACTIONS'
      case params[:webhook_code]
      when 'DEFAULT_UPDATE', 'INITIAL_UPDATE'
        account = Account.find_by(plaid_item_id: params[:item_id])
        FetchPlaidTransactionsJob.perform_later(account)
      end
    end
    
    head :ok
  end
  
  # Gmail push notification
  def gmail
    user = User.find_by(gmail_watch_token: params[:token])
    FetchGmailReceiptsJob.perform_later(user) if user
    
    head :ok
  end
end
```

## Configuration

### Background Processing (Solid Queue)

```yaml
# config/solid_queue.yml
production:
  dispatchers:
    - polling_interval: 1
      batch_size: 500
  workers:
    - queues: [critical, default, contexts, memories]
      threads: 5
      processes: 2
    - queues: [low_priority, maintenance]
      threads: 2
      processes: 1

# config/recurring.yml
production:
  memory_formation:
    class: MemoryFormationJob
    queue: memories
    schedule: every 5 minutes
  
  late_context_enhancement:
    class: LateContextEnhancementJob
    queue: low_priority
    schedule: every hour
  
  plaid_sync:
    class: FetchPlaidTransactionsJob
    queue: critical
    schedule: every 4 hours
  
  context_cleanup:
    class: ContextExpirationJob
    queue: maintenance
    schedule: every day at 3am
```

## Deployment Considerations

### Database
- PostgreSQL 14+ for range types and JSONB
- Enable `pg_trgm` extension for fuzzy text matching
- Consider partitioning `contexts` table by month

### Redis
- For Solid Queue and caching
- ~100MB for typical usage

### Background Processing
- Solid Queue built into Rails 8
- No separate infrastructure needed

### External Services
- Plaid API for transactions
- Gmail API for receipts (optional)
- OpenAI API for enhanced descriptions (optional)

## Performance Optimization

### Database Indexes
```sql
-- Optimized for context seeking
CREATE INDEX idx_contexts_merchant_amount ON contexts(merchant, amount);
CREATE INDEX idx_contexts_date_range ON contexts USING gist(date_range);
CREATE INDEX idx_contexts_items ON contexts USING gin(items);

-- Optimized for memory formation
CREATE INDEX idx_plaid_transactions_ready ON plaid_transactions(created_at) 
  WHERE memory_id IS NULL AND pending = false;

-- Optimized for user queries
CREATE INDEX idx_memories_user_date ON memories(user_id, transaction_date DESC);
CREATE INDEX idx_memories_pile ON memories(pile, transaction_date DESC);
```

### Caching Strategy
```ruby
class Memory < ApplicationRecord
  # Cache expensive computations
  def display_description
    Rails.cache.fetch([self, 'display_description']) do
      user_description || description || plaid_transaction.merchant_name
    end
  end
end
```

## Success Metrics

### System Health
- Memory formation rate: >95% within 2 hours
- Context match rate: >60% with high confidence
- API response time: <100ms p95

### User Experience
- Time to first memory: <1 hour
- High confidence memories: >40%
- User correction rate: <10%

## Future Enhancements

### Phase 2: Additional Context Sources
- Photos with receipt OCR
- Location tracking correlation
- SMS/iMessage parsing
- Browser history matching

### Phase 3: Intelligence Layer
- Pattern learning per user
- Predictive context matching
- Anomaly detection
- Spending insights

### Phase 4: Social Features
- Shared expenses
- Group memories
- Family accounts
- Bill splitting

## Conclusion

This system design prioritizes:
1. **Data integrity** - Plaid transactions never modified
2. **Progressive enhancement** - Start simple, improve over time
3. **User agency** - Easy to correct and teach
4. **Extensibility** - New context sources plug in easily
5. **Performance** - Efficient queries and background processing

The architecture scales from MVP (just email receipts) to full platform (multiple context sources) without major refactoring.