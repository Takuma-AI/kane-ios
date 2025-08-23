# Memory Orbs - Phase 2: Context Enrichment

## Overview
Build on the base memory system to accumulate context from multiple sources, transforming "PAYPAL *ETSYSELLER" into "Vintage brass lamp from Etsy" through email receipts and other context signals.

## Prerequisites
- Phase 1 fully deployed and stable
- All transactions creating basic memories
- Background jobs running reliably
- AI enhancement working with location context

## Git Branch Strategy
```bash
git checkout -b feature/memory-context-enrichment
```

## Phase 2.1: Email Context Infrastructure

### Database Schema
```ruby
# Migration: Create context infrastructure
class CreateContextTables < ActiveRecord::Migration[8.0]
  def change
    # Email contexts - parsed receipts become searchable context
    create_table :email_contexts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :from_address
      t.string :subject
      t.decimal :amount, precision: 10, scale: 2
      t.date :order_date
      t.string :merchant
      t.jsonb :line_items, default: []  # [{name, price, quantity}]
      t.text :raw_email
      t.datetime :processed_at
      t.timestamps
      
      t.index [:user_id, :amount, :order_date]
      t.index :merchant
      t.index :processed_at
    end
    
    # Link memories to their context sources
    create_table :memory_contexts do |t|
      t.references :memory, null: false, foreign_key: true
      t.references :email_context, null: false, foreign_key: true
      t.decimal :relevance_score, precision: 3, scale: 2
      t.string :match_reason  # 'amount_date', 'merchant', 'ai_matched'
      t.timestamps
      
      t.index [:memory_id, :email_context_id], unique: true
      t.index :relevance_score
    end
    
    # Add context tracking to memories
    add_column :memories, :context_count, :integer, default: 0
    add_column :memories, :primary_context_id, :integer
    add_column :memories, :last_enriched_at, :datetime
    
    # User email forwarding setup
    add_column :users, :receipt_email, :string
    add_index :users, :receipt_email, unique: true
  end
end
```

### Enhanced Models
```ruby
# app/models/email_context.rb
class EmailContext < ApplicationRecord
  belongs_to :user
  has_many :memory_contexts, dependent: :destroy
  has_many :memories, through: :memory_contexts
  
  validates :from_address, presence: true
  validates :amount, numericality: { greater_than: 0 }, allow_nil: true
  
  scope :unmatched, -> { left_joins(:memory_contexts).where(memory_contexts: { id: nil }) }
  scope :recent, -> { where('created_at > ?', 30.days.ago) }
  scope :with_line_items, -> { where("jsonb_array_length(line_items) > 0") }
  
  def potential_transactions
    # Find transactions that could match this context
    user.transactions
        .joins(:account)
        .where('ABS(transactions.amount - ?) < ?', amount || 0, 1.0)
        .where(transaction_date: date_range)
        .includes(:memories)
  end
  
  def date_range
    return (7.days.ago..Date.current) unless order_date
    (order_date - 3.days)..(order_date + 7.days)
  end
  
  def display_items
    return merchant unless line_items.present?
    
    items = line_items.first(3).map { |item| item['name'] }
    items.join(', ')
  end
end

# app/models/memory_context.rb
class MemoryContext < ApplicationRecord
  belongs_to :memory
  belongs_to :email_context
  
  validates :relevance_score, numericality: { in: 0..1 }
  validates :match_reason, presence: true
  
  scope :high_confidence, -> { where('relevance_score > ?', 0.8) }
  scope :by_relevance, -> { order(relevance_score: :desc) }
end

# app/models/memory.rb (enhanced)
class Memory < ApplicationRecord
  belongs_to :transaction
  has_many :memory_contexts, dependent: :destroy
  has_many :email_contexts, through: :memory_contexts
  belongs_to :primary_context, class_name: 'EmailContext', optional: true
  
  scope :needs_enrichment, -> { where('confidence < ? OR context_count = 0', 0.7) }
  scope :recently_enriched, -> { where('last_enriched_at > ?', 1.hour.ago) }
  
  def enrich_with_context(context, relevance_score, reason)
    memory_contexts.create!(
      email_context: context,
      relevance_score: relevance_score,
      match_reason: reason
    )
    
    # Update primary context if this is better
    if primary_context.nil? || relevance_score > memory_contexts.maximum(:relevance_score)
      update!(
        primary_context: context,
        context_count: memory_contexts.count,
        last_enriched_at: Time.current
      )
    end
    
    # Regenerate description with new context
    regenerate_description!
  end
  
  def regenerate_description!
    return unless primary_context
    
    # Use context to create rich description
    ContextEnrichmentService.new(self).enhance_from_context
  end
end
```

