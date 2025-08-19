# Basecamp MCP Server

This MCP server provides tools for interacting with the Basecamp API.

## Setup

1. Install dependencies:
```bash
cd tools/mcp/basecamp
python3 -m venv venv
./venv/bin/pip install -r requirements.txt
```

2. Get your Basecamp credentials from Hashi:
```bash
# Start your Hashi Rails app
cd labs/hashi/codebase
rails server

# In another terminal, get credentials via Rails console:
rails console
user = User.find_by(email: 'your-email@example.com')
puts "Token: #{user.basecamp_credential.token}"
puts "Refresh Token: #{user.basecamp_credential.refresh_token}" 
puts "Account ID: #{Credential.last.user.credentials.first.uid}"

# Or find account ID from a recent session
```

3. Save credentials:
```bash
# Run the helper script
./venv/bin/python get_token_from_hashi.py
# Paste the token, refresh token, and account ID when prompted
```

4. Add to Claude Code:
```bash
# From takuma-os root directory
claude mcp add basecamp /Users/kate/Documents/Manual\ Library/Projects/takuma-os/tools/mcp/basecamp/venv/bin/python /Users/kate/Documents/Manual\ Library/Projects/takuma-os/tools/mcp/basecamp/server.py
```

4. Set environment variables when prompted:
- BASECAMP_TOKEN: Your Basecamp access token
- BASECAMP_ACCOUNT_ID: Your Basecamp account ID

## Available Tools

- `list_projects()` - Lists all projects in your Basecamp account
- `list_todolists(project_id, todoset_id)` - Lists todolists in a project
- `create_single_todo(project_id, todolist_id, content)` - Creates a single todo

## Testing

Test the server directly:
```bash
BASECAMP_TOKEN=your_token BASECAMP_ACCOUNT_ID=your_id ./venv/bin/python server.py
```

## Basecamp API Quirks

- **Groups vs Todolists**: When adding todos to a group, use the group_id as the todolist_id in the API path
- **Todosets**: Each project has a todoset that contains all todolists
- **Rate Limits**: Basecamp has rate limits - the server handles 429 responses with exponential backoff