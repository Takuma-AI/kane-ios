# Chapter 60: Don't Do Dead Documents

**Book:** Getting Real  
**Section:** Words  
**Mental Model:** Process & Execution  
**Tags:** #documentation #living-documents #prototyping #efficiency #agile-process

## Core Concept

**Eliminate unnecessary paperwork.** Avoiding functional specs is a good start but don't stop there; Prevent excess paperwork everywhere. Unless a document is actually going to morph into something real, don't produce it.

## The Build vs. Write Philosophy

"Build, don't write. If you need to explain something, try mocking it up and prototyping it rather than writing a longwinded document. An actual interface or prototype is on its way to becoming a real product. A piece of paper, on the other hand, is only on its way to the garbage can."

## Mental Model: Living vs. Dead Documentation

**Traditional Thinking:** Document everything thoroughly before building. More documentation = better planning.

**Getting Real Thinking:** Only create documents that evolve into real things. If it stops before becoming real, it's dead.

### Decision Framework

Before creating any document:
1. **Will this become part of the actual product?**
2. **Can we show this instead of describe it?**
3. **Does this document have a real destination?**
4. **Could we build/mock this instead?**

### Key Insight

The best documentation is the thing itself. Everything else is waste.

## The Wireframe Test

"Here's an example: If a wireframe document is destined to stop and never directly become the actual design, don't bother doing it. If the wireframe starts as a wireframe and then morphs into the actual design, go for it."

This creates a clear litmus test:
- **Living wireframe**: Evolves into actual design ✓
- **Dead wireframe**: Stops at documentation stage ✗

## The Worthless Document Problem

"Documents that live separately from your application are worthless. They don't get you anywhere. Everything you do should evolve into the real thing. If a document stops before it turns real, it's dead."

## Gina Trapani on Documentation Reality

"I can't even count how many multi-page product specifications or business requirement documents that have languished, unread, gathering dust nearby my dev team while we coded away, discussing problems, asking questions and user testing as we went."

Her experience reveals:
- Documents go unread
- Teams work around them
- Real decisions happen in conversation
- Testing reveals truth, not documents

### The Development Reality

"I've even worked with developers who've spent hours writing long, descriptive emails or coding standards documents that also went unread."

## Why Documents Fail

"Webapps don't move forward with copious documentation. Software development is a constantly shifting, iterative process that involves interaction, snap decisions, and impossible-to-predict issues that crop up along the way. None of this can or should be captured on paper."

Key characteristics of real development:
- **Constantly shifting** requirements
- **Iterative process** that evolves
- **Interaction** drives decisions
- **Snap decisions** based on discovery
- **Unpredictable issues** emerge

## The Consolation

"Don't waste your time typing up that long visionary tome; no one's going to read it. Take consolation in the fact that if you give your product enough room to grow itself, in the end it won't resemble anything you wrote about anyway."

This reveals a profound truth: Products evolve beyond any documentation's ability to predict.

## Real-World Application

### Replace Documents With:

**Instead of Requirements Docs**
- Working prototypes
- User story cards
- Quick sketches
- Interface mockups

**Instead of Technical Specs**
- Proof of concept code
- Spike solutions
- Working examples
- API demos

**Instead of Design Documents**
- HTML/CSS prototypes
- Clickable mockups
- Style tiles
- Component libraries

**Instead of Process Documentation**
- Automated workflows
- Working systems
- Code comments
- README files

## Living Documentation Examples

### Good (Living) Documents
- Code that compiles
- Automated tests
- API documentation generated from code
- README with setup instructions
- Inline help in the product

### Bad (Dead) Documents
- 100-page requirements
- Detailed project plans
- Comprehensive specs
- Meeting minutes
- Status reports

## The Time Factor

Time spent on dead documents:
- Writing: Hours/days
- Reviewing: More hours
- Updating: Ongoing burden
- Reading: Almost never
- Value delivered: Zero

Time spent building:
- Creating: Same hours/days
- Reviewing: Through usage
- Updating: Improves product
- Using: Constantly
- Value delivered: Immediate

## Warning Signs of Dead Documents

- "We need to update the spec"
- "Let me check the documentation"
- "That's not what the document says"
- "We spent weeks on this plan"
- "No one read my proposal"

## Creating a Living Culture

### Encourage
- Quick prototypes
- Working demos
- Visual mockups
- Actual interfaces
- Real code

### Discourage
- Long proposals
- Detailed specs
- Comprehensive plans
- Abstract descriptions
- Theoretical documents

## The Exception

Some documents must exist:
- Legal requirements
- Compliance needs
- User manuals
- API references
- Setup guides

But even these should be:
- Minimal
- Auto-generated when possible
- Close to the code
- Frequently validated
- Actually used

## Benefits of Avoiding Dead Documents

1. **More building time**: Energy goes to creation
2. **Faster iteration**: No document updates needed
3. **Better communication**: Show don't tell
4. **Reduced waste**: No unused artifacts
5. **Clearer vision**: Reality over theory

## The Ultimate Test

Ask yourself:
> "If this document disappeared tomorrow, would anyone notice or care?"

If the answer is no, don't create it in the first place.

## Related Concepts

- Chapter 59: There's Nothing Functional about a Functional Spec (avoiding specs)
- Chapter 46: Interface First (building over documenting)
- Chapter 61: Tell Me a Quick Story (minimal documentation)
- Chapter 29: Race to Running Software (bias toward building)