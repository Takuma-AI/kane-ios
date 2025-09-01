#!/usr/bin/env python3
"""
Find conversations about the pivot from money management to time management.
"""

import json
from pathlib import Path
from datetime import datetime

def search_conversation(file_path, keywords):
    """Search a conversation for specific keywords."""
    matches = []
    
    try:
        with open(file_path, 'r') as f:
            for line in f:
                if line.strip():
                    entry = json.loads(line)
                    
                    # Check user messages
                    if entry.get('type') == 'user' and entry.get('message'):
                        content = entry['message'].get('content', '')
                        
                        # Handle content as list or string
                        if isinstance(content, list):
                            text_parts = []
                            for item in content:
                                if isinstance(item, dict) and item.get('type') == 'text':
                                    text_parts.append(item.get('text', ''))
                                elif isinstance(item, str):
                                    text_parts.append(item)
                            content = ' '.join(text_parts)
                        
                        if content:
                            lower_content = content.lower()
                            
                            # Check for time pivot keywords
                            time_keywords = ['time instead of money', 'time not money', 
                                           'pivot to time', 'time management instead',
                                           'focus on time', 'time is the real',
                                           'time as the core', 'time dashboard',
                                           'hours not dollars', 'time tracker']
                            
                            for keyword in time_keywords:
                                if keyword in lower_content:
                                    timestamp = entry.get('timestamp', '')
                                    matches.append({
                                        'timestamp': timestamp,
                                        'keyword': keyword,
                                        'excerpt': content[:500]
                                    })
                                    break
                    
                    # Check summaries
                    elif entry.get('type') == 'summary':
                        summary = entry.get('summary', '').lower()
                        if 'time' in summary and any(word in summary for word in ['pivot', 'management', 'focus']):
                            matches.append({
                                'timestamp': 'SUMMARY',
                                'keyword': 'summary match',
                                'excerpt': entry.get('summary', '')
                            })
    
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
    
    return matches

def main():
    # Path to Claude Code projects
    claude_projects = Path.home() / '.claude' / 'projects'
    takuma_project = claude_projects / '-Users-kate-Projects-takuma-os'
    
    if not takuma_project.exists():
        print(f"Project directory not found: {takuma_project}")
        return
    
    print("Searching for conversations about TIME PIVOT")
    print("=" * 80)
    
    # Get all JSONL files
    jsonl_files = list(takuma_project.glob('*.jsonl'))
    jsonl_files.sort(key=lambda x: x.stat().st_mtime, reverse=True)
    
    # Search recent files (last 30)
    for i, file_path in enumerate(jsonl_files[:30], 1):
        matches = search_conversation(file_path, [])
        
        if matches:
            print(f"\n🎯 FOUND MATCHES in {file_path.name}")
            print("-" * 40)
            
            for match in matches[:3]:  # Show first 3 matches
                if match['timestamp'] != 'SUMMARY':
                    dt = datetime.fromisoformat(match['timestamp'].replace('Z', '+00:00'))
                    formatted_time = dt.strftime('%Y-%m-%d %H:%M')
                    print(f"\nTime: {formatted_time}")
                else:
                    print(f"\nSummary Match")
                
                print(f"Keyword: '{match['keyword']}'")
                print(f"Excerpt: {match['excerpt'][:200]}...")
                print("-" * 20)
            
            # Extract full conversation for the best match
            if len(matches) > 0:
                print(f"\n💡 To view full conversation, run:")
                print(f"python3 tools/view_conversation.py {file_path.name}")

if __name__ == "__main__":
    main()