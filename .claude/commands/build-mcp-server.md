# Build MCP Server Command

You are building an MCP (Model Context Protocol) server for Claude Code integration. Follow the same philosophy as building products - start with understanding the struggle, shape the work, then build progressively.

## Context: Extending Takuma OS

You're building bridges that allow Takuma OS to operate across platforms. Each MCP server is a portal through which the OS can:
- Push progress from Takuma OS to external platforms
- Pull context from platforms back into the OS  
- Maintain coherence across distributed systems
- Preserve the OS philosophy while working with external constraints

Think of MCP servers as the OS's ambassadors - they translate Takuma OS's intent into actions on other platforms while respecting both systems' patterns.

## Your Role

You're an MCP server architect who:
- Questions to understand the real need
- Shapes the minimal working integration  
- Builds progressively from proof of concept to full server
- Ships what works today, not what might work tomorrow
- Ensures the server serves Takuma OS's operating philosophy

## Discovery Process

### 1. Find the Epicenter
Start with questions to understand what they really need:

```
"What external service or API do you need Claude to interact with?"
"What's the ONE thing you need this to do first? What would make this immediately useful?"
"Are you trying to read data, write data, or both?"
"Show me an example of what you'd want to ask Claude to do with this service."
"How does this extend Takuma OS's capabilities?"
"What friction does this remove from your workflow?"
```

### 2. Understand the Integration Context

For Takuma OS specifically:
- How does this platform relate to the departments? (Labs, Bespoke, Knowledge, Tools)
- Is this about progress tracking (like Basecamp) or capability extension?
- Will this be used by subagents or the main Claude interface?
- Should this eventually become a submodule for portability?

### 3. Shape the Integration

Once you understand the need:
- Identify the minimal proof of concept (one working tool)
- Determine authentication method (API key, OAuth, token)
- Find the simplest API endpoint that proves it works
- Set appetite: Small batch (1 tool), Medium (3-5 tools), Large (full integration)
- Consider how this fits with existing MCP servers in the ecosystem

### 4. Technical Discovery

Research the API:
- Check if there's an existing Python SDK
- Find API documentation
- Identify authentication requirements
- Understand rate limits and constraints
- Look for similar patterns in existing takuma-os MCP servers

## Build Process

### Phase 1: Create GitHub Repository First

```bash
# Create GitHub repository for the MCP server
gh repo create Takuma-AI/[service]-mcp --public --description "MCP server for [service] integration"

# Clone it as a submodule directly into tools/servers/
cd /Users/kate/Documents/Manual\ Library/Projects/takuma-os
git submodule add https://github.com/Takuma-AI/[service]-mcp.git tools/servers/[service-name]

# Enter the new submodule
cd tools/servers/[service-name]

# Initialize Python environment
python3 -m venv venv
```

### Phase 2: Build Minimal Server

Start with the absolute minimum - one tool that proves the connection works.

Create `server.py`:
```python
#!/usr/bin/env python3
"""
[Service] MCP Server
[One line description of what this enables for Takuma OS]
"""

import os
import json
import httpx
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("[service-name]")

# Credentials loading
def load_credentials():
    """Load credentials from environment variables (project .env file)"""
    # Load from environment variables set by .env file in project root
    creds = {
        'api_key': os.getenv('[SERVICE]_API_KEY')
    }
    
    # For local testing only - credentials.json fallback
    if not creds['api_key']:
        creds_file = os.path.join(os.path.dirname(__file__), 'credentials.json')
        if os.path.exists(creds_file):
            with open(creds_file, 'r') as f:
                creds = json.load(f)
    
    return creds

CREDS = load_credentials()

@mcp.tool()
async def [minimal_tool_name]() -> dict:
    """[What this tool does - be specific about what it enables]"""
    
    if not CREDS.get('api_key'):
        return {
            "success": False,
            "error": "Missing API credentials"
        }
    
    # Simplest possible API call
    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(
                "[API_ENDPOINT]",
                headers={"Authorization": f"Bearer {CREDS['api_key']}"}
            )
            
            if response.status_code == 200:
                return {
                    "success": True,
                    "data": response.json()
                }
            else:
                return {
                    "success": False,
                    "error": f"API error: {response.status_code}"
                }
        except Exception as e:
            return {
                "success": False,
                "error": str(e)
            }

if __name__ == "__main__":
    mcp.run()
```

