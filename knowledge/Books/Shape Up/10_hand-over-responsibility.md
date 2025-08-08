# Chapter 10: Hand Over Responsibility

**Book:** Shape Up  
**Section:** Part 3 - Building  
**Mental Model:** Team Dynamics  
**Tags:** #autonomy #responsibility #team-empowerment #trust #ownership

## The Core Philosophy

Teams are given full responsibility for the entire project within the boundaries of the pitch. Instead of assigning tasks, we hand over shaped work and trust teams to define their own approach, make trade-offs, and deliver a complete solution.

**The fundamental principle:** "We don't start by assigning tasks to anyone. Nobody plays the role of the 'taskmaster' or the 'architect' who splits the project up into pieces for other people to execute."

## Mental Model: Whole Projects vs. Task Lists

**Traditional Thinking:** Managers break down work and assign tasks to team members

**Shape Up Thinking:** Teams take ownership of entire projects and define their own tasks

### The Problem with Task Assignment

"Splitting the project into tasks up front is like putting the pitch through a paper shredder. Everybody just gets disconnected pieces. We want the project to stay 'whole' through the entire process so we never lose sight of the bigger picture."

## The Power of Full Responsibility

### Team Empowerment

"Teams love being given more freedom to implement an idea the way they think is best. Talented people don't like being treated like 'code monkeys' or ticket takers."

### Better Outcomes

"Projects also turn out better when the team is given responsibility to look after the whole."

Why this works:
- Nobody can predict all the pieces needed upfront
- Paper designs never work exactly in practice
- Real workers are best positioned to make adjustments
- Teams can spot missing pieces during implementation

### The Blindness Problem

"When teams are assigned individual tasks, each person can execute their little piece without feeling responsible for judging how all the pieces fit together. Planning up front makes you blind to the reality along the way."

## The Right Level of Direction

### Not Absolute Freedom

"Remember: we aren't giving the teams absolute freedom to invent a solution from scratch."

What's already done:
- We've done the shaping
- We've set the boundaries
- We've defined the core elements
- We've identified key risks

"Now we are going to trust the team to fill in the outline from the pitch with real design decisions and implementation."

### The Payoff

"This is where our efforts to define the project at the right level of abstraction—without too much detail—will pay off. With their talent and knowledge of the particulars, the team is going to arrive at a better finished product than we could have by trying to determine the final form in advance."

## Done Means Deployed

### The Shipping Constraint

"At the end of the cycle, the team will deploy their work."

For Small Batch teams:
- Deploy each project as they see fit
- Must happen before cycle ends
- Team manages own schedule

### Why This Matters

"This constraint keeps us true to our bets and respects the circuit breaker. The project needs to be done within the time we budgeted; otherwise, our appetite and budget don't mean anything."

### Including QA

"That also means any testing and QA needs to happen within the cycle."

How teams accommodate:
- Scope off most essential aspects
- Finish core features early
- Coordinate with QA
- Leave time for integration

### What's Not Required

"For most projects we aren't strict about the timing of help documentation, marketing updates, or announcements to customers and don't expect those to happen within the cycle."

Why these can wait:
- Thin-tailed from risk perspective
- Never take 5x longer than expected
- Mostly handled by other teams
- Often done during cool-down

## Kick-off

### Setting Up

"We start the project by creating a new Basecamp project and adding the team to it."

First steps:
1. Create project space
2. Add team members
3. Post shaped concept to Message Board
4. Either original pitch or distilled version

### The Kick-off Call

"Since our teams are remote, we use the chat room in the Basecamp project to arrange a kick-off call."

Purpose:
- Team asks important questions
- Clarify anything unclear from write-up
- Gain rough understanding
- Get ready to start

## Getting Oriented

### The Quiet Period

"Work in the first few days doesn't look like 'work.' No one is checking off tasks. Nothing is getting deployed. There aren't any deliverables to look at."

What's really happening:
- Learning how existing system works
- Finding best starting points
- Getting oriented to the codebase
- Understanding the problem space

"Often there isn't even much communication between the team in the first few days. There can be an odd kind of radio silence."

### Why This Is Normal

"Because each person has their head down trying to figure out how the existing system works and which starting point is best. Everyone is busy learning the lay of the land and getting oriented."

### Management's Role

"It's important for managers to respect this phase."

What not to do:
- Interfere with questions
- Ask for status too early
- Demand visible progress
- Create pressure for activity

Why patience matters:
- Teams can't dive in immediately
- Need to acquaint with relevant code
- Must think through the pitch
- Exploration must happen anyway

"Asking for visible progress will only push it underground. It's better to empower the team to explicitly say 'I'm still figuring out how to start' so they don't have to hide or disguise this legitimate work."

### When to Check In

"Generally speaking, if the silence doesn't start to break after three days, that's a reasonable time to step in and see what's going on."

## Imagined vs. Discovered Tasks

### The Task Discovery Process

"Since the team was given the project and not tasks, they need to come up with the tasks themselves."

Two types of tasks:

**Imagined Tasks:**
- What teams think they'll need to do
- Based on initial understanding
- Assumed from thinking about problem

**Discovered Tasks:**
- Found during real work
- Make up true bulk of project
- Often present hardest challenges
- Can't be known in advance

### Examples of Discovery

**Design Discovery:**
"The designer adds a new button on the desktop interface but then notices there's no obvious place for it on the mobile webview version."
- New task: Figure out mobile button placement

**Content Discovery:**
"The first pass of the design has good visual hierarchy, but then the designer realizes there needs to be more explanatory copy in a place that disrupts the layout."
- New tasks: Change layout, write copy

**Technical Discovery:**
"Suppose a programmer is working on a database migration. While looking at the model to understand the associations, she might run into a method that needs to be updated for a different part of the project later."
- New task: Update that method

### The Key to Discovery

"The way to really figure out what needs to be done is to start doing real work. That doesn't mean the teams start by building just anything."

Requirements for first work:
- Pick something meaningful
- Central to the project
- Small enough for end-to-end completion
- Working UI and working code
- Completable in a few days

## Decision-Making Framework

For teams taking responsibility:
1. **What's central to this project?** Start there
2. **What can we build end-to-end quickly?** For early momentum
3. **What are we discovering?** Track new tasks
4. **Are we staying whole?** Not fragmenting the project
5. **Can we ship on time?** Scope accordingly

## Real-World Application

### For Managers
- Hand over shaped work, not task lists
- Respect the orientation period
- Don't demand early status updates
- Trust teams to find their way

### For Teams
- Embrace ownership of the whole
- Expect quiet exploration time
- Communicate if stuck after 3 days
- Track both imagined and discovered tasks

### For Designers
- You define the design approach
- Work within pitch boundaries
- Collaborate on technical constraints
- Own the user experience

### For Programmers
- You choose implementation details
- Identify technical risks early
- Collaborate on feasibility
- Own the technical solution

## Key Insight

"Nobody can predict at the beginning of a project what exactly will need to be done for all the pieces to come together properly. What works on paper almost never works exactly as designed in practice. The designers and programmers doing the real work are in the best position to make changes and adjustments or spot missing pieces."

## Related Concepts

- **Get One Piece Done** (Chapter 11) - How teams start building
- **Map the Scopes** (Chapter 12) - Organizing discovered work
- **Principles of Shaping** (Chapter 2) - Why abstraction enables autonomy
- **The Circuit Breaker** (Chapter 8) - Why responsibility includes shipping