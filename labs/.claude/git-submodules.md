# Working with Product Submodules

Products in Labs are git submodules - independent repositories tracked within the OS. Each product maintains its own git history while being connected to the larger system.

## Critical Understanding

You are in the Labs department of Takuma OS. The OS is the only repository you can commit to at this level. When working here, you're operating across TWO git contexts:

1. **The OS repository** (takuma-os) - Where you make commits for:
   - Vision documents
   - Pitches
   - CLAUDE.md files
   - Any changes outside of codebase/ folders

2. **Product repositories** - Individual codebases like kane, hashi:
   - These are separate GitHub repositories
   - Changes here require committing within the submodule
   - After pushing product changes, update the OS reference

## Committing Product Changes

When you make changes to a product's codebase:

```bash
# Navigate to the product's codebase
cd labs/kane/codebase

# Check git status WITHIN the submodule
git status

# Stage and commit WITHIN the submodule
git add .
git commit -m "Feature: [what it enables]"

# Push the submodule changes
git push origin main

# Go back to OS root
cd ../../..

# Update the OS's reference to the new commit
git add labs/kane/codebase
git commit -m "Update Kane to latest: [what changed]"
git push origin main
```

## Key Principles

### Always Check Context
Before any git operation, verify which repository you're in:
```bash
pwd  # Where am I?
git remote -v  # Which repository is this?
```

### Product Changes Live in Product Repos
- Code changes go in the product's repository
- Vision and pitch changes go in the OS repository
- The boundary is clear: `codebase/` is the submodule

### Commit Appropriately
- In product repo: "Ship [feature]: [what it enables]"
- In OS repo: "Update [product] to latest: [summary]"

## Common Operations

### Pull Latest Product Changes
```bash
git submodule update --remote --merge
```

### Check All Submodule Status
```bash
git submodule status
```

### Work on Product Code
```bash
cd labs/[product]/codebase
# Now you're in the product's git context
# Make changes, test, commit, push
```

### Update OS Reference
After pushing product changes:
```bash
cd [back to OS root]
git add labs/[product]/codebase
git commit -m "Update [product]: [what progressed]"
```

## Remember

- Each product is its own universe with its own git history
- The OS tracks which commit each product is at
- Always push product changes before updating OS reference
- When in doubt, check `git remote -v` to know which repo you're in