## Phase 2.2: Email Ingestion with Action Mailbox

### Setup Action Mailbox
```ruby
# config/application.rb
config.action_mailbox.ingress = :postmark  # or :sendgrid

# app/mailboxes/application_mailbox.rb
class ApplicationMailbox < ActionMailbox::Base
  routing(/receipts\+(.+)@/i => :receipts)  # receipts+userid@inbox.kane.app
end

# app/mailboxes/receipts_mailbox.rb
class ReceiptsMailbox < ApplicationMailbox
  def process
    return unless valid_receipt?
    
    user = identify_user
    return unless user
    
    context = EmailContextParser.new(mail).parse
    
    if context.save
      # Queue matching after a delay to let transactions settle
      MatchContextJob.set(wait: 1.hour).perform_later(context)
    end
  end
  
  private
  
  def valid_receipt?
    # Check if this looks like a receipt
    body_text = mail.text_part&.body || mail.body
    
    receipt_indicators = [
      /order|receipt|invoice|purchase|transaction/i,
      /total|amount|price/i,
      /thank you for your (order|purchase)/i
    ]
    
    receipt_indicators.any? { |pattern| body_text.to_s.match?(pattern) }
  end
  
  def identify_user
    # Extract user ID from plus addressing
    if mail.to.first =~ /receipts\+(.+)@/
      User.find_by(id: $1)
    end
  end
end
```

### Email Parsing Service
```ruby
# app/services/email_context_parser.rb
class EmailContextParser
  MERCHANT_PATTERNS = {
    amazon: /amazon|amzn/i,
    etsy: /etsy/i,
    uber: /uber/i,
    lyft: /lyft/i,
    doordash: /doordash/i,
    grubhub: /grubhub/i
  }
  
  def initialize(mail)
    @mail = mail
    @body = extract_body
    @subject = mail.subject
  end
  
  def parse
    EmailContext.new(
      from_address: @mail.from.first,
      subject: @subject,
      raw_email: @mail.raw_source.to_s,
      amount: extract_amount,
      order_date: extract_date,
      merchant: extract_merchant,
      line_items: extract_line_items,
      processed_at: Time.current
    )
  end
  
  private
  
  def extract_body
    if @mail.html_part
      Nokogiri::HTML(@mail.html_part.body.to_s).text
    else
      @mail.text_part&.body || @mail.body
    end.to_s
  end
  
  def extract_amount
    # Try multiple patterns
    patterns = [
      /total[:\s]+\$?([\d,]+\.?\d*)/i,
      /amount[:\s]+\$?([\d,]+\.?\d*)/i,
      /charged[:\s]+\$?([\d,]+\.?\d*)/i,
      /\$\s?([\d,]+\.?\d{2})/  # Any dollar amount
    ]
    
    patterns.each do |pattern|
      if match = @body.match(pattern)
        return match[1].gsub(',', '').to_f
      end
    end
    
    nil
  end
  
  def extract_date
    # Look for order date patterns
    patterns = [
      /order date[:\s]+([a-z]+ \d+,? \d{4})/i,
      /purchased on[:\s]+([a-z]+ \d+,? \d{4})/i,
      /date[:\s]+(\d{1,2}\/\d{1,2}\/\d{2,4})/i
    ]
    
    patterns.each do |pattern|
      if match = @body.match(pattern)
        begin
          return Date.parse(match[1])
        rescue
          next
        end
      end
    end
    
    # Default to email date
    @mail.date&.to_date || Date.current
  end
  
  def extract_merchant
    # Check known patterns first
    MERCHANT_PATTERNS.each do |merchant, pattern|
      return merchant.to_s.capitalize if @body.match?(pattern) || @subject.match?(pattern)
    end
    
    # Try to extract from from address
    if @mail.from.first =~ /@(.+)\./
      domain = $1
      return domain.capitalize unless domain.match?(/gmail|yahoo|outlook/)
    end
    
    "Unknown Merchant"
  end
  
  def extract_line_items
    # This is complex and merchant-specific
    # Start simple, enhance over time
    items = []
    
    if @body.match?(/amazon/i)
      items = parse_amazon_items
    elsif @body.match?(/etsy/i)
      items = parse_etsy_items
    end
    
    items
  end
  
  def parse_amazon_items
    # Simplified Amazon parsing
    items = []
    
    # Look for item patterns
    item_pattern = /^(.+?)\s+\$?([\d,]+\.?\d{2})\s*$/m
    
    @body.scan(item_pattern).each do |name, price|
      next if name.match?(/tax|shipping|total|subtotal/i)
      next if name.length > 100  # Skip non-item lines
      
      items << {
        name: name.strip,
        price: price.gsub(',', '').to_f,
        quantity: 1
      }
    end
    
    items.first(5)  # Limit to 5 items
  end
  
  def parse_etsy_items
    # Etsy-specific parsing
    []  # Implement based on actual Etsy receipt format
  end
end
```

