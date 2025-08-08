# Chapter 12: Map the Scopes

**Book:** Shape Up  
**Section:** Part 3 - Building  
**Mental Model:** Building & Execution  
**Tags:** #scopes #project-organization #task-management #structure #workflow

## The Core Philosophy

As teams discover the real work to be done, they need a way to organize it that reflects the actual structure of the problem, not arbitrary divisions by person or role. Scopes provide this organization, giving teams a shared language and clear map of the project territory.

**The fundamental insight:** "Organize by structure, not by person."

## The Problem with Traditional Organization

### The Credit Card Form Example

When building a feature to save credit cards for future use, organizing by person creates artificial divisions:

**Alice's Tasks:**
- Design profile screen
- Design radio buttons
- Design search results  
- Implement profile screen

**Bob's Tasks:**
- Back-end for credit cards
- JavaScript for toggle
- Update search

"When you pull these tasks apart like this, you can't see the whole."

### What's Missing

This organization fails to show:
- Which tasks relate to saving cards vs. using them
- Where the complex integrations are
- What the actual features are
- How the parts connect

## Mental Model: Scopes as Territory

**Traditional Thinking:** Organize tasks by person, function, or technical layer

**Shape Up Thinking:** Organize by natural boundaries of the problem itself

### The Scope Map Metaphor

"Imagine a map with territories like 'Save Card,' 'Use Card,' and 'Locate Card.' These are the scopes."

Benefits:
- See the whole project at once
- Understand relationships
- Track meaningful progress
- Share common language

## Properties of Well-Defined Scopes

### 1. Completable Boundaries

"A scope isn't a 'bucket' of tasks. It's something you can finish."

Think of scopes as:
- Things you can complete
- Features you can ship
- Territory you can conquer

"You can't 'finish' a bucket. A scope is 'done' when you've finished with that part of the problem and can safely put it down."

### 2. Mapable Structure

Scopes reveal project structure:
- Different parts of the system
- Natural feature boundaries  
- Integration points
- Complexity distribution

### 3. Team Language

"Scopes give us the right language for the project."

Instead of:
- "Did you finish that task?"
- "What's Bob working on?"

Teams say:
- "How's 'Save Card' coming?"
- "We're wrapping up 'Use Card'"

## Case Study: Message Drafts

### The Project

Allow users to save drafts of messages before sending them in Basecamp.

### Initial Task Discovery

As the team explored, they found work in many areas:
- Message form changes
- Database for drafts
- Menu modifications
- Visibility rules
- Navigation updates

"After some exploratory work, they had about 30 unscoped tasks. Using the unscoped tasks as a guide, the team had a discussion about how to divide up the work."

### The Scoping Process

The team identified these areas as "slices of the work":

1. **Reusing Existing Drafts** - Core draft CRUD operations
2. **Adding Support for Drafts** - System-wide integration  
3. **Trash** - Deletion and recovery system

### Scope Distribution

**Bucket 1: Reusing Existing Drafts**
- Database work
- Basic UI
- Fundamental operations

**Bucket 2: Adding Support for Drafts**
- Multiple integration points
- Various UI locations
- Navigation updates
- Visibility widget

**Bucket 3: Trash**
- Trash functionality
- Recovery options
- Clean-up operations

"The first scope is mostly back-end work. The third scope is self-contained with fewer interdependencies. The second scope is the most complex and UI-heavy."

### Why These Scopes Work

"These aren't slices of code or design. These are slices of the concept."

They represent:
- User-facing functionality
- Complete features
- Natural boundaries
- Different complexity levels

## Discovering Scopes

### The Organic Process

"The scopes need to be discovered by doing the real work. They can't be assigned in advance."

Common patterns:
- Start with unscoped tasks
- Notice natural groupings
- Identify feature boundaries
- Name meaningful territories

### Questions That Reveal Scopes

As tasks accumulate, ask:
- What parts could we finish independently?
- Where are the natural boundaries?
- What would make sense to a user?
- Which tasks always go together?

### The Timing

"Scopes are more than just slices. They become the natural language of the project at the macro level."

