# Memory Orbs Technical Research - Executive Summary

## The Magical Experience is Achievable

Building for ourselves and close friends first, we can create truly magical transaction memories without worrying about scale or App Store restrictions. Here's what's possible today.

## Key Findings

### Data Availability Reality Check
- **50% of transactions** have location data (card-present only)
- **27% of purchases** generate email receipts (but 75% of users want them)
- **90%+ merchant categorization** accuracy from Plaid
- **Photos correlation** possible via timestamp/location matching

### Cost Per User (Monthly)
Assuming 50 transactions/month per user:

| Component | Minimal | Magical | Notes |
|-----------|---------|---------|-------|
| **LLM Processing** | $0.003 | $0.34 | GPT-4o Mini vs Claude Opus |
| **Map Images** | $0 (iOS) | $0.10 | Native MapKit is free |
| **Receipt Parsing** | $0 | $4.00 | If using commercial API |
| **Weather/Context** | $0 | $0 | Within free tiers |
| **Total/User/Month** | $0.003 | $4.44 | |

### Privacy-First Technical Stack

#### iOS Native (Recommended Start)
- **Photos**: PHPickerViewController for privacy
- **Maps**: Free MapKit with MKMapSnapshotter
- **Processing**: On-device Vision framework
- **LLM**: Local models or secure API calls

#### Data We Can Access
- Transaction timestamp, amount, merchant
- Photo timestamps and locations (with permission)
- Weather data for transaction time/place
- Maps and reverse geocoding
- Email receipts (with permission)

## The One-Week Build Plan

### What's Definitely Possible
1. **Rich merchant context** via Plaid + LLM enrichment
2. **Map snapshots** for every location-enabled transaction
3. **Time-based photo matching** showing photos from purchase day
4. **Weather context** for outdoor/travel purchases
5. **Smart categorization** beyond Plaid's categories

### What's Possible With Permission
1. **Photo library correlation** (timestamps match purchases)
2. **Email receipt parsing** for line-item details
3. **Calendar integration** for event context
4. **Location patterns** (home/work detection)

### What's Magical But Complex
1. **Real-time photo analysis** during purchases
2. **Social correlation** (friends' shared expenses)
3. **Emotional state inference** (late night, stress patterns)
4. **AR reconstruction** of shopping moments

## Recommended Implementation Path

### Week 1: Core Magic (What We Ship)
- LLM-enriched transaction descriptions
- Map images for location-enabled purchases
- Time/weather context
- Photo day correlation (with picker)
- Need/Want/Kill with memory context

### Week 2-4: Enhanced Magic
- Email receipt integration
- Pattern detection (recurring, unusual)
- Richer photo integration
- Voice memos for transactions

### Future: Full Magic
- On-device ML for all processing
- AR shopping reconstruction
- Social expense detection
- Predictive insights

## Critical Technical Decisions

### LLM Strategy
- **Start with**: GPT-4o Mini ($0.00006/transaction)
- **Upgrade to**: Claude Haiku for quality ($0.00036/transaction)
- **End goal**: Local inference for privacy

### Photo Integration
- **Start with**: PHPickerViewController (manual selection)
- **Evolve to**: Limited library access with timestamps
- **End goal**: Smart correlation with permission

### Mapping Approach
- **iOS**: Native MapKit (free, unlimited)
- **Web**: Google Static Maps ($2/1,000)
- **Alternative**: Geoapify with OpenStreetMap

## The Bottom Line

For 100 beta users, we can deliver a magical experience for under $500/month total, even using premium APIs. The technical pieces exist today - the magic is in the integration.

**Most importantly**: By starting with iOS native development and focusing on our own use first, we can build the most magical version without compromise, then figure out how to scale it.

## Next Steps

1. **Spike on Plaid data** - Map actual coverage with real accounts
2. **Test LLM enrichment** - Try GPT-4o Mini vs Claude on real transactions
3. **Build photo correlation** - Prototype timestamp matching
4. **Design memory generation** - What triggers the strongest memories?

The primitives are ready. Let's build magic.