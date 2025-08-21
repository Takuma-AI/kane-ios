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
cd "$SCRIPT_DIR"

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
    local server_path="$SCRIPT_DIR/tools/mcp/$server_name"
    
    echo ""
    echo -e "${BLUE}Setting up $server_name...${NC}"
    
    if [ ! -d "$server_path" ]; then
        echo -e "${RED}✗ Directory not found: $server_path${NC}"
        return 1
    fi
    
    cd "$server_path"
    
    # Create virtual environment if it doesn't exist
    if [ ! -d "venv" ]; then
        echo "Creating virtual environment..."
        python3 -m venv venv
    fi
    
    # Activate venv and install requirements
    echo "Installing dependencies..."
    ./venv/bin/pip install --quiet --upgrade pip
    if [ -f "requirements.txt" ]; then
        ./venv/bin/pip install --quiet -r requirements.txt
    fi
    
    echo -e "${GREEN}✓ $server_name dependencies installed${NC}"
}

# Setup each MCP server
setup_python_mcp "basecamp"
setup_python_mcp "openai-deep-research-mcp"
setup_python_mcp "pdf-generator"
setup_python_mcp "perplexity-deep-research"
setup_python_mcp "youtube-transcribe"

# Handle API keys and credentials
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"
echo -e "${YELLOW}        API Keys Configuration${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"

# Basecamp credentials
echo ""
echo -e "${BLUE}Basecamp API Setup:${NC}"
BASECAMP_CREDS="$SCRIPT_DIR/tools/mcp/basecamp/credentials.json"
if [ ! -f "$BASECAMP_CREDS" ]; then
    echo "You'll need Basecamp API credentials."
    echo "Get them from: https://3.basecamp.com/integrations"
    echo ""
    read -p "Enter your Basecamp Account ID: " basecamp_account_id
    read -p "Enter your Basecamp Personal Access Token: " basecamp_token
    read -p "Enter your name (for API User-Agent): " user_name
    read -p "Enter your email (for API User-Agent): " user_email
    
    cat > "$BASECAMP_CREDS" <<EOF
{
    "account_id": "$basecamp_account_id",
    "personal_access_token": "$basecamp_token",
    "user_agent": "$user_name <$user_email>"
}
EOF
    echo -e "${GREEN}✓ Basecamp credentials saved${NC}"
else
    echo -e "${GREEN}✓ Basecamp credentials already exist${NC}"
fi

# OpenAI credentials
echo ""
echo -e "${BLUE}OpenAI API Setup:${NC}"
OPENAI_ENV="$SCRIPT_DIR/tools/mcp/openai-deep-research-mcp/.env"
if [ ! -f "$OPENAI_ENV" ]; then
    echo "You'll need an OpenAI API key for Deep Research."
    echo "Get one from: https://platform.openai.com/api-keys"
    echo ""
    read -p "Enter your OpenAI API Key: " openai_key
    
    cat > "$OPENAI_ENV" <<EOF
OPENAI_API_KEY=$openai_key
EOF
    echo -e "${GREEN}✓ OpenAI credentials saved${NC}"
else
    echo -e "${GREEN}✓ OpenAI credentials already exist${NC}"
fi

# Perplexity credentials
echo ""
echo -e "${BLUE}Perplexity API Setup:${NC}"
PERPLEXITY_CREDS="$SCRIPT_DIR/tools/mcp/perplexity-deep-research/credentials.json"
if [ ! -f "$PERPLEXITY_CREDS" ]; then
    echo "You'll need a Perplexity API key."
    echo "Get one from: https://www.perplexity.ai/settings/api"
    echo ""
    read -p "Enter your Perplexity API Key: " perplexity_key
    
    cat > "$PERPLEXITY_CREDS" <<EOF
{
    "api_key": "$perplexity_key"
}
EOF
    echo -e "${GREEN}✓ Perplexity credentials saved${NC}"
else
    echo -e "${GREEN}✓ Perplexity credentials already exist${NC}"
fi

# Add MCP servers to Claude
echo ""
echo -e "${YELLOW}Adding MCP servers to Claude...${NC}"

# Function to add MCP server if not already added
add_mcp_server() {
    local name=$1
    local command=$2
    
    # Check if server already exists
    if claude mcp list 2>/dev/null | grep -q "^$name:"; then
        echo -e "${GREEN}✓ $name already configured${NC}"
    else
        echo "Adding $name..."
        cd "$SCRIPT_DIR"  # Run from project root for project-level config
        claude mcp add "$name" "$command"
        echo -e "${GREEN}✓ $name added${NC}"
    fi
}

# Add each server
add_mcp_server "basecamp" "$SCRIPT_DIR/tools/mcp/basecamp/venv/bin/python $SCRIPT_DIR/tools/mcp/basecamp/server.py"
add_mcp_server "openai-deep-research" "$SCRIPT_DIR/tools/mcp/openai-deep-research-mcp/venv/bin/python $SCRIPT_DIR/tools/mcp/openai-deep-research-mcp/server.py"
add_mcp_server "pdf-generator" "$SCRIPT_DIR/tools/mcp/pdf-generator/venv/bin/python $SCRIPT_DIR/tools/mcp/pdf-generator/server.py"
add_mcp_server "perplexity-deep-research" "$SCRIPT_DIR/tools/mcp/perplexity-deep-research/venv/bin/python $SCRIPT_DIR/tools/mcp/perplexity-deep-research/server.py"
add_mcp_server "youtube-transcribe" "$SCRIPT_DIR/tools/mcp/youtube-transcribe/venv/bin/python $SCRIPT_DIR/tools/mcp/youtube-transcribe/server.py"

# Test the setup
echo ""
echo -e "${YELLOW}Testing MCP server connections...${NC}"
claude mcp list

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
echo "  • OpenAI Deep Research - Advanced research with o3/o4-mini models"
echo "  • Perplexity Deep Research - Web research and analysis"
echo "  • PDF Generator - Create PDFs from markdown"
echo "  • YouTube Transcribe - Download and transcribe videos"
echo ""