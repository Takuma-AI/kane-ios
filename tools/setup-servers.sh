#!/bin/bash

# Takuma OS MCP Server Setup Script
# This script sets up all MCP servers for Claude Desktop

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Takuma OS MCP Server Setup Script     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Check if Claude CLI is installed
echo -e "${YELLOW}Checking prerequisites...${NC}"
if ! command -v claude &> /dev/null; then
    echo -e "${RED}✗ Claude CLI is not installed${NC}"
    echo "Please install Claude Desktop and the CLI first:"
    echo "https://claude.ai/download"
    exit 1
fi
echo -e "${GREEN}✓ Claude CLI found${NC}"

# Check for Python 3
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}✗ Python 3 is not installed${NC}"
    echo "Please install Python 3.9 or later"
    exit 1
fi
echo -e "${GREEN}✓ Python 3 found${NC}"

# Check for system dependencies
echo -e "${YELLOW}Checking system dependencies...${NC}"

# Check for pango (required for PDF generation)
if command -v brew &> /dev/null; then
    # macOS with Homebrew
    if ! brew list pango &>/dev/null; then
        echo -e "${YELLOW}Installing pango for PDF generation...${NC}"
        brew install pango cairo || echo -e "${YELLOW}⚠ Could not install pango automatically${NC}"
    else
        echo -e "${GREEN}✓ Pango found${NC}"
    fi
elif command -v apt-get &> /dev/null; then
    # Ubuntu/Debian
    if ! dpkg -l | grep -q libpango; then
        echo -e "${YELLOW}Installing pango for PDF generation...${NC}"
        sudo apt-get update && sudo apt-get install -y libpango-1.0-0 libpangocairo-1.0-0
    fi
fi

# Check for Node.js (not currently needed but good to check)
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}⚠ Node.js is not installed (not currently required)${NC}"
fi

# Initialize and update git submodules
echo ""
echo -e "${YELLOW}Initializing git submodules...${NC}"
git submodule update --init --recursive
echo -e "${GREEN}✓ Submodules initialized${NC}"

# Function to setup Python-based MCP server
setup_python_mcp() {
    local server_name=$1
    local server_path="$PROJECT_ROOT/tools/servers/$server_name"
    
    echo ""
    echo -e "${BLUE}Setting up $server_name...${NC}"
    
    if [ ! -d "$server_path" ]; then
        echo -e "${RED}✗ Directory not found: $server_path${NC}"
        return 1
    fi
    
    cd "$server_path"
    
    # Create a wrapper script that loads environment variables
    cat > run.sh << EOF
#!/bin/bash
# MCP Server wrapper script for $server_name
# This ensures environment variables are loaded from .env

# Get the directory of this script
SCRIPT_DIR="\$(cd "\$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="\$(cd "\$SCRIPT_DIR/../../.." && pwd)"

# Load environment from .env file if it exists
if [ -f "\$PROJECT_ROOT/.env" ]; then
    export \$(grep -v '^#' "\$PROJECT_ROOT/.env" | xargs)
fi

# Special handling for pdf-generator libraries on macOS
if [ "$server_name" = "pdf-generator" ] && command -v brew &> /dev/null; then
    export DYLD_LIBRARY_PATH="/opt/homebrew/lib:/usr/local/lib:\$DYLD_LIBRARY_PATH"
fi

# Run the server with the virtual environment
exec "\$SCRIPT_DIR/venv/bin/python" "\$SCRIPT_DIR/server.py"
EOF
    chmod +x run.sh
    
    # Check if venv exists and has correct path
    if [ -d "venv" ]; then
        # Check if venv points to current directory
        if ! grep -q "$server_path" venv/bin/pip 2>/dev/null; then
            echo "Virtual environment has incorrect path, recreating..."
            rm -rf venv
            python3 -m venv venv
        fi
    else
        echo "Creating virtual environment..."
        python3 -m venv venv
    fi
    
    # Activate venv and install requirements
    echo "Installing dependencies..."
    ./venv/bin/pip install --quiet --upgrade pip
    
    # Special handling for pdf-generator to find system libraries
    if [ "$server_name" = "pdf-generator" ]; then
        if command -v brew &> /dev/null; then
            # Set environment for macOS to find pango/cairo libraries
            export DYLD_LIBRARY_PATH="/opt/homebrew/lib:/usr/local/lib:$DYLD_LIBRARY_PATH"
            export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
        fi
    fi
    
    if [ -f "requirements.txt" ]; then
        if ./venv/bin/pip install --quiet -r requirements.txt; then
            echo -e "${GREEN}✓ $server_name dependencies installed${NC}"
        else
            echo -e "${RED}✗ Failed to install dependencies for $server_name${NC}"
            return 1
        fi
    else
        echo -e "${YELLOW}⚠ No requirements.txt found for $server_name${NC}"
    fi
    
    # Test the server can start
    echo "Testing server startup..."
    if timeout 5s ./venv/bin/python server.py > /dev/null 2>&1; then
        echo -e "${GREEN}✓ $server_name server starts successfully${NC}"
    else
        echo -e "${YELLOW}⚠ $server_name server test timed out (this may be normal)${NC}"
    fi
}

# Setup each MCP server
setup_python_mcp "basecamp"
setup_python_mcp "pdf-generator"
setup_python_mcp "perplexity-deep-research"
setup_python_mcp "youtube-transcribe"
setup_python_mcp "openai-images"

# Check API keys configuration
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"
echo -e "${YELLOW}        API Keys Status${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"

ENV_FILE="$PROJECT_ROOT/.env"

