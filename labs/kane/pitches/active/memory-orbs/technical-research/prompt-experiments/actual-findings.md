# Memory Orbs - Actual Findings from Email Analysis

## Key Discovery: Email Subject Lines Lie
"Shipped: Japanese Style..." turned out to be throw pillows and a doorway curtain, not room dividers.

## What Kate Actually Bought (From Real Email Content)

### August 5-6: New Apartment Setup

**"Japanese Style" Order - $92.58**
- Velvet throw pillow covers (4 pack) - $30.99
- Japanese Noren doorway curtain - $37.99
- Tension rod for hanging - $14.99
*Not room dividers - decorative home textiles*

**Netflix Projector - $176.38**
- 4K Smart Projector with Netflix licensing & WiFi 6
*Not a streaming stick - an actual projector*

**Bath Spa Setup - $36.74**
- Dr Teal's sugar body scrub - $20.94
- Luxury bath pillow - $24.98
- Wooden bathtub tray - $21.97
- Bath bombs (12 pack) - $13.99
- Epsom salt - $5.87

**LMNT + Lighting - $46.57 + $38.56**
- LMNT electrolyte variety pack - $23.99
- Gold cordless table lamp - $19.99
- Motion sensor wall sconce - (in second charge)
*Mixed order: health + home lighting*

**Drift Scent Diffusers - $49.51**
- Home Scent Diffuser Starter Kit
- Open Air scent
- Monthly scent subscription
*Actual scent diffusers, not furniture*

### The Missing Context

**Without emails for:**
- Rugs $218.29 (biggest single purchase)
- Multiple $137.80 Amazon charges
- $143.43 Amazon
- Various $39.24 charges
- PayPal $126.13 transactions

## Critical Technical Insights

### 1. Amazon Charging Patterns
- Single orders often charged as multiple transactions
- Items ship and charge separately even from same order
- Banks see each charge as separate transaction
- Amounts may not match email totals due to split charging

### 2. Email Limitations
- Subject lines don't reveal actual products
- "and 2 more items" hides crucial context
- Must parse actual item lists in email body
- Many transactions have no corresponding emails

### 3. Memory Orbs Requirements

**What Works (50% coverage):**
- Exact matches to email totals
- Recurring subscriptions (Spotify, Render)
- DoorDash/delivery with clear merchants
- BNPL installments (recognizable amounts)

**What Doesn't Work:**
- Split Amazon charges without full order emails
- PayPal hiding actual merchants
- Old transactions (emails deleted/archived)
- Digital purchases (inconsistent email receipts)

## Revised Technical Approach

### Minimum Viable Memory Orbs
1. **Start with what's clear** - exact email matches
2. **Progressive enhancement** - add context as available
3. **Show uncertainty** - "Amazon purchase" vs wrong guess
4. **Learn from corrections** - user teaches system

### Data Sources Priority
1. **Bank transaction descriptions** - often have order numbers
2. **Email receipts** - need ALL of them, not partial export
3. **Direct API access** - Amazon order history API would solve most issues
4. **Photo receipts** - iOS can extract these
5. **User memory** - let them add context manually

### The 80/20 Rule
- 80% of value from 20% of transactions
- Focus on large purchases and recurring charges
- Don't try to match every $9.99 Amazon charge
- Aggregate small unknown charges as "Various Amazon"

## Next Steps

1. **Get complete email export** - current mbox is incomplete
2. **Try Gmail API** - programmatic access to all receipts
3. **Test with Plaid Enhanced** - some banks provide better descriptions
4. **Build learning system** - remember user corrections

## The Real Lesson

Memory Orbs can work, but need:
- Complete data sources (all emails, not some)
- Intelligence about merchant patterns
- Acceptance that 100% accuracy is impossible
- UI that handles uncertainty gracefully

The magic isn't in perfect matching - it's in transforming what we CAN match into meaningful memories while being honest about what we can't.