When to scope:
- After initial exploration
- When tasks start accumulating
- Before feeling overwhelmed
- As patterns emerge

## How to Know if Scopes Are Right

### Signs of Good Scopes

1. **Credit Card Example - Well Integrated**

Original scopes:
- Saving Card
- Using Card
- Finding Card

"Those three things worked nicely because each scope required a different kind of design and implementation."

Each had:
- Unique location in app
- Different complexity
- Clear boundaries

2. **To-Do Perms - Different Integration Points**

Better scopes:
- Invite to Project
- Grant To-Do Access  
- Extend Existing Pattern

Each required:
- Different technical approach
- Unique UI considerations
- Separate implementation path

### Signs of Bad Scopes

When scopes need reorganization:
- Too much interdependency
- Can't complete one without another
- Unclear boundaries
- No natural finish line

## Scope Patterns

### Layer Cakes

"Think of a layer cake. You can't eat the top layer without eating the bottom layer first."

Example: A complicated navigation design might have:
1. Bottom layer: Basic functionality
2. Middle layer: Enhanced features
3. Top layer: Polish and refinement

"Whoever takes it on can start with the bottom layer and work their way up. They don't have to design all the visual details for the first layer. They just need to make it work."

### Icebergs

"Think of an iceberg. There's a lot of complexity under the surface."

Characteristics:
- Simple UI element
- Complex backend logic
- Easy to underestimate
- Most work invisible

"A scope like that needs more back-end programming than UI. The programmer could build a temporary UI to make the feature work and hand it to a designer later to firm up."

### Chowder

"There's a variety of pieces that all have to be touched in different parts of the app."

Examples:
- System-wide updates
- Multiple integration points
- Many small changes
- Broad but shallow work

"This kind of scope needs a lot of UI work and not much back-end work besides wiring things together."

## Nice-to-Haves: The ~ Notation

### Marking Optional Work

"When the team starts to run out of time, they'll need to make hard decisions about what to leave out."

The ~ symbol:
- Marks nice-to-have tasks
- Within must-have scopes
- Helps with time trade-offs
- Guides cutting decisions

"We put a ~ in front of the optional items. This allows everyone on the team and any stakeholders to see what's considered essential and what's considered nice-to-have."

### How It Works

Example tasks:
- Search for new card
- ~Add card from search results
- Show card metadata
- ~Highlight selection

"If time runs out, the ~ items are the first to go."

## Decision-Making Framework

When mapping scopes:
1. **Can this be completed independently?** Good scope boundary
2. **Does this represent user value?** Not just technical division
3. **Are dependencies manageable?** Not too intertwined
4. **Is the size reasonable?** Not too big or small
5. **Does the name communicate clearly?** Team understands

## Real-World Application

### For Teams
- Let scopes emerge from work
- Use scope names in communication
- Mark nice-to-haves with ~
- Re-scope if boundaries aren't working

### For Designers
- Understand which scopes need visual work
- Identify chowder vs. iceberg patterns
- Collaborate on scope boundaries
- Design within scope contexts

### For Programmers
- Recognize backend-heavy scopes
- Build temporary UI when needed
- Identify technical boundaries
- Help define scope edges

### For Managers
- Think in scopes, not tasks
- Ask about scope progress
- Respect scope boundaries
- Support re-scoping decisions

## Key Insight

"When it's time to report status, saying 'Save Card is done' is more meaningful than '11 tasks are done.' When it's time to cut scope, it's better to drop a whole scope and leave the rest of the project intact than to drop small tasks here and there and leave holes all over the product."

## The Evolution of Scopes

Scopes aren't static:
1. Start with imagined divisions
2. Discover real boundaries through work
3. Adjust based on dependencies
4. Refine as understanding grows
5. Use for communication and decisions

## Related Concepts

- **Get One Piece Done** (Chapter 11) - First work reveals scope boundaries
- **Show Progress** (Chapter 13) - Scopes enable Hill Chart tracking
- **Decide When to Stop** (Chapter 14) - Scopes guide cutting decisions
- **Hand Over Responsibility** (Chapter 10) - Teams define their own scopes