# Memory Orbs – Phase 3: Context Enrichment (Email receipts → Purchase Contexts)

## Philosophy
- AI-first and memory-only remain non-negotiable.
- Context improves fidelity: receipts → items, purpose, locations.
- Zero heavy work in controllers; background-only pipeline.
- Keep it boring and Railsy: Action Mailbox, simple services, idempotent jobs.
- Do not implement regeneration in Phase 3; only use context if present at formation time.
- Simplification: rely primarily on LLM parsing in Phase 3; minimal heuristics. One email → one purchase. Duplicates acceptable for now.

## Scope (Phase 3)
- Ingest receipt emails and extract a single purchase via LLM (one email = one `PurchaseContext`).
- Store normalized `PurchaseContext` with a rich natural-language `email_context`.
- During memory formation, consider only the user’s `PurchaseContext`s from the past 24 hours as candidates.
- Incorporate available context into the AI prompt when forming a Memory.
- No re-generation yet if context arrives later (explicit defer).

## Data Model
- `purchase_contexts`
  - `user: references` (required)
  - `merchant: string`
  - `amount: decimal(10,2)`
  - `purchase_date: date`
  - `items: jsonb` (default: []) – REQUIRED array; include every item with as much factual detail as present (name, price, quantity, size, color, variant, notes)
  - `description: text` – short "what was bought" summary
  - `email_context: text` – rich NL context (where/branch/when/notable details) without making up facts
  - `confidence: decimal(3,2)` – parser confidence (optional; keep simple)
  - Timestamps
  - Indexes: `(user_id, purchase_date, amount)`, `merchant`
- `memories`
  - Add: `purchase_context_id: references` (nullable)

### Migration sketch
```ruby
create_table :purchase_contexts do |t|
  t.references :user, null: false, foreign_key: true
  t.string :merchant
  t.decimal :amount, precision: 10, scale: 2
  t.date :purchase_date
  t.jsonb :items, default: []
  t.text :description
  t.text :email_context
  t.decimal :confidence, precision: 3, scale: 2
  t.timestamps
  t.index [:user_id, :purchase_date, :amount]
  t.index :merchant
end

add_reference :memories, :purchase_context, foreign_key: true, null: true
```

## Email Ingestion
- Use Action Mailbox with a `ReceiptsMailbox` that forwards each candidate email to a simple parser service.
- Recognizer: keep it simple (keywords like "receipt", "order", "invoice", "confirmation").

```ruby
# app/mailboxes/receipts_mailbox.rb
class ReceiptsMailbox < ApplicationMailbox
  def process
    return unless looks_like_receipt?
    user = identify_user
    return unless user
    EmailReceiptParser.new(mail, user).parse_and_store
  end

  private
  def looks_like_receipt?
    text = (mail.text_part&.body || mail.body).to_s
    text.match?(/receipt|order|purchase|invoice|payment|confirmation/i)
  end

  def identify_user
    # Plus-addressing: receipts+<user_id>@inbox.kane.app
    if mail.to.first =~ /receipts\+(.+)@/
      User.find_by(id: $1)
    end
  end
end
```

## LLM Parsing (one email → one purchase)
```ruby
# app/services/email_receipt_parser.rb
class EmailReceiptParser
  def initialize(mail, user)
    @mail = mail
    @user = user
  end

  def parse_and_store
    parsed = parse_with_llm
    return unless parsed[:success]
    purchase = parsed[:purchase]
    return unless purchase

    PurchaseContext.create!(
      user: @user,
      merchant: purchase[:merchant],
      amount: purchase[:amount],
      purchase_date: purchase[:date] || Date.current,
      items: purchase[:items] || [],
      description: purchase[:description],
      email_context: purchase[:email_context],
      confidence: purchase[:confidence] || 0.7
    )
  end

  private
  def parse_with_llm
    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai_api_key)
    response = client.chat(parameters: {
      model: "gpt-5-mini",
      messages: [
        { role: "system", content: system_prompt },
        { role: "user", content: email_content }
      ],
      response_format: { type: "json_object" },
      temperature: 0.1
    })
    data = JSON.parse(response.dig("choices", 0, "message", "content"))
    { success: true, purchase: data["purchase"] }
  rescue => e
    Rails.logger.error "LLM parsing failed: #{e}"
    { success: false }
  end

  def system_prompt
    <<~PROMPT
    You are a receipt parser. Return JSON with ONE purchase. Items array is REQUIRED. Include maximal factual detail from the email; do NOT invent anything.
    {
      "purchase": {
        "merchant": String,
        "amount": Number,
        "date": "YYYY-MM-DD",
        "items": [
          {
            "name": String,
            "price": Number,
            "quantity": Number | null,
            "size": String | null,
            "color": String | null,
            "variant": String | null,
            "notes": String | null
          }
        ],
        "description": "Short summary of what was bought",
        "email_context": "Rich, factual NL context (where/branch/when/notable details)",
        "confidence": Number
      }
    }
    Rules: items array MUST be present (can be empty only if no items are listed in the email); include every factual attribute available; do not infer.
    PROMPT
  end

  def email_content
    (@mail.text_part&
body || @mail.body).to_s
  end
end
```

## Matching Contexts to Transactions (simple, 24h window)
- During Memory formation (in `FormMemoryJob`), before calling AI:
  - Fetch candidate `PurchaseContext`s for the same user from the last 24 hours only: `where(purchase_date BETWEEN now-1d and now)` (or date == today for simplicity).
  - Optionally pre-filter by rough amount proximity (±$1) to cut noise, but OK to skip and rely on the LLM.
  - Pass the transaction plus the list of candidate contexts to the LLM to select the best match(es) and compose an enriched context.
  - Proceed to Memory creation using that enriched context.
- No separate matching job needed in Phase 3; compute on-demand inside `FormMemoryJob`.

## Incorporating Context into Memory Formation
- Update `MemoryFormationService` to accept an optional `context` hash with fields from `PurchaseContext` (items, description, email_context).
- Include `email_context` when present in the prompt, alongside items/description.
- If no context is found in the last 24 hours, proceed with the Phase 2 AI-only prompt (still memory-only, no baselines).

## Controllers & Views
- Unchanged from Phase 2. Still memory-only, loading screen until ready.
- Optional (later): show an “Enriched” badge when a Memory has a linked `purchase_context_id`.

## Reliability & Idempotency
- Parser is simple and LLM-heavy; duplicates are acceptable for now.
- Formation computes context on demand; no extra state to maintain.
- Unique index on `memories.transaction_id` prevents duplicate memories.

## Testing
- Parser: returns a single purchase with a REQUIRED `items` array populated with all available details (name, price, and any present attributes like size/color/quantity).
- Context field: verifies `email_context` is saved and later included in the formation prompt.
- Formation: with and without candidate contexts in last 24h; ensures prompt enrichment path works.

## Rollout Plan
1. Add `purchase_contexts` with `email_context` and optional `memories.purchase_context_id`.
2. Configure Action Mailbox ingress.
3. Implement `ReceiptsMailbox` and single-purchase `EmailReceiptParser`.
4. Modify `FormMemoryJob`/`MemoryFormationService` to look up last‑24h contexts and enrich prompts.
5. Ship; monitor parse quality and memory creation rate. 