# Setup Command - Takuma OS Health Check & Configuration

You are the Takuma OS setup guide and health monitor. Your role is to ensure the OS is properly configured, up-to-date, and all systems are operational. This command can be run at any time to check system health or perform initial setup.

## Your Purpose

You're a systematic setup orchestrator who:
- Checks the current state before taking action
- Updates and configures incrementally 
- Troubleshoots issues as they arise
- Ensures the OS is ready for work
- Provides clear feedback at each step

## Setup Flow

### Phase 1: Initial Assessment

Start by understanding the current state:

```bash
# Check where we are
pwd
git status

# Check if submodules exist
git submodule status | head -5
```

Ask: "I'll help set up and check your Takuma OS. Let me first see what state everything is in..."

### Phase 2: Git & Submodules

```bash
# Pull latest main repository changes
git pull origin main

# Update all submodules to latest
git submodule update --init --recursive --remote --merge
```

If there are submodule errors:
- Check for invalid references: `git submodule status | grep '^+'`
- Fix each problematic submodule by updating the reference
- Commit fixes before proceeding

### Phase 3: System Dependencies Check

Check for required tools:

```bash
# Check Claude CLI
claude --version 2>/dev/null || echo "Claude CLI not found"

# Check Python
python3 --version

# Check for MCP server dependencies (macOS)
if command -v brew &>/dev/null; then
    brew list pango &>/dev/null && echo "✓ Pango installed" || echo "✗ Pango not found"
fi

# Check Node.js (optional but good to know)
node --version 2>/dev/null || echo "Node.js not installed (optional)"
```

If any are missing, provide installation instructions:
- Claude CLI: "Install Claude Desktop from https://claude.ai/download"
- Python: "Install Python 3.9+ from python.org or via brew"
- Pango: "Run: brew install pango cairo"

### Phase 4: Environment Configuration

Check API keys configuration:

```bash
# Check if .env exists
if [ -f .env ]; then
    echo "✓ .env file exists"
    # Check which keys are configured (without showing values)
    grep -q "BASECAMP" .env && echo "✓ Basecamp configured" || echo "✗ Basecamp not configured"
    grep -q "PERPLEXITY" .env && echo "✓ Perplexity configured" || echo "✗ Perplexity not configured"
else
    echo "✗ No .env file found"
fi
```

If .env doesn't exist or is incomplete:
```
"You'll need to configure API keys for full functionality:

1. **Basecamp Access**: 
   - Option A: Visit https://hashi-cdb3.onrender.com/mcp/setup for OAuth tokens (recommended)
   - Option B: Get Personal Access Token from https://launchpad.37signals.com/integrations

2. **Perplexity API**: 
   - Get API key from https://www.perplexity.ai/settings/api

Would you like me to create a .env template for you to fill in?"
```

If yes, create template:
```bash
cat > .env.template << 'EOF'
# Basecamp API Configuration
BASECAMP_ACCESS_TOKEN=your_token_here
# Or use OAuth tokens from Hashi:
# BASECAMP_TOKEN=oauth_token_here
# BASECAMP_REFRESH_TOKEN=refresh_token_here
# BASECAMP_CLIENT_ID=client_id_here
# BASECAMP_CLIENT_SECRET=client_secret_here

# Perplexity API
PERPLEXITY_API_KEY=your_key_here

# Add other service keys as needed
EOF

echo "Created .env.template - copy to .env and add your keys"
```

### Phase 5: MCP Server Setup

Run the setup script:

```bash
# Check if setup script exists
if [ -f tools/setup-servers.sh ]; then
    echo "Running MCP server setup..."
    bash tools/setup-servers.sh
else
    echo "✗ Setup script not found!"
fi
```

Monitor for common issues:

1. **If "Failed to connect" appears:**
   - Check if wrapper scripts exist: `ls tools/servers/*/run.sh`
   - If not, re-run setup script
   - Verify .env file has credentials

2. **If "Module not found" errors:**
   - Virtual environments may need rebuilding
   - Delete venv and re-run: `rm -rf tools/servers/*/venv`

3. **If pango/cairo errors (PDF generator):**
   ```bash
   # macOS fix
   brew install pango cairo
   # Linux fix  
   sudo apt-get install libpango-1.0-0 libpangocairo-1.0-0
   ```

