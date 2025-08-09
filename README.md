# Takuma OS

The operating system for Takuma - where business operations become executable code through natural language.

## What This Is

This repository IS Takuma. Not documentation about the company, but the company itself encoded as an executable system. Every document here is a word program that runs as real-world progress.

## For Human Operators

### Philosophy

We believe words have become code. Not metaphorically - literally. This repository embodies that belief. Every CLAUDE.md file contains instructions that ARE the company's operations, not descriptions of them.

When you work here, you're not using the OS - you're executing it.

### Getting Started

1. **Clone with submodules**: 
   ```bash
   git clone --recursive [repository-url]
   # Or if already cloned:
   git submodule update --init --recursive
   ```

2. **Understand the structure**:
   - `/core/` - Company DNA (handbook, manifesto, thought leadership)
   - `/labs/` - Product development studio
   - `/bespoke/` - Consulting engagements  
   - `/knowledge/` - Shared patterns and references
   - `/tools/` - Automation utilities
   - `/local/` - Your personal workspace (gitignored)
   - `/archive/` - Historical work preserved

3. **Read the foundation**:
   Start with `/core/handbook/` to understand who we are and why we exist.

### Working with AI Agents

Each directory contains a CLAUDE.md file that serves as the operating instructions for that department. When launching an AI agent:

- At root level: Agent understands the entire company
- At `/labs/`: Agent becomes a product development partner
- At `/bespoke/`: Agent becomes a consulting co-founder
- At specific products/clients: Agent has full context for that work

The system is hierarchical - each level inherits from its parent while adding its own context.

### Git Submodules

Products in `/labs/` use git submodules for their codebases. This separates intent (the OS) from implementation (the code).

#### Update all submodules:
```bash
git submodule update --remote --merge
```

#### Add a new product:
```bash
cd labs
git submodule add [repository-url] [product-name]/codebase
```

#### Important: 
- Submodules always track the latest main branch
- Commit submodule updates to the OS when products evolve significantly
- Keep product vision and pitches in the OS, code in the submodule

### Working with the OS

1. **Start**: Pull latest state
   ```bash
   git pull --recurse-submodules
   ```

2. **During Work**: Each change is a decision
   - Make changes with intent
   - Commit when understanding crystallizes
   - Push when work creates meaningful progress

3. **Completion**: Share your progress
   ```bash
   git push
   ```

Work happens in units of meaningful progress, not time. A task might span hours or days - what matters is that each commit represents intentional evolution of the company.

### The Local Folder

The `/local/` directory is gitignored. Use it for:
- Personal experiments
- Messy drafts
- Work not ready for the shared OS
- Anything you want to keep private

### Making Changes

This OS evolves through pull requests. Each PR should:
- Have a clear epicenter (the one thing it enables)
- Explain the struggle it addresses
- Show what reality looks like after merging
- Be shipped as soon as it enables progress

### Architecture Principles

1. **Words are code** - Every document is executable
2. **Departments are directories** - Each folder is a functional unit
3. **Context cascades** - Child directories inherit parent context
4. **Archives preserve history** - Completed work teaches through preservation
5. **Main is reality** - The main branch is always the current state

## Recent Updates

- **2025-08-08**: Initial OS architecture established
- **2025-08-08**: Core philosophy encoded from handbook
- **2025-08-08**: Department structures created (labs, bespoke)

For detailed history: `git log --oneline`

## Remember

You're not documenting work. You're encoding it.

You're not managing the company. You're programming it.

You're not using Takuma OS. You ARE Takuma OS in action.

---

*Discover intent. Refine and repeat.*