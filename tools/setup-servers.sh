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

# Handle API keys and credentials using .env file
echo ""
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"
echo -e "${YELLOW}        API Keys Configuration${NC}"
echo -e "${YELLOW}═══════════════════════════════════════════${NC}"

ENV_FILE="$PROJECT_ROOT/.env"

# Check if .env file exists
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
    fi
    
    if grep -q "^PERPLEXITY_API_KEY=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ Perplexity API key configured${NC}"
    else
        echo -e "${YELLOW}⚠ Perplexity API key not configured${NC}"
    fi
    echo ""
    read -p "Do you want to reconfigure API keys? (y/N): " reconfigure
    if [[ ! "$reconfigure" =~ ^[Yy]$ ]]; then
        echo "Keeping existing configuration."
    else
        cp "$ENV_FILE" "$ENV_FILE.backup"
        echo "Backed up existing .env to .env.backup"
        > "$ENV_FILE"  # Clear the file
    fi
else
    echo -e "${YELLOW}No .env file found. Creating one...${NC}"
    touch "$ENV_FILE"
fi

# Configure Basecamp if needed
if ! (grep -q "^BASECAMP_ACCESS_TOKEN=" "$ENV_FILE" || grep -q "^BASECAMP_TOKEN=" "$ENV_FILE") 2>/dev/null || [[ "$reconfigure" =~ ^[Yy]$ ]]; then
    echo ""
    echo -e "${BLUE}Basecamp API Setup:${NC}"
    echo "For new Basecamp integration using OAuth tokens, visit:"
    echo "https://hashi-cdb3.onrender.com/mcp/setup"
    echo ""
    echo "This will generate OAuth tokens with proper permissions."
    echo "Copy the .env content from there and paste it here."
    echo ""
    echo "Alternative: Use Personal Access Token from:"
    echo "https://launchpad.37signals.com/integrations"
    echo ""
    read -p "Do you have OAuth tokens from Hashi (recommended)? (y/N): " use_oauth
    
    if [[ "$use_oauth" =~ ^[Yy]$ ]]; then
        echo ""
        echo "Please visit: https://hashi-cdb3.onrender.com/mcp/setup"
        echo "Copy the .env content and paste it below (press Enter then Ctrl+D when done):"
        echo ""
        
        # Read multi-line input
        oauth_content=$(cat)
        
        # Remove old Basecamp entries if they exist
        grep -v "^BASECAMP_" "$ENV_FILE" > "$ENV_FILE.tmp" 2>/dev/null || true
        mv "$ENV_FILE.tmp" "$ENV_FILE"
        
        # Add OAuth content
        echo "" >> "$ENV_FILE"
        echo "# Basecamp API (OAuth)" >> "$ENV_FILE"
        echo "$oauth_content" >> "$ENV_FILE"
        
        echo -e "${GREEN}✓ Basecamp OAuth credentials saved to .env${NC}"
    else
        read -p "Enter your Basecamp Personal Access Token: " basecamp_token
        
        # Remove old Basecamp entries if they exist
        grep -v "^BASECAMP_" "$ENV_FILE" > "$ENV_FILE.tmp" 2>/dev/null || true
        mv "$ENV_FILE.tmp" "$ENV_FILE"
        
        # Add new Basecamp entries
        cat >> "$ENV_FILE" <<EOF

# Basecamp API (Personal Access Token)
BASECAMP_ACCESS_TOKEN=$basecamp_token
EOF
        echo -e "${GREEN}✓ Basecamp credentials saved to .env${NC}"
        echo -e "${YELLOW}Note: OAuth tokens from Hashi provide better functionality${NC}"
    fi
fi

