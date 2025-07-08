# Chapter 6: Write the Pitch

**Book:** Shape Up  
**Section:** Part 1 - Shaping  
**Mental Model:** Shaping Work  
**Tags:** #pitching #communication #documentation #shaping #betting-table

## The Core Philosophy

A pitch transforms the shaped concept from rough sketches and private understanding into a formal presentation that others can evaluate and bet on. It captures both the work done so far and presents it in a form that enables informed decision-making.

**The key principle:** "The purpose of the pitch is to present a good potential bet. It's basically a presentation. The ingredients are all the things that we need to both capture the work done so far and present it in a form that will enable the people who schedule projects to make an informed bet."

## Mental Model: Complete Package Thinking

**Traditional Thinking:** Present either just problems or just solutions

**Shape Up Thinking:** Always present problem and solution together as a complete package

### Why Both Are Essential

"It's critical to always present both a problem and a solution together. It sounds like an obvious point but it's surprising how often teams, our own included, jump to a solution with the assumption that it's obvious why it's a good idea to build this thing."

Without a problem:
- No basis for evaluating the solution
- Discussions devolve into UI preference debates
- Can't judge fitness between alternatives

Without a solution:
- It's just unshaped work
- Pushes research down to wrong level
- Misaligned skillsets, time limits, and risk profiles

## The Five Essential Ingredients

### 1. Problem
"The raw idea, a use case, or something we've seen that motivates us to work on this"

**Purpose:**
- Establishes basis for evaluation
- Enables fitness testing
- Separates demand discussion from solution quality

**Best Practice:**
- Single specific story showing why status quo fails
- Provides baseline to test solutions against
- Helps weigh solution against this specific problem

### 2. Appetite
"How much time we want to spend and how that constrains the solution"

**Purpose:**
- Prevents unproductive conversations
- Makes appetite another part of problem definition
- Creates partnership in constraint-based design

**Key Point:**
"There's always a better solution. The question is, if we only care enough to spend two weeks on this now, how does this specific solution look?"

### 3. Solution
"The core elements we came up with, presented in a form that's easy for people to immediately understand"

**Critical Balance:**
- More concrete than shaping sketches
- Not so detailed as to over-specify
- Help people "get it" without prior context

### 4. Rabbit Holes
"Details about the solution worth calling out to avoid problems"

**Examples:**
- Technical approach decisions
- Specific implementation constraints
- Patches for identified risks

### 5. No-gos
"Anything specifically excluded from the concept: functionality or use cases we intentionally aren't covering to fit the appetite or make the problem tractable"

## Helping People See It

### The Visualization Challenge

"We need to stay high level, but add a little more concreteness than when we worked alone or with a partner. People who read the pitch and look at the drawings without much context need to 'get' the idea."

### Finding the Right Level

**Too Abstract:** Hand-written breadboards with "you had to be there" quality

**Too Concrete:** Wireframes or high-fidelity mocks that box in designers

**Just Right:** Embedded sketches and annotated fat markers

## Technique: Embedded Sketches

When breadboards alone aren't clear enough, selectively add visual detail:

### Example Progression
1. **Original breadboard** - Words and arrows
2. **Unclear placement** - Where do affordances go?
3. **Fat marker clarification** - Shows placement without over-specifying

"This is an example of selectively getting into more visual detail because we need it to sell the concept. Fortunately, we won't need to make as many visual decisions in other parts of the concept. This was a 'linchpin' part of the design that everybody had to see concretely in order to 'get' it."

### The Trade-off
"The downside is we've gotten into some layout decisions that would have been nice to avoid. Designers should feel free to find a different design than the box divided with a vertical line. We'd add a disclaimer here in the pitch that reminds designers of the latitude they should take."

## Technique: Annotated Fat Marker Sketches

"Sometimes ideas are inherently visual or a little too complicated to express in a schematic breadboard. Fat marker sketches can be very effective in a pitch; you just need to take more care to label them cleanly."

### Best Practices
- Redraw on iPad with fat brush size
- Use different colors for labels vs. sketches
- Add call-outs for specific elements
- Keep annotations clear and separate

## Communicating Rabbit Holes

"Sometimes addressing a rabbit hole just requires a few lines of text."

### Example
In the Payment Form project, shapers specified:
- URLs would never live on custom domains for v1
- Not central to concept but patches potential confusion
- Prevents team from going down complex path

## Communicating No-gos

"If there's anything we're not doing in this concept, it's good to mention it here."

### Example
Payment Form project explicitly excluded:
- WYSIWYG editing of the form
- Only logo and header text customization allowed
- Important given the appetite constraints

"WYSIWYG might be better in some peoples' eyes, but given the appetite it was important to mark this as a no-go."

## Real Pitch Examples

### To-Do Groups Pitch
- **Problem:** Screenshots showing workaround behavior
- **Solution:** Fat marker sketches of main ideas
- **Rabbit holes:** Motivated specific sketch decisions

### Notifications Pitch  
- **Problem:** Two videos demonstrating the issue
- **Solution:** Fat marker sketch and breadboard
- **Support:** Data visualizations backing trade-offs

## The Presentation Process

### Asynchronous by Default

"We prefer asynchronous communication by default and escalate to real-time only when necessary. This gives everyone the maximum amount of time under their own control for doing real work."

### Benefits
- Keeps betting table short and productive
- Allows thoughtful consideration
- Enables better preparation
- Respects everyone's time

### The Flow
1. Post write-up where stakeholders can read
2. Allow time for independent review
3. Use betting table for decision, not education
4. Keep live pitch ready if needed

## Implementation in Basecamp

### Technical Details
- Post as Messages in Basecamp
- Use "Pitch" Message Category for easy finding
- Post to Product Strategy team
- Include sketches as screenshots from iPad
- Use captions to explain images in flow

### Engagement Pattern
"People comment on the pitch asynchronously. Not to say yes or no — that happens at the betting table — but to poke holes or contribute missing information."

## Decision-Making Framework

When writing a pitch, ensure:
1. **Is the problem crystal clear?** Single story that shows the need?
2. **Is the appetite explicit?** No ambiguity about time investment?
3. **Can people visualize the solution?** Without being over-specified?
4. **Are rabbit holes documented?** So teams don't get surprised?
5. **Are no-gos clear?** So scope doesn't expand?

## Common Pitfalls

### Solution Without Problem
"Add tabs to the iPad app" might excite designers but provides no evaluation criteria

### Problem Without Solution
"We really need to make it easier to find things" isn't ready to bet on

### Over-specification
Detailed wireframes that remove designer autonomy

### Under-communication
Assuming people will understand context they don't have

## Real-World Application

### For Shapers
- Always include all five ingredients
- Test comprehension with someone unfamiliar
- Add just enough visual detail to communicate
- Document discussions with technical experts

### For Betting Table Members
- Read pitches before the meeting
- Evaluate problem-solution fit
- Consider appetite appropriateness
- Ask about unclear elements asynchronously

### For Future Teams
- Pitches become project kick-off documents
- Reference for understanding boundaries
- Source of truth for what's in/out of scope

## Key Insight

"Establishing the problem also lets us have a cleaner conversation later when it's time to pitch the idea or bet on it. The solution might be perfect, but what if the problem only happens to customers who are known to be a poor fit to the product?"

## Related Concepts

- **Set Boundaries** (Chapter 3) - Defining appetite and problem
- **Find the Elements** (Chapter 4) - Creating the solution to pitch
- **Risks and Rabbit Holes** (Chapter 5) - What to document
- **The Betting Table** (Chapter 8) - Where pitches go next