# Memory Orbs - Simple System Flow

## Core Process (3 Steps)

```
1. COLLECT
   Transactions (Plaid) ──┐
                          ├──→ Pool of unmatched items
   Email Receipts ────────┘

2. MATCH
   Same amount? Same day? ──→ Link them together

3. ENRICH
   Has receipt? ──→ Use line items for memory
   No receipt?  ──→ Use Plaid merchant name
```

## The Simplest Implementation

### What We Store
```
Transaction:
- Amount: $47.82
- Date: Jan 15
- Merchant: "PAYPAL *ETSYSELLER"
- Receipt_ID: (null or linked)

Receipt:
- Amount: $47.82  
- Date: Jan 15
- What: "Vintage brass lamp"
- From: "CozyHomeDecor on Etsy"

Memory:
- Text: "Vintage brass lamp from Etsy"
- Source: receipt or plaid
```

### Matching Logic (Dead Simple)
```python
for each new receipt:
    find transactions where:
        - amount matches (± $1 for rounding)
        - date within 3 days
        - not already matched
    
    if found:
        link them
    else:
        wait (might come later)
```

### Memory Generation

**If receipt exists:**
```
$47.82 PayPal + Receipt → "Vintage brass lamp from Etsy"
```

**If no receipt:**
```
$7.50 Blue Bottle → "Morning coffee at Blue Bottle"
```

## What Makes This Work

1. **Don't overthink matching** - Amount + date is usually enough
2. **Async is fine** - Receipts can match later
3. **Something is better than nothing** - Show Plaid version immediately
4. **Let users help** - "Is this receipt for this transaction?"

## MVP Process (What We Ship Week 1)

```
Day 1-2: Email Receipt Parser
- User forwards receipts to receipts@kane.app
- Parse amount, merchant, items
- Store in database

Day 3-4: Simple Matcher  
- Match by amount + date
- Link receipt to transaction
- No complex logic

Day 5-6: Memory Display
- If receipt: Show line items
- Else: Show Plaid merchant
- Add LLM polish if time

Day 7: Ship It
```

## The Magic Moment

Before: "PAYPAL *ETSYSELLER $47.82"

After: "Vintage brass lamp from Etsy - shipped to home"

That's it. That's the whole system.