## Phase 2.3: Context Matching Engine

### Matching Service
```ruby
# app/services/context_matching_service.rb
class ContextMatchingService
  def initialize(context)
    @context = context
  end
  
  def find_matches
    matches = []
    
    # Strategy 1: Exact amount and date match
    exact_matches = find_exact_matches
    matches.concat(exact_matches.map { |t| [t, 0.9, 'amount_date'] })
    
    # Strategy 2: Fuzzy merchant matching
    merchant_matches = find_merchant_matches
    matches.concat(merchant_matches.map { |t| [t, 0.7, 'merchant'] })
    
    # Strategy 3: AI-powered matching for ambiguous cases
    if matches.empty? && should_use_ai?
      ai_matches = find_ai_matches
      matches.concat(ai_matches.map { |t| [t, 0.6, 'ai_matched'] })
    end
    
    # Return unique transactions with highest scores
    matches.group_by(&:first)
           .map { |trans, group| group.max_by { |_, score, _| score } }
  end
  
  private
  
  def find_exact_matches
    return [] unless @context.amount
    
    @context.user.transactions
            .where('ABS(amount - ?) < ?', @context.amount, 0.01)
            .where(transaction_date: @context.date_range)
            .includes(:memories)
  end
  
  def find_merchant_matches
    return [] if @context.merchant == "Unknown Merchant"
    
    merchant_pattern = @context.merchant.downcase.gsub(/[^a-z0-9]/, '')
    
    @context.user.transactions
            .where("LOWER(REPLACE(merchant_name, ' ', '')) LIKE ?", "%#{merchant_pattern}%")
            .where(transaction_date: @context.date_range)
            .includes(:memories)
  end
  
  def find_ai_matches
    # Use GPT-5-mini to match ambiguous receipts
    candidates = @context.potential_transactions.limit(10)
    
    return [] if candidates.empty?
    
    prompt = build_ai_matching_prompt(candidates)
    
    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai_api_key)
    
    response = client.chat(
      parameters: {
        model: "gpt-5-mini",
        messages: [
          {
            role: "system",
            content: "Match email receipts to transactions. Return only the transaction ID that best matches, or 'none' if no match."
          },
          {
            role: "user",
            content: prompt
          }
        ],
        max_tokens: 10,
        temperature: 0.1
      }
    )
    
    transaction_id = response.dig("choices", 0, "message", "content").strip
    
    return [] if transaction_id == 'none'
    
    Transaction.where(id: transaction_id)
  rescue => e
    Rails.logger.error "AI matching failed: #{e}"
    []
  end
  
  def should_use_ai?
    # Control AI usage for cost
    Rails.env.production? && 
    @context.amount.present? && 
    @context.created_at > 1.hour.ago
  end
  
  def build_ai_matching_prompt(candidates)
    <<~PROMPT
      Email Receipt:
      From: #{@context.from_address}
      Amount: $#{@context.amount}
      Date: #{@context.order_date}
      Merchant: #{@context.merchant}
      Items: #{@context.display_items}
      
      Transactions:
      #{candidates.map { |t| "ID: #{t.id}, Merchant: #{t.merchant_name}, Amount: $#{t.amount}, Date: #{t.transaction_date}" }.join("\n")}
      
      Which transaction ID matches this receipt?
    PROMPT
  end
end
```

