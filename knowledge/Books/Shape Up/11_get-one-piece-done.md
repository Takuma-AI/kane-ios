# Chapter 11: Get One Piece Done

**Book:** Shape Up  
**Section:** Part 3 - Building  
**Mental Model:** Building & Execution  
**Tags:** #integration #vertical-slices #momentum #progress #design-programming

## The Core Philosophy

Teams should aim to complete one meaningful piece of functionality end-to-end early in the project. This means integrating design and programming work vertically rather than building horizontal layers that don't connect until the end.

**The fundamental principle:** "It's important at this early phase that they don't create a master plan of parts that should come together in the 11th hour."

## The Problem with Horizontal Layers

### Lots Done, Nothing Done

"If the team completes a lot of tasks but there's no 'one thing' to click on and try out, it's hard to feel progress. A team can do a lot of work but feel insecure because they don't have anything real to show for it yet."

The symptoms:
- Many tasks checked off
- No working functionality
- Team feels insecure
- Progress is theoretical

"Lots of things are done but nothing is really done."

## Mental Model: Vertical Integration

**Traditional Thinking:** Build all backend, then all frontend, then connect

**Shape Up Thinking:** Build one complete slice from top to bottom

### The Two-Layer View

"We can think of projects in two layers: front-end and back-end, design and code. While technically speaking there are more layers than this, these two are the primary integration challenge in most projects."

### The Integration Problem

**Frontend without Backend:**
"Suppose the project starts with a lot of design. The team could design a variety of screens and even implement them as templates or views. But until they're wired to a backend, nothing does anything. The work remains hypothetical and speculative."

**Backend without Frontend:**
"Same with the backend. A lot of tasks could be checked off, but without any UI—what can you do with it? How do you judge if the work on a specific piece of business logic is really right without interacting with it?"

## The Solution: One Slice

### Make Something Tangible Early

"Instead they should aim to make something tangible and demoable early—in the first week or so. That requires integrating vertically on one small piece of the project instead of chipping away at the horizontal layers."

### What This Looks Like

The goal:
- Pick one meaningful piece
- Build it end-to-end
- Working UI connected to working code
- Complete within first week
- Creates foundation for rest of project

## Case Study: Clients in Projects

### The Shaped Work

Feature to invite clients to see partial project data in Basecamp.

Core elements:
- Toggle on project to enable client mode
- Invite screen with client's email
- Special permissions for client view

### Two Possible Approaches

**Approach 1: Start with Visible**
1. Build toggle on project screen
2. Immediately visible to team
3. Can be demoed and clicked
4. Backend built to support what's seen

**Approach 2: Start with Foundational**
1. Build invitation system first
2. Create database for client permissions
3. Nothing visible initially
4. Toggle comes later

### The Better Choice

"The team in this case chose to start with the toggle. They did just enough work at first for the toggle to appear and for the screen to respond when you flip it on."

Why this works:
- Immediately demoable
- Real functionality to test
- Builds confidence
- Creates momentum

### The Implementation Sequence

1. **Basic toggle appears** (can flip but does nothing)
2. **Toggle state persists** (remembers on/off)
3. **Flipping reveals actions** (shows invite option)
4. **Actions become functional** (actually send invites)

"This is the pattern language of the project starting to develop. The toggle flip could be used in subsequent work to decide which actions to show throughout the project once permissions were wired up."

## Programmer and Designer Collaboration

### Programmers Don't Need to Wait

"Programmers don't need to wait. They should feel free to build scaffolds for the UI, cobble together stub views, or even run forward with temporary screens of their own design."

The goal: Get to the point where real code does real things, even if ugly.

### Affordances Before Pixel-Perfect Screens

"Designers don't need to design screens first or wait for programmers to build out a back-end. They can jump in and do one small piece of work just like the programmer, instead of delaying until all the right screens are assembled."

Designer's early work:
- Basic affordances
- Essential copy
- Rough layouts
- Core interactions

"Questions like 'should it be a button or a link' or 'should these be radio buttons or checkboxes' or 'how should this sentence read' are the raw materials for making software considerate, clear, and easy to use."

### Program Just Enough for the Next Step

Both programmers and designers can work incrementally:

**For Programmers:**
- Stub views can become designed
- Temporary becomes refined
- Backend supports what's needed now

**For Designers:**
- Start with key decisions
- Add affordances as backend enables
- Refine based on real functionality

"As backend functionality is wired up—even if it's rough or doesn't look right—the designer can grab it and work with the real thing to refine the design."

## Start in the Middle

### The Non-Linear Path

"Sometimes it's not obvious which piece to start with. In that case the best approach is to start in the middle and work outward."

### Example: To-Do Perms

**The Challenge:** Build permissions so users can selectively grant access to specific to-do lists within a project.

**Traditional Approach:**
1. Design permissions UI
2. Build selection interface
3. Create backend rules
4. Test with real data

**Start in the Middle:**
"Well, to start in the middle, we could just hack it. Let's just create some code to give a specific user access to a specific to-do list. Nothing else."

### Why This Works

Starting with the core assumption:
- Tests the fundamental mechanism
- Validates technical approach
- Provides foundation to build on
- Reduces risk of wrong path

"The act of doing the work will help you figure out the structure. Start in the real middle and don't worry about the wiring or the dependencies or the validations."

## Decision-Making Framework

When choosing what to build first:
1. **What would make this feel real?** Build that
2. **What's the core interaction?** Start there
3. **What reduces uncertainty most?** Do it first
4. **What creates momentum?** Prioritize it
5. **What can we demo soon?** Make it work

## Anti-Patterns to Avoid

### The Master Plan
- Creating detailed task breakdowns
- Scheduling all work upfront
- Building all of one layer first
- Saving integration for the end

### The Perfect Foundation
- Over-engineering early code
- Waiting for complete designs
- Building unused flexibility
- Delaying visible progress

### The Demo Desert
- Weeks without clickable progress
- Nothing to show stakeholders
- Team uncertainty about progress
- Late integration surprises

## Real-World Application

### For Teams
- Pick one meaningful slice
- Build it completely in week one
- Demo early and often
- Let momentum guide next steps

### For Programmers
- Don't wait for perfect designs
- Build rough but functional UI
- Create stubs designers can improve
- Focus on making things work

### For Designers
- Don't wait for complete backend
- Design with real functionality
- Start with core affordances
- Refine based on working code

### For Managers
- Look for early integration
- Expect rough early demos
- Value function over polish initially
- Trust the iterative process

## Key Insight

"Lots of things are done but nothing is really done. Instead they should aim to make something tangible and demoable early—in the first week or so. That requires integrating vertically on one small piece of the project instead of chipping away at the horizontal layers."

## The Pattern of Progress

The chapter reveals a pattern:
1. Start with meaningful piece
2. Integrate vertically
3. Create working functionality
4. Build team confidence
5. Establish project patterns
6. Guide subsequent work

## Related Concepts

- **Map the Scopes** (Chapter 12) - Organizing work after first piece
- **Show Progress** (Chapter 13) - How integrated work enables Hill Charts
- **Hand Over Responsibility** (Chapter 10) - Why teams choose their approach
- **Decide When to Stop** (Chapter 14) - How early integration helps scope