# Chapter 5: Risks and Rabbit Holes

**Book:** Shape Up  
**Section:** Part 1 - Shaping  
**Mental Model:** Shaping Work  
**Tags:** #risk-management #rabbit-holes #de-risking #technical-feasibility #shaping

## The Core Philosophy

Before we can bet on a shaped project, we need to identify and eliminate the risks that could derail it. This means looking for rabbit holes—technical unknowns, unsolved design problems, or misunderstood interdependencies—and either patching them or declaring them out of bounds.

**The fundamental insight:** "We're shaping work for a fixed time window. All it takes is one hole in the concept to derail that. If they run into an unanticipated problem that takes two weeks to solve, they just burned a third of the budget!"

## The Problem with Unforeseen Complexities

### When Shaping Goes Wrong

"We once bet on a project to redesign the way we present projects with clients on Basecamp's home screen. We assumed the designer would figure it out; we didn't do the work in the shaping phase to validate that a viable approach existed."

**Result:** 
- Harder problem than expected
- No suitable design solution found
- Six weeks wasted
- Project abandoned

### The Hidden Time Bombs

Sometimes problems don't just delay projects—they have no apparent solution. Without proper de-risking, teams can:
- Hit walls with no way forward
- Burn significant time on dead ends
- Lose confidence in the process
- Fail to ship despite best efforts

## Mental Model: Probability Distributions of Risk

**Traditional Thinking:** All unknowns are acceptable; teams will figure it out

**Shape Up Thinking:** Well-shaped work has thin-tailed probability distribution

### Risk Profiles

**Well-Shaped Work:**
- Slight chance of taking an extra week
- Elements are well-defined and familiar
- Known assembly patterns
- Thin-tailed distribution

**Work with Rabbit Holes:**
- Could take multiple times the appetite
- Technical unknowns lurking
- Unsolved design problems
- Misunderstood interdependencies
- Fat-tailed distribution

"We want to remove the unknowns and tricky problems from the project so that our probability is as thin-tailed as possible. That means a project with independent, well-understood parts that assemble together in known ways."

## Looking for Rabbit Holes

### The Slow-Motion Walkthrough

"One way to analyze the solution is to walk through a use case in slow motion. Given the solution we sketched, how exactly would a user get from the starting point to the end?"

This reveals:
- Missing pieces in the flow
- Gaps in the solution
- Unstated assumptions
- Hidden complexity

### Critical Questions to Ask

For each part of the solution:
- **Does this require new technical work we've never done before?**
- **Are we making assumptions about how the parts fit together?**
- **Are we assuming a design solution exists that we couldn't come up with ourselves?**
- **Is there a hard decision we should settle in advance so it doesn't trip up the team?**

"Fleshing out the elements of the solution was a fast-moving, exploratory process. It was more breadth than depth. In this step, we slow down and look critically at what we came up with."

## Case Study: Patching the To-Do Groups Hole

### The Discovery
When implementing grouped to-dos with dividers, a critical question emerged: How do we display completed items?

**The Problem:**
- Previously: completed items shown at bottom of list
- With groups: where do completed items go?
- Show at bottom of each group?
- Repeat dividers in completed section?
- Reconsider completed items entirely?

### Why This Matters
"This was a hole in the concept. If we didn't address it, we'd be pushing a deep design problem down to the team and unreasonably asking them to find a solution under deadline."

**The Risk:**
- Changing completed to-do rendering has complex implications
- Affects user experience, navigation, and performance
- Team could waste days exploring dead ends
- Designer might think "Maybe if I experiment with the styling a little more I can make them blend in better"

### The Solution
"To remove uncertainty in the project, we decided to dictate a solution in the shaped concept."

**Decision:** Leave completed items exactly as they worked previously
- Just append group name to each completed item
- "A little messy" but acceptable trade-off
- Drastically simplified the problem
- Could still show completed items from a group on the group's detail page

### The Lesson
"As shapers, we're thinking less about the ultimate design and more about basic quality and risk. With the compromised concept we get to keep all the elements that made the project worth doing—the groups of incomplete items—and we get to cut off a big tail of risk."

## Declaring Out of Bounds

