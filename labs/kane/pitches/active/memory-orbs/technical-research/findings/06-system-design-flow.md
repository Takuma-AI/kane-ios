# Memory Orbs System Design - Information Flow

## Overview
Match email receipts to transactions, enrich with context, and generate memories.

## Data Flow Architecture

```
┌─────────────────┐     ┌─────────────────┐
│   Email Inbox   │     │  Plaid Webhook  │
│   (Gmail API)   │     │  (Transactions) │
└────────┬────────┘     └────────┬────────┘
         │                       │
         ▼                       ▼
┌─────────────────────────────────────────┐
│          INGESTION LAYER                 │
├─────────────────┬────────────────────────┤
│ Receipt Parser  │  Transaction Importer  │
│ (Extract data)  │  (Normalize + Enrich)  │
└────────┬────────┴────────────┬──────────┘
         │                     │
         ▼                     ▼
┌─────────────────────────────────────────┐
│           MATCHING ENGINE                │
│                                          │
│  1. Amount + Date matching               │
│  2. Merchant name correlation            │
│  3. Confidence scoring                   │
└────────────────┬─────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│         ENRICHMENT PIPELINE              │
│                                          │
│  Receipt Data → LLM → Memory Generation  │
│  OR                                      │
│  Plaid Data → LLM → Memory Generation    │
└────────────────┬─────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│           MEMORY STORE                   │
│                                          │
│  Transaction + Receipt + Memory Orb      │
└──────────────────────────────────────────┘
```

## Detailed Process Flow

### 1. Email Receipt Ingestion
```
New Email Arrives
    ↓
Is it a receipt? (From: amazon.com, subject: "order", etc.)
    ↓ Yes
Parse Receipt
    ├── Merchant name
    ├── Total amount
    ├── Date/time
    ├── Line items
    └── Order ID
    ↓
Store in Receipt Queue (unmatched)
```

### 2. Transaction Ingestion
```
Plaid Webhook (new transaction)
    ↓
Apply Plaid Enrich
    ├── Clean merchant name
    ├── Category
    ├── Location (if available)
    └── merchant_entity_id
    ↓
Store in Transaction Queue (unmatched)
```

### 3. Matching Process
```
For each unmatched transaction:
    ↓
Search Receipt Queue
    ├── Amount match? (± $0.50 for tips/tax)
    ├── Date match? (± 3 days)
    └── Merchant correlation? (PayPal → any, Amazon → Amazon)
    ↓
Calculate confidence score
    ├── Exact amount + same day = 95%
    ├── Close amount + merchant match = 85%
    └── Amount only = 60%
    ↓
If confidence > threshold:
    → Create matched pair
Else:
    → Keep as unmatched
```

### 4. Memory Generation
```
Matched Transaction + Receipt
    ↓
Extract context:
    ├── Line items from receipt
    ├── Time of day
    ├── Day of week
    ├── Location (if available)
    └── Amount relative to usual
    ↓
Generate memory via LLM:
    "Saturday morning Target run: 
     Paper towels, kids snacks, and 
     that impulse buy candle"
    ↓
Store Memory Orb

---OR---

Unmatched Transaction (Plaid only)
    ↓
Use Plaid enriched data:
    ├── Clean merchant name
    ├── Category
    ├── Time context
    └── Location
    ↓
Generate simpler memory:
    "Tuesday lunch at Sweetgreen"
    ↓
Store Memory Orb
```

## Data Storage Schema

### Transactions Table
```
- transaction_id (Plaid)
- amount
- date
- merchant_name (raw)
- merchant_name_clean (Plaid Enrich)
- category
- location_lat_long
- receipt_id (nullable)
- memory_orb_id
- confidence_score
```

### Receipts Table
```
- receipt_id
- email_message_id
- merchant
- amount
- date
- line_items (JSON)
- raw_text
- parsed_at
- transaction_id (nullable)
```

### Memory Orbs Table
```
- memory_orb_id
- transaction_id
- memory_text
- generation_method (receipt/plaid/manual)
- context_used (JSON)
- created_at
- user_corrected (boolean)
```

## Matching Rules

### High Confidence Matches (Auto-match)
1. **Exact amount + Same day + Merchant keyword** → 95%
2. **Within $1 + Same day + Category match** → 90%
3. **Exact amount + Within 2 days** → 85%

### Medium Confidence (Suggest to user)
1. **Close amount + Within 3 days** → 70%
2. **Merchant match + Different amount** → 65%

### Special Cases
- **PayPal/Venmo** → Match ANY receipt same amount ±3 days
- **Amazon** → Match Amazon receipts ±5 days (shipping delays)
- **Tips** → Restaurant receipts match base amount * 1.15-1.30

## Queue Management

### Unmatched Receipts
- Keep for 30 days
- Re-attempt matching when new transactions arrive
- Surface to user: "We found a receipt that might match..."

### Unmatched Transactions  
- Generate basic memory from Plaid data
- Flag for potential enrichment
- Prompt user: "What was this PayPal purchase?"

## Incremental Enhancement

### Phase 1: Basic Matching
- Amount + date matching only
- Manual receipt forwarding
- Simple memory generation

### Phase 2: Smart Matching
- Merchant correlation
- Tip/tax tolerance
- Batch processing

### Phase 3: Proactive Collection
- Auto-detect missing receipts
- Prompt: "Check email for Target receipt?"
- Learn user patterns

## Key Design Decisions

1. **Async processing** - Don't block on receipt matching
2. **Graceful degradation** - Always show something, even if just Plaid
3. **User correction** - Learn from manual matches
4. **Confidence thresholds** - Better to miss than mis-match
5. **Temporal windows** - Receipts can arrive days after purchase