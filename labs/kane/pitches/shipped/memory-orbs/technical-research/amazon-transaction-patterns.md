# Amazon Transaction Patterns - Research Findings

## How Amazon Charges Actually Work

### Core Pattern: Charge on Shipment
- **Amazon charges when items SHIP, not when ordered**
- One order → multiple shipments → multiple bank charges
- No order numbers in bank transaction descriptions
- Total charges should equal original order amount

### Why Orders Split

1. **Different availability** - Items ship as available
2. **Multiple warehouses** - Items from different fulfillment centers
3. **Marketplace sellers** - Third-party items charge separately
4. **Multiple addresses** - Each address gets separate charge
5. **Subscribe & Save** - Can charge month after order appears

## The Reconciliation Problem

### User Pain Points (From Real Complaints)
- "Takes 4 hours monthly to figure out how Amazon billed"
- "If they included last 6-8 digits of order number, matching would take minutes not hours"
- "Subscribe & Save makes it worse - charges full month after order"
- "Nightmare for business/personal separation"

### Amazon's Official Solution
**Your Transactions page** (under Your Account)
- Shows charge amounts and dates
- Links charges to order numbers
- Still requires manual matching
- No API for personal accounts

## Technical Reality for Memory Orbs

### What We Can't Access
- **No consumer API** - Amazon doesn't provide purchase history API for personal accounts
- **No order numbers** - Bank charges don't include order identifiers
- **Historical data** - SP-API only for sellers, not consumers
- **Screen scraping** - Violates ToS, actively blocked

### What We Can Work With
1. **Email receipts** - Parse order confirmations and shipping notices
2. **Amount patterns** - Match totals to email orders
3. **Date windows** - Orders ship 1-5 days after placement
4. **Your Transactions** - User could manually export (no API)

## Practical Patterns Discovered

### Split Charge Examples
```
Order Total: $92.58
Actual Charges:
- Day 1: $37.99 (item ships)
- Day 3: $30.99 (item ships)
- Day 4: $14.99 (item ships)
```

### Subscribe & Save Timing
```
Order appears: July 1
Actually charges: July 28-31
Bank statement: Shows in August
```

### Multi-Item Orders
```
Email: "Japanese Style... and 2 more items"
Reality: 3 separate charges over 4 days
Bank: Just shows "AMAZON.COM" three times
```

## Solutions for Memory Orbs

### Realistic Approach
1. **Parse all email receipts** - Get order totals and items
2. **Group charges by date range** - Orders ship within days
3. **Match totals, not individual items** - Look for charges that sum to order
4. **Show uncertainty** - "Amazon purchase (likely: throw pillows)"
5. **Let users teach** - Manual corrections improve future matching

### What to Tell Users
"Amazon charges when items ship, which can be days after ordering and split across multiple transactions. We'll do our best to match based on amounts and dates, but some Amazon charges may remain generic."

### Accept Limitations
- 30-40% of Amazon charges won't match perfectly
- Subscribe & Save will always be confusing
- Without order numbers in bank data, perfect matching impossible
- Focus on large purchases and patterns, not every $9.99

## The Bottom Line

Amazon's charging pattern makes perfect transaction matching impossible without:
1. Access to Your Transactions data (manual export)
2. Complete email history (every order/ship confirmation)
3. User corrections for ambiguous matches

Memory Orbs should:
- Match what's obvious (exact amounts to emails)
- Group related charges ("3 Amazon charges totaling $92.58")
- Be transparent about limitations
- Focus on the story, not perfect accuracy