# Kane Simulations

Synthetic personas to explore how Kane would help different types of people understand their spending patterns.

## The Personas

### 1. [Creative Paralysis - Sarah Chen](01-creative-paralysis/)
28, Portland. Marketing manager spending $400/month maintaining a creative identity she's not actively using. Subscriptions as psychological safety valves.

### 2. [Optimization Obsession - Marcus Thompson](02-optimization-obsession/)
34, Austin. Senior engineer who's turned life into metrics. Spending more time tracking than living. The optimization has become the problem.

### 3. [Identity Juggler - Priya Patel](03-identity-juggler/)
31, Brooklyn. Product designer maintaining three parallel identities through parallel subscriptions. Can't choose because choosing feels like losing.

### 4. [Success Theater - James Kim](04-success-theater/)
26, San Francisco. First tech job, performing success for an imagined audience. Every purchase optimized for story value, not actual enjoyment.

### 5. [Transition Chaos - Alex Rodriguez](05-transition-chaos/)
38, Denver. Left corporate for startup, family of three. Spending chaos reflects identity chaos - luxury items next to extreme budgeting.

### 6. [The Reluctant Host - Neal](06-neal-generous-investor/) **(Real Data)**
30s, San Francisco. Techstars MD making $220k/year but marking professional dinners as "kills" because he'd rather be cooking for people at home. The money reveals the gap between obligation and aspiration.

## How to Use These

### For Design Exploration
Each persona has patterns that would create different Kane experiences:
- Sarah needs to see the gap between creative identity and creative action
- Marcus needs to see that optimization has become procrastination  
- Priya needs permission to choose what she's already choosing
- James needs to discover his own definition of success
- Alex needs clarity on new values vs old identity

### For Testing Conversations
Use the `kane-interview` command to practice conversations with each persona. Focus on:
- What questions unlock understanding?
- What patterns do they not see?
- What insights create "aha" moments?
- What small changes could cascade?

### For Feature Development
Each persona suggests different features:
- **Sarah:** Creative time tracking vs creative spending tracking
- **Marcus:** "What are you optimizing for?" goal clarification
- **Priya:** Identity consolidation visualization
- **James:** Authentic vs performed spending analyzer
- **Alex:** Family values alignment tools

## Adding Transactions

To add transaction data for any persona:
1. Create a `transactions.csv` in their folder
2. Include: date, amount, merchant, category, notes
3. Make transactions reflect their patterns:
   - Sarah: Sunday night course purchases after hard weeks
   - Marcus: Optimization tool purchases on lonely Saturdays
   - Priya: Context-switching costs between identities
   - James: Thursday cocktails he doesn't enjoy
   - Alex: Whiplash between frugality and splurging

## Key Insight

Each persona's spending problem isn't really about money - it's about identity, meaning, and becoming. Kane's job is to reveal this through the money lens, creating understanding that leads to natural change.

## Next Steps

1. Generate transaction data for each persona
2. Run simulated Kane interviews
3. Design custom visualizations for each pattern type
4. Test what interventions create change
5. Build features that address these universal patterns