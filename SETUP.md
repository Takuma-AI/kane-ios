# Setting Up Takuma OS

## Prerequisites
- Git
- Claude Code (Anthropic's CLI for Claude)
- Python 3.8+ (for tools)

## Quick Setup

### 1. Clone and Create Your Workspace
```bash
# Clone Takuma OS
git clone https://github.com/Takuma-AI/takuma-os.git
cd takuma-os

# Create your personal workspace
cp -r workspace-template ~/takuma-workspace
cd ~/takuma-workspace
```

### 2. Configure Claude Code
The workspace includes CLAUDE.md files at multiple levels:
- **Root CLAUDE.md** - Overall workspace philosophy and navigation
- **Project CLAUDE.md** - Project-specific context (e.g., 🌒 TAKUMA/CLAUDE.md)
- **Your own CLAUDE.md** - Add to any directory for local context

Claude Code automatically reads these files to understand your workspace.

### 3. Create Your Global Claude Configuration (Optional)
```bash
# Create global Claude instructions
mkdir -p ~/.claude
cat > ~/.claude/CLAUDE.md << 'EOF'
# My Global Claude Instructions

[Add any personal preferences for how Claude should work across all projects]
EOF
```

### 4. Set Up Tools
```bash
# Navigate to your workspace
cd ~/takuma-workspace

# Copy tools from Takuma OS
cp -r path/to/takuma-os/tools ./

# Set up basecamp-sync
cd tools/basecamp-sync
./sync --setup

# Set up youtube-transcribe
cd ../youtube-transcribe
pip install -r requirements.txt
```

## Working with Claude Code

### Basic Workflow
1. Open your workspace in Claude Code
2. Claude will automatically read CLAUDE.md files for context
3. Start with a Side Quest to get familiar with the system

### Example Session
```bash
# Start Claude Code in your workspace
cd ~/takuma-workspace
claude

# Claude now understands:
# - The Progress Management philosophy
# - Your project structure
# - The emoji naming convention
# - Any project-specific context
```

### Creating Project Context
When starting a new project:
```bash
cd "⚔️ SIDE QUESTS"
mkdir "🔬 My Experiment"
cd "🔬 My Experiment"

# Create project-specific context
cat > CLAUDE.md << 'EOF'
# 🔬 My Experiment

## What I'm Exploring
[Your project context]

## Current Understanding
[What you know so far]

## Instructions for Claude
[Any project-specific instructions]
EOF
```

## Customizing Your Workspace

### Adding Knowledge
Copy relevant materials to your local `knowledge/` directory:
```bash
cp -r /path/to/useful/docs ~/takuma-workspace/knowledge/
```

### Creating Tools
Add new tools to your local `tools/` directory following the pattern:
```
tools/
└── my-tool/
    ├── README.md
    ├── requirements.txt (if Python)
    └── tool-script.py
```

### Sharing Back
When you create something worth sharing:
1. Copy it to your fork of takuma-os
2. Clean sensitive content
3. Submit a pull request

## Tips for Claude Code Users

1. **Update Context Regularly**: Keep CLAUDE.md files current as projects evolve
2. **Reference Knowledge**: Point Claude to specific files in knowledge/ for frameworks
3. **Use Todo Lists**: Claude Code works well with task tracking in markdown
4. **Leverage Templates**: Start from examples/ for common project types

## Troubleshooting

### Claude Can't Find Context
- Ensure CLAUDE.md files are in the correct directories
- Check file permissions
- Restart Claude Code session

### Tools Not Working
- Verify Python/Node versions
- Check tool-specific README files
- Ensure dependencies are installed

### Git Issues
- Your workspace should NOT be a git repository
- Only takuma-os itself is git-tracked
- Use simple copy operations to share

## Next Steps
1. Read `philosophy/getting-started.md`
2. Explore the knowledge base
3. Create your first Side Quest
4. Let your work reveal what it wants to become

Remember: The system should feel alive, not mechanical.