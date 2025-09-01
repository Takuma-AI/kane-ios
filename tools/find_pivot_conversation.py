#!/usr/bin/env python3
"""
Find the conversation where Kate asked for encouragement and redirection,
leading to the pivot from money management to time.
"""

import json
import os
from pathlib import Path
from datetime import datetime
from typing import List, Dict, Any

def parse_jsonl_file(file_path: Path) -> List[Dict[str, Any]]:
    """Parse a JSONL file and return all entries."""
    entries = []
    try:
        with open(file_path, 'r') as f:
            for line in f:
                if line.strip():
                    entries.append(json.loads(line))
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
    return entries

def extract_conversation_info(entries: List[Dict[str, Any]]) -> Dict[str, Any]:
    """Extract key information from conversation entries."""
    info = {
        'file': None,
        'start_time': None,
        'summary': None,
        'first_user_message': None,
        'messages': [],
        'has_encouragement_request': False,
        'has_pivot_discussion': False
    }
    
    for entry in entries:
        # Get summary if available
        if entry.get('type') == 'summary':
            info['summary'] = entry.get('summary', '')
        
        # Get messages
        if entry.get('type') == 'user' and entry.get('message'):
            content = entry['message'].get('content', '')
            
            # Handle content as list or string
            if isinstance(content, list):
                # For content arrays, join text parts
                text_parts = []
                for item in content:
                    if isinstance(item, dict) and item.get('type') == 'text':
                        text_parts.append(item.get('text', ''))
                    elif isinstance(item, str):
                        text_parts.append(item)
                content = ' '.join(text_parts)
            
            timestamp = entry.get('timestamp', '')
            
            if not info['first_user_message'] and content:
                info['first_user_message'] = content[:500]  # First 500 chars
                info['start_time'] = timestamp
            
            if content:
                info['messages'].append({
                    'type': 'user',
                    'content': content,
                    'timestamp': timestamp
                })
                
                # Check for keywords indicating encouragement/redirection request
                lower_content = content.lower()
                if any(word in lower_content for word in ['encouragement', 'redirect', 'stuck', 'help me', 'overwhelm']):
                    info['has_encouragement_request'] = True
                
                # Check for pivot discussion keywords
                if any(phrase in lower_content for phrase in ['money management', 'time management', 'pivot', 'time instead of money', 'time not money']):
                    info['has_pivot_discussion'] = True
        
        # Get assistant responses for context
        elif entry.get('type') == 'assistant' and entry.get('message'):
            content_list = entry['message'].get('content', [])
            for content_item in content_list:
                if isinstance(content_item, dict) and content_item.get('type') == 'text':
                    text = content_item.get('text', '')
                    info['messages'].append({
                        'type': 'assistant',
                        'content': text[:500],  # Truncate for readability
                        'timestamp': entry.get('timestamp', '')
                    })
    
    return info

def find_recent_conversations(project_dir: Path, limit: int = 5) -> List[Path]:
    """Find the most recent conversation files."""
    jsonl_files = list(project_dir.glob('*.jsonl'))
    
    # Sort by modification time (most recent first)
    jsonl_files.sort(key=lambda x: x.stat().st_mtime, reverse=True)
    
    return jsonl_files[:limit]

def search_for_pivot_conversation():
    """Search for the conversation about pivoting from money to time."""
    # Path to Claude Code projects
    claude_projects = Path.home() / '.claude' / 'projects'
    
    # Focus on takuma-os project
    takuma_project = claude_projects / '-Users-kate-Projects-takuma-os'
    
    if not takuma_project.exists():
        print(f"Project directory not found: {takuma_project}")
        return
    
    print(f"Searching in: {takuma_project}")
    print("=" * 80)
    
    # Get recent conversations
    recent_files = find_recent_conversations(takuma_project, limit=10)  # Get more to increase chances
    
    print(f"Found {len(recent_files)} recent conversations")
    print("=" * 80)
    
    potential_matches = []
    
    for i, file_path in enumerate(recent_files, 1):
        print(f"\nAnalyzing conversation {i}: {file_path.name}")
        
        entries = parse_jsonl_file(file_path)
        info = extract_conversation_info(entries)
        info['file'] = file_path.name
        
        # Check if this might be the pivot conversation
        if info['has_encouragement_request'] or info['has_pivot_discussion']:
            potential_matches.append(info)
            print(f"  ✓ POTENTIAL MATCH!")
            print(f"    - Has encouragement request: {info['has_encouragement_request']}")
            print(f"    - Has pivot discussion: {info['has_pivot_discussion']}")
            if info['summary']:
                print(f"    - Summary: {info['summary'][:100]}...")
            if info['first_user_message']:
                print(f"    - First message: {info['first_user_message'][:200]}...")
    
    print("\n" + "=" * 80)
    print("SEARCH RESULTS")
    print("=" * 80)
    
    if potential_matches:
        print(f"\nFound {len(potential_matches)} potential conversations about the pivot:\n")
        
        for match in potential_matches:
            print(f"\nFile: {match['file']}")
            print(f"Time: {match['start_time']}")
            if match['summary']:
                print(f"Summary: {match['summary']}")
            print(f"First message preview:")
            print("-" * 40)
            print(match['first_user_message'][:300])
            print("-" * 40)
            
            # Show a few message excerpts to help identify
            print("\nKey message excerpts:")
            for msg in match['messages'][:3]:  # First 3 messages
                if msg['type'] == 'user':
                    preview = msg['content'][:200]
                    if 'time' in preview.lower() or 'money' in preview.lower():
                        print(f"  USER: {preview}...")
    else:
        print("\nNo conversations found matching the criteria.")
        print("\nShowing summaries of recent conversations for manual review:")
        
        for i, file_path in enumerate(recent_files[:5], 1):
            entries = parse_jsonl_file(file_path)
            info = extract_conversation_info(entries)
            
            print(f"\n{i}. {file_path.name}")
            print(f"   Time: {info['start_time']}")
            if info['summary']:
                print(f"   Summary: {info['summary']}")
            if info['first_user_message']:
                print(f"   Opening: {info['first_user_message'][:150]}...")

if __name__ == "__main__":
    search_for_pivot_conversation()