### Why It's Necessary
"Since everyone on the team wants to do their best work, they will of course look for all the use cases to cover and consider them necessary."

Even with scope hammering skills, teams need explicit boundaries.

### Case Study: Group Notifications

**The Shaped Solution:** Click "Programmers" to select all programmers for notification when posting a message

**Potential Scope Creep:**
- Why not when assigning a to-do?
- Why not when mentioning in chat?
- Why not in every selection interface?

**The Decision:**
- Core value: faster flow for posting messages
- Explicitly marked other cases as "out of bounds"
- Focused on the specific win
- Avoided multiplication of complexity

## Cutting Back

### Nice-to-Haves vs. Must-Haves

"There may be parts of the solution we got excited about during the sketching phase that aren't really necessary."

### Example: Color-Coding Groups

**Initial excitement:** Color-coded group labels would make the page more interesting and useful

**The decision:** Flag as unnecessary and cut from core
- Mention as nice-to-have to team
- Start with assumption feature is valuable without it
- Preserve time for core functionality

## Presenting to Technical Experts

### When to Get Input

"Before you're ready to write up the idea to share more widely, you might need input on some parts of the concept you aren't completely sure about."

Reasons to consult:
- Technical assumptions need verification
- Usage data might contradict assumptions
- Code complexity needs assessment

### How to Present

**The Approach:**
- Closed-door, friendly-conspiratorial mood
- "Here's something I'm thinking about… but I'm not ready to show anybody yet… what do you think?"
- Keep the clay wet—use whiteboard, not documents
- Build up concept from beginning
- Emphasize hunting for time bombs

### The Right Question

**Wrong:** "Is this possible?"  
**Right:** "Is X possible in 6-weeks?"

"In software, everything is possible but nothing is free. We want to find out if it's possible within the appetite we're shaping for."

### Key Points for the Conversation
- Talk through constraints and appetite
- Make them partners in keeping project sized correctly
- Focus on risks that could blow up the project
- Stay open to drastically different approaches

"Depending on how the conversation goes, you may either have validated your approach or discovered some problems that send you back for another round of shaping."

## De-risked and Ready

### The Output

At the end of this stage, we have:
- **Elements of the solution** - Core components defined
- **Patches for rabbit holes** - Known problems addressed
- **Fences around scope** - Clear out-of-bounds declarations

"We've gone from a roughly formed solution with potential risk in it to a solid idea that we now hope to bet on in the future."

### Next Step

We're ready to transition from:
- Private shaping with inner circle feedback
- To presenting at the betting table
- Through a formal write-up (pitch)
- That communicates boundaries and solutions
- For people with less context to evaluate

## Decision-Making Framework

When evaluating risks:
1. **Is this a real rabbit hole?** Or just a detail to figure out?
2. **Can we patch it in shaping?** Or does it need team exploration?
3. **Should we declare it out of bounds?** To preserve appetite?
4. **Is the risk acceptable?** Given the project value?
5. **Do we need expert input?** To assess feasibility?

## Real-World Application

### For Shapers
- Always do slow-motion walkthroughs
- Question every technical assumption
- Get expert input on unknowns
- Be willing to compromise for de-risking
- Document out-of-bounds decisions

### For Technical Experts
- Help identify time bombs early
- Suggest simpler alternatives
- Be honest about complexity
- Partner in preserving appetite

### For Teams
- Trust that major risks were addressed
- Focus energy on known problems
- Respect out-of-bounds declarations
- Use remaining time for polish

## Key Insight

"This is the kind of trade-off that's difficult to make when you're working inside the cycle under pressure. There are lots of reasons why a different design or a deeper reconsideration would be objectively better. Why not try? A designer could reasonably think, 'Maybe if I experiment with the styling a little more I can make them blend in better.' They could easily waste a few days of the very few weeks they have going down a dead end."

## Related Concepts

- **Find the Elements** (Chapter 4) - Creating the solution to be de-risked
- **Write the Pitch** (Chapter 6) - Documenting holes and patches
- **Hand Over Responsibility** (Chapter 10) - Why de-risking enables autonomy
- **Decide When to Stop** (Chapter 14) - How boundaries help shipping