Create `requirements.txt`:
```
mcp[cli]
httpx
```

Create `credentials.example.json`:
```json
{
  "api_key": "YOUR_API_KEY_HERE"
}
```

Create `.gitignore`:
```
# Python
__pycache__/
*.py[cod]
*$py.class
venv/
.venv/

# Credentials - NEVER commit these
credentials.json
.env
*.token

# IDE
.vscode/
.idea/

# MacOS
.DS_Store

# Test scripts and development files
tests/
test_*.py
*.test.py
development/
scratch/
tmp/

# Log files
*.log
logs/

# Local development notes
notes.md
TODO.md
local_*.md
IMPLEMENTATION_STATUS.md
```

Create `tests/` directory for test scripts:
```bash
mkdir tests
cat > tests/README.md << 'EOF'
# Test Scripts

This directory contains test scripts for local development. These files are not tracked in git.

## Important
- Test scripts are gitignored and won't be shared
- Place all test files here, not in the root directory
- Name them test_*.py for consistency
- Each developer creates their own test scripts as needed

## Why Tests Are Gitignored
- Test scripts often contain specific IDs and test data
- Keeps the repository clean and focused on core server code
- Prevents accidental commits of development/debugging code
EOF
```

### Phase 3: Test Connection

```bash
# Install dependencies
./venv/bin/pip install -r requirements.txt

# Create test script in tests/ directory
cat > tests/test_connection.py << 'EOF'
#!/usr/bin/env python3
import asyncio
import sys
import os
# Add parent directory to path for imports
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from server import [minimal_tool_name]

async def test():
    print("Testing [Service] connection...")
    result = await [minimal_tool_name]()
    if result.get('success'):
        print("✅ Connection successful!")
        print(f"Data: {result.get('data')}")
    else:
        print(f"❌ Failed: {result.get('error')}")

asyncio.run(test())
EOF

# Add credentials
cp credentials.example.json credentials.json
# [Instruct user to edit credentials.json]

# Test
./venv/bin/python tests/test_connection.py
```

### Phase 4: Connect to Claude Code

```bash
# Add to Claude using the submodule path
claude mcp add [service-name] \
  "$PWD/tools/servers/[service-name]/venv/bin/python $PWD/tools/servers/[service-name]/server.py"

# Verify
claude mcp list

# Update project .env file with credentials
echo "[SERVICE]_API_KEY=your_api_key_here" >> /Users/kate/Documents/Manual\ Library/Projects/takuma-os/.env
```

### Phase 5: Progressive Enhancement

Only after the minimal tool works:
1. Add second tool that builds on the first
2. Add error handling and retry logic
3. Add pagination if needed
4. Add OAuth refresh if needed
5. Add caching if beneficial

## OAuth Services

If the service requires OAuth:

### Option 1: Use Existing App
If user has a web app with OAuth already (like Hashi for Basecamp):
- Create extraction script to get tokens from existing app
- Store refresh token for longevity
- Add refresh logic to server

### Option 2: Local OAuth Flow  
For services that support it:
- Implement temporary local server for callback
- Open browser for auth
- Capture token automatically

### Option 3: Manual Token
Simplest approach:
- Provide clear instructions
- User gets token manually
- Save to credentials.json

## Integration Patterns for Takuma OS

### Progress Synchronization
For project management platforms (Basecamp, Asana, Linear):
```python
@mcp.tool()
async def sync_progress_to_platform(
    department: str,  # labs, bespoke, knowledge
    progress_type: str,  # milestone, task, completion
    content: str
) -> dict:
    """Pushes Takuma OS progress to external platform"""
    # Map OS concepts to platform concepts
    # Preserve OS philosophy in translation
```

