# Chapter 4: Find the Elements

**Book:** Shape Up  
**Section:** Part 1 - Shaping  
**Mental Model:** Shaping Work  
**Tags:** #breadboarding #fat-marker-sketches #design-process #prototyping #abstraction

## The Core Philosophy

With boundaries set, it's time to move from idea to solution. This requires working at the right speed with the right tools—fast enough to explore broadly but concrete enough to make progress. The key is using techniques that keep us at the proper level of abstraction.

**The fundamental principle:** "There could be dozens of different ways to approach the solution for a problem. So it's important that we can move fast and cover a lot of different ideas without getting dragged down."

## Moving at the Right Speed

### Two Critical Requirements

**1. The Right People (or Nobody)**
- Work alone or with a trusted partner
- Someone who can keep pace
- Shared background knowledge
- Ability to speak in shorthand
- Frank communication as you jump between ideas

**2. The Right Level of Detail**
- Avoid wireframes or specific visual layouts
- They lead to premature detail decisions
- Can't explore broadly when stuck on specifics

"If we start with wireframes or specific visual layouts, we'll get stuck on unnecessary details and we won't be able to explore as broadly as we need to."

## The Questions to Answer

When finding elements, we're trying to answer:
- **Where in the current system does the new thing fit?**
- **How do you get to it?**
- **What are the key components or interactions?**
- **Where does it take you?**

## Mental Model: Borrowed from Electrical Engineering

Shape Up borrows the concept of "breadboarding" from electrical engineering—prototypes that have all the functional components without industrial design.

"Deciding to include an indicator light and a rotary knob is very different from debating the chassis material, whether the knob should go to the left of the light or the right, how sharp the corners should be, and so on."

Similarly, we can sketch interface ideas without specifying visual design.

## Technique 1: Breadboarding

### The Three Basic Elements

**1. Places**
- Things you can navigate to
- Screens, dialogs, or menus that pop up
- Drawn by underlining the name

**2. Affordances**
- Things the user can act on
- Buttons, fields, interface copy
- Listed below the line
- Interface copy counts—reading provides information

**3. Connection Lines**
- Show how affordances move users between places
- Indicate flow and navigation

"We'll use words for everything instead of pictures. The important things are the components we're identifying and their connections."

### Case Study: Autopay Feature

The breadboarding example shows how this technique reveals critical questions:

**Initial approach:** Add "Turn on Autopay" button to invoice
- But does it pay the current invoice?
- Where do we explain the behavior?
- What about payment confirmation?

**Alternative approach:** Make Autopay option during payment
- Clearer about current payment
- Leverages existing payment flow
- Simpler confirmation logic

**Key Discovery:** What about turning it off?
- No username/password system exists
- Solution: Let invoicer disable for customer
- Acceptable trade-off for the appetite

"This example illustrates the level of thinking and the speed of movement to aim for during the breadboarding phase. Writing out the flows confronts us with questions we didn't originally think of and stimulates design ideas without distracting us with unimportant visual choices."

## Technique 2: Fat Marker Sketches

### When to Use Visual Sketching

"Sometimes the idea we have in mind is a visual one. Breadboarding would just miss the point because the 2D arrangement of elements is the fundamental problem."

### The Fat Marker Principle
- Use broad strokes that make detail impossible
- Originally done with large Sharpies on paper
- Now often on iPads with large brush diameter
- Forces focus on structure over style

### Case Study: To-Do List Dividers

**The Problem:** People creating fake to-dos as dividers (e.g., "––– Needs testing –––")

**The Solution Concept:**
- Official divider feature
- "Loose" to-dos above first divider
- "Grouped" to-dos below dividers
- Multiple groups possible

**Design Challenges Revealed:**
- Where to place "add" affordances
- Risk of breaking list gestalt
- Alternative: use existing action menus

"We were a little concerned the add buttons might break up the gestalt of the list, and the groups might all separate too much from the lists on the page."

### The Danger of Fat Markers

