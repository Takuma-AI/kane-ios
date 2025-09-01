#!/usr/bin/env python3
"""
Export Claude Code conversation to markdown format.
"""

import json
from pathlib import Path
from datetime import datetime
import os

def format_timestamp(timestamp):
    """Convert ISO timestamp to readable format."""
    if not timestamp:
        return "Unknown time"
    try:
        dt = datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
        return dt.strftime('%Y-%m-%d %H:%M:%S')
    except:
        return timestamp

def extract_text_content(content):
    """Extract text from various content formats."""
    if isinstance(content, str):
        return content
    
    if isinstance(content, list):
        text_parts = []
        for item in content:
            if isinstance(item, dict):
                if item.get('type') == 'text':
                    text_parts.append(item.get('text', ''))
                elif item.get('type') == 'tool_use':
                    tool_name = item.get('name', 'Unknown Tool')
                    text_parts.append(f"\n**[Tool Use: {tool_name}]**\n")
            elif isinstance(item, str):
                text_parts.append(item)
        return '\n'.join(text_parts)
    
    return str(content)

def export_conversation_to_markdown(jsonl_path, output_dir):
    """Export a JSONL conversation to markdown files."""
    
    # Create output directory
    output_path = Path(output_dir)
    output_path.mkdir(parents=True, exist_ok=True)
    
    # Parse conversation
    entries = []
    summary = None
    session_id = None
    
    with open(jsonl_path, 'r') as f:
        for line in f:
            if line.strip():
                entry = json.loads(line)
                entries.append(entry)
                
                if entry.get('type') == 'summary':
                    summary = entry.get('summary', 'No summary')
                
                if not session_id and entry.get('sessionId'):
                    session_id = entry.get('sessionId')
    
    # Create main conversation file
    conv_filename = f"conversation_{session_id or 'unknown'}.md"
    conv_path = output_path / conv_filename
    
    with open(conv_path, 'w') as f:
        # Write header
        f.write("# Claude Code Conversation\n\n")
        
        if summary:
            f.write(f"**Summary:** {summary}\n\n")
        
        f.write(f"**Session ID:** {session_id or 'Unknown'}\n")
        f.write(f"**Source File:** {jsonl_path.name}\n")
        f.write(f"**Total Entries:** {len(entries)}\n\n")
        f.write("---\n\n")
        
        # Write conversation
        message_count = 0
        
        for entry in entries:
            entry_type = entry.get('type')
            
            if entry_type == 'user':
                message_count += 1
                timestamp = format_timestamp(entry.get('timestamp'))
                f.write(f"## User Message #{message_count}\n")
                f.write(f"*{timestamp}*\n\n")
                
                if entry.get('message'):
                    content = entry['message'].get('content', '')
                    text = extract_text_content(content)
                    f.write(f"{text}\n\n")
                
                f.write("---\n\n")
            
            elif entry_type == 'assistant':
                timestamp = format_timestamp(entry.get('timestamp'))
                f.write(f"## Assistant Response\n")
                f.write(f"*{timestamp}*\n\n")
                
                if entry.get('message'):
                    content_list = entry['message'].get('content', [])
                    
                    for content_item in content_list:
                        if isinstance(content_item, dict):
                            if content_item.get('type') == 'text':
                                text = content_item.get('text', '')
                                f.write(f"{text}\n\n")
                            elif content_item.get('type') == 'tool_use':
                                tool_name = content_item.get('name', 'Unknown')
                                f.write(f"**[Tool Use: {tool_name}]**\n\n")
                                
                                # Include tool parameters if available
                                if content_item.get('input'):
                                    f.write("```json\n")
                                    f.write(json.dumps(content_item['input'], indent=2))
                                    f.write("\n```\n\n")
                
                # Include token usage if available
                if entry.get('message', {}).get('usage'):
                    usage = entry['message']['usage']
                    f.write(f"\n*Tokens: {usage.get('input_tokens', 0)} in, {usage.get('output_tokens', 0)} out*\n\n")
                
                f.write("---\n\n")
    
    # Create index file
    index_path = output_path / "index.md"
    with open(index_path, 'w') as f:
        f.write("# Exported Claude Code Conversation\n\n")
        f.write(f"## Summary\n{summary or 'No summary available'}\n\n")
        f.write(f"## Details\n")
        f.write(f"- **Session ID:** {session_id or 'Unknown'}\n")
        f.write(f"- **Source:** {jsonl_path.name}\n")
        f.write(f"- **Messages:** {message_count}\n")
        f.write(f"- **Export Date:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        f.write(f"## Files\n")
        f.write(f"- [Full Conversation](./{conv_filename})\n")
    
    return output_path

def main():
    # The encouragement conversation
    conv_file = Path.home() / '.claude' / 'projects' / '-Users-kate-Projects-takuma-os' / 'be8bb112-4041-4fc8-82a5-5e0c0e006364.jsonl'
    
    if not conv_file.exists():
        print(f"File not found: {conv_file}")
        return
    
    # Export to markdown
    output_dir = Path.home() / 'Projects' / 'takuma-os' / 'tools' / 'exported_conversations' / 'encouragement_pivot'
    
    print(f"Exporting conversation...")
    print(f"From: {conv_file.name}")
    print(f"To: {output_dir}")
    print("=" * 60)
    
    result_path = export_conversation_to_markdown(conv_file, output_dir)
    
    print(f"\n✅ Export complete!")
    print(f"📁 Files saved to: {result_path}")
    print(f"\nView the conversation:")
    print(f"  cat {result_path}/index.md")
    print(f"  cat {result_path}/conversation_*.md")

if __name__ == "__main__":
    main()