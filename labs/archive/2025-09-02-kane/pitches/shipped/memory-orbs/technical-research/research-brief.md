# Memory Orbs Technical Research Brief

## Philosophy
Start with the most magical experience possible. Build for ourselves and close friends first. Technical feasibility and App Store guidelines come later - if the experience is magical enough, we'll find a way to ship it. All primitives can be reconsidered in the age of AI.

## Mission
Exhaustively explore all possible data sources and contextual cues that could transform transaction data into memories. Focus on breadth over depth - we need to know what Lego pieces we're playing with.

## 1. Plaid Transaction Data

### What we get directly
- `merchant_name` - cleaned merchant names
- `category` & `detailed_category` - spending categories
- `datetime` - exact timestamp
- `amount` - transaction amount
- `location` - lat/long when available
- `payment_channel` - online vs in-store
- `pending` status
- `account_id` - which account used

### Questions to investigate
- What % of transactions have location data? (anecdotal: ~30-40% for in-store)
- Do certain merchant types have better location coverage?
- What's in the `merchant_entity_id` - can we build merchant profiles?
- How reliable is category data for inferring purchase type?
- Can we detect patterns in `authorized_datetime` vs `datetime` gaps?

## 2. Location & Maps Integration

### Possibilities
- Show map pin/image via lat/long coordinates
- Reverse geocode to neighborhood names ("Castro district" vs exact address)
- Distance from home/work (if we know those)
- Weather at time/location of purchase
- Local events happening nearby that day
- Travel detection (purchases far from usual locations)

### Questions to investigate
- Google Maps Static API pricing for map thumbnails
- MapBox alternatives for visual context
- Can we detect "home" and "work" from transaction patterns?
- Privacy implications of location tracking

## 3. Time & Calendar Context