### Context Matching Job
```ruby
# app/jobs/match_context_job.rb
class MatchContextJob < ApplicationJob
  queue_as :matching
  
  def perform(context)
    matcher = ContextMatchingService.new(context)
    matches = matcher.find_matches
    
    matches.each do |transaction, score, reason|
      next unless transaction.memories.any?
      
      memory = transaction.current_memory
      memory.enrich_with_context(context, score, reason)
    end
    
    # If no matches found, try again later with more transactions
    if matches.empty? && context.created_at > 24.hours.ago
      self.class.set(wait: 6.hours).perform_later(context)
    end
  end
end
```

## Phase 2.4: Context Enrichment Service

### Enhanced Memory Formation
```ruby
# app/services/context_enrichment_service.rb
class ContextEnrichmentService
  def initialize(memory)
    @memory = memory
    @transaction = memory.transaction
    @context = memory.primary_context
  end
  
  def enhance_from_context
    return enhance_without_context unless @context
    
    description = if @context.line_items.present?
      generate_item_description
    else
      generate_merchant_description
    end
    
    @memory.update!(
      description: description,
      confidence: calculate_enhanced_confidence,
      source: 'email',
      last_enriched_at: Time.current
    )
  end
  
  private
  
  def generate_item_description
    items = @context.line_items
    
    # For single item purchases
    if items.length == 1
      return items.first['name']
    end
    
    # For multiple items, be smart about summary
    if items.length <= 3
      items.map { |i| i['name'] }.join(', ')
    else
      # Summarize with count
      "#{items.first['name']} and #{items.length - 1} more items"
    end
  end
  
  def generate_merchant_description
    # Use AI to create better description from context
    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai_api_key)
    
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
            content: build_context_prompt
          }
        ],
        max_tokens: 30,
        temperature: 0.3
      }
    )
    
    response.dig("choices", 0, "message", "content").strip
  rescue => e
    Rails.logger.error "Context enrichment failed: #{e}"
    fallback_description
  end
  
  def system_prompt
    <<~PROMPT
      Transform receipt information into a human memory. Be specific about what was purchased while keeping merchant identity clear.
      
      Guidelines:
      - Include actual items when known from receipt
      - Keep merchant name visible (Amazon, Etsy, etc.)
      - Be concise (5-15 words)
      - Don't make assumptions beyond what's in the receipt
      - Use natural, factual language
      
      Examples:
      Etsy receipt for "Vintage brass table lamp" → "Vintage brass table lamp from Etsy"
      Amazon with "JavaScript: The Good Parts" → "JavaScript book from Amazon"
      Restaurant receipt → "Meal at [restaurant name]"
      PayPal to ETSYSELLER with no item details → "PayPal to Etsy seller"
    PROMPT
  end
  
  def build_context_prompt
    location = @transaction.location_data
    
    parts = [
      "Original transaction: #{@transaction.merchant_name}",
      "Receipt from: #{@context.merchant}",
      "Amount: $#{@context.amount}",
      "Items: #{@context.display_items}",
      "Date: #{@context.order_date}"
    ]
    
    if location&.dig(:city)
      parts << "Location: #{location[:city]}, #{location[:region]}"
    end
    
    parts.join("\n")
  end
  
  def calculate_enhanced_confidence
    base = 0.7  # Start high with email context
    
    # Boost for specific signals
    base += 0.1 if @context.line_items.present?
    base += 0.1 if @memory.memory_contexts.count > 1
    base += 0.1 if @context.amount == @transaction.amount
    
    [base, 1.0].min
  end
  
  def enhance_without_context
    # Fallback to Phase 1 enhancement
    MemoryFormationService.new(@transaction).create_memory
  end
  
  def fallback_description
    "Purchase from #{@context.merchant}"
  end
end
```

## Phase 2.5: Recurring Background Jobs

### Job Schedule
```yaml
# config/recurring.yml (updated)
production:
  fetch_transactions:
    class: FetchTransactionsJob
    queue: critical
    schedule: every 4 hours
  
  form_memories:
    class: FormMemoriesJob
    queue: memories
    schedule: every 15 minutes
  
  match_unmatched_contexts:
    class: MatchUnmatchedContextsJob
    queue: matching
    schedule: every hour
  
  enrich_memories:
    class: EnrichMemoriesJob
    queue: enrichment
    schedule: every 30 minutes
  
  cleanup_old_contexts:
    class: CleanupOldContextsJob
    queue: low
    schedule: every day at 3am
```

