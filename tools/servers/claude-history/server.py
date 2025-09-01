#!/usr/bin/env python3
"""
Claude History MCP Server
Provides tools for searching and reading Claude Code chat history
"""

import os
import json
import glob as glob_module
from pathlib import Path
from typing import Optional, List, Dict, Any
from mcp.server.fastmcp import FastMCP
import re
from datetime import datetime

# Initialize MCP server
mcp = FastMCP("claude-history")

# Path to Claude Code projects
CLAUDE_PROJECTS_PATH = os.path.expanduser("~/.claude/projects")

class ConversationEntry:
    def __init__(self, data: dict):
        self.type = data.get("type", "")
        self.message = data.get("message")
        self.timestamp = data.get("timestamp", "")
        self.summary = data.get("summary", "")
        self.session_id = data.get("sessionId", "")

class SearchResult:
    def __init__(self, file: str, project: str, session_id: str, timestamp: str, excerpt: str, match_type: str):
        self.file = file
        self.project = project
        self.session_id = session_id
        self.timestamp = timestamp
        self.excerpt = excerpt
        self.match_type = match_type
    
    def to_dict(self):
        return {
            "file": self.file,
            "project": self.project,
            "sessionId": self.session_id,
            "timestamp": self.timestamp,
            "excerpt": self.excerpt,
            "matchType": self.match_type
        }

def parse_jsonl_file(file_path: str) -> List[ConversationEntry]:
    """Parse a JSONL file and return conversation entries"""
    entries = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line:
                    try:
                        data = json.loads(line)
                        entries.append(ConversationEntry(data))
                    except json.JSONDecodeError:
                        # Skip invalid JSON lines
                        continue
    except FileNotFoundError:
        pass
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
    
    return entries

def extract_text_content(content: Any) -> str:
    """Extract text content from various message content formats"""
    if isinstance(content, str):
        return content
    
    if isinstance(content, list):
        text_parts = []
        for item in content:
            if isinstance(item, str):
                text_parts.append(item)
            elif isinstance(item, dict) and item.get("type") == "text":
                text_parts.append(item.get("text", ""))
        return " ".join(text_parts)
    
    return ""

@mcp.tool()
async def search_conversations(
    query: str,
    project: Optional[str] = None,
    limit: int = 20,
    include_assistant: bool = False
) -> dict:
    """
    Search through Claude Code conversation history.
    
    Args:
        query: Search query
        project: Optional project name to search within
        include_assistant: Include assistant responses in search (default: false)
        limit: Maximum number of results (default: 20)
    
    Returns:
        Dict with search results
    """
    results = []
    
    # Get project directories
    if project:
        project_pattern = os.path.join(CLAUDE_PROJECTS_PATH, project)
        project_dirs = [project_pattern] if os.path.exists(project_pattern) else []
    else:
        project_dirs = [d for d in glob_module.glob(os.path.join(CLAUDE_PROJECTS_PATH, "*")) 
                       if os.path.isdir(d)]
    
    for project_dir in project_dirs:
        project_name = os.path.basename(project_dir)
        jsonl_files = glob_module.glob(os.path.join(project_dir, "*.jsonl"))
        
        for file in jsonl_files:
            entries = parse_jsonl_file(file)
            session_id = ""
            
            for entry in entries:
                if entry.session_id:
                    session_id = entry.session_id
                
                # Search in user messages
                if entry.type == "user" and entry.message:
                    content = extract_text_content(entry.message.get("content", ""))
                    if query.lower() in content.lower():
                        result = SearchResult(
                            file=os.path.basename(file),
                            project=project_name,
                            session_id=session_id,
                            timestamp=entry.timestamp,
                            excerpt=content[:200],
                            match_type="user"
                        )
                        results.append(result.to_dict())
                
                # Search in assistant messages if requested
                if include_assistant and entry.type == "assistant" and entry.message:
                    content_list = entry.message.get("content", [])
                    for item in content_list:
                        if isinstance(item, dict) and item.get("type") == "text":
                            text = item.get("text", "")
                            if query.lower() in text.lower():
                                result = SearchResult(
                                    file=os.path.basename(file),
                                    project=project_name,
                                    session_id=session_id,
                                    timestamp=entry.timestamp,
                                    excerpt=text[:200],
                                    match_type="assistant"
                                )
                                results.append(result.to_dict())
                
                # Search in summaries
                if entry.type == "summary" and entry.summary:
                    if query.lower() in entry.summary.lower():
                        result = SearchResult(
                            file=os.path.basename(file),
                            project=project_name,
                            session_id=session_id,
                            timestamp="",
                            excerpt=entry.summary,
                            match_type="summary"
                        )
                        results.append(result.to_dict())
                
                if len(results) >= limit:
                    return {"results": results}
    
    return {"results": results}

