# Chapter 14: Decide When to Stop

**Book:** Shape Up  
**Section:** Part 3 - Building  
**Mental Model:** Building & Execution  
**Tags:** #scope-hammering #quality #trade-offs #shipping #constraints

## The Core Philosophy

Shipping on time requires actively deciding what's good enough and what can be cut. The fixed time box forces teams to make trade-offs between the ideal and the practical, developing judgment about when to stop improving and start shipping.

**The fundamental principle:** "You can't ship without making hard decisions about where to stop, what to compromise, and what to leave out."

## Mental Model: Comparing to Baseline

**Traditional Thinking:** Ship when it's "done" (perfect)

**Shape Up Thinking:** Ship when it's better than what exists

### The Baseline Standard

"Designers and programmers always want to do their best work. It doesn't matter if the end result is one notch or ten notches better than the current state—it should still be the best they can do, right?"

The reality check:
- Perfection is never achieved
- Time is always limited
- Better is good enough
- Progress over perfection

"The standard we apply is: Is it good enough for the baseline? Basecamp, in the example above, is the baseline."

## Limits Motivate Trade-offs

### The Power of Constraints

"Recall that the six-week bet has a circuit breaker—if the work doesn't get done, the project doesn't happen."

This creates positive pressure:
- Forces real decisions
- Prevents endless polishing
- Focuses on essentials
- Ships meaningful improvements

"Shipping on time motivates the team to regularly question how their design and implementation decisions are affecting the scope."

### The Variable Scope Principle

Remember from Chapter 3:
- Fixed time (six weeks)
- Variable scope (what ships)
- Quality maintained through smart cuts
- Core value preserved

## Scope Grows Like Grass

### The Natural Expansion

"Scope grows naturally. Scope creep isn't the right word. Scope is like grass. It grows by nature."

Why scope grows:
- Use cases multiply
- Edge cases appear
- Nice ideas emerge
- Refinements tempt

"The question is: Will we cut it down before time runs out?"

### The Constant Gardening

Like maintaining a lawn:
- Regular trimming needed
- Can't let it overgrow
- Some areas need more attention
- Always growing back

## Cutting Scope Isn't Lowering Quality

### The Quality Misconception

"We should never lower the quality bar. We should always ship something that's durable. But we can decide what to build and what to leave out."

The distinction:
- **Quality:** How well it works
- **Scope:** What it does
- Cut features, not craftsmanship
- Reduce surface, not standards

### Product Design as Scope Selection

"Making choices makes the product better. It makes the product better at some things instead of others. If we're not making trade-offs, we're not making decisions."

The three aspects of any project:
1. Time (fixed)
2. Quality (maintained)
3. Scope (variable)

"We should always hold quality constant and vary scope."

## Scope Hammering

### The Final Push

"We call this process scope hammering. It's the most forceful and the most deliberate phase of making decisions about the product."

When it happens:
- Final weeks of cycle
- Scopes mostly downhill
- Time pressure mounting
- Decisions become urgent

### Questions During Hammering

Team asks themselves:
- "Is this a 'must-have' or a 'nice-to-have'?"
- "How would we solve this if we only had two weeks?"
- "Could we ship without this?"
- "What happens if we don't do this?"
- "Is this part of the core idea?"

### The Focusing Effect

"As the deadline approaches, the team will feel the pressure and start to make harder decisions. You might hear them say 'How about if we don't do this?' or 'Do you think people will notice if we ship without that?'"

## QA Is for the Edges

### Timing QA Work

"QA can limit their attention to edge cases because the designers and programmers take responsibility for the basic quality of their work."

The QA timeline:
- Basic quality during build
- Team self-tests core flows
- QA comes in later
- Focus on edge cases
- Final cycle weeks

### The QA Compromise

"Sometimes the QA person will be too perfectionist and say 'this isn't ready to ship.' It can help to remind them 'This isn't the last time we can work on this.'"

Balance considerations:
- Critical bugs must be fixed
- Edge cases can wait
- Perfect isn't the goal
- Future cycles exist

## When to Extend a Project

### The Rare Exception

"In very rare cases, you might need to extend a project."

Valid reasons:
- Unexpected technical hurdle
- Critical integration discovered late
- Essential scope misunderstood
- True emergency

"But the circuit breaker ensures that by default, projects don't get extensions."

### The Decision Criteria

When considering extension:
1. Is the problem unsolvable in remaining time?
2. Is the project meaningless without this piece?
3. Have we exhausted scope cuts?
4. Is this truly exceptional?

"The option to extend should be used sparingly and with great caution."

## Examples of Scope Hammering

### The Notification Redesign

Original scope included:
- New notification design
- Real-time updates
- Custom preferences
- Email integration

What shipped:
- New notification design ✓
- Basic preferences ✓
- Real-time updates (cut)
- Email integration (simplified)

### The Calendar Feature

Started with:
- Monthly view
- Weekly view
- Daily view
- Drag and drop
- Color coding

Became:
- Two-month dot grid
- Read-only
- Click for details
- Ships on time

## Decision-Making Framework

When deciding what to cut:
1. **Is this core to the concept?** Must have
2. **Will users notice if missing?** Maybe keep
3. **Can we add it later?** Probably cut
4. **Does this affect basic function?** Keep it
5. **Is this polish or foundation?** Cut polish

## The Psychology of Stopping

### Why It's Hard

Stopping feels wrong because:
- Pride in craft
- Perfectionist tendencies
- Fear of criticism
- Comparison to ideals

### Why It's Necessary

Stopping on time matters because:
- Momentum is precious
- Teams need wins
- Users need improvements
- Perfect never ships

"There's always something else to improve. The question is: Does it need to be improved right now?"

## Real-World Application

### For Teams
- Start scope conversations early
- Use ~ notation proactively
- Cut whole scopes when needed
- Maintain quality bar always

### For Designers
- Design core experiences first
- Save polish for time permitting
- Accept good enough
- Focus on user value

### For Programmers
- Build robust core first
- Edge cases can wait
- Refactoring happens later
- Ship working code

### For Product Managers
- Support scope decisions
- Remind teams of baseline
- Protect time boundaries
- Celebrate what ships

## Key Insight

"Your work is better when you are forced to make trade-offs. Creative decisions are about saying no. Successfully completing a project means choosing where to stop. It's the difference between a painter that makes a masterpiece and a painter that never finishes."

## The Shipping Mindset

Shipping requires:
- Accepting imperfection
- Trusting future cycles
- Valuing progress
- Making hard choices
- Celebrating completion

"The best builders don't build everything. They build the right things. And the time box forces us to figure out what those right things are."

## Related Concepts

- **Fixed Time, Variable Scope** (Chapter 3) - The fundamental principle
- **Circuit Breaker** (Chapter 8) - Why deadlines matter
- **Map the Scopes** (Chapter 12) - Using ~ for nice-to-haves
- **Move On** (Chapter 15) - What happens after shipping