### Background Jobs
```ruby
# app/jobs/match_unmatched_contexts_job.rb
class MatchUnmatchedContextsJob < ApplicationJob
  queue_as :matching
  
  def perform
    # Try to match contexts that haven't found their transaction yet
    EmailContext.unmatched.recent.find_each do |context|
      MatchContextJob.perform_later(context)
    end
  end
end

# app/jobs/enrich_memories_job.rb
class EnrichMemoriesJob < ApplicationJob
  queue_as :enrichment
  
  def perform
    # Continuously improve memories with new context
    Memory.needs_enrichment
          .not_recently_enriched
          .limit(50)
          .each do |memory|
      
      # Look for new context
      contexts = find_potential_contexts(memory)
      
      contexts.each do |context|
        matcher = ContextMatchingService.new(context)
        matches = matcher.find_matches
        
        if match = matches.find { |t, _, _| t.id == memory.transaction_id }
          memory.enrich_with_context(context, match[1], match[2])
        end
      end
    end
  end
  
  private
  
  def find_potential_contexts(memory)
    transaction = memory.transaction
    
    EmailContext.where(user: transaction.account.user)
                .where('ABS(amount - ?) < ?', transaction.amount, 5.0)
                .where(order_date: (transaction.transaction_date - 7.days)..(transaction.transaction_date + 3.days))
                .where.not(id: memory.email_contexts.pluck(:id))
                .limit(5)
  end
end

# app/jobs/cleanup_old_contexts_job.rb
class CleanupOldContextsJob < ApplicationJob
  queue_as :low
  
  def perform
    # Remove old unmatched contexts to save space
    EmailContext.unmatched
                .where('created_at < ?', 90.days.ago)
                .destroy_all
  end
end
```

## Phase 2.6: User Setup Flow

### Receipt Email Setup
```ruby
# app/controllers/settings_controller.rb
class SettingsController < ApplicationController
  def receipt_forwarding
    @user = current_user
    @receipt_email = generate_receipt_email unless @user.receipt_email
  end
  
  def enable_receipts
    current_user.update!(receipt_email: params[:receipt_email])
    
    # Send test email with instructions
    UserMailer.receipt_setup_instructions(current_user).deliver_later
    
    redirect_to settings_path, notice: "Receipt forwarding enabled! Check your email for setup instructions."
  end
  
  private
  
  def generate_receipt_email
    "receipts+#{current_user.id}@inbox.kane.app"
  end
end
```

### Setup Instructions Email
```erb
<!-- app/views/user_mailer/receipt_setup_instructions.html.erb -->
<h2>Set Up Receipt Forwarding</h2>

<p>Your receipt email is: <strong><%= @user.receipt_email %></strong></p>

<h3>Gmail Auto-Forwarding (Recommended)</h3>
<ol>
  <li>Go to Gmail Settings → Filters and Blocked Addresses</li>
  <li>Click "Create a new filter"</li>
  <li>In "From" field, enter: order OR receipt OR invoice OR purchase</li>
  <li>Click "Create filter"</li>
  <li>Check "Forward it to" and enter: <%= @user.receipt_email %></li>
  <li>Click "Create filter"</li>
</ol>

<h3>Manual Forwarding</h3>
<p>You can also manually forward individual receipts to <%= @user.receipt_email %></p>

<h3>Privacy Note</h3>
<p>We only process emails that look like receipts. All other emails are automatically rejected and deleted.</p>
```

## Phase 2.7: Enhanced UI