@mcp.tool()
async def get_conversation(session_id: str) -> dict:
    """
    Get a full conversation by session ID.
    
    Args:
        session_id: The session ID of the conversation
    
    Returns:
        Dict with conversation details and messages
    """
    # Find the conversation file
    pattern = os.path.join(CLAUDE_PROJECTS_PATH, "*", f"*{session_id}*.jsonl")
    files = glob_module.glob(pattern)
    
    if not files:
        return {
            "error": f"Conversation {session_id} not found",
            "success": False
        }
    
    entries = parse_jsonl_file(files[0])
    
    # Format conversation
    messages = []
    summary = ""
    
    for entry in entries:
        if entry.type == "summary":
            summary = entry.summary
        elif entry.type == "user" and entry.message:
            messages.append({
                "role": "user",
                "content": extract_text_content(entry.message.get("content", "")),
                "timestamp": entry.timestamp
            })
        elif entry.type == "assistant" and entry.message:
            text_parts = []
            for item in entry.message.get("content", []):
                if isinstance(item, dict) and item.get("type") == "text":
                    text_parts.append(item.get("text", ""))
            messages.append({
                "role": "assistant",
                "content": "\n".join(text_parts),
                "timestamp": entry.timestamp
            })
    
    return {
        "success": True,
        "sessionId": session_id,
        "summary": summary,
        "file": os.path.basename(files[0]),
        "project": os.path.basename(os.path.dirname(files[0])),
        "messageCount": len(messages),
        "messages": messages
    }

@mcp.tool()
async def list_recent(limit: int = 10) -> dict:
    """
    List recent conversations.
    
    Args:
        limit: Number of conversations to return (default: 10)
    
    Returns:
        Dict with list of recent conversations
    """
    all_files = glob_module.glob(os.path.join(CLAUDE_PROJECTS_PATH, "*", "*.jsonl"))
    
    # Get file stats and sort by modification time
    file_stats = []
    for file in all_files:
        try:
            stat = os.stat(file)
            file_stats.append({
                "file": file,
                "mtime": stat.st_mtime
            })
        except OSError:
            continue
    
    file_stats.sort(key=lambda x: x["mtime"], reverse=True)
    
    recent = []
    for file_info in file_stats[:limit]:
        file = file_info["file"]
        entries = parse_jsonl_file(file)
        
        summary = ""
        session_id = ""
        first_user_message = ""
        
        for entry in entries:
            if entry.type == "summary":
                summary = entry.summary
            if entry.session_id and not session_id:
                session_id = entry.session_id
            if entry.type == "user" and not first_user_message and entry.message:
                first_user_message = extract_text_content(entry.message.get("content", ""))[:200]
        
        recent.append({
            "file": os.path.basename(file),
            "project": os.path.basename(os.path.dirname(file)),
            "sessionId": session_id,
            "summary": summary,
            "firstMessage": first_user_message,
            "lastModified": datetime.fromtimestamp(file_info["mtime"]).isoformat()
        })
    
    return {"conversations": recent}

@mcp.tool()
async def list_projects() -> dict:
    """
    List all available Claude Code projects.
    
    Returns:
        Dict with list of project names
    """
    project_dirs = [d for d in glob_module.glob(os.path.join(CLAUDE_PROJECTS_PATH, "*")) 
                   if os.path.isdir(d)]
    projects = [os.path.basename(d) for d in project_dirs]
    
    return {"projects": projects}

if __name__ == "__main__":
    mcp.run()