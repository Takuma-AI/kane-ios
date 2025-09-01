#!/usr/bin/env python3
"""
Extract the specific conversation about encouragement and pivot to time.
"""

import json
from pathlib import Path
from datetime import datetime

def extract_full_conversation(file_path: Path):
    """Extract and display the full conversation."""
    
    print(f"Extracting conversation from: {file_path.name}")
    print("=" * 80)
    
    entries = []
    with open(file_path, 'r') as f:
        for line in f:
            if line.strip():
                entries.append(json.loads(line))
    
    # Process entries
    for entry in entries:
        if entry.get('type') == 'summary':
            print(f"\n📋 SUMMARY: {entry.get('summary', 'N/A')}")
            print("-" * 40)
        
        elif entry.get('type') == 'user' and entry.get('message'):
            timestamp = entry.get('timestamp', '')
            if timestamp:
                dt = datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
                formatted_time = dt.strftime('%Y-%m-%d %H:%M:%S')
            else:
                formatted_time = 'Unknown time'
            
            print(f"\n👤 USER ({formatted_time}):")
            print("-" * 40)
            
            content = entry['message'].get('content', '')
            if isinstance(content, list):
                for item in content:
                    if isinstance(item, dict) and item.get('type') == 'text':
                        print(item.get('text', ''))
                    elif isinstance(item, str):
                        print(item)
            else:
                print(content)
            
            print()
        
        elif entry.get('type') == 'assistant' and entry.get('message'):
            timestamp = entry.get('timestamp', '')
            if timestamp:
                dt = datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
                formatted_time = dt.strftime('%Y-%m-%d %H:%M:%S')
            else:
                formatted_time = 'Unknown time'
            
            print(f"\n🤖 ASSISTANT ({formatted_time}):")
            print("-" * 40)
            
            content_list = entry['message'].get('content', [])
            for content_item in content_list:
                if isinstance(content_item, dict):
                    if content_item.get('type') == 'text':
                        text = content_item.get('text', '')
                        # Print first 2000 chars to keep it readable
                        if len(text) > 2000:
                            print(text[:2000] + "\n... [truncated] ...")
                        else:
                            print(text)
                    elif content_item.get('type') == 'tool_use':
                        print(f"\n[Tool Use: {content_item.get('name', 'Unknown')}]")
            print()

if __name__ == "__main__":
    # The conversation that looked most promising
    conv_file = Path.home() / '.claude' / 'projects' / '-Users-kate-Projects-takuma-os' / 'be8bb112-4041-4fc8-82a5-5e0c0e006364.jsonl'
    
    if conv_file.exists():
        extract_full_conversation(conv_file)
    else:
        print(f"File not found: {conv_file}")