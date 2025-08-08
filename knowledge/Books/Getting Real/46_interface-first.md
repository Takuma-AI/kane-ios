# Chapter 46: Interface First

**Book:** Getting Real  
**Section:** Interface Design  
**Mental Model:** Design & Interface  
**Tags:** #interface-design #design-first #flexibility #user-experience #product-development

## Core Concept

**Design the interface before you start programming.** Too many apps start with a program-first mentality. That's a bad idea. Programming is the heaviest component of building an app, meaning it's the most expensive and hardest to change. Instead, start by designing first.

## The Weight of Different Activities

"Design is relatively light. A paper sketch is cheap and easy to change. HTML designs are still relatively simple to modify (or throw out). That's not true of programming."

The cost hierarchy:
1. **Paper sketches** - Cheapest to change
2. **HTML mockups** - Still relatively flexible
3. **Programming** - Most expensive and rigid

**Key principle:** "Designing first keeps you flexible. Programming first fences you in and sets you up for additional costs."

## Interface IS the Product

"Another reason to design first is that the interface is your product. What people see is what you're selling. If you just slap an interface on at the end, the gaps will show."

This fundamental truth means:
- The interface deserves primary attention
- Backend should serve the interface, not vice versa
- User experience can't be an afterthought

## The 37signals Method

"We start with the interface so we can see how the app looks and feels from the beginning. It's constantly being revised throughout the process."

Key questions answered through interface-first design:
- **Does it make sense?**
- **Is it easy to use?**
- **Does it solve the problem at hand?**

"These are questions you can only truly answer when you're dealing with real screens."

## Mental Model: Progressive Refinement

**Traditional Thinking:** Build the backend functionality first, then create an interface to access it.

**Getting Real Thinking:** Design the ideal user experience first, then build the backend to support it.

### Decision Framework

Before writing code, ask:
1. **What does the user need to accomplish?**
2. **What's the simplest interface for that?**
3. **How should it feel to use this?**
4. **What backend will support this experience?**

### Key Insight

The interface drives requirements. Let user needs shape technical decisions, not the other way around.

## Case Study: The Orange Pen That Started Blinksale

Josh Williams shares how Blinksale began with interface design:

### The Beginning
"As soon as I realized my frustration with off-the-shelf invoicing software, I decided to draw out how I would prefer my invoicing solution to work. I pulled out an orange pen, because it was the only thing handy that evening, and had about 75% of the UI drawn out within a few hours."

### The Validation
"I showed it to my wife, Rachel, who was ironing at the time, and asked, 'What do you think?' And she replied with a smile, 'You need to do this. For real.'"

### The Process
"Over the next two weeks I refined the designs, and completely mocked up static HTML pages for almost the entire first version of what would become Blinksale."

## Benefits of Interface-First Design

### 1. Creates Real Vision
"Having most of the UI designed up front was extremely beneficial... First, it gave Scott [the developer] a real vision and excitement for where we were going. It was much more than just an idea, it was real."

### 2. Accurate Scoping
"It helped us accurately gauge how much of Scott's effort and time it would require to turn the design into a functioning application. When you're financially bootstrapping a project, the earlier you can predict budget requirements, the better."

### 3. Feature Discipline
"The UI design served as a guide to remind us what the application was about as we progressed further into development. As we were tempted to add new features, we couldn't simply say, 'Sure, let's add that!' We had to go back to the design and ask ourselves where that new feature would go, and if it didn't have a place, it wouldn't get added."

## Real-World Application

### Start Simple
1. Grab paper and pen
2. Sketch the main screens
3. Focus on user flow
4. Iterate quickly

### Progress to HTML
1. Create static mockups
2. Make them feel real
3. Test with real content
4. Get feedback early

### Let Design Guide Development
1. Use interface as specification
2. Build backend to support UI
3. Keep design as north star
4. Resist feature creep

## Common Pitfalls to Avoid

### Programming First
- Locks in technical decisions
- Creates sunk cost pressure
- Limits UI possibilities
- Expensive to change

### Over-Engineering Early
- Solving problems that don't exist
- Building flexibility you don't need
- Wasting time on maybes

### Skipping Low-Fidelity Design
- Jumping straight to code
- Missing cheap iteration opportunities
- Committing too early

## The Power of Seeing

"Designing first keeps you flexible and gets you to those answers sooner in the process rather than later."

Benefits of early visualization:
- Spot problems before they're expensive
- Get stakeholder buy-in early
- Test with users cheaply
- Maintain momentum through tangibility

## Interface as Living Document

The interface isn't set in stone: "It's constantly being revised throughout the process."

This ongoing refinement:
- Responds to user feedback
- Incorporates new insights
- Evolves with understanding
- Stays aligned with user needs

## Related Concepts

- Chapter 47: Epicenter Design (start with the core)
- Chapter 49: The Blank Slate (design all states)
- Chapter 52: Copywriting is Interface Design (words matter)
- Chapter 31: From Idea to Implementation (design-driven process)