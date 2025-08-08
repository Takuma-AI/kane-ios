# Chapter 9: Place Your Bets

**Book:** Shape Up  
**Section:** Part 2 - Betting  
**Mental Model:** Product Development Modes  
**Tags:** #betting #product-modes #r-and-d #production-mode #cleanup #existing-products #new-products

## The Core Philosophy

Different stages of product development require different approaches to shaping, betting, and building. By recognizing where we are in a product's lifecycle, we can set appropriate expectations and adapt our process to maximize success.

**The key insight:** "Depending on whether we're improving an existing product or building a new product, we're going to set different expectations about what happens during the six-week cycle."

## Mental Model: Product Development Modes

**Traditional Thinking:** One process fits all product development

**Shape Up Thinking:** Different modes for different stages of product life

### The Three Modes for New Products

1. **R&D Mode** - Exploration and foundation
2. **Production Mode** - Systematic building
3. **Cleanup Mode** - Final polish before launch

## Existing Products

### The Standard Process

"When we add features to an existing product, we follow the standard Shape Up process: shape the work, bet on it, and give it to a team to build. We expect the team to finish and ship some version of the shaped work by the end of the cycle."

### The Furniture Metaphor

"On an existing product, all of the existing code and design that isn't going to change defines a kind of empty space that the new feature will fit into. Shaping and building is like crafting a piece of furniture for a house that is already built."

Key characteristics:
- Clear boundaries defined by existing system
- Known integration points
- Established patterns to follow
- Ship directly to customers

## New Products: A Different Beast

### The Foundation Problem

"Whereas adding to an existing product is like buying a couch for a room with fixed dimensions, new product development is like figuring out where the walls and the foundation should go so the building will stand."

### Three Distinct Phases

New products evolve through phases over multiple cycles, but we still only bet one cycle at a time.

## R&D Mode

### When We Don't Know What We Want

"At the very earliest stages of a new product, our idea is just a theory or a glimmer. We don't know if the bundle of features we imagine will hold together in reality, and the technical decisions about how to model them in code are even less clear."

### Characteristics of R&D Mode

**Lots of Scrapwork:**
- Might abandon approaches mid-cycle
- Try multiple directions
- Learn by building
- Can't predict outcomes

**Different Shaping:**
"We can't reliably shape what we want in advance and say: 'This is what we want. We expect to ship it after six weeks.' We have to learn what we want by building it."

### Three Key Adjustments

**1. Fuzzy Betting**
"Instead of betting on a well-shaped pitch, we mainly bet the time on spiking some key pieces of the new product idea. The shaping is much fuzzier because we expect to learn by building."

**2. Senior Staffing**
"Rather than delegating to a separate build team, our senior people make up the team."

Why seniors:
- Can't delegate when you don't know what you want
- Architectural decisions determine future possibilities
- Need vision holders making long-term judgments
- "They define the 'holes' that future features fit into"

Example team: "David (CTO) takes the programming role and works with Jason (CEO and designer) or a senior designer with Jason's guidance."

**3. Different Expectations**
"We don't expect to ship anything at the end of an R&D cycle. The aim is to spike, not to ship."

Best case outcomes:
- Some UI and code committed as foundation
- Learn what works
- Commit to load-bearing structures
- Define main code and UI decisions

### Staying Flexible

"We can't ship anything to customers with just a single cycle of R&D work. But we still don't commit to more than one cycle at a time."

Cycle-by-cycle decisions:
- Might not be ready to tackle product
- Might discover intuition was correct
- Continue based on warming confidence
- Always option to pivot or pause

## Production Mode

### When Structure Exists

"If we continue to get warmer after some R&D cycles, we'll eventually reach a point where the most important architectural decisions are settled. The product does those few essential things that define it, and the foundation is laid for the dozens of other things we'll have to do before we can ship to customers."

### The Flip to Formal Process

"This is the flip to production mode, where we work in formal cycles with clear-cut shaping, betting, and building phases."

Key change: "Production mode is like working on an existing product: the precedent set by the R&D work enables new contributors to identify where new functionality belongs and how it fits into the whole."

### Three Production Mode Characteristics

**1. Deliberate Shaping**
"Shaping is deliberate again. The shaped work describes what we expect to see at the end of the cycle."

**2. Expanded Teams**
"The team that builds the projects is no longer limited to the senior group. It becomes possible to bet multiple teams in parallel (if you have them) and cover more ground."

**3. Shipping Goals**
"Shipping is the goal, not spiking. But because the product isn't publicly available to customers yet, we define 'shipping' differently. Shipping means merging into the main codebase and expecting not to touch it again."

### Maintaining Flexibility

"Since we aren't shipping to customers at the end of each cycle, we maintain the option to remove features from the final cut before launch."

Benefits:
- Can still be experimental
- Bet six weeks without knowing final inclusion
- Risk cycle to take best swing
- Set clear expectations with teams

## Cleanup Mode

### The Final Push

"In the final phase before launching the new product, we throw all structure out the window. We call this cleanup mode. It's a free-for-all."

### Why Cleanup Is Necessary

"There are always things we forget, things we miss, details that aren't right, and bugs that creep in over the course of the R&D and production mode cycles."

