# Chapter 8: The Betting Table

**Book:** Shape Up  
**Section:** Part 2 - Betting  
**Mental Model:** Time & Cycles  
**Tags:** #betting-table #cycles #cool-down #team-structure #circuit-breaker

## The Core Philosophy

The betting table is where leadership meets to decide what gets built in the next six-week cycle. By standardizing cycle length, team structures, and decision-making processes, the betting table transforms from a resource battle into a strategic planning session.

**The fundamental principle:** "Working in cycles drastically simplifies project planning. A cycle gives us a standard project size both for shaping and scheduling."

## Six-Week Cycles

### Why Six Weeks?

**Too Short - Two Weeks:**
- "Two weeks is too short to get anything meaningful done"
- "Extremely costly due to the planning overhead"
- Not worth collective hours around table for "sprint planning"
- Breaks everyone's momentum to constantly re-group

**Just Right - Six Weeks:**
- "Long enough to finish something meaningful"
- "Short enough to see the end from the beginning"
- Deadline feels real from day one
- Natural pressure creates good trade-offs

"After years of experimentation we arrived at six weeks. Six weeks is long enough to finish something meaningful and still short enough to see the end from the beginning."

### The Psychology of Deadlines

"People need to feel the deadline looming in order to make trade-offs. If the deadline is too distant and abstract at the start, teams will naturally wander and use time inefficiently until the deadline starts to get closer and feel real."

## Cool-down

### The Breathing Room

"If we were to run six-week cycles back to back, there wouldn't be any time to breathe and think about what's next."

Problems with back-to-back cycles:
- End of cycle is worst time to plan
- Everyone busy finishing projects
- Last-minute decisions consuming attention
- No time for strategic thinking

### The Two-Week Cool-down

After each six-week cycle:
- No scheduled work
- Meet as needed
- Consider what to do next
- Programmers and designers control their time

### How Teams Use Cool-down

"After working hard to ship their six-week projects, they enjoy having time that's under their control."

Common activities:
- Fix bugs
- Explore new ideas
- Try technical possibilities
- Address personal bug lists
- Recover from intense cycle

## Team and Project Sizes

### Standard Team Structures

**Team Composition:**
- One designer and two programmers, OR
- One designer and one programmer
- QA person joins for integration testing later

**Project Types:**

**Big Batch:** 
- Entire cycle on one project
- Full six weeks
- Single focused deliverable

**Small Batch:**
- Multiple smaller projects
- Usually 1-2 weeks each
- Team juggles scheduling
- All must ship before cycle ends

"Small batch projects aren't scheduled individually. It's up to the small batch team to figure out how to juggle the work so they all ship before the end of the cycle."

## The Betting Table Meeting

### Who's Present

"Our betting table at Basecamp consists of the CEO (who in our case is the last word on product), CTO, a senior programmer, and a product strategist (myself)."

### The Atmosphere

Key characteristics:
- C-level time in small slices
- "Waste no time" atmosphere
- Rarely longer than 1-2 hours
- Everyone studied pitches beforehand
- Ad-hoc conversations established context

### The Output

"The output of the call is a cycle plan."

Factors considered:
- Who's available
- Business priorities
- Recent work balance
- Team preferences

### The Authority

"The highest people in the company are there. There's no 'step two' to validate the plan or get approval. And nobody else can jump in afterward to interfere or interrupt the scheduled work."

Why top-level buy-in matters:
- Enables proper cycle execution
- Prevents interruptions
- Ensures strategic alignment
- Gives C-suite "hands on the wheel" feeling

## Mental Model: Bets vs. Plans

### Why "Betting" Language Matters

**1. Bets Have a Payout**
- "We're not just filling a time box with tasks"
- "We're not throwing two weeks toward a feature and hoping"
- Shaped work has meaningful finish line
- Pitch defines specific expected outcome

**2. Bets Are Commitments**
- Six weeks means six weeks exclusively
- No interruptions allowed
- Not optimizing every hour
- Looking at bigger picture progress

**3. Bets Have Capped Downside**
- "If we bet six weeks on something, the most we can lose is six weeks"
- No multiples of original estimate
- Known maximum cost
- Prevents runaway projects

## Uninterrupted Time

### The Sacred Commitment

"It's not really a bet if we say we're dedicating six weeks but then allow a team to get pulled away to work on something else."

### The Cost of Interruptions

"When you pull someone away for one day to fix a bug or help a different team, you don't just lose a day. You lose the momentum they built up and the time it will take to gain it back."

The real impact:
- "Losing the wrong hour can kill a day"
- "Losing a day can kill a week"
- Momentum is second-order, like acceleration
- Can't be measured in simple time units

### Handling Emergencies