"This notation is much less constraining than breadboards, which has downsides. We might sketch a sidebar and get attached to a layout element like that even though it's not a core element."

The key: Keep an eye on avoiding premature commitments to non-essential visual elements.

## Why These Techniques Matter

"It may seem a little silly to call fat marker sketches a technique or a tool. The reason for calling them out is we too easily skip ahead to the wrong level of fidelity."

### Benefits
- Segments the creative process appropriately
- Ensures broad exploration before narrowing
- Prevents premature detail commitment
- Maintains focus on core elements

## Elements Are the Output

### Autopay Example - Final Elements:
- New "use this to Autopay?" checkbox on existing "Pay an invoice" screen
- "Disable Autopay" option on the invoicer's side

### To-Do Groups - Final Elements:
- Loose to-dos above the first group belong directly to the parent
- Grouped to-dos appear below the loose to-dos
- Try add affordance within each section (fallback: action menu)

### Dot Grid Calendar - Final Elements:
- 2-up monthly calendar grid
- Dots for events, no spanned pills
- Agenda-style list of events below that scrolls an event into view when you tap a dot

"This list of elements is extremely narrow and specific compared to 'monthly calendar.' Exactly the kind of narrowing we hope to accomplish through the shaping process."

## Room for Designers

### The Bias Problem
"Later, when it's time to involve a designer, you don't want to have to say 'I know I drew it like this but ignore that…'. Regardless of what you say, any specific mockups are going to bias what other people do after you—especially if you're in a higher position than them."

### The Right Balance
By using breadboards and fat markers:
- We make the project specific and concrete
- We leave space for design decisions
- We enable creative interpretation
- We respect designer expertise

"This is a theme of the shaping process. We're making the project more specific and concrete, but still leaving lots of space for decisions and choices to be made later. This isn't a spec. It's more like the boundaries and rules of a game. It could go in countless different ways once it's time to play."

## Not Deliverable Yet

"This step of shaping is still very much in your private sphere. It's normal for the artifacts at this point — on the wall or in your notebook — to be more or less indecipherable to anybody who wasn't there with you."

### What We've Accomplished
- Moved from cloudy idea to specific approach
- Identified concrete elements
- Outlined a solution approach

### What's Still Needed
- Stress-testing for holes
- Risk assessment
- Addressing unknowns
- Formal write-up

## No Conveyor Belt

"Keep in mind that, at this stage, we could walk away from the project. We haven't bet on it. We haven't made any commitments or promises about it."

### The Value Created
- Raw idea now more actionable
- Closer to a good option
- Can be advocated for when appropriate
- No obligation to continue

## Decision-Making Framework

When finding elements, constantly evaluate:
1. **Are we at the right speed?** Not getting bogged down in details?
2. **Are we answering core questions?** Where it fits, how it works?
3. **Are we leaving room?** Not over-specifying?
4. **Are we making progress?** Moving from abstract to concrete?
5. **Is this still worth pursuing?** Given what we're discovering?

## Real-World Application

### For Shapers
- Start with breadboarding for logic-heavy problems
- Use fat markers for visual/spatial problems
- Keep moving—don't perfect early sketches
- Focus on connections and core elements

### For Designers
- Expect rough elements, not specifications
- Look for the core idea to preserve
- Use your expertise to resolve visual questions
- Don't feel constrained by sketch details

### For Teams
- Elements define what, not how
- Implementation details are yours to resolve
- The connections matter more than the pixels
- You have freedom within boundaries

## Key Insight

"We've gone from a cloudy idea, like 'autopay' or 'to-do groups,' to a specific approach and a handful of concrete elements. But the form we have is still very rough and mostly in outline."

## Related Concepts

- **Principles of Shaping** (Chapter 2) - The philosophy behind abstraction levels
- **Set Boundaries** (Chapter 3) - The constraints that guide element finding
- **Risks and Rabbit Holes** (Chapter 5) - Next step after finding elements
- **Write the Pitch** (Chapter 6) - Formalizing elements for others