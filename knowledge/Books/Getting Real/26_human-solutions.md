# Chapter 26: Human Solutions

**Book:** Getting Real  
**Section:** Feature Selection  
**Mental Model:** Emergent Convention Design  
**Tags:** #flexibility #human-creativity #conventions #general-solutions #emergence

## Build for General Concepts

"**Don't force conventions on people.** Instead make your software general so everyone can find their own solution. Give people **just enough to solve their own problems their own way**. And then **get out of the way**."

## Case Study: Ta-da List's Radical Simplicity

"When we built Ta-da List we intentionally omitted a lot of stuff. There's no way to assign a to-do to someone, there's no way to mark a date due, there's no way to categorize items, etc."

"We kept the tool **clean and uncluttered** by letting people get creative. People figured out how to solve issues on their own. If they wanted to add a date to a to-do item they could just add **(due: April 7, 2006)** to the front of the item. If they wanted to add a category, they could just add **[Books]** to the front of the item. **Ideal? No. Infinitely flexible? Yes.**"

## The Cost of Specific Solutions

"If we tried to build software to specifically handle these scenarios, we'd be **making it less useful for all the cases when those concerns don't apply**."

## The Philosophy

"Do the best job you can with the **root of the problem** then step aside. People will find their own solutions and conventions within your general framework."

## Mental Model: General vs. Specific

### Specific Solutions (Traditional):
- Build features for every use case
- Force particular workflows
- Complex UI for all scenarios
- Rigid conventions
- Heavy, cluttered interface

### General Solutions (Getting Real):
- **Build flexible foundations**
- **Let users create conventions**
- **Simple UI that adapts**
- **Emergent workflows**
- **Clean, uncluttered interface**

## What Ta-da List Didn't Include

### Missing "Features":
- No assignment system
- No due dates
- No categories
- No priority levels
- No tags or labels

### What Users Created:
- **(due: date)** convention
- **[Category]** notation
- **@Person** for assignment
- **!** for priority
- Their own systems

## Why This Works

### The Power of Human Creativity:
- **Users are smart** - They'll figure it out
- **Needs vary** - One size doesn't fit all
- **Conventions emerge** - Better than prescribed
- **Flexibility wins** - Adapts to any workflow

### The Problem with Prescriptive Design:
- **Forces everyone into same box**
- **Clutters interface for all**
- **Reduces flexibility**
- **Increases complexity**
- **Limits creativity**

## Examples of Emergent Conventions

### What You Provide:
- Simple text field
- Basic list functionality
- Core capability only

### What Users Create:
- **Dating systems:** (due: April 7), [Apr-7], !0407
- **Categories:** [Work], #work, Work:
- **Priority:** !!!, (1), HIGH
- **Assignment:** @john, ->Sarah, (John)
- **Status:** DONE:, ✓, [x]

## The Design Philosophy

### Step 1: Identify Root Problem
"Do the best job you can with the root of the problem"

### Step 2: Provide Minimal Solution
"Give people just enough"

### Step 3: Get Out of the Way
"Then step aside"

### Result: Emergent Excellence
"People will find their own solutions"

## Decision Framework

### Should You Build a Specific Feature?

1. **Is this the root problem?**
   - If no, don't build it

2. **Can users solve this themselves?**
   - If yes, let them

3. **Will this clutter the interface for others?**
   - If yes, avoid it

4. **Does this reduce flexibility?**
   - If yes, reconsider

5. **Is a general solution possible?**
   - If yes, build that instead

## Benefits of Human Solutions

### For Users:
- **Maximum flexibility** - Work their way
- **No learning curve** - Use own conventions
- **Clean interface** - No feature clutter
- **Personal ownership** - Their system, their rules

### For Developers:
- **Less to build** - Focus on core
- **Less to maintain** - Fewer features
- **Less to document** - Self-evident
- **Less to support** - Users self-solve

## Real-World Applications

### Email:
- No folders? Use search and labels
- No categories? Use subject prefixes
- No priority? Use stars or flags

### Documents:
- No formatting? Use markdown conventions
- No structure? Create with headings
- No metadata? Embed in content

### Project Management:
- No Gantt charts? Use simple lists
- No dependencies? Note in text
- No assignments? Use conventions

## The Trust Factor

This approach requires trusting that:
- **Users are intelligent**
- **Creativity will emerge**
- **Conventions will develop**
- **Simplicity enables more**
- **Less prescriptive = more useful**

## Warning Signs of Over-Specification

### Red Flags:
- Building UI for edge cases
- Multiple ways to do same thing
- Features used by < 80% of users
- Conventions you're forcing
- Complexity creeping in

### Green Flags:
- Users creating their own systems
- Clean, simple interface
- Flexibility in usage
- Emergent patterns
- Happy creative users

## Cultural Insights & Communication Style

### Question-Answer Honesty:
- **"Ideal? No."** - Admits imperfection
- **"Infinitely flexible? Yes."** - Celebrates trade-off
- Clear about choices made

### Specific Examples:
- **(due: April 7, 2006)** - Real usage shown
- **[Books]** - Actual convention
- Concrete not theoretical

### Philosophy Statements:
- **"Get out of the way"** - Humility in design
- **"Step aside"** - Designer ego removed
- Let users lead

### Root Problem Focus:
- Not surface solutions
- Core functionality only
- Essential vs. nice-to-have

### Trust in Users:
- **"People figured out"** - Faith in intelligence
- **"Get creative"** - Expects innovation
- Users as partners

### Clean and Uncluttered:
- Design value stated
- Simplicity as goal
- Less as strategy

## Related Concepts

- **Build Less** (Chapter 4) - Core philosophy
- **It Just Doesn't Matter** (Chapter 22) - Most features don't
- **Make Opinionated Software** (Chapter 20) - Opinion: users are smart
- **Half, Not Half-Assed** (Chapter 21) - Do core well, skip rest
- **Human Solutions** (Chapter 42) - People over process