"What if something comes up during that six weeks?"

The approach:
- Still don't interrupt the team
- Maximum wait is six weeks
- If still important, bet next cycle
- True crises are very rare

"If it's a real crisis, we can always hit the brakes. But true crises are very rare."

## The Circuit Breaker

### No Extensions by Default

"Teams have to ship the work within the amount of time that we bet. If they don't finish, by default the project doesn't get an extension."

This sounds severe but provides crucial benefits.

### Benefit 1: Prevents Runaway Projects

"We defined our appetite at the start when the project was shaped and pitched. If the project was only worth six weeks, it would be foolish to spend two, three or ten times that."

- Very few projects are "at all costs" type
- Protects system from overload
- Preserves capacity for new opportunities

### Benefit 2: Forces Better Shaping

"If a project doesn't finish in the six weeks, it means we did something wrong in the shaping."

Instead of extending:
- Use next shaping cycle to reframe
- Find better approach
- Avoid the rabbit hole from first attempt
- Make informed decision about re-betting

### Benefit 3: Motivates Ownership

"The circuit breaker motivates teams to take more ownership over their projects."

Teams must:
- Make trade-offs about implementation
- Choose where to cut scope
- Decide what to compromise
- Define what to leave out

"A hard deadline and the chance of not shipping motivates the team to regularly question how their design and implementation decisions are affecting the scope."

## Handling Bugs

### Questioning Assumptions

"First we should step back and question our assumptions about bugs. There is nothing special about bugs that makes them automatically more important than everything else."

Key principle:
"The mere fact that something is a bug does not give us an excuse to interrupt ourselves or other people."

### Bug Reality

"All software has bugs. The question is: how severe are they?"

**Real crises (rare):**
- Data loss
- App grinding to halt
- Major customer-facing errors
- Drop everything to fix

**Most bugs:**
- Can wait six weeks or longer
- Many don't need fixing at all
- Part of software reality

"If we tried to eliminate every bug, we'd never be done. You can't ship anything new if you have to fix the whole world first."

### Three Bug Strategies

**1. Use Cool-down**
- Programmers have lists of desired fixes
- Two weeks every six weeks adds up
- Significant time for improvements
- Respects the cycle boundaries

**2. Bring to Betting Table**
- Big bugs compete for cycle time
- Shape the solution
- Make deliberate resource decision
- Strategic rather than reactive

"Time should always be used strategically. There's a huge difference between delaying other work to fix a bug versus deciding up front that the bug is worth the time to fix."

**3. Schedule a Bug Smash**
- Once a year (often holidays)
- Whole cycle dedicated to bugs
- Good when people are traveling
- Team self-organizes priorities

## Keeping the Slate Clean

### One Cycle at a Time

"The key to managing capacity is giving ourselves a clean slate with every cycle. That means only betting one cycle at a time and never carrying scraps of old work over without first shaping and considering them as a new potential bet."

### Maximizing Future Options

"We don't know what will happen in the next six weeks. We don't know what brilliant idea will emerge or what urgent request might appear."

Benefits of clean slates:
- Respond to unexpected opportunities
- Learn from each cycle
- Adjust priorities based on reality
- No accumulating commitments

### Multi-Cycle Projects

"What about projects that just can't be done in one cycle?"

The approach:
- Still bet only six weeks
- Shape specific six-week target
- Something fully built and working
- Decide next steps based on results
- Keep options open to change course

"The important thing is that we always shape what the end looks like for that cycle and that we keep our options open to change course."

## Decision-Making Framework

At the betting table, consider:
1. **Are the right people available?** For these specific projects?
2. **What have we been doing lately?** Need balance?
3. **What do pitches promise?** Clear payouts defined?
4. **Can we commit fully?** No planned interruptions?
5. **What if it doesn't finish?** Acceptable loss?

## Real-World Application

### For Leadership
- Keep betting meetings short
- Review pitches beforehand
- Make firm commitments
- Resist post-bet interference

### For Managers
- Protect team's time fiercely
- Trust the circuit breaker
- Use cool-down strategically
- Shape bugs that need cycles

### For Teams
- Count on uninterrupted time
- Use circuit breaker as motivation
- Handle bugs in cool-down
- Focus on shipping within cycle

## Key Insight

"Momentum and progress are second-order things, like growth or acceleration. You can't describe them with one point. You need an uninterrupted curve of points."

## Related Concepts

- **Place Your Bets** (Chapter 9) - Different betting strategies
- **Hand Over Responsibility** (Chapter 10) - Why uninterrupted time matters
- **Decide When to Stop** (Chapter 14) - How circuit breaker drives decisions
- **Move On** (Chapter 16) - What happens after the cycle