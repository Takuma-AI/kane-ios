# Basecamp MCP Server - Pragmatic Implementation Spec

## Core Principle
Make Basecamp feel like a filesystem that AI agents can navigate using familiar patterns, while enabling rich todo creation that matches Hashi's current capabilities.

## Priority Levels

### P0: Absolute Essentials (Week 1)
**What Hashi does today, but through MCP**

#### 1. `bc_auth`
Verify and store authentication
```json
Input: { "token": "...", "refresh_token": "..." }
Returns: { "success": true, "account_id": 123456, "user": "Kate" }
```

#### 2. `bc_ls` 
List contents at current level (bash-like discovery)
```json
Input: { 
  "path": null  // null = list accounts, "123456" = list projects, "123456/789" = list todolists
}
Returns: {
  "current_path": "/",
  "contents": [
    { "type": "account", "id": 123456, "name": "Takuma OS" }
  ]
}

// Or at project level:
Returns: {
  "current_path": "/123456/789",  
  "project": "Kane",
  "contents": [
    { "type": "todolist", "id": 111, "title": "Sprint 3", "todos_count": 15 },
    { "type": "todolist", "id": 222, "title": "Bug fixes", "todos_count": 8 }
  ]
}
```

#### 3. `bc_create_full_list`
Create a complete todolist with groups and tasks (Hashi's current core function)
```json
Input: {
  "account_id": 123456,
  "project_id": 789,
  "todolist": {
    "title": "Memory orbs MVP shipped",
    "groups": [{
      "title": "Backend complete", 
      "tasks": [{
        "content": "Design schema",
        "description": "<div>Rich HTML...</div>",
        "assignee_id": 0,  // 0 = unassigned
        "due_on": "2025-01-22"
      }]
    }],
    "tasks": []  // Top-level tasks (usually empty)
  }
}
Returns: {
  "success": true,
  "todolist_id": 333,
  "url": "https://3.basecamp.com/123456/buckets/789/todolists/333",
  "created": { "groups": 3, "todos": 12 }
}
```

#### 4. `bc_get_project_info`
Get project details including todoset_id (required for creating lists)
```json
Input: { "account_id": 123456, "project_id": 789 }
Returns: {
  "id": 789,
  "name": "Kane", 
  "todoset_id": 456,  // Critical for API calls
  "description": "Memory tracking for humans"
}
```

### P1: Core Improvements (Week 2)
**Work with existing lists and understand context**

#### 5. `bc_parse_url`
Extract IDs from Basecamp URLs
```json
Input: { "url": "https://3.basecamp.com/123456/buckets/789/todolists/333" }
Returns: {
  "account_id": 123456,
  "project_id": 789,
  "todolist_id": 333,
  "type": "todolist"
}
```

#### 6. `bc_get_todolist`
Fetch complete todolist with all todos and groups
```json
Input: { 
  "account_id": 123456,
  "project_id": 789,
  "todolist_id": 333
}
Returns: {
  "title": "Memory orbs MVP shipped",
  "description": "...",
  "groups": [{
    "id": 444,
    "title": "Backend complete",
    "todos": [{
      "id": 555,
      "content": "Design schema",
      "description": "<div>...</div>",
      "completed": false,
      "assignee": "Kate"
    }]
  }],
  "todos": [],  // Ungrouped todos
  "stats": { "total": 12, "completed": 3 }
}
```

#### 7. `bc_append_todos`
Add todos to existing list or group
```json
Input: {
  "account_id": 123456,
  "project_id": 789,
  "todolist_id": 333,
  "group_id": 444,  // Optional - if null, adds to top level
  "todos": [{
    "content": "Add caching layer",
    "description": "<div>...</div>"
  }]
}
Returns: {
  "success": true,
  "added": 2,
  "todo_ids": [666, 777]
}
```

#### 8. `bc_create_group`
Add a new group to existing todolist
```json
Input: {
  "account_id": 123456,
  "project_id": 789,
  "todolist_id": 333,
  "group_title": "Testing complete"
}
Returns: {
  "success": true,
  "group_id": 888
}
```

### P2: Navigation & Discovery (Week 3)
**Efficient workspace understanding**

#### 9. `bc_find_list`
Search for todolists by name
```json
Input: {
  "account_id": 123456,
  "query": "memory",  // Partial match
  "project_id": null  // Optional filter
}
Returns: {
  "matches": [{
    "project": "Kane",
    "project_id": 789,
    "todolist_id": 333,
    "title": "Memory orbs MVP shipped",
    "url": "https://3.basecamp.com/..."
  }]
}
```

#### 10. `bc_get_all_projects`
Get all projects with their todoset info (cached)
```json
Input: { "account_id": 123456 }
Returns: {
  "projects": [{
    "id": 789,
    "name": "Kane",
    "todoset_id": 456,
    "recent_activity": "2 hours ago",
    "todolist_count": 5
  }]
}
```

#### 11. `bc_check_todo`
Mark todo as complete/incomplete
```json
Input: {
  "account_id": 123456,
  "project_id": 789,
  "todo_id": 555,
  "complete": true
}
Returns: { "success": true, "completed_at": "2025-01-19T10:30:00Z" }
```

### P3: Nice-to-Have Enhancements (Future)
**Quality of life improvements**

#### 12. `bc_get_people`
Get list of people for assignee mapping
```json
Input: { "account_id": 123456 }
Returns: {
  "people": [
    { "id": 111, "name": "Kate", "email": "kate@takuma.com" }
  ]
}
```

#### 13. `bc_bulk_create_lists`
Create multiple todolists in one call
```json
Input: {
  "account_id": 123456,
  "project_id": 789,
  "todolists": [...]  // Array of todolist structures
}
```

#### 14. `bc_get_recent_activity`
See what's been happening
```json
Input: { 
  "account_id": 123456,
  "project_id": 789,
  "since": "2025-01-18T00:00:00Z"
}
```

#### 15. `bc_move_todo`
Move todo between lists/groups
```json
Input: {
  "todo_id": 555,
  "to_todolist_id": 999,
  "to_group_id": null
}
```

## Implementation Notes

### Caching Strategy
- Cache `bc_get_all_projects` for 5 minutes
- Cache `bc_get_project_info` for 10 minutes  
- Cache `bc_get_people` for 30 minutes
- Invalidate on writes

### Error Messages
Always return helpful context:
```json
{
  "success": false,
  "error": "Todolist not found",
  "suggestion": "Use bc_ls to list available todolists",
  "available_ids": [111, 222, 333]
}
```

### Response Consistency
Every response includes:
```json
{
  "success": true/false,
  "data": {...},  // On success
  "error": "...",  // On failure
  "suggestion": "..."  // On failure
}
```

## How Hashi Would Use These Tools

### Current Hashi Workflow (Replicable with P0)
```python
# 1. Get workspace context
accounts = mcp.bc_ls(path=None)
account_id = accounts["contents"][0]["id"]

# 2. List projects
projects = mcp.bc_ls(path=str(account_id))
kane_project = [p for p in projects["contents"] if p["name"] == "Kane"][0]

# 3. Get project details (for todoset_id)
project_info = mcp.bc_get_project_info(
    account_id=account_id,
    project_id=kane_project["id"]
)

# 4. Create full todolist (current Hashi capability)
result = mcp.bc_create_full_list(
    account_id=account_id,
    project_id=kane_project["id"],
    todolist={
        "title": "Memory orbs MVP shipped",
        "groups": [...],  # Rich structured data from Gemini
        "tasks": []
    }
)
```

### Enhanced Workflow (With P1)
```python
# User provides Basecamp URL
url_info = mcp.bc_parse_url(url="https://3.basecamp.com/...")

# Get existing list
existing = mcp.bc_get_todolist(
    account_id=url_info["account_id"],
    project_id=url_info["project_id"],
    todolist_id=url_info["todolist_id"]
)

# Add to existing group
mcp.bc_append_todos(
    account_id=url_info["account_id"],
    project_id=url_info["project_id"],
    todolist_id=url_info["todolist_id"],
    group_id=existing["groups"][0]["id"],
    todos=[...]
)
```

### Smart Discovery (With P2)
```python
# Find related work
existing_lists = mcp.bc_find_list(
    account_id=account_id,
    query="memory"
)

if existing_lists["matches"]:
    # Append to existing
    todolist_id = existing_lists["matches"][0]["todolist_id"]
    mcp.bc_append_todos(...)
else:
    # Create new
    mcp.bc_create_full_list(...)
```

## Migration from Current Implementation

### What to Keep
- Authentication logic
- Basic HTTP client
- Token refresh mechanism

### What to Add (Priority Order)
1. **P0 Tools** - Enable current Hashi workflow
2. **Caching layer** - Reduce API calls
3. **P1 Tools** - Work with existing lists
4. **P2 Tools** - Smart discovery

### What to Enhance
- Error messages with suggestions
- Consistent response format
- URL parsing capability

## Success Criteria

### P0 Success (Week 1)
- [ ] Hashi can create complete todolists as it does today
- [ ] Agent can navigate workspace using bash-like commands
- [ ] All current Hashi functionality works through MCP

### P1 Success (Week 2)
- [ ] Can work with existing todolists from URLs
- [ ] Can append todos to specific groups
- [ ] Can create new groups in existing lists

### P2 Success (Week 3)
- [ ] Can search for existing work before creating
- [ ] Can check off completed todos
- [ ] Efficient discovery without multiple API calls

## Key Design Decisions

### Why Bash-like Navigation?
- AI agents are trained on terminal commands
- Familiar cd/ls patterns reduce cognitive load
- Progressive discovery matches how humans explore

### Why Separate Tools vs Mega-Tools?
- Easier to implement incrementally
- Clearer error boundaries
- Agent can compose them as needed
- Simpler to test and debug

### Why IDs Over Semantic Search?
- Basecamp API requires IDs
- Semantic layer can be built on top later
- Keeps MCP server lightweight
- AI agent can handle the semantic mapping

## Remember

The goal is to make Basecamp accessible to AI agents without requiring them to understand Basecamp's structure, while keeping the implementation simple and maintainable. Start with what Hashi needs today, then progressively enhance.