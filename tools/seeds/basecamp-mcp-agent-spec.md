# Basecamp MCP Server - AI Agent Feature Specification

## Vision
Transform the Basecamp MCP server into an AI-agent-optimized interface that enables Hashi (and other subagents) to seamlessly manage rich, context-aware todos on Basecamp, treating the AI agent as the primary user.

## Core Philosophy
The AI agent shouldn't need to understand Basecamp's API structure. It should work with intuitive, semantic operations that map to how humans think about task management.

## Tool Architecture

### Layer 1: Discovery & Context Tools

#### `get_workspace_context`
**Purpose**: Understand the entire Basecamp workspace in one call
```json
Returns: {
  "accounts": [{
    "id": 123456,
    "name": "Takuma OS",
    "projects": [{
      "id": 789,
      "name": "Kane",
      "description": "...",
      "todoset_id": 456,
      "active_lists": 3,
      "total_todos": 47,
      "recent_activity": "2 hours ago"
    }]
  }],
  "suggested_project": "Kane",  // Based on recent activity
  "user_context": {
    "name": "Kate",
    "id": 111
  }
}
```
**Why**: Agent needs full context to make intelligent routing decisions without multiple API calls.

#### `search_todos`
**Purpose**: Find existing todos across projects
```json
Input: {
  "query": "memory formation",
  "project_id": null,  // Optional, searches all if null
  "status": "incomplete"  // incomplete, complete, all
}
Returns: {
  "matches": [{
    "todo_id": 999,
    "content": "Implement memory formation service",
    "project": "Kane",
    "list": "Sprint 3",
    "group": "AI Integration",
    "status": "incomplete",
    "assignee": "Kate",
    "context_snippet": "...surrounding todos..."
  }]
}
```
**Why**: Agent needs to know if related work already exists before creating duplicates.

### Layer 2: Intelligent Reading Tools

#### `get_project_todos`
**Purpose**: Get complete todo hierarchy with context
```json
Input: {
  "project_id": 789,
  "include_completed": false,
  "depth": "full"  // full, lists_only, summary
}
Returns: {
  "project": "Kane",
  "lists": [{
    "id": 111,
    "title": "User testing completed",
    "description": "...",
    "progress": "3/7 complete",
    "groups": [{
      "id": 222,
      "title": "Interview insights gathered",
      "todos": [{
        "id": 333,
        "content": "Conduct user interviews",
        "description": "<div>Full HTML description...</div>",
        "assignee": "Kate",
        "due_on": "2025-01-20",
        "status": "incomplete",
        "comments_count": 2,
        "last_activity": "2 hours ago"
      }]
    }],
    "ungrouped_todos": []
  }]
}
```
**Why**: Agent gets complete context in one call, understanding the work structure.

#### `analyze_todo_structure`
**Purpose**: Understand patterns in existing todos
```json
Input: {
  "project_id": 789
}
Returns: {
  "patterns": {
    "naming_conventions": {
      "lists": "Past tense outcomes (e.g., 'User testing completed')",
      "groups": "Milestone gates (e.g., 'Design signed off')",
      "todos": "Present tense actions (e.g., 'Review copy')"
    },
    "typical_structure": {
      "todos_per_group": 3.5,
      "groups_per_list": 4,
      "description_length": "200-500 words with HTML"
    },
    "assignee_mapping": {
      "Kate": ["product", "strategy"],
      "Dev Team": ["implementation"]
    },
    "recent_themes": ["user testing", "memory formation", "authentication"]
  }
}
```
**Why**: Agent learns project conventions to maintain consistency.

### Layer 3: Intelligent Creation Tools

#### `create_smart_todolist`
**Purpose**: Create complete todo structures in one call
```json
Input: {
  "project_id": 789,
  "list_title": "Memory orbs MVP shipped",
  "description": "Initial implementation of memory formation from transactions",
  "groups": [{
    "title": "Transaction enrichment complete",
    "todos": [{
      "content": "Design memory data model",
      "description": "<div><h1>Objective</h1>...</div>",
      "assignee_name": "Kate",  // Can use name, not just ID
      "due_in_days": 3  // Relative dates
    }]
  }],
  "context": {
    "related_to": "Previous sprint work",
    "epicenter": "Enable users to see spending patterns"
  }
}
Returns: {
  "success": true,
  "list_id": 444,
  "url": "https://3.basecamp.com/...",
  "created": {
    "groups": 3,
    "todos": 12
  }
}
```
**Why**: Single atomic operation that handles the complete creation flow.

