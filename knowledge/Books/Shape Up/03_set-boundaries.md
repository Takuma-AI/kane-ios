# Chapter 3: Set Boundaries

**Book:** Shape Up  
**Section:** Part 1 - Shaping  
**Mental Model:** Time & Cycles  
**Tags:** #appetite #constraints #problem-definition #scope #time-boxing

## The Core Philosophy

Before diving into solutions, we must establish clear boundaries for our work. This means setting an "appetite"—how much time we're willing to spend—and narrowing down exactly what problem we're solving. These boundaries become creative constraints that guide the shaping process.

**The key insight:** "The conversation about building a feature always starts with a raw idea, like 'customers are asking for group notifications.' Before we all go down the rabbit hole discussing ways we can solve it, we should first set some broad terms on the discussion to make it productive."

## Mental Model: Appetite vs. Estimates

**Traditional Thinking:** Start with a design, then estimate how long it will take

**Shape Up Thinking:** Start with a time budget (appetite), then design to fit

### The Fundamental Shift
- **Estimates:** Design → Time
- **Appetite:** Time → Design

"An appetite is completely different from an estimate. Estimates start with a design and end with a number. Appetites start with a number and end with a design. We use the appetite as a creative constraint on the design process."

## Setting the Appetite

### Standard Appetites

**Small Batch:** 
- One designer + one or two programmers
- One or two weeks
- Batched together in a six-week cycle

**Big Batch:**
- Same team size
- Full six weeks

**Rare Cases:**
- Scope too big for six weeks
- Try to hammer down by narrowing problem
- Break off meaningful six-week piece if needed

### The Psychology of Appetite

Sometimes ideas excite us immediately—we need to temper that excitement by asking if it's worth the time. Other times, ideas feel like unwanted obligations—like the calendar request where "we don't particularly want to build one, but we do feel we need to do something."

The appetite helps in both cases:
- **Prevents overcommitment** to exciting but low-value ideas
- **Defines acceptable investment** for necessary but uninspiring work
- **Creates partnership** in finding solutions that fit constraints

## The Principle: Fixed Time, Variable Scope

This principle is "key to successfully defining and shipping projects."

### The Book Writing Analogy

"Take this book for an example. It's hard to ship a book when you can always add more, explain more, or improve what's already there. When you have a deadline, all of a sudden you have to make decisions. With one week left, I can choose between fixing typos or adding a new section to a chapter. That's the tension between time, quality, and scope."

### Why It Works
- **Forces trade-offs:** Limited time requires prioritization
- **Prevents perfection paralysis:** There's always a "better" version
- **Enables shipping:** Deadlines create decision pressure
- **Maintains quality:** Scope reduction preserves core value

## "Good" Is Relative

"There's no absolute definition of 'the best' solution. The best is relative to your constraints. Without a time limit, there's always a better version."

### The Hot Dog Principle
"The ultimate meal might be a ten course dinner. But when you're hungry and in a hurry, a hot dog is perfect."

### Design Implications
Different appetites lead to fundamentally different solutions:
- **Database columns** in the fancy version
- **Flat textarea** in the simple version
- **Redesigned landing page** for major feature
- **Hidden settings screen** for quick addition

"We can only judge what is a 'good' solution in the context of how much time we want to spend and how important it is."

## Responding to Raw Ideas

### The Default Response
"Our default response to any idea that comes up should be: 'Interesting. Maybe some day.' In other words, a very soft 'no' that leaves all our options open."

### Why This Matters
- **Too early to commit** without understanding implications
- **Avoid growing pile** of obligations
- **Keep options open** for new information
- **Prevent expectation setting** from early enthusiasm

### The Right Approach
"It's important to keep a cool manner and a bit of a poker face. We don't want to shut down an idea that we don't understand. New information might come in tomorrow that makes us see it differently."

## Narrowing Down the Problem

Beyond setting time boundaries, we need to understand what we're actually solving.

