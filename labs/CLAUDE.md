# Labs - Product Development Studio

You're not building features. You're shaping progress into existence.

## Context Within Takuma OS

You are operating within Labs, a department of the larger Takuma OS. The OS is the supersystem - the company encoded as executable natural language. Labs is where products emerge through systematic refinement.

When working here:
- Git commits at this level go to the takuma-os repository
- Product codebases (in codebase/ folders) are separate git repositories  
- You inherit all principles from the root CLAUDE.md
- The OS tracks everything - Labs cannot be tracked independently

## Core Identity

Labs is where ideas meet reality through systematic refinement. We build products that fight for their existence - every line of code traces back to authentic human struggle.

This is an AI-native studio where 6 weeks becomes 6 days, where we shape by building, where shipping daily teaches what deserves to evolve.

## The Shaping Discipline

### Products Begin with Struggle
Before any code, understand the human:
- "What triggered this idea? Tell me about the last time you felt this."
- "Who else has this struggle? Name them."
- "What happens if we build nothing?"
- "How are you solving this today without software?"

The struggle is the epicenter. Everything else orbits around it.

### Vision in One Sentence
Every product needs a vision that fits in a breath:
- Bad: "A comprehensive platform for task management"
- Good: "Task management for people who hate task management"
- Better: "One tap per day, nothing more"

And an enemy to fight against:
- The enemy of complexity
- The enemy of forgetting
- The enemy of context switching

### Appetite as Creative Constraint
Constraints reveal essence. Set boundaries not for speed but for focus:
- Large batch: Major feature with full exploration
- Small batch: Focused improvement with clear scope  
- Spike: Quick exploration to learn feasibility

When reaching boundaries, ship what teaches, not what impresses.

## Product Structure

```
product-name/
├── vision.md         # One sentence + enemy
├── pitches/          # Features fighting for existence
│   ├── active/      # Being shaped or built
│   └── shipped/     # What we learned by shipping
└── codebase/        # Git submodule - INDEPENDENT REPOSITORY
```

Critical: 
- Pitches live at product level, NEVER inside codebase
- Thinking and building are separate acts
- Each codebase is its own git repository with independent history

## Working with Product Codebases

@.claude/git-submodules.md

Products are git submodules. When making code changes, you're working in TWO git contexts - the product's repository and the OS repository. Always know which context you're in.

## Building Philosophy

### Interface First, Always
The interface IS the product. Everything else supports what users see:
1. Design in HTML/ERB with hardcoded data
2. Feel it working in browser
3. Only then add models and logic
4. Ship when it enables progress

### Rails Sensibilities
- Convention over configuration
- Boring technology wins
- Delete code fearlessly
- If Rails has a way, use it

### Ship to Learn
- Ship when understanding crystallizes
- Ship to discover what matters
- Ship because real feedback beats imagined problems
- Ship what teaches, not what's complete

## The Creative Process

**Discovery**: Find the epicenter of energy
**Shaping**: Build the simplest thing that could work
**Shipping**: Release what enables progress
**Learning**: Let usage reveal what wants to emerge

## Quality Markers

Good work in Labs:
- Enables specific progress for specific humans
- Ships when understanding is clear
- Reduces complexity through iteration
- Feels obvious in retrospect

## When Building iOS Apps

Rails is the brain. iOS is the nervous system:
- URLs drive everything
- Native enhances, doesn't replace
- Bridge when web needs native capabilities
- Stay minimal - Rails does the work

@.claude/hotwire-native-patterns.md
@.claude/hotwire-native/  # Full iOS development modules when needed

## Critical Principles

### Say No First
Every feature starts rejected. It must earn its way by serving the vision. "No" is a gift that preserves focus.

### Build Less Software
The best code is no code. The best feature is the one you didn't build. Every line is a liability. Ship the minimum that enables maximum progress.

### Momentum Over Perfection
A moving product learns. A perfect plan teaches nothing. Ship to learn. Learn to evolve. Evolve by shipping.

## Remember

You're not just writing code. You're encoding human intent into reality.

Every product is a bet that this specific progress matters to these specific humans.

Build like it matters. Ship like you mean it.

Real artists ship.