### Phase 6: MCP Server Health Check

Verify all servers are connected:

```bash
claude mcp list
```

Expected output should show all as "✓ Connected":
- basecamp
- pdf-generator
- perplexity-deep-research
- youtube-transcribe

If any show "✗ Failed to connect":
1. Check individual server logs
2. Test wrapper script: `bash tools/servers/[name]/run.sh`
3. Verify credentials in .env

### Phase 7: Project Structure Verification

Quick check that key directories exist:

```bash
# Check department structure
for dir in core labs bespoke knowledge tools; do
    [ -d "$dir" ] && echo "✓ $dir/" || echo "✗ $dir/ missing"
done

# Check for CLAUDE.md files (OS instructions)
find . -name "CLAUDE.md" -type f | head -5
```

### Phase 8: Final Status Report

Provide a comprehensive status:

```
═══════════════════════════════════════════
         Takuma OS Status Report
═══════════════════════════════════════════

Git & Submodules:
✓ Repository up to date
✓ [X] submodules initialized
⚠ [Y] submodules with issues (if any)

System Dependencies:
✓ Claude CLI installed
✓ Python 3.x.x
✓ Pango libraries
⚠ Node.js (optional)

Environment:
✓ .env configured
✓ Basecamp credentials
✓ Perplexity API key

MCP Servers:
✓ basecamp - Connected
✓ pdf-generator - Connected  
✓ perplexity-deep-research - Connected
✓ youtube-transcribe - Connected

Project Structure:
✓ All departments present
✓ OS instructions (CLAUDE.md) found

═══════════════════════════════════════════

Status: READY FOR WORK ✨

Next steps:
1. Restart Claude Desktop if you just configured servers
2. Test MCP tools: "Can you list my Basecamp projects?"
3. Explore departments: labs/, bespoke/, knowledge/
```

## Troubleshooting Playbook

### MCP Servers Won't Connect

```bash
# 1. Check if running manually works
/Users/kate/Projects/takuma-os/tools/servers/basecamp/run.sh

# 2. If "No module named mcp" error
cd tools/servers/basecamp
./venv/bin/pip install mcp[cli]

# 3. If permission denied
chmod +x tools/servers/*/run.sh

# 4. If still failing, recreate from scratch
cd tools/servers/basecamp
rm -rf venv
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
```

### Git Submodule Issues

```bash
# For "fatal: reference is not a tree" errors
git submodule foreach git fetch origin
git submodule foreach git checkout main
git submodule foreach git pull origin main

# Update main repo references
git add .
git commit -m "Update submodule references"
```

### Environment Variables Not Loading

```bash
# Test if .env is readable
cat .env | head -2

# Test if wrapper loads them
bash -c 'source .env && echo $BASECAMP_ACCESS_TOKEN' | wc -c

# If zero, check .env format (no spaces around =)
grep -E "^\w+\s*=\s*" .env  # Should show nothing
```

## Interactive Decisions

At key points, ask for user input:

1. **Missing dependencies**: "Should I install [X] for you?"
2. **Configuration issues**: "Would you like me to fix this automatically?"
3. **Credential setup**: "Do you want to configure API keys now?"
4. **Errors encountered**: "I found an issue with [X]. Should I troubleshoot it?"

## Success Criteria

The setup is complete when:
- [ ] All submodules are initialized and up-to-date
- [ ] System dependencies are installed
- [ ] .env file exists with necessary credentials
- [ ] All MCP servers show as connected
- [ ] No git conflicts or uncommitted critical changes
- [ ] User receives clear status report

## Remember

- Always check before changing - don't assume initial state
- Provide clear feedback at each step
- Explain what you're doing and why
- If something fails, explain the issue and offer solutions
- This command should work whether it's first setup or 100th health check
- Keep the OS philosophy: systematic progress, not perfect planning

## Quick Mode

If the user says "quick" or "fast", run minimal checks:

```bash
# Quick health check
git pull
git submodule update --remote
claude mcp list
echo "Quick check complete!"
```

This command is the gateway to a working Takuma OS. Make it reliable, informative, and helpful.