### Case Study: Permission Rules
**Raw request:** "More complex permission rules"  
**Potential appetite:** Six weeks

**Discovery:** Someone archived a file not knowing it would disappear for everyone  
**Real solution:** Warning on archive action  
**Actual appetite:** One day

"Instead of creating a rule to prevent some people from archiving, we realized we could put a warning on the archive action itself that explains the impact. That's a one-day change instead of a six-week project."

### The Key Question

Flip from "What could we build?" to "What's really going wrong?"

- What specific point breaks down?
- When does this problem occur?
- What is the user trying to accomplish?

## Case Study: Defining "Calendar"

### The Request
"Customers are asking for a calendar in Basecamp"

### The Problem with "Calendar"
- Could take six months to build properly
- Only 10% used calendars in previous versions
- Encompasses massive functionality:
  - Dragging and dropping events
  - Multi-day spanning
  - Multiple view scales
  - Duration editing
  - Color coding
  - Desktop vs. mobile differences

### The Investigation
"Instead of asking her why she wants a calendar and what it should look like, we asked her when she wanted a calendar. What was she doing when the thought occurred to ask for it?"

### The Discovery
**Situation:** Office with meeting rooms scheduled on a physical chalkboard  
**Problem:** Working from home, needed to check availability  
**Pain:** Drove to office in traffic, found no suitable slots  
**Actual need:** "See free spaces" not "do everything a calendar does"

### The Insight
"What we learned was that 'see free spaces' was the important thing for this use case, not 'do everything a calendar does.'"

This narrowed scope led to the Dot Grid solution that fit within a six-week appetite.

## Watch Out for Grab-bags

### What's a Grab-bag?
"When someone proposes something like 'redesign the Files section,' that's a grab-bag, not a project. It's going to be very hard to figure out what it means, where it starts, and where it ends."

### The 2.0 Warning
"A tell-tale sign of a grab-bag is the '2.0' label. We made the mistake in the past of kicking off a 'Files 2.0' project without really considering what that meant."

### What Happened
- Excitement overcame clear thinking
- No definition of "done"
- Project became a mess
- Required splitting into smaller, defined projects:
  - "Better file previews"
  - "Custom folder colors"

### Better Starting Points
**Instead of:** "Redesign the Files section"  
**Try:** "We need to rethink the Files section because sharing multiple files takes too many steps"

This enables productive questions:
- What's not working?
- In what context?
- What parts can stay the same?
- What specifically needs to change?

## Decision-Making Framework

Before moving to solutions, ensure you have:

1. **Raw idea** - The initial request or observation
2. **Appetite** - How much time this is worth
3. **Narrow problem definition** - What specifically goes wrong

Without all three, you're not ready to start shaping solutions.

## When to Walk Away

"If it's not critical now and we can't get our hands around the problem, we'll walk away from it and work on something else. Maybe in the future a new request or story will pop up that gives us better insight into the problem."

## Real-World Application

### For Product Managers
- Always establish appetite before designing
- Dig deeper into requests to find real problems
- Use customer stories to narrow scope
- Avoid grab-bag projects

### For Stakeholders
- Communicate problems, not just solutions
- Provide context about when problems occur
- Accept that appetite constrains solutions
- Understand "maybe someday" as default

### For Shapers
- Use appetite as creative constraint
- Design different solutions for different appetites
- Question surface requests to find root issues
- Break apart grab-bags into specific problems

## Key Insight

"Stating the appetite and embracing it as a constraint turns everyone into a partner in that process. Anybody can suggest expensive and complicated solutions. It takes work and design insight to get to a simple idea that fits in a small time box."

## Related Concepts

- **Principles of Shaping** (Chapter 2) - Working at the right abstraction level
- **Find the Elements** (Chapter 4) - Designing within boundaries
- **Write the Pitch** (Chapter 6) - Communicating appetite and problem
- **The Betting Table** (Chapter 8) - How appetite factors into bets