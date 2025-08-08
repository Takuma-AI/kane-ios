# Plaid Transaction Data Coverage - Research Findings

## Executive Summary
Location data available for ~50% of transactions (card-present only). Merchant categorization >90% accurate. Data quality varies significantly by institution.

## Key Findings

### Location Coverage
- **50% of card-present transactions** have lat/long coordinates
- Online transactions typically lack location data
- Partnership with SafeGraph improved coverage
- **Source**: https://www.safegraph.com/customers/plaid

### Merchant Data Quality
- **>90% merchant categorization accuracy**
- **>90% merchant coverage** with 99% precision
- New `merchant_entity_id` field (Sept 2023) provides stable merchant identification
- Small/local businesses remain challenging
- **Sources**: 
  - https://plaid.com/blog/transaction-enrichment-engine/
  - https://plaid.com/blog/transactional-data-personalization-update/

### Institution-Specific Limitations
- Capital One, USAA don't provide pending transactions
- Investment transactions can take up to a week for accurate data
- Only 90 days history by default (up to 24 months with configuration)
- Update frequency: 1+ times per day (not real-time)

### Developer Pain Points (from Stack Overflow)
- "Data is very spotty" for investment transactions
- Transactions can change or disappear after posting
- Missing webhooks cause data consistency issues
- **Source**: https://stackoverflow.com/questions/75025828/investments-transactions-get-endpoint-how-long-to-return-data

## Implications for Memory Orbs

### What We Can Count On
- Merchant name and category for most transactions
- Transaction timestamp and amount
- ~50% will have location for in-person purchases

### What We Need Fallbacks For
- 50% of transactions without location
- Online purchases lacking geographic context
- Small business identification
- Investment/brokerage transactions

### Recommended Approach
1. Build robust fallback handling for missing data
2. Use merchant_entity_id for consistent merchant tracking
3. Expect institution-specific quirks
4. Design for partial data availability