### Possibilities
- Day of week patterns (weekend vs weekday behavior)
- Time of day categorization (breakfast/lunch/dinner/late night)
- Paycheck proximity (day after deposit = different context)
- Holiday/event detection (Black Friday, Valentine's Day)
- Recurring transaction detection
- Unusual timing flags (3am purchase vs usual patterns)

### Questions to investigate
- Can we access user's calendar with permission?
- Public holiday APIs for context
- How to detect pay cycles from deposits
- Timezone handling for travel

## 4. Amount & Pattern Analysis

### Possibilities
- Relative size ("3x your usual grocery spend")
- Round numbers vs precise (likely split bills)
- Multiple same-merchant same-day (coffee meeting?)
- Tip detection in restaurant amounts
- Subscription vs one-time detection
- Price-per-item inference ($14.50 at coffee = 2 drinks)

### Questions to investigate
- Statistical analysis for "unusual" amounts
- How to infer item counts from totals
- Building merchant-specific price models

## 5. Email Receipt Integration

### Possibilities
- Line item details from email receipts
- Product names and quantities
- Digital receipt parsing (Amazon, Target, etc.)
- Order confirmation context
- Shipping vs pickup detection
- Return/refund matching

### Questions to investigate
- Gmail API integration requirements
- Receipt parsing services (Sensibill, Microblink)
- Email permission and privacy concerns
- Coverage % - how many merchants email receipts?
- Complexity of parsing different receipt formats

## 6. Merchant Intelligence

### Possibilities
- Business hours (late night McDonald's vs dinner)
- Merchant type beyond category (fast food vs restaurant)
- Price tier of establishment
- Popular items at that merchant
- Merchant logos/imagery
- Chain vs local business

### Questions to investigate
- Merchant enrichment APIs (Plaid's own, or third-party)
- Google Places API for business details
- Yelp/Foursquare APIs for context
- Building our own merchant database over time

## 7. Social & Shared Context

### Possibilities
- Multiple cards charged at same merchant/time (group dinner)
- Venmo/Zelle near transaction (splitting costs)
- Contact proximity (if they share KANE)
- Special occasions in social circle

### Questions to investigate
- Privacy boundaries and user comfort
- Detecting split bills without being creepy
- Opt-in social features

## 8. Device & Behavioral Signals

### Possibilities
- Purchase made via app vs physical card
- New merchant vs repeat visit
- Shopping session detection (multiple stores in sequence)
- Impulse vs planned (search history?)
- Post-purchase behavior (immediate return?)

### Questions to investigate
- What device/channel data does Plaid provide?
- Browser extension for online purchase context?
- Mobile app location permissions

## 9. External Data Enrichment

### Possibilities
- Weather data (rainy day shopping)
- Stock market that day (stress shopping?)
- News events (pandemic panic buying)
- Sports scores (celebration/consolation)
- Traffic/transit delays (grabbed Uber instead)

### Questions to investigate
- Cost of weather/news APIs
- Relevance vs noise in external data
- How to connect external events to spending

## 10. User-Provided Context

### Possibilities
- Photo attachment to transactions
- Voice memo about purchase
- Quick tags/emojis
- Future purchase planning that provides context
- Sharing why they bought something

### Questions to investigate
- Storage costs for media
- Minimal friction input methods
- How much will users actually annotate?

## 11. Photo Library Integration

### Possibilities
- Match transaction timestamp to photos taken that day
- Shopping photos (items tried on, considered, purchased)
- Restaurant food photos correlating to dining transactions
- Travel photos providing context for travel spending
- Screenshots of items before purchasing online
- Photos with friends on days with group expenses
- Receipts photographed by users
- Location match between photo GPS and transaction location

### Questions to investigate
- iOS PhotoKit permissions and privacy requirements
- Can we access photo timestamps without seeing photos?
- Privacy-preserving matching (on-device only?)
- User comfort level with photo access
- Android Google Photos API equivalents
- How many users photograph purchases/experiences?
- Can we detect receipt photos vs regular photos?
- Photo EXIF data for time/location matching
- Performance of scanning large photo libraries
- Storage of photo associations (just references, not copies)

### Workarounds & Limitations
- Apple's privacy restrictions on photo access
- Need explicit user permission per photo
- Could offer "select photos for this purchase" manual option
- Day-view clustering (show photos from purchase day)
- On-device processing only for privacy
- Progressive permission (ask only when relevant)

## 12. LLM Analysis Capabilities

### Possibilities
- Narrative generation from multiple signals
- Sentiment analysis of purchase patterns
- Anomaly detection in spending
- Category inference beyond Plaid's
- Natural language summaries

### Questions to investigate
- OpenAI vs Claude vs Llama for transaction analysis
- Cost per transaction for LLM processing
- Latency requirements
- Fine-tuning on transaction data
- Privacy/security of sending financial data to LLMs

## 13. Cross-Transaction Intelligence

### Possibilities
- Purchase chains (coffee after gym)
- Complementary purchases (groceries + wine)
- Substitute detection (Starbucks vs Blue Bottle)
- Lifecycle tracking (furniture purchases = moving?)
- Seasonal patterns

### Questions to investigate
- How much history needed for patterns?
- Real-time vs batch processing
- Storage of derived insights

## Priority Research Questions

1. **Coverage mapping**: For each data type, what % of transactions will have it?
2. **Latency budget**: How fast must memory generation be?
3. **Privacy boundaries**: What's too creepy even if technically possible?
4. **Cost per transaction**: What's our budget for external API calls?
5. **Fallback strategy**: What's the minimum viable memory when data is sparse?

## Next Steps

Engineering team should:
1. Spike on Plaid's enhanced data to map actual coverage
2. Price out top 3 external APIs (maps, weather, merchant)
3. Test LLM transaction summarization with real data
4. Build proof-of-concept for email receipt parsing
5. Survey users on comfort with different data types

Design team needs:
- List of guaranteed vs maybe vs unlikely data types
- Latency constraints for memory generation
- Understanding of coverage gaps

## Magical Experience Ideas (No Limits)

### Dream Integrations
- Full photo library access with AI understanding what's in photos
- Voice transcription of thoughts right after purchase
- Apple Watch heart rate during purchase (stress shopping?)
- Screen recording of online shopping journey
- Social media activity correlation
- Spotify playing during purchase
- Calendar deep integration
- Messages/WhatsApp context around purchases
- Browser history leading up to purchase
- App usage patterns before/after
- Sleep data correlation with late-night purchases
- Fitness data (post-workout treat?)

### Wild Possibilities
- AR reconstruction of shopping moment
- AI-generated imagery of the moment (not just maps)
- Emotional state inference from multiple signals
- Future prediction based on purchase patterns
- Parallel universe ("what if you hadn't bought this")
- Purchase journey visualization
- Time travel view (see all December purchases across years)
- Relationship mapping (purchases with specific people)
- Dream analysis of spending patterns

## Open Questions

- Should memories be generated real-time or batch processed?
- How do we handle transactions with zero context available?
- What's our stance on storing derived insights vs regenerating?
- Can we build this incrementally or does it need critical mass?
- How do we measure if a memory "worked"?
- How far can we push device permissions for magic?
- What would we build if privacy wasn't a concern?
- What needs on-device vs cloud processing?