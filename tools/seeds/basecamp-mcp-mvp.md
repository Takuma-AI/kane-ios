# Basecamp MCP Server - MVP Specification

## MVP Goal
Enable Hashi subagent to create rich, structured todolists on Basecamp exactly as it does today, but through an MCP server.

## MVP Tools (Only What's Needed for Hashi)

### 1. `list_projects`
**Already exists** - Just needs todoset_id added to response
```json
Returns: {
  "success": true,
  "projects": [
    {
      "id": 789,
      "name": "Kane",
      "todoset_id": 456  // ADD THIS
    }
  ]
}
```

### 2. `create_full_todolist`
**New tool** - Create complete todolist with groups and tasks in one call
```json
Input: {
  "project_id": 789,
  "todoset_id": 456,  // From list_projects
  "title": "Memory orbs MVP shipped",
  "description": "Created by Hashi",
  "groups": [
    {
      "title": "Backend complete",
      "tasks": [
        {
          "content": "Design memory schema",
          "description": "<div><h1>Objective</h1><p>Design the PostgreSQL schema...</p></div>",
          "assignee_id": 0,  // 0 for unassigned
          "due_on": "2025-01-25"  // Optional
        }
      ]
    }
  ],
  "tasks": []  // Top-level tasks (usually empty per Hashi's pattern)
}

Returns: {
  "success": true,
  "todolist_id": 333,
  "url": "https://3.basecamp.com/123456/buckets/789/todolists/333",
  "stats": {
    "groups_created": 3,
    "todos_created": 12
  }
}
```

### 3. `parse_basecamp_url` 
**New tool** - Extract IDs from Basecamp URLs
```json
Input: {
  "url": "https://3.basecamp.com/123456/buckets/789/todolists/333"
}

Returns: {
  "success": true,
  "account_id": 123456,
  "project_id": 789,
  "todolist_id": 333,
  "todoset_id": null  // Would need additional API call to get
}
```

### 4. `get_todolist_details`
**New tool** - Get existing todolist structure
```json
Input: {
  "project_id": 789,
  "todolist_id": 333
}

Returns: {
  "success": true,
  "title": "Memory orbs MVP shipped",
  "groups": [
    {
      "id": 444,
      "title": "Backend complete",
      "todos_count": 5,
      "completed_count": 2
    }
  ],
  "todos_count": 12,
  "completed_count": 3
}
```

## Implementation Changes to Current server.py

### 1. Update `list_projects` (5 minutes)
```python
# Add todoset_id to response
project_list.append({
    "id": project["id"],
    "name": project["name"],
    "todoset_id": todoset["id"] if todoset else None  # Already being found!
})
```

### 2. Add `create_full_todolist` (30 minutes)
Combine existing logic but in one atomic operation:
```python
@mcp.tool()
async def create_full_todolist(
    project_id: int,
    todoset_id: int,
    title: str,
    description: str = "Created by Hashi",
    groups: list = [],
    tasks: list = []
) -> dict:
    # 1. Create todolist (existing logic)
    # 2. Create groups (existing logic) 
    # 3. Create tasks in groups (existing logic)
    # 4. Create top-level tasks if any
    # Return consolidated result
```

### 3. Add `parse_basecamp_url` (10 minutes)
```python
@mcp.tool()
async def parse_basecamp_url(url: str) -> dict:
    import re
    pattern = r"https://3\.basecamp\.com/(\d+)/buckets/(\d+)/todolists/(\d+)"
    match = re.match(pattern, url)
    if match:
        return {
            "success": True,
            "account_id": int(match.group(1)),
            "project_id": int(match.group(2)),
            "todolist_id": int(match.group(3))
        }
    return {"success": False, "error": "Invalid Basecamp URL"}
```

### 4. Add `get_todolist_details` (20 minutes)
```python
@mcp.tool()
async def get_todolist_details(
    project_id: int,
    todolist_id: int
) -> dict:
    # GET /buckets/{project_id}/todolists/{todolist_id}.json
    # Parse and return simplified structure
```

## Hashi Subagent Usage

```python
# Hashi receives context and instructions

# 1. List projects to find the right one
projects = await mcp.list_projects()
kane = [p for p in projects["projects"] if p["name"] == "Kane"][0]

# 2. Create the full todolist in one call
result = await mcp.create_full_todolist(
    project_id=kane["id"],
    todoset_id=kane["todoset_id"],
    title="User testing insights captured",
    groups=[
        {
            "title": "Interviews completed",
            "tasks": [
                {
                    "content": "Interview 5 users",
                    "description": "<div><h1>User Interview Protocol</h1>...</div>"
                }
            ]
        }
    ],
    tasks=[]
)

print(f"Created todolist: {result['url']}")
```

## What This MVP Enables

1. ✅ Hashi can create complete, structured todolists as it does today
2. ✅ Rich HTML descriptions in todos (Hashi's key feature)
3. ✅ Milestone-based grouping (Hashi's organizational pattern)
4. ✅ Parse URLs if user provides existing Basecamp links
5. ✅ Check what's in existing lists (basic read capability)

## What This MVP Doesn't Do (Future)

- ❌ Append to existing lists (needs more tools)
- ❌ Search across all todolists
- ❌ Move todos between lists
- ❌ Mark todos as complete
- ❌ Assignee name resolution (still uses IDs)

## Time Estimate

- 5 min: Update `list_projects` 
- 30 min: Implement `create_full_todolist`
- 10 min: Implement `parse_basecamp_url`
- 20 min: Implement `get_todolist_details`
- 15 min: Test with actual Basecamp account

**Total: ~1.5 hours to working MVP**

## Next Steps After MVP

1. Test with Hashi subagent
2. Add append capabilities
3. Add search/discovery tools
4. Add completion tracking
5. Add people/assignee resolution

## Success Criteria

The MVP is successful when:
- [ ] Hashi can list projects and get todoset_ids
- [ ] Hashi can create a complete todolist with groups and tasks
- [ ] The created todolists appear correctly in Basecamp UI
- [ ] URLs can be parsed to work with existing lists
- [ ] Basic read capability exists for understanding existing lists