#### `append_to_existing`
**Purpose**: Add todos to existing structures intelligently
```json
Input: {
  "target": {
    "type": "smart",  // smart, list_id, group_id
    "query": "authentication work"  // Finds best match
  },
  "todos": [{
    "content": "Add OAuth error handling",
    "description": "...",
    "fits_milestone": "Implementation complete"  // Agent suggests placement
  }],
  "create_group_if_needed": true
}
Returns: {
  "placed_in": {
    "list": "Auth system implemented",
    "group": "Error handling complete",
    "created_new_group": true
  },
  "todos_created": 1
}
```
**Why**: Agent doesn't need to know exact IDs, can work semantically.

### Layer 4: Manipulation Tools

#### `update_todo_intelligently`
**Purpose**: Update todos with context awareness
```json
Input: {
  "find": {
    "content_match": "user interviews",
    "project": "Kane"
  },
  "update": {
    "status": "complete",
    "add_comment": "Completed with 5 participants, insights documented",
    "trigger_next": true  // Marks dependent todos as ready
  }
}
```
**Why**: Agent can update based on description, not just IDs.

#### `reorganize_todos`
**Purpose**: Move todos between groups/lists based on evolved understanding
```json
Input: {
  "todos": ["Design memory model", "Create memory service"],
  "move_to": {
    "list": "Technical implementation",
    "group": "Backend complete",
    "create_if_missing": true
  },
  "reason": "Realized these are backend tasks, not product tasks"
}
```
**Why**: As understanding evolves, agent can reorganize without recreating.

### Layer 5: Progress & Analytics Tools

#### `get_progress_summary`
**Purpose**: Understand overall progress patterns
```json
Input: {
  "project_id": 789,
  "timeframe": "last_week"
}
Returns: {
  "velocity": {
    "todos_completed": 12,
    "lists_completed": 1,
    "average_completion_time": "2.3 days"
  },
  "blockers": [{
    "todo": "Get API keys from vendor",
    "blocked_for": "5 days",
    "blocking_count": 3
  }],
  "momentum": "increasing",  // increasing, steady, decreasing
  "next_milestones": [{
    "group": "User testing complete",
    "progress": "2/3",
    "estimated_completion": "2 days"
  }]
}
```
**Why**: Agent can make intelligent decisions about pacing and priorities.

#### `suggest_next_actions`
**Purpose**: AI-friendly guidance on what to create/update
```json
Input: {
  "context": "Just discussed memory formation architecture",
  "project_id": 789
}
Returns: {
  "suggestions": [{
    "action": "create_todos",
    "reasoning": "No technical implementation tasks exist for memory formation",
    "proposed_group": "Memory service implemented",
    "fits_in_list": "Sprint 4 - Memory Formation"
  }],
  "avoid": [{
    "reason": "Similar todo exists",
    "existing": "Design memory data model (created yesterday)"
  }]
}
```
**Why**: Agent gets intelligent guidance to avoid duplication and maintain consistency.

### Layer 6: Context Preservation Tools

#### `link_to_source`
**Purpose**: Connect todos back to Takuma OS documents
```json
Input: {
  "todo_id": 333,
  "source": {
    "type": "github",
    "url": "https://github.com/takuma-os/kane/pitch/memory-orbs.md",
    "excerpt": "Key insight about transaction patterns..."
  }
}
```
**Why**: Maintains connection between Basecamp tasks and source documentation.

#### `export_for_documentation`
**Purpose**: Generate markdown documentation from Basecamp todos
```json
Input: {
  "list_id": 111,
  "format": "takuma_os"  // Formats for Takuma OS conventions
}
Returns: {
  "markdown": "# Memory Formation Implementation\n\n## Epicenter\n...",
  "suggested_path": "/labs/kane/pitches/shipped/memory-formation.md"
}
```
**Why**: Completed work can flow back into Takuma OS documentation.

## Tool Design Principles

### 1. Semantic Over Structural
- Agent uses "find authentication todos" not "get todos from list 123"
- Tools understand intent, not just IDs

### 2. Atomic Operations
- Complex operations in single calls
- Tools handle retry logic and error recovery internally
- Agent doesn't manage transaction states

