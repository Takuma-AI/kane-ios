#!/usr/bin/env python3
"""
Basecamp MCP Server
Provides tools for interacting with Basecamp API
"""

import os
import json
import httpx
from typing import Optional
from mcp.server.fastmcp import FastMCP

# Initialize MCP server
mcp = FastMCP("basecamp")

# Get credentials from environment or saved file
def load_credentials():
    """Load credentials from environment or saved file"""
    token = os.getenv("BASECAMP_TOKEN")
    account_id = os.getenv("BASECAMP_ACCOUNT_ID")
    refresh_token = os.getenv("BASECAMP_REFRESH_TOKEN")
    
    # Try loading from saved file if not in environment
    if not token:
        creds_file = os.path.expanduser("~/.basecamp_mcp_credentials.json")
        if os.path.exists(creds_file):
            with open(creds_file, 'r') as f:
                creds = json.load(f)
                token = creds.get('access_token')
                account_id = creds.get('account_id')
                refresh_token = creds.get('refresh_token')
    
    return token, account_id, refresh_token

BASECAMP_TOKEN, BASECAMP_ACCOUNT_ID, BASECAMP_REFRESH_TOKEN = load_credentials()

@mcp.tool()
async def create_single_todo(
    project_id: int,
    todolist_id: int,
    content: str,
    description: Optional[str] = None
) -> dict:
    """
    Creates a single todo item in Basecamp.
    
    Args:
        project_id: The Basecamp project ID
        todolist_id: The todolist ID to add the todo to
        content: The todo text
        description: Optional description for the todo
    
    Returns:
        Dict with success status and todo details
    """
    if not BASECAMP_TOKEN or not BASECAMP_ACCOUNT_ID:
        return {
            "success": False,
            "error": "Missing BASECAMP_TOKEN or BASECAMP_ACCOUNT_ID environment variables"
        }
    
    url = f"https://3.basecampapi.com/{BASECAMP_ACCOUNT_ID}/buckets/{project_id}/todolists/{todolist_id}/todos.json"
    
    headers = {
        "Authorization": f"Bearer {BASECAMP_TOKEN}",
        "Content-Type": "application/json",
        "User-Agent": "Basecamp-MCP (hello@takuma.com)"
    }
    
    body = {
        "content": content
    }
    if description:
        body["description"] = description
    
    async with httpx.AsyncClient() as client:
        try:
            response = await client.post(url, headers=headers, json=body)
            
            if response.status_code == 201:
                todo = response.json()
                return {
                    "success": True,
                    "todo_id": todo["id"],
                    "content": todo["content"],
                    "url": todo["app_url"]
                }
            else:
                return {
                    "success": False,
                    "error": f"Basecamp API error: {response.status_code} - {response.text}"
                }
        except Exception as e:
            return {
                "success": False,
                "error": f"Request failed: {str(e)}"
            }

@mcp.tool()
async def list_projects() -> dict:
    """
    Lists all Basecamp projects for the configured account.
    
    Returns:
        Dict with projects list or error
    """
    if not BASECAMP_TOKEN or not BASECAMP_ACCOUNT_ID:
        return {
            "success": False,
            "error": "Missing BASECAMP_TOKEN or BASECAMP_ACCOUNT_ID environment variables"
        }
    
    url = f"https://3.basecampapi.com/{BASECAMP_ACCOUNT_ID}/projects.json"
    
    headers = {
        "Authorization": f"Bearer {BASECAMP_TOKEN}",
        "Content-Type": "application/json",
        "User-Agent": "Basecamp-MCP (hello@takuma.com)"
    }
    
    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url, headers=headers)
            
            if response.status_code == 200:
                projects = response.json()
                # Extract relevant project info
                project_list = []
                for project in projects:
                    # Find todoset in dock
                    todoset = None
                    if isinstance(project.get('dock'), list):
                        for item in project['dock']:
                            if item.get('name') == 'todoset':
                                todoset = item
                                break
                    
                    project_list.append({
                        "id": project["id"],
                        "name": project["name"],
                        "todoset_id": todoset["id"] if todoset else None
                    })
                
                return {
                    "success": True,
                    "projects": project_list
                }
            else:
                return {
                    "success": False,
                    "error": f"Basecamp API error: {response.status_code} - {response.text}"
                }
        except Exception as e:
            return {
                "success": False,
                "error": f"Request failed: {str(e)}"
            }

@mcp.tool()
async def list_todolists(project_id: int, todoset_id: int) -> dict:
    """
    Lists all todolists in a project's todoset.
    
    Args:
        project_id: The Basecamp project ID
        todoset_id: The todoset ID
    
    Returns:
        Dict with todolists or error
    """
    if not BASECAMP_TOKEN or not BASECAMP_ACCOUNT_ID:
        return {
            "success": False,
            "error": "Missing BASECAMP_TOKEN or BASECAMP_ACCOUNT_ID environment variables"
        }
    
    url = f"https://3.basecampapi.com/{BASECAMP_ACCOUNT_ID}/buckets/{project_id}/todosets/{todoset_id}/todolists.json"
    
    headers = {
        "Authorization": f"Bearer {BASECAMP_TOKEN}",
        "Content-Type": "application/json",
        "User-Agent": "Basecamp-MCP (hello@takuma.com)"
    }
    
    async with httpx.AsyncClient() as client:
        try:
            response = await client.get(url, headers=headers)
            
            if response.status_code == 200:
                todolists = response.json()
                todolist_data = []
                for todolist in todolists:
                    todolist_data.append({
                        "id": todolist["id"],
                        "title": todolist["title"],
                        "completed_count": todolist.get("completed_count", 0),
                        "remaining_count": todolist.get("remaining_count", 0)
                    })
                
                return {
                    "success": True,
                    "todolists": todolist_data
                }
            else:
                return {
                    "success": False,
                    "error": f"Basecamp API error: {response.status_code} - {response.text}"
                }
        except Exception as e:
            return {
                "success": False,
                "error": f"Request failed: {str(e)}"
            }

if __name__ == "__main__":
    # Run the server on stdio transport
    mcp.run()