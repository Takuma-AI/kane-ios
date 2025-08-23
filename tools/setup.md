# MCP Server Setup Guide

This guide will help you set up all the MCP (Model Context Protocol) servers that give Claude superpowers in the Takuma OS.

## Co-founder Quick Start

If you're a co-founder who just pulled the latest repo, jump to [Quick Setup](#quick-setup-5-minutes) below.

## Prerequisites

Before starting, make sure you have:
1. **Claude Desktop** installed with CLI ([Download here](https://claude.ai/download))
2. **Python 3.9+** installed (`python3 --version` to check)
3. **Git** with submodule support
4. API keys ready (see below)

## Required API Keys

You'll need these API keys before running setup. The setup script will prompt you for them and store them in a `.env` file:

| Service | Where to Get | What It Does |
|---------|--------------|--------------|
| **Basecamp** | [3.basecamp.com/integrations](https://3.basecamp.com/integrations) | Project management, todos, documents |
| **Perplexity** | [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api) | Web research and analysis |

## Quick Setup (5 minutes)

1. **Update submodules (if you already have the repo):**
   ```bash
   git submodule update --init --recursive
   ```
   
   Or clone fresh with submodules:
   ```bash
   git clone --recurse-submodules [repo-url]
   cd takuma-os
   ```

2. **Run the setup script:**
   ```bash
   ./tools/setup-servers.sh
   ```
   
   The script will:
   - Check prerequisites
   - Install Python dependencies for each server
   - Prompt you for API keys and save them to `.env`
   - Add all servers to Claude
   - Test the connections
   
   All credentials are stored in a single `.env` file in the project root.

4. **Restart Claude Desktop**
   
   After setup completes, fully quit and restart Claude Desktop to load the new servers.

5. **Verify it worked:**
   
   In Claude, you can test by asking:
   - "Can you list my Basecamp projects?"
   - "Can you use Perplexity to research [topic]?"
   - "Can you generate a PDF from this markdown?"
   - "Can you transcribe this YouTube video: [url]"

## What Each Server Does

- **basecamp**: Full Basecamp integration - create todos, upload documents, manage projects
- **perplexity-deep-research**: Advanced web research with Perplexity's Sonar models
- **pdf-generator**: Convert markdown to beautiful PDFs with multiple styles
- **youtube-transcribe**: Download and transcribe YouTube videos using Whisper

## Troubleshooting

### "Claude CLI not found"
Make sure Claude Desktop is installed and you've opened it at least once.

### "Permission denied" when running script
```bash
chmod +x tools/setup-servers.sh
```

### API key errors
- Double-check your API keys are correct
- Make sure you have the right permissions/tier for each service
- Perplexity: Requires API access (separate from regular subscription)

### MCP servers not showing in Claude
1. Make sure you restarted Claude Desktop completely (Cmd+Q on Mac)
2. Check they're listed: `claude mcp list`
3. Make sure you're in the project directory when using Claude

### "Module not found" errors
Re-run the setup script - it will reinstall missing dependencies.

## Manual Setup (if script fails)

If the automated script doesn't work, here's what it does:

1. **For each MCP server in `tools/servers/`:**
   ```bash
   cd tools/servers/[server-name]
   python3 -m venv venv
   ./venv/bin/pip install -r requirements.txt
   ```

2. **Add credentials to .env file:**
   Create a `.env` file in the project root with:
   ```
   BASECAMP_ACCOUNT_ID=your_account_id
   BASECAMP_ACCESS_TOKEN=your_token
   PERPLEXITY_API_KEY=your_key
   ```

3. **Add to Claude:**
   ```bash
   claude mcp add basecamp "$PWD/tools/servers/basecamp/venv/bin/python $PWD/tools/servers/basecamp/server.py"
   # Repeat for each server...
   ```

## Updating

To get the latest MCP server updates:
```bash
git pull
git submodule update --remote --merge
./tools/setup-servers.sh  # Re-run to update dependencies
```

## Security Notes

- **Never commit .env file** - The .env file is gitignored
- **Keep API keys secure** - Don't share them or expose in logs
- **Use project-level config** - Keeps MCP servers isolated to this project
- **Single source of truth** - All credentials in one .env file makes rotation easier

## Need Help?

- Check server logs: `tools/servers/[server-name]/server.log`
- Test individual servers: `claude mcp list`
- Ask Claude to test each tool to verify it's working
- **Run `/setup` in Claude** for automated health check and troubleshooting