### Context Retrieval
For knowledge platforms (Notion, Confluence, GitHub):
```python
@mcp.tool()
async def pull_context_from_platform(
    query: str,
    relevance_to: str  # which OS department needs this
) -> dict:
    """Pulls relevant context back into OS workflows"""
    # Filter for what matters to current work
    # Transform into OS-compatible format
```

### Capability Extension
For service platforms (AWS, Stripe, Plaid):
```python
@mcp.tool()
async def execute_platform_capability(
    action: str,
    parameters: dict
) -> dict:
    """Extends OS capabilities through platform services"""
    # Wrap complex platform operations
    # Return results in OS-friendly format
```

## Common Patterns to Include

### Rate Limiting with Backoff
```python
async def with_retry(func, max_retries=3):
    for attempt in range(max_retries):
        result = await func()
        if result.get('error') == 'rate_limited':
            await asyncio.sleep(2 ** attempt)
            continue
        return result
    return result
```

### Pagination for Complete Data
```python
async def get_all_pages(endpoint):
    all_items = []
    next_url = endpoint
    
    while next_url:
        response = await fetch_page(next_url)
        all_items.extend(response['items'])
        next_url = response.get('next')
    
    return all_items
```

### Token Refresh for Long Sessions
```python
async def ensure_valid_token():
    if token_expires_soon():
        new_token = await refresh_token(CREDS['refresh_token'])
        update_credentials(new_token)
    return CREDS['token']
```

## Submodule Consideration

For MCP servers that become essential to Takuma OS operations:

1. **When to make it a submodule:**
   - Used across multiple departments
   - Has its own evolution cycle
   - Other users might benefit from it
   - Needs independent versioning

2. **Submodule setup:**
```bash
# Create GitHub repo
gh repo create Takuma-AI/[service]-mcp --public

# Initialize and push
git init
git add .
git commit -m "Initial [service] MCP server"
git remote add origin https://github.com/Takuma-AI/[service]-mcp.git
git push -u origin main

# Add as submodule to takuma-os
cd /Users/kate/Documents/Manual\ Library/Projects/takuma-os
git submodule add https://github.com/Takuma-AI/[service]-mcp.git tools/mcp/[service]
git commit -m "Add [service] MCP server as submodule"
```

## Success Criteria

Before considering the MCP server complete:
- [ ] One tool successfully returns data
- [ ] Claude Code shows server as connected  
- [ ] Credentials are loaded securely
- [ ] Errors return helpful messages
- [ ] README explains setup clearly
- [ ] Test script confirms connection
- [ ] Integration serves Takuma OS philosophy
- [ ] Consider if it should be a submodule

## Anti-Patterns to Avoid

- ❌ Building multiple tools before one works
- ❌ Complex OAuth before trying API keys
- ❌ Perfect error handling before basic functionality
- ❌ Caching before confirming it's needed
- ❌ Generic tools instead of specific use cases
- ❌ Fighting the platform's patterns instead of translating
- ❌ Losing OS philosophy in platform constraints

## Questions to Ask Throughout

- "What's the simplest version that ships today?"
- "What assumption are we making about the API?"
- "Can we hardcode this for now?"
- "Is this the epicenter or an edge case?"
- "What would make this immediately useful?"
- "How does this serve the OS's larger purpose?"
- "Should this be reusable beyond this specific need?"

## Remember

- Ship the smallest thing that works
- One working tool is better than five broken ones
- Test outside MCP first, add MCP layer second
- Clear error messages over silent failures
- Document what it enables, not how it works
- Preserve Takuma OS philosophy across platform boundaries
- Each MCP server extends the OS's reach, not its complexity

The goal is a working MCP server that extends Takuma OS's capabilities into other platforms while maintaining the system's coherence and philosophy.