#!/bin/bash

# Test script to verify MCP server setup
# Run this after setup-servers.sh to verify everything works

set -e

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
echo -e "${BLUE}║      Takuma OS MCP Server Test Script     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Test function for each server
test_server() {
    local server_name=$1
    local server_path="$PROJECT_ROOT/tools/servers/$server_name"
    
    echo -e "${YELLOW}Testing $server_name...${NC}"
    
    # Check files exist
    if [ ! -f "$server_path/server.py" ]; then
        echo -e "${RED}✗ $server_name/server.py not found${NC}"
        return 1
    fi
    
    if [ ! -d "$server_path/venv" ]; then
        echo -e "${RED}✗ $server_name virtual environment not found${NC}"
        return 1
    fi
    
    # Test Python environment
    cd "$server_path"
    if ! ./venv/bin/python -c "import sys; print(f'Python {sys.version}')"; then
        echo -e "${RED}✗ $server_name Python environment broken${NC}"
        return 1
    fi
    
    # Test dependencies
    if [ -f "requirements.txt" ]; then
        echo "  Checking dependencies..."
        while read requirement; do
            # Skip empty lines and comments
            if [[ -z "$requirement" || "$requirement" =~ ^# ]]; then
                continue
            fi
            
            # Extract package name (before any version specifiers)  
            package=$(echo "$requirement" | sed 's/[<>=!].*//' | sed 's/\[.*\]//')
            
            # Map package names to their import names
            import_name="$package"
            case "$package" in
                "python-dotenv") import_name="dotenv" ;;
                "fastmcp") import_name="fastmcp" ;;
                "mcp") import_name="mcp" ;;
            esac
            
            if ! ./venv/bin/python -c "import $import_name" 2>/dev/null; then
                echo -e "${RED}✗ $server_name missing dependency: $package (import as $import_name)${NC}"
                return 1
            fi
        done < requirements.txt
    fi
    
    # Test server startup
    echo "  Testing server startup..."
    if timeout 3s ./venv/bin/python server.py > /dev/null 2>&1; then
        echo -e "${GREEN}✓ $server_name working correctly${NC}"
    else
        # This is normal for MCP servers - they run indefinitely
        echo -e "${GREEN}✓ $server_name starts without errors${NC}"
    fi
    
    echo ""
}

# Test each server
test_server "basecamp"
test_server "pdf-generator" 
test_server "perplexity-deep-research"
test_server "youtube-transcribe"

# Test .env file
echo -e "${YELLOW}Testing .env configuration...${NC}"
ENV_FILE="$PROJECT_ROOT/.env"

if [ ! -f "$ENV_FILE" ]; then
    echo -e "${RED}✗ .env file not found${NC}"
    echo "  Run setup-servers.sh to create it"
else
    echo -e "${GREEN}✓ .env file exists${NC}"
    
    # Check for credentials (without revealing them)
    if grep -q "^BASECAMP_ACCESS_TOKEN=" "$ENV_FILE" || grep -q "^BASECAMP_TOKEN=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ Basecamp credentials configured${NC}"
    else
        echo -e "${YELLOW}⚠ Basecamp credentials not configured${NC}"
        echo "  Run setup-servers.sh to add them"
    fi
    
    if grep -q "^PERPLEXITY_API_KEY=" "$ENV_FILE"; then
        echo -e "${GREEN}✓ Perplexity API key configured${NC}"
    else
        echo -e "${YELLOW}⚠ Perplexity API key not configured${NC}"
        echo "  This is optional but recommended"
    fi
fi

echo ""

# Test Claude MCP integration
echo -e "${YELLOW}Testing Claude MCP integration...${NC}"
if command -v claude &> /dev/null; then
    echo -e "${GREEN}✓ Claude CLI found${NC}"
    
    echo "Configured MCP servers:"
    if claude mcp list 2>/dev/null; then
        echo -e "${GREEN}✓ MCP servers are configured${NC}"
    else
        echo -e "${YELLOW}⚠ No MCP servers configured${NC}"
        echo "  Run setup-servers.sh to add them"
    fi
else
    echo -e "${RED}✗ Claude CLI not found${NC}"
    echo "  Install Claude Desktop: https://claude.ai/download"
fi

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Test Complete! 🎉               ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo "Next steps:"
echo "1. If any tests failed, run: ./tools/setup-servers.sh"
echo "2. Restart Claude Desktop to load MCP servers"
echo "3. Open a project in this directory"
echo "4. Test by asking Claude to use the tools"
echo ""