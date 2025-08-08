# Email Receipt Parsing - Research Findings

## Executive Summary
27% of purchases generate email receipts currently, but 75-89% of consumers want them. Commercial APIs cost $0.04-0.08 per receipt. Gmail integration is complex (5,000+ dev hours).

## Commercial Receipt Parsing APIs

### Pricing Comparison
| Service | Price per Receipt | Free Tier | Accuracy |
|---------|------------------|-----------|----------|
| **Veryfi** | $0.08 | 100 total | 99%+ |
| **Taggun** | $0.04-0.08 | 30-day unlimited | 90%+ |
| **Tabscanner** | Custom | Trial available | 99% |
| **Microblink** | Enterprise | 30-day trial | High |
| **Sensibill** | Enterprise | Demo-based | High |

### API Capabilities
- Line-item extraction
- 91 currencies, 38 languages (Veryfi)
- SKU-level parsing (Microblink)
- 150+ data points (Sensibill)

### URLs
- Veryfi: https://www.veryfi.com/pricing/
- Taggun: https://www.taggun.io/pricing
- Tabscanner: https://tabscanner.com/pricing/
- Microblink: https://microblink.com/commerce/data-capture-receipts/
- Sensibill: https://getsensibill.com/receipt-ocr-api

## Email Receipt Coverage

### Current Adoption
- **27% overall adoption** across industries
- **75-89% consumer preference** for digital receipts
- **80% open rate** for email receipts (vs 19% typical retail)

### Industry Leaders
- Apparel: 71% above average adoption
- Jewelry: 58% open rate
- Amazon: 100% coverage for all purchases
- Walmart: Auto-adds store purchases with saved cards

### Market Growth
- Expected to reach $293B by 2030 (7.5% CAGR)
- Alternative projection: $5.2B by 2034 (21.4% CAGR)

## Gmail Integration Challenges

### Complexity
- **5,016 developer hours** average for full integration
- MIME parsing required despite JSON representation
- Direct integration challenging due to API complexity

### Recommended Solutions
- **Nylas**: 99.9% uptime, simplified API
- **EmailEngine**: Unified REST API for multiple providers
- **Unipile**: Comprehensive integration guides

## Open Source Alternatives

### Available Options
- **receipt-parser-legacy**: Python + Tesseract OCR
- **invoice2data**: Python PDF extraction
- **Tesseract OCR**: Base engine for custom solutions
- **Apache Tika**: Content analysis with OCR

### Modern Approaches
- Tesseract.js + GPT for intelligent parsing
- Docker-based containerized solutions
- OCR.space: 500 free requests/day per IP

## Implications for Memory Orbs

### Coverage Reality
- Only 1 in 4 purchases have email receipts today
- Major retailers (Amazon, Walmart, Target) well-covered
- Small businesses likely have no email receipts

### Cost Considerations
- At $0.08/receipt, 1000 users × 30 transactions/month = $2,400/month
- Volume pricing brings down to $0.04/receipt
- Gmail integration complexity may justify third-party services

### Implementation Strategy
1. **Phase 1**: Focus on major retailers with known email formats
2. **Phase 2**: Add commercial API for broader coverage
3. **Phase 3**: Consider email integration for power users

### Privacy Approach
- Request email access only after demonstrating value
- Process receipts on-device where possible
- Allow manual receipt upload as alternative