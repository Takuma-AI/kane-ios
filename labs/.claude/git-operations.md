# Git Operations for Labs

Version control in Labs operates at two levels: the OS tracks vision and progress, while product submodules track implementation. Each serves its purpose.

## Two-Level Git Architecture

### OS Level (takuma-os)
Where we track:
- Product visions and pitches
- Department-wide patterns
- Progress documentation
- System configuration

### Product Level (submodules)
Where we track:
- Actual code (Rails, iOS, etc.)
- Tests and implementation
- Product-specific documentation
- Deployment configuration

## Submodule Philosophy

Products need their own evolutionary space. The OS points to current reality, not historical states.

### Adding a New Product
```bash
# From labs/ directory
git submodule add [repository-url] [product-name]/codebase
git submodule update --init --recursive

# Configure to track main branch
git config -f .gitmodules submodule.labs/[product]/codebase.branch main
```

### Daily Workflow

#### Morning: Sync Reality
```bash
# Pull OS changes
git pull

# Update all product submodules to latest
git submodule update --remote --merge
```

#### During Development: Context Awareness
```bash
# Always know where you are
pwd
git remote -v

# For product code changes
cd labs/[product]/codebase
git add -p  # Review changes consciously
git commit -m "Ship [feature]: [what it enables]"
git push

# For OS changes (visions, pitches)
cd [back to OS root]
git add [file]
git commit -m "Shape [product]: [what evolved]"
```

#### Evening: Push Progress
```bash
# If you changed product code
cd labs/[product]/codebase
git push

# Update OS to point to new product state
cd [OS root]
git add labs/[product]/codebase
git commit -m "Update [product]: [progress made]"
git push
```

## Commit Philosophy

### In Product Repos
Commits record shipped progress:
```bash
git commit -m "Ship [feature]: [capability enabled]"
git commit -m "Fix [issue]: [what works now]"
git commit -m "Refactor [area]: [what improved]"
```

### In OS Repo
Commits record evolution:
```bash
git commit -m "Shape [product]: [vision clarified]"
git commit -m "Update [product]: [progress summary]"
git commit -m "Document [learning]: [what we know now]"
```

## Common Patterns

### Check Product Status
```bash
# See all submodule states
git submodule status

# Check specific product
cd labs/[product]/codebase
git status
git log --oneline -5
```

### Switch Product Branches
```bash
cd labs/[product]/codebase
git checkout -b feature/[what-it-enables]
# Work and commit
git push -u origin feature/[what-it-enables]
```

### Update After Team Changes
```bash
# Someone else updated the product
git pull
git submodule update --remote --merge

# Conflicts in submodule?
cd labs/[product]/codebase
git status  # Resolve conflicts
git add .
git commit
cd [OS root]
git add labs/[product]/codebase
git commit -m "Resolve [product] conflicts"
```

## Critical Rules

### Never Commit Broken References
Always push product changes before updating OS:
```bash
# WRONG - OS points to unpushed commit
cd labs/kane/codebase
git commit -m "Add feature"
cd ../../..
git add labs/kane/codebase
git commit -m "Update kane"  # Points to commit that doesn't exist on remote!

# RIGHT - Push first, then update
cd labs/kane/codebase
git commit -m "Add feature"
git push  # Make it real
cd ../../..
git add labs/kane/codebase
git commit -m "Update kane"
```

### Keep Boundaries Clear
- `/vision.md` and `/pitches/` → OS repo
- `/codebase/` → Product repo
- Never mix commits across boundaries

### Pull Frequently
```bash
# Start every session
git pull --recurse-submodules
git submodule update --remote --merge
```

## Troubleshooting

### Submodule Out of Sync
```bash
# Reset to tracked commit
git submodule update --force

# Or update to latest
git submodule update --remote --merge
```

### Accidental Direct Edit
If you edited submodule files without being in the submodule:
```bash
cd labs/[product]/codebase
git status  # See the changes
git add -p  # Stage appropriately
git commit
git push
```

### Lost in Git Context
```bash
# Where am I?
pwd

# What repo is this?
git remote -v

# What's my status?
git status

# What submodules exist?
git submodule status
```

## Remember

- Products evolve independently within the OS framework
- Always push product changes before updating OS references
- The OS tracks what IS, not what WAS
- Each commit is progress crystallized
- When in doubt, check your context with `git remote -v`

The architecture serves the work. Products need freedom to evolve while remaining connected to the whole.