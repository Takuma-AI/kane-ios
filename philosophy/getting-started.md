# Getting Started with Takuma OS

## What is Takuma OS?

Takuma OS is a living system for organizing work that emerges from the process of defining it. Rather than managing predefined projects, this workspace lets work reveal what it wants to become through systematic refinement and AI collaboration.

## Core Philosophy

**Progress > Projects**: Traditional project management forces work into predetermined shapes. Progress Management lets work evolve naturally, maintaining flexibility while building momentum.

## Your First Hour

### 1. Set Up Your Workspace
```bash
# Clone Takuma OS
git clone [repo-url] takuma-os
cd takuma-os

# Create your personal workspace
cp -r workspace-template ~/my-workspace
cd ~/my-workspace
```

### 2. Explore the Knowledge Base
Start by browsing the `knowledge/` directory. This curated wisdom will inform how you work:
- **Books/** - Complete frameworks and methodologies
- **Pieces/** - Specific insights and techniques

Recommended first reads:
- `knowledge/Books/Getting Real/01_what-is-getting-real.md`
- `knowledge/Books/Shape Up/02_principles-of-shaping.md`

### 3. Create Your First Side Quest
Side Quests are experiments - low commitment, high learning:

```bash
cd "⚔️ SIDE QUESTS"
mkdir "🔬 My First Experiment"
cd "🔬 My First Experiment"
```

Create a CLAUDE.md file to capture context:
```markdown
# 🔬 My First Experiment

## What I'm Exploring
[What question or idea sparked this?]

## Current Understanding
[What do I know so far?]

## Next Steps
[What will I try first?]
```

### 4. Let Work Reveal Itself
Don't over-plan. Start with:
1. A question you want to answer
2. A problem you want to solve
3. An idea you want to explore

As you work, the project will tell you:
- Whether it belongs in SIDE QUESTS or deserves its own space
- What resources from `knowledge/` apply
- When it's ready to graduate to a full project

## Working with AI

### The CLAUDE.md Pattern
Every project should have a CLAUDE.md file that captures:
- Current context and understanding
- Project-specific instructions
- Accumulated decisions and learnings

This becomes your AI's memory across conversations.

### Effective AI Collaboration
1. **Start with exploration**: "Help me understand..."
2. **Build context gradually**: Reference specific knowledge files
3. **Maintain agency**: You decide, AI amplifies
4. **Document insights**: Update CLAUDE.md as you learn

## Daily Workflow

### Morning
1. Review yesterday's progress
2. Check `plan/` for priorities (if you use daily planning)
3. Choose your focus area

### During Work
1. Keep CLAUDE.md updated with decisions
2. Reference `knowledge/` for frameworks
3. Move fluidly between projects as energy dictates

### Evening
1. Capture key insights in project CLAUDE.md
2. Archive completed work
3. Note what wants attention tomorrow

## Common Patterns

### When Starting Something New
1. Check if similar work exists in `research/`
2. Start in `⚔️ SIDE QUESTS` unless you're certain of scope
3. Create CLAUDE.md immediately
4. Pull relevant wisdom from `knowledge/`

### When Stuck
1. Search `knowledge/` for relevant frameworks
2. Check `examples/` for similar projects
3. Update CLAUDE.md with the challenge
4. Step away - let your subconscious work

### When Growing
- SIDE QUEST → Named Project (when scope clarifies)
- Local work → Shared in TAKUMA OS (when ready)
- Simple tool → Automated utility (when pattern emerges)

## Remember

- **Progress emerges**: Don't force structure prematurely
- **Context is king**: CLAUDE.md files are your memory
- **Knowledge informs**: Let the knowledge base guide decisions
- **Work has personality**: Hence the emoji convention
- **You maintain agency**: Tools and AI serve your vision

The workspace should feel alive, not mechanical. Let it breathe.