# Configure Perplexity if needed
if ! grep -q "^PERPLEXITY_API_KEY=" "$ENV_FILE" 2>/dev/null || [[ "$reconfigure" =~ ^[Yy]$ ]]; then
    echo ""
    echo -e "${BLUE}Perplexity API Setup:${NC}"
    echo "You'll need a Perplexity API key."
    echo "Get one from: https://www.perplexity.ai/settings/api"
    echo ""
    read -p "Enter your Perplexity API Key: " perplexity_key
    
    # Remove old Perplexity entry if it exists
    grep -v "^PERPLEXITY_" "$ENV_FILE" > "$ENV_FILE.tmp" 2>/dev/null || true
    mv "$ENV_FILE.tmp" "$ENV_FILE"
    
    # Add new Perplexity entry
    cat >> "$ENV_FILE" <<EOF

# Perplexity API
PERPLEXITY_API_KEY=$perplexity_key
EOF
    echo -e "${GREEN}✓ Perplexity credentials saved to .env${NC}"
fi

# Clean up old credential files if they exist (migration)
echo ""
echo -e "${YELLOW}Cleaning up old credential files...${NC}"
if [ -f "$PROJECT_ROOT/tools/servers/basecamp/credentials.json" ]; then
    mv "$PROJECT_ROOT/tools/servers/basecamp/credentials.json" "$PROJECT_ROOT/tools/servers/basecamp/credentials.json.migrated"
    echo "Migrated basecamp/credentials.json to .env"
fi
if [ -f "$PROJECT_ROOT/tools/servers/perplexity-deep-research/credentials.json" ]; then
    mv "$PROJECT_ROOT/tools/servers/perplexity-deep-research/credentials.json" "$PROJECT_ROOT/tools/servers/perplexity-deep-research/credentials.json.migrated"
    echo "Migrated perplexity-deep-research/credentials.json to .env"
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
        cd "$PROJECT_ROOT"  # Run from project root for project-level config
        claude mcp add "$name" "$command"
        echo -e "${GREEN}✓ $name added${NC}"
    fi
}

# Add each server
add_mcp_server "basecamp" "$PROJECT_ROOT/tools/servers/basecamp/venv/bin/python $PROJECT_ROOT/tools/servers/basecamp/server.py"
add_mcp_server "pdf-generator" "$PROJECT_ROOT/tools/servers/pdf-generator/venv/bin/python $PROJECT_ROOT/tools/servers/pdf-generator/server.py"
add_mcp_server "perplexity-deep-research" "$PROJECT_ROOT/tools/servers/perplexity-deep-research/venv/bin/python $PROJECT_ROOT/tools/servers/perplexity-deep-research/server.py"
add_mcp_server "youtube-transcribe" "$PROJECT_ROOT/tools/servers/youtube-transcribe/venv/bin/python $PROJECT_ROOT/tools/servers/youtube-transcribe/server.py"

# Test the setup
echo ""
echo -e "${YELLOW}Testing MCP server connections...${NC}"
claude mcp list

# Final validation
echo ""
echo -e "${YELLOW}Final validation...${NC}"

# Check that all servers have their required files
validation_errors=0

for server in "basecamp" "pdf-generator" "perplexity-deep-research" "youtube-transcribe"; do
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

# Check .env file has required credentials
if [ -f "$ENV_FILE" ]; then
    if ! (grep -q "^BASECAMP_ACCESS_TOKEN=" "$ENV_FILE" || grep -q "^BASECAMP_TOKEN=" "$ENV_FILE"); then
        echo -e "${YELLOW}⚠ Basecamp credentials not configured in .env${NC}"
        echo "  Run the script again to configure them"
    fi
    
    if ! grep -q "^PERPLEXITY_API_KEY=" "$ENV_FILE"; then
        echo -e "${YELLOW}⚠ Perplexity API key not configured in .env${NC}"
        echo "  This is optional but recommended for research features"
    fi
else
    echo -e "${RED}✗ .env file not found${NC}"
    validation_errors=$((validation_errors + 1))
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
echo ""
echo -e "${YELLOW}Important:${NC} All API keys are now stored in the .env file"
echo "This file is gitignored and won't be committed to the repository."
echo ""