The launch button effect:
"There's something about putting your finger near the launch button that makes your hair stand up. Everything suddenly gets 'real.' Things we dismissed before pop out at us with new importance."

### Cleanup Characteristics

**1. No Shaping**
"The cycle is closer in spirit to the 'bug smash.' Leadership stands at the helm throughout the cycle, calling attention to what's important and cutting away distractions."

**2. No Team Boundaries**
"There aren't clear team boundaries. Everyone jumps in to help however they can."

**3. Continuous Shipping**
"Work is 'shipped' (merged to the main codebase) continuously in as small bites as possible."

### Discipline Still Matters

"We have to check ourselves to make sure these are must-haves we're working on, not just our cold feet begging us to delay launch."

Duration: "Cleanup shouldn't last longer than two cycles."

### Final Cut Decisions

"Cleanup is also the phase where leadership makes those 'final cut' decisions."

Benefits of cutting:
- Smaller surface area for V1
- Fewer questions to answer
- Less to support
- Less commitment to maintain indefinitely

"Sometimes we need to see all the features working as a whole to judge what we can live without and what might require deeper consideration before shipping it to customers."

## Examples

### The Dot Grid Calendar (Existing Product)
- Built for Basecamp (existing product)
- Shaped project → bet six weeks → team built → shipped to customers
- Standard process worked perfectly

### HEY Email App (New Product)
Timeline:
- **Year 1:** R&D mode exploration
- **Year 2:** Production mode with all teams
- **Final:** Two cycles of cleanup
- **Result:** Launched July 2020

Team evolution:
- Started with Jason (CEO), David (CTO), Jonas (senior designer)
- Explored wide variety of ideas
- Nearly a year to settle on core
- Expanded to all Basecamp teams for production

Betting approach:
"Every bet on HEY was placed one at a time. The betting table didn't know they would be working on HEY for two years during those first few R&D cycles."

### Hill Charts (Experimental Feature)
- Existing product (Basecamp)
- Too experimental for direct customer release
- Treated like production mode on new product
- First version: functional enough for internal use
- Second cycle: rounded out and shipped

"This was a risk: we bet one cycle, not two. If it didn't work out, we'd scrap it."

## Questions at the Betting Table

### Does the Problem Matter?

"Just like in pitch write-ups, we always take care to separate problem and solution. The solution doesn't matter if the problem isn't worth solving."

Weighing problems:
- All customer problems matter
- Must choose due to limited time
- Consider support burden
- Evaluate business impact

Sometimes complexity invites problem questioning:
- Do we need so many changes?
- Is the problem specific enough?
- Can we narrow for 80/20 benefit?

### Is the Appetite Right?

Even well-shaped work might not be worth the time.

Negotiation directions:

**1. Better Problem Articulation**
- "When it does happen, people are so vocal it tarnishes perception"
- "Support has to go through 11 time-consuming steps"

**2. Hidden Objections**
- "How would you feel if we could do it in two weeks?"
- Might reveal technical concerns
- "I don't want another dependency there"

**3. Let It Go**
- If interest too low

**4. Back to Drawing Board**
- Smaller version for shorter appetite
- More research if problem compelling

### Is the Solution Attractive?

Interface real estate example:
"A button in the corner of the home page might perfectly solve the problem. But that real estate is valuable. If we give it up now, we won't be able to use it in the future."

Avoiding design discussions:
"If we catch ourselves spending too much time in the weeds we'll remind ourselves 'okay, we're not doing design here' and move back up to the high level."

### Is This the Right Time?

Timing factors:
- Too long since newsworthy features
- Too many new features, need fixes
- Team morale from variety
- Market conditions
- Competitive landscape

"Those are all reasons that we might pass on a project even though it's perfectly well shaped and valuable. The project's great; it's just not the right time."

### Are the Right People Available?

"We choose who specifically will play which role on each team."

Factors:
- Project expertise requirements
- Recent work variety for individuals
- Skill balance (front-end vs. back-end)
- Scope hammering abilities
- Vacation schedules

Alternative model: "Some other companies let team members choose which projects they want to work on. Culturally, we are too meeting-averse for this extra step."

## The Kick-off Message

"After the bets are made, someone from the betting table will write a message that tells everyone which projects we're betting on for the next cycle and who will be working on them."

## Decision-Making Framework

When placing bets, consider:
1. **Where are we?** Existing product or new?
2. **What mode fits?** R&D, production, or cleanup?
3. **Who should work on this?** Seniors or full teams?
4. **What's the expectation?** Ship, spike, or clean?
5. **How does this fit our trajectory?** Right time and place?

## Key Insight

"We've noticed three phases of work when we build a new product from scratch. In each phase, the way that we shape and our expectations for how the team will work together during the cycle are different. These phases unfold over the course of multiple cycles, but we still only bet one cycle at a time."

## Related Concepts

- **The Betting Table** (Chapter 8) - Where these decisions are made
- **R&D Mode** (This chapter) - Special case for exploration
- **Hand Over Responsibility** (Chapter 10) - Different in each mode
- **Cleanup Mode** (This chapter) - Pre-launch intensity