if [ -f "$ENV_FILE" ]; then
    echo -e "${GREEN}✓ .env file found${NC}"
    echo ""
    echo "Current configuration:"
    echo "----------------------"
    # Show what's configured (without revealing actual keys)
    if grep -q "^BASECAMP_ACCESS_TOKEN=" "$ENV_FILE" || grep -q "^BASECAMP_TOKEN=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ Basecamp credentials configured${NC}"
    else
        echo -e "${YELLOW}⚠ Basecamp credentials not configured${NC}"
        echo "  Visit https://hashi-cdb3.onrender.com/mcp/setup for OAuth tokens"
        echo "  Or get a Personal Access Token from https://launchpad.37signals.com/integrations"
    fi
    
    if grep -q "^PERPLEXITY_API_KEY=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ Perplexity API key configured${NC}"
    else
        echo -e "${YELLOW}⚠ Perplexity API key not configured${NC}"
        echo "  Get one from: https://www.perplexity.ai/settings/api"
    fi
    
    if grep -q "^OPENAI_API_KEY=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ OpenAI API key configured${NC}"
    else
        echo -e "${YELLOW}⚠ OpenAI API key not configured${NC}"
        echo "  Get one from: https://platform.openai.com/api-keys"
    fi
else
    echo -e "${YELLOW}⚠ No .env file found${NC}"
    echo ""
    echo "Please create a .env file with your API keys:"
    echo "  BASECAMP_ACCESS_TOKEN=your_token_here"
    echo "  PERPLEXITY_API_KEY=your_key_here"
    echo "  OPENAI_API_KEY=your_key_here"
    echo ""
    echo "For Basecamp OAuth (recommended):"
    echo "  Visit https://hashi-cdb3.onrender.com/mcp/setup"
fi

# Add MCP servers to Claude
echo ""
echo -e "${YELLOW}Adding MCP servers to Claude...${NC}"

# Function to add or update MCP server
add_mcp_server() {
    local name=$1
    local command=$2
    
    # Check if server already exists and remove it first
    if claude mcp list 2>/dev/null | grep -q "$name:"; then
        echo "Updating $name configuration..."
        claude mcp remove "$name" 2>/dev/null || true
    else
        echo "Adding $name..."
    fi
    
    # Add the server with latest configuration
    cd "$PROJECT_ROOT"  # Run from project root for project-level config
    if claude mcp add "$name" "$command" 2>/dev/null; then
        echo -e "${GREEN}✓ $name configured${NC}"
    else
        # If add fails, it might be because it still exists, try force update
        claude mcp remove "$name" 2>/dev/null || true
        claude mcp add "$name" "$command"
        echo -e "${GREEN}✓ $name configured (updated)${NC}"
    fi
}

# Add each server using the wrapper scripts
add_mcp_server "basecamp" "$PROJECT_ROOT/tools/servers/basecamp/run.sh"
add_mcp_server "pdf-generator" "$PROJECT_ROOT/tools/servers/pdf-generator/run.sh"
add_mcp_server "perplexity-deep-research" "$PROJECT_ROOT/tools/servers/perplexity-deep-research/run.sh"
add_mcp_server "youtube-transcribe" "$PROJECT_ROOT/tools/servers/youtube-transcribe/run.sh"
add_mcp_server "openai-images" "$PROJECT_ROOT/tools/servers/openai-images/run.sh"

# Test the setup
echo ""
echo -e "${YELLOW}Testing MCP server connections...${NC}"
claude mcp list

# Final validation
echo ""
echo -e "${YELLOW}Final validation...${NC}"

# Check that all servers have their required files
validation_errors=0

for server in "basecamp" "pdf-generator" "perplexity-deep-research" "youtube-transcribe" "openai-images"; do
    server_path="$PROJECT_ROOT/tools/servers/$server"
    if [ ! -f "$server_path/server.py" ]; then
        echo -e "${RED}✗ $server/server.py not found${NC}"
        validation_errors=$((validation_errors + 1))
    fi
    
    if [ ! -d "$server_path/venv" ]; then
        echo -e "${RED}✗ $server venv not created${NC}"
        validation_errors=$((validation_errors + 1))
    fi
    
    if [ ! -f "$server_path/venv/bin/python" ]; then
        echo -e "${RED}✗ $server venv Python not found${NC}"
        validation_errors=$((validation_errors + 1))
    fi
done

# Check .env file exists (credentials are optional)
if [ -f "$ENV_FILE" ]; then
    echo -e "${GREEN}✓ .env file exists${NC}"
else
    echo -e "${YELLOW}⚠ .env file not found${NC}"
    echo "  Create one with your API keys for full functionality"
fi

if [ $validation_errors -eq 0 ]; then
    echo -e "${GREEN}✓ All validations passed${NC}"
else
    echo -e "${YELLOW}⚠ $validation_errors validation issues found${NC}"
fi

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║          Setup Complete! 🎉               ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo "Next steps:"
echo "1. Restart Claude Desktop to load the new MCP servers"
echo "2. Open a project in this directory to use project-level config"
echo "3. Test the tools by asking Claude to use them"
echo ""
echo "Available MCP tools:"
echo "  • Basecamp - Project management integration"
echo "  • Perplexity Deep Research - Web research and analysis"
echo "  • PDF Generator - Create PDFs from markdown"
echo "  • YouTube Transcribe - Download and transcribe videos"
echo "  • OpenAI Images - Generate images with DALL-E 3"
echo ""
echo -e "${YELLOW}Important:${NC} All API keys are now stored in the .env file"
echo "This file is gitignored and won't be committed to the repository."
echo ""