### 3. Context-Aware Defaults
- Tools remember recent operations
- Suggest logical next steps
- Learn from patterns

### 4. Rich Responses
- Every response includes context
- Suggestions and warnings included
- Related information provided proactively

### 5. Graceful Degradation
- Work with partial information
- Suggest when uncertain
- Never fail silently

## Integration with Hashi Subagent

### Hashi's Workflow
1. Receives context from main agent
2. Calls `get_workspace_context` to understand current state
3. Calls `search_todos` to check for existing related work
4. Calls `analyze_todo_structure` to learn conventions
5. Calls `create_smart_todolist` with rich, structured todos
6. Returns summary to main agent with Basecamp URLs

### Hashi's Prompt Enhancement
The subagent prompt will include:
- Understanding of Takuma OS philosophy
- Knowledge of todo structuring patterns
- Ability to create document-length descriptions
- Context about project epicenters

## Implementation Priority

### Phase 1: Core Reading (Week 1)
- `get_workspace_context`
- `get_project_todos`
- `search_todos`

### Phase 2: Smart Creation (Week 2)
- `create_smart_todolist`
- `append_to_existing`

### Phase 3: Intelligence Layer (Week 3)
- `analyze_todo_structure`
- `suggest_next_actions`
- `update_todo_intelligently`

### Phase 4: Advanced Features (Week 4)
- `reorganize_todos`
- `get_progress_summary`
- `link_to_source`
- `export_for_documentation`

## Success Metrics

### For AI Agent (Primary User)
- Can create todos without knowing Basecamp structure
- Single tool calls accomplish complex operations
- Receives intelligent suggestions and warnings
- Never creates duplicate work

### For Human (End Beneficiary)
- Todos have rich, actionable descriptions
- Work is properly organized in logical structures
- Progress is visible and meaningful
- Context is preserved from original discussions

## Technical Considerations

### Caching Strategy
- Cache workspace structure (5 minutes)
- Cache todo searches (1 minute)
- Invalidate on writes
- Warm cache on startup

### Error Handling
- Automatic retry with exponential backoff
- Graceful degradation on partial failures
- Clear error messages with recovery suggestions
- Never lose user input

### Performance
- Batch API calls internally
- Parallel fetching where possible
- Lazy loading of detailed descriptions
- Progress indicators for long operations

## Example Usage by Hashi

```python
# Hashi receives: "Create tasks for implementing memory formation based on our discussion"

# 1. Understand workspace
context = mcp.get_workspace_context()
# Finds Kane project is most active

# 2. Check existing work  
existing = mcp.search_todos(query="memory formation", project_id=context.suggested_project_id)
# Finds some related work but no implementation tasks

# 3. Learn conventions
patterns = mcp.analyze_todo_structure(project_id=context.suggested_project_id)
# Understands this project uses milestone-based groups

# 4. Create structured todos
result = mcp.create_smart_todolist(
    project_id=context.suggested_project_id,
    list_title="Memory formation service operational",
    groups=[{
        "title": "Data model designed",
        "todos": [{
            "content": "Design memory schema",
            "description": "<div><h1>Design PostgreSQL Schema for Memories</h1>...[500 words of rich HTML]...</div>",
            "assignee_name": "Kate",
            "due_in_days": 2
        }]
    }],
    context={
        "epicenter": "Users understand their spending patterns",
        "related_to": existing.matches[0].todo_id if existing.matches else None
    }
)

# 5. Return to main agent
return f"Created memory formation tasks in Kane project: {result.url}"
```

## Migration Path from Current MCP

### Keep
- Basic authentication flow
- Credential management
- Core HTTP communication

### Enhance
- Add caching layer
- Add search capabilities
- Add pattern analysis
- Add smart routing

### Replace
- Single-purpose tools → Multi-operation tools
- ID-based operations → Semantic operations
- Flat responses → Rich contextual responses

## Next Steps

1. Review and refine this specification
2. Prioritize which tools to implement first
3. Design the Hashi subagent prompt
4. Build Phase 1 tools
5. Test with Hashi in real scenarios
6. Iterate based on usage patterns

## Remember

The AI agent is the user. Every tool should think "How would an AI want to interact with this?" not "How does Basecamp's API work?" The goal is to make Basecamp feel native to AI reasoning patterns.