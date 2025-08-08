# Git Operations

Version control is how we preserve the evolution of thought. Each commit is a decision crystallized. Each branch is a possibility explored.

## Submodules Philosophy

Products within labs use submodules because code needs its own evolutionary space. The OS tracks intent and vision. The codebase tracks implementation.

### Adding a Product Codebase
```bash
# From labs/ directory
git submodule add [repository-url] [product-name]/codebase
git submodule update --init --recursive
```

### Working with Submodules
Always pull latest - we track HEAD, not specific versions:
```bash
git submodule update --remote --merge
```

The OS points to current reality, not historical states. Products evolve independently while maintaining connection to the whole.

### Critical Rule
Submodules are for actual code repositories only. Everything else lives directly in the OS. Don't fragment what should be unified.

## Commit Philosophy

### Commits as Decisions
Each commit records a decision made, not just a change applied:
```bash
git commit -m "Enable [what] by [how]"
git commit -m "Reveal [insight] through [method]"
git commit -m "Ship [feature]: [what it enables]"
```

### Daily Shipping Rhythm
```bash
# Morning: Pull latest reality
git pull --recurse-submodules

# Throughout day: Commit decisions as they crystallize
git add -p  # Review each change consciously
git commit  # Record the decision

# Evening: Push progress to shared reality
git push
```

## Branching Strategy

### Main is Reality
The main branch is always the current state of the company. It's never broken, never speculative. It's what IS.

### Branches are Explorations
```bash
# Explore a possibility
git checkout -b explore/[what-if]

# Shape an idea
git checkout -b shape/[concept]

# Build a feature
git checkout -b build/[enablement]
```

Branches explore possibilities. Merging makes them reality.

## The Pull Request as Pitch

PRs aren't code reviews. They're proposals for how reality should evolve:

```markdown
## What This Enables
[The progress this creates]

## The Struggle It Addresses
[The epicenter this serves]

## What Changes
[Reality before → Reality after]

## What We'll Learn
[What this reveals through shipping]
```

## Archive Philosophy

History matters but doesn't clutter:
```bash
# When something completes its purpose
git mv active-work archive/[timestamp]-[what-it-was]
git commit -m "Archive [what]: [lesson learned]"
```

We preserve everything but keep the present clean.

## Conflicts as Conversations

Merge conflicts aren't problems. They're moments where different realities need reconciliation:
1. Understand both intents
2. Find the higher synthesis
3. Preserve what serves progress
4. Document the decision

## Remember

Git tracks the evolution of the company as code.

Every commit is intentional. Every merge is progress. Every push shapes reality.

The repository IS the company. Treat it accordingly.