### Updated Views
```erb
<!-- app/views/transactions/_card.html.erb (enhanced) -->
<div class="transaction-content">
  <% memory = transaction.current_memory %>
  
  <h3 class="transaction-description">
    <%= memory.display_text %>
  </h3>
  
  <% if memory.primary_context&.line_items&.any? %>
    <div class="memory-items">
      <% memory.primary_context.line_items.first(3).each do |item| %>
        <span class="item-tag"><%= item['name'] %></span>
      <% end %>
    </div>
  <% end %>
  
  <div class="transaction-meta">
    <span class="amount">$<%= transaction.amount %></span>
    <span class="date"><%= memory.semantic_date %></span>
    
    <% if memory.confidence >= 0.8 %>
      <span class="confidence-badge high">✓</span>
    <% elsif memory.confidence >= 0.5 %>
      <span class="confidence-badge medium">~</span>
    <% end %>
  </div>
  
  <% if memory.confidence < 0.7 %>
    <p class="original-merchant"><%= transaction.merchant_name %></p>
  <% end %>
  
  <% if memory.context_count > 0 %>
    <div class="context-indicator">
      <%= memory.context_count %> context<%= 's' if memory.context_count > 1 %>
    </div>
  <% end %>
</div>

<!-- app/views/memories/show.html.erb (new) -->
<% content_for :title, @memory.display_text %>

<div class="memory-detail">
  <h1><%= @memory.display_text %></h1>
  
  <div class="memory-metadata">
    <p class="amount">$<%= @memory.amount %></p>
    <p class="date"><%= @memory.semantic_date %></p>
    <p class="original">Originally: <%= @memory.transaction.merchant_name %></p>
  </div>
  
  <% if @memory.primary_context %>
    <div class="context-details">
      <h3>Context</h3>
      <p>From: <%= @memory.primary_context.from_address %></p>
      <p>Receipt date: <%= @memory.primary_context.order_date %></p>
      
      <% if @memory.primary_context.line_items.any? %>
        <h4>Items</h4>
        <ul>
          <% @memory.primary_context.line_items.each do |item| %>
            <li>
              <%= item['name'] %>
              <span class="item-price">$<%= item['price'] %></span>
            </li>
          <% end %>
        </ul>
      <% end %>
    </div>
  <% end %>
  
  <% if @memory.transaction.location_data.present? %>
    <div class="location-details">
      <h3>Location</h3>
      <p><%= @memory.transaction.location_data['city'] %>, <%= @memory.transaction.location_data['region'] %></p>
    </div>
  <% end %>
</div>
```

## Migration & Deployment

### Migration Strategy
```ruby
# lib/tasks/context_migration.rake
namespace :context do
  desc "Enable context enrichment for existing users"
  task enable_for_existing: :environment do
    User.find_each do |user|
      next if user.receipt_email.present?
      
      user.update!(
        receipt_email: "receipts+#{user.id}@inbox.kane.app"
      )
      
      puts "Enabled receipt forwarding for user #{user.id}"
    end
  end
  
  desc "Reprocess memories with new context"
  task reprocess_memories: :environment do
    Memory.where(source: ['plaid', 'migration'])
          .find_in_batches(batch_size: 100) do |batch|
      
      batch.each do |memory|
        # Queue for context matching
        EnrichMemoriesJob.perform_later(memory.id)
      end
      
      puts "Queued #{batch.size} memories for enrichment"
      sleep 1  # Rate limiting
    end
  end
end
```

### Deployment Checklist
```markdown
## Pre-deployment
- [ ] Test Action Mailbox locally with sample receipts
- [ ] Verify email parsing for major merchants (Amazon, Etsy, etc.)
- [ ] Test context matching algorithm
- [ ] Set up email forwarding domain (inbox.kane.app)

## Deployment
1. [ ] Deploy code with migrations
2. [ ] Run context infrastructure migrations
3. [ ] Configure Action Mailbox in production
4. [ ] Set up email ingress (Postmark/SendGrid)
5. [ ] Enable receipt forwarding for test users
6. [ ] Monitor email processing pipeline
7. [ ] Run `rails context:enable_for_existing` for all users
8. [ ] Monitor enrichment jobs

## Monitoring
- [ ] Track email processing rate
- [ ] Monitor context match success rate
- [ ] Watch memory confidence scores
- [ ] Check AI API usage and costs
```

## Success Metrics

### Phase 2 Goals
- 70%+ transactions matched with email context
- 90%+ email receipts successfully parsed
- Memory confidence > 0.8 for matched transactions
- Context accumulation < 2 hours from email receipt
- User engagement increases 2x with enriched memories

### Quality Indicators
- Rich descriptions replacing merchant codes
- Line items visible for complex purchases
- Location context when relevant
- High confidence indicators in UI

## Future Enhancements (Phase 3+)

- Photo receipt OCR with iOS integration
- Calendar event correlation
- SMS receipt parsing
- Weather correlation for context
- Social spending detection (multiple people)
- Reverse geocoding for neighborhood names
- Category inference from purchase patterns

## Remember

Context accumulation is organic, not forced. Like memories forming in our minds, each transaction gathers meaning from the signals around it. The magic is in patience - letting context find its transaction, not forcing matches that don't exist.