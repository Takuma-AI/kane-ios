# Chapter 54: Less Software

**Book:** Getting Real  
**Section:** Code  
**Mental Model:** Technical Architecture  
**Tags:** #less-software #complexity #simplicity #technical-debt #code-philosophy

## Core Concept

**Keep your code as simple as possible.** You'd think that twice as much code would make your software only twice as complex. But actually, each time you increase the amount of code, your software grows exponentially more complicated. Each minor addition, each change, each interdependency, and each preference has a cascading effect.

## The Exponential Complexity Problem

"Keep adding code recklessly and, before you know it, you'll have created the dreaded Big Ball of Mud."

The reality of code complexity:
- **Linear assumption**: 2x code = 2x complexity
- **Exponential reality**: 2x code = 4x, 8x, or worse complexity
- **Cascading effects**: Every addition impacts everything else
- **Interdependencies**: Create hidden complexity multipliers

## The Solution: Less Software

"The way you fight this complexity is with less software. Less software means less features, less code, less waste."

## The 80/20 Principle

"The key is to restate any hard problem that requires a lot of software into a simple problem that requires much less. You may not be solving exactly the same problem but that's alright. Solving 80% of the original problem for 20% of the effort is a major win."

**Critical insight**: "The original problem is almost never so bad that it's worth five times the effort to solve it."

## Mental Model: Simplicity Through Reduction

**Traditional Thinking:** More features = better product. Complex problems require complex solutions.

**Getting Real Thinking:** Less software = better product. Complex problems can be restated as simple ones.

### Decision Framework

When facing complexity:
1. **Can we restate this problem more simply?**
2. **What's the 80% solution that takes 20% effort?**
3. **Is the full solution really 5x more valuable?**
4. **What can we eliminate entirely?**

### Key Insight

The best code is no code. Every line you don't write is a line you don't have to maintain.

## Putting Away the Crystal Ball

"Less software means you put away the crystal ball. Instead of trying to predict future problems, you deal only with the problems of today."

Why this works:
- **Phantom problems**: "Fears you have about tomorrow often never come to fruition"
- **Wasted effort**: "Don't bog yourself down trying to solve these phantom issues"
- **Real focus**: Deal with actual problems, not imagined ones

## The 37signals Philosophy

"From the beginning, we've designed our products around the concept of less software. Whenever possible, we chop up hard problems into easy ones."

Results of this approach:
- **Easier to implement and support**
- **Easier to understand**
- **Easier to use**
- **Differentiation**: "Instead of trying to build products that do more, we build products that do less"

## Benefits of Less Software

### 1. Easier Management
"Less software is easier to manage."

### 2. Reduced Maintenance
"Less software reduces your codebase and that means less maintenance busywork (and a happier staff)."

### 3. Lower Cost of Change
"Less software lowers your cost of change so you can adapt quickly. You can change your mind without having to change boatloads of code."

### 4. Fewer Bugs
"Less software results in fewer bugs."

### 5. Less Support
"Less software means less support."

## Feature Selection Strategy

"Which features you choose to include or omit have a lot to do with less software too."

Guidelines:
- **Don't be afraid to say no** to feature requests that are hard to do
- **Unless they're absolutely essential**, save time/effort/confusion by leaving them out
- **Slow down**: "Don't take action on an idea for a week and see if it still seems like a great idea"
- **Marinate**: "The extra marinating time will often help your brain come up with an easier solution"

## Encouraging Pushback

"Encourage programmers to make counteroffers."

What you want to hear: **"The way you suggested will take 12 hours. But there's a way I can do it that will only take one hour. It won't do x but it will do y."**

Benefits:
- **Let the software push back**
- **Tell programmers to fight for what they think is the best way**
- **Find simpler solutions through constraints**

## Creative Detours

"Search for detours around writing more software."

Examples:
- **Change the copy** instead of the code
- **Suggest alternate user paths** that don't require new features
- **Use existing functionality** in creative ways
- **Example**: "Can you suggest that people upload images of a specific size instead of doing the image manipulation on the server side?"

## The Final Filter

"For every feature that makes it into your app, ask yourself: Is there a way this can be added that won't require as much software? Write just the code you need and no more. Your app will be leaner and healthier as a result."

## Supporting Wisdom

### Brad Appleton on Flexibility

"The 'secret' to good software design wasn't in knowing what to put into the code; it was in knowing what to leave OUT! It was in recognizing where the hard-spots and soft-spots were, and knowing where to leave space/room rather than trying to cram in more design."

**Title wisdom**: "There is No CODE That is More Flexible Than NO Code!"

### The Ganssle Group on Complexity Scaling

"The most important rule of software engineering is also the least known: Complexity does not scale linearly with size…A 2000 line program requires more than twice as much development time as one half the size."

## Real-World Application

### Code Review Questions
- What can we remove?
- How can we simplify this?
- Do we really need this feature?
- What's the minimal solution?

### Architecture Decisions
- Choose simple over clever
- Favor deletion over addition
- Question every dependency
- Minimize surface area

### Feature Planning
- Start with no
- Add only essentials
- Solve 80% of problems
- Resist feature creep

## The Compound Effect

Less software creates virtuous cycles:
- **Less to understand** → Faster onboarding
- **Less to test** → Higher quality
- **Less to break** → More reliability
- **Less to maintain** → More time for innovation
- **Less complexity** → Happier developers

## Warning Signs of Too Much Software

- Long build times
- Slow test suites
- Frequent bugs
- Hard to explain features
- Developer frustration
- Customer confusion

## Related Concepts

- Chapter 4: Build Less (product philosophy)
- Chapter 21: Half, Not Half-Assed (quality over quantity)
- Chapter 56: Code Speaks (listen to complexity warnings)
- Chapter 57: Manage Debt (paying down complexity)