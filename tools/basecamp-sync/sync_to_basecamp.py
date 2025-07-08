#!/usr/bin/env python3
"""
Simple command-line tool to upload markdown files to Basecamp documents.
Usage: python sync_to_basecamp.py <file_path> [--project-id ID] [--vault-id ID]
"""

import sys
import os
import json
import argparse
import urllib.request
import urllib.parse
import urllib.error
from datetime import datetime
from pathlib import Path
import re
import glob

CONFIG_FILE = os.path.join(os.path.dirname(__file__), '.basecamp_config.json')

class BasecampSync:
    def __init__(self):
        self.config = self.load_config()
        self.access_token = None
        
    def load_config(self):
        """Load configuration from file or return empty config"""
        if os.path.exists(CONFIG_FILE):
            with open(CONFIG_FILE, 'r') as f:
                return json.load(f)
        return {}
    
    def save_config(self):
        """Save configuration to file"""
        with open(CONFIG_FILE, 'w') as f:
            json.dump(self.config, f, indent=2)
    
    def setup_oauth(self):
        """Guide user through OAuth setup"""
        print("\n=== Basecamp OAuth Setup ===")
        print("You'll need to create an app at: https://launchpad.37signals.com/integrations")
        print("Use 'http://localhost:8080/callback' as the redirect URI\n")
        
        self.config['client_id'] = input("Enter your Client ID: ").strip()
        self.config['client_secret'] = input("Enter your Client Secret: ").strip()
        
        # Generate authorization URL
        auth_url = (
            f"https://launchpad.37signals.com/authorization/new"
            f"?type=web_server"
            f"&client_id={self.config['client_id']}"
            f"&redirect_uri=http://localhost:8080/callback"
        )
        
        print(f"\nPlease visit this URL to authorize the app:")
        print(auth_url)
        print("\nAfter authorizing, copy the 'code' parameter from the URL you're redirected to.")
        print("It will look like: http://localhost:8080/callback?code=XXXXXXX")
        
        code = input("\nEnter just the code part: ").strip()
        
        # Exchange code for tokens
        data = urllib.parse.urlencode({
            "type": "web_server",
            "client_id": self.config['client_id'],
            "client_secret": self.config['client_secret'],
            "redirect_uri": "http://localhost:8080/callback",
            "code": code
        }).encode('utf-8')
        
        req = urllib.request.Request(
            "https://launchpad.37signals.com/authorization/token",
            data=data,
            headers={'Content-Type': 'application/x-www-form-urlencoded'}
        )
        
        try:
            with urllib.request.urlopen(req) as response:
                tokens = json.loads(response.read().decode())
                self.config['refresh_token'] = tokens['refresh_token']
                self.save_config()
                print("✓ Authentication successful!")
                return True
        except urllib.error.HTTPError as e:
            error_text = e.read().decode()
            print(f"✗ Authentication failed: {error_text}")
            return False
    
    def get_access_token(self):
        """Get a fresh access token using refresh token"""
        if 'refresh_token' not in self.config:
            print("No refresh token found. Running setup...")
            if not self.setup_oauth():
                return None
        
        data = urllib.parse.urlencode({
            "type": "refresh",
            "refresh_token": self.config['refresh_token'],
            "client_id": self.config['client_id'],
            "client_secret": self.config['client_secret']
        }).encode('utf-8')
        
        req = urllib.request.Request(
            "https://launchpad.37signals.com/authorization/token",
            data=data,
            headers={'Content-Type': 'application/x-www-form-urlencoded'}
        )
        
        try:
            with urllib.request.urlopen(req) as response:
                token_data = json.loads(response.read().decode())
                self.access_token = token_data['access_token']
                return self.access_token
        except urllib.error.HTTPError as e:
            error_text = e.read().decode()
            print(f"Failed to refresh token: {error_text}")
            return None
    
    def extract_title(self, content):
        """Extract the first H1 header from markdown content"""
        lines = content.split('\n')
        for line in lines:
            line = line.strip()
            if line.startswith('# '):
                return line[2:].strip()
        return None
    
    def markdown_to_html(self, content):
        """Convert markdown to Basecamp-compatible HTML"""
        lines = content.split('\n')
        html_lines = []
        in_ul = False
        in_table = False
        in_code_block = False
        table_headers = []
        code_block_lines = []
        
        i = 0
        while i < len(lines):
            line = lines[i].rstrip()
            
            # Handle code blocks
            if line.strip().startswith('```'):
                if not in_code_block:
                    # Start code block
                    if in_ul:
                        html_lines.append('</ul>')
                        in_ul = False
                    in_table = False
                    in_code_block = True
                    code_block_lines = []
                else:
                    # End code block
                    in_code_block = False
                    if code_block_lines:
                        html_lines.append(f'<pre>{"<br>".join(code_block_lines)}</pre>')
                    code_block_lines = []
                i += 1
                continue
            
            # If we're in a code block, collect lines
            if in_code_block:
                code_block_lines.append(line)
                i += 1
                continue
            
            # Skip empty lines
            if not line.strip():
                i += 1
                continue
            
            # Check for table rows (contains |)
            if '|' in line and not line.strip().startswith('#'):
                if not in_table:
                    # Start of table - close any open lists
                    if in_ul:
                        html_lines.append('</ul>')
                        in_ul = False
                    in_table = True
                    # Check if this is a header row (next line might be separator)
                    if i + 1 < len(lines) and '---' in lines[i + 1]:
                        table_headers = [cell.strip() for cell in line.split('|')[1:-1] if cell.strip()]
                        i += 2  # Skip the separator line
                        continue
                    else:
                        table_headers = []
                
                # Process table row
                cells = [cell.strip() for cell in line.split('|')[1:-1] if cell.strip()]
                if cells:
                    if not in_ul:
                        html_lines.append('<ul>')
                        in_ul = True
                    
                    # Create bullet point for table row
                    if table_headers and len(cells) == len(table_headers):
                        # Format as "Header: Value" pairs
                        row_items = []
                        for header, cell in zip(table_headers, cells):
                            formatted_cell = self.format_inline_text(cell)
                            row_items.append(f"<strong>{header}:</strong> {formatted_cell}")
                        html_lines.append(f'<li>{" | ".join(row_items)}</li>')
                    else:
                        # Simple bullet list of cells
                        formatted_cells = []
                        for cell in cells:
                            formatted_cell = self.format_inline_text(cell)
                            formatted_cells.append(formatted_cell)
                        html_lines.append(f'<li>{" | ".join(formatted_cells)}</li>')
            
            # Headers - flatten to just H1 and bold text
            elif line.startswith('### '):
                if in_ul:
                    html_lines.append('</ul>')
                    in_ul = False
                in_table = False
                if html_lines:  # Add divider before headers (except first)
                    html_lines.append('<div></div>')  # Space before
                    html_lines.append('<div>---</div>')
                    html_lines.append('<div></div>')  # Space after
                html_lines.append(f'<div><strong>{line[4:]}</strong></div>')
            elif line.startswith('## '):
                if in_ul:
                    html_lines.append('</ul>')
                    in_ul = False
                in_table = False
                if html_lines:  # Add divider before headers (except first)
                    html_lines.append('<div></div>')  # Space before
                    html_lines.append('<div>---</div>')
                    html_lines.append('<div></div>')  # Space after
                html_lines.append(f'<h1>{line[3:]}</h1>')
            elif line.startswith('# '):
                if in_ul:
                    html_lines.append('</ul>')
                    in_ul = False
                in_table = False
                if html_lines:  # Add divider before headers (except first)
                    html_lines.append('<div></div>')  # Space before
                    html_lines.append('<div>---</div>')
                    html_lines.append('<div></div>')  # Space after
                html_lines.append(f'<h1>{line[2:]}</h1>')
            
            # Lists
            elif line.strip().startswith('- '):
                in_table = False
                if not in_ul:
                    html_lines.append('<ul>')
                    in_ul = True
                list_content = line.strip()[2:]
                # Apply formatting to list items
                list_content = self.format_inline_text(list_content)
                html_lines.append(f'<li>{list_content}</li>')
            
            # Regular paragraphs
            else:
                if in_ul:
                    html_lines.append('</ul>')
                    in_ul = False
                in_table = False
                
                # Skip table separator lines
                if '---' in line and '|' in line:
                    i += 1
                    continue
                
                # Apply formatting
                formatted_line = self.format_inline_text(line)
                html_lines.append(f'<div>{formatted_line}</div>')
            
            i += 1
        
        # Close any open lists or code blocks
        if in_ul:
            html_lines.append('</ul>')
        if in_code_block and code_block_lines:
            html_lines.append(f'<pre>{"<br>".join(code_block_lines)}</pre>')
        
        return '\n'.join(html_lines)
    
    def format_inline_text(self, text):
        """Apply bold/italic formatting and clean up markdown syntax"""
        # Apply bold formatting (remove ** but keep <strong>)
        formatted = re.sub(r'\*\*(.+?)\*\*', r'<strong>\1</strong>', text)
        # Apply italic formatting (remove * but keep <em>)
        formatted = re.sub(r'\*(.+?)\*', r'<em>\1</em>', formatted)
        return formatted
    
    def parse_basecamp_url(self, url):
        """Extract project_id and vault_id from Basecamp URL"""
        # Pattern: https://3.basecamp.com/ACCOUNT/buckets/PROJECT_ID/vaults/VAULT_ID
        import re
        pattern = r'buckets/(\d+)/vaults/(\d+)'
        match = re.search(pattern, url)
        if match:
            return match.group(1), match.group(2)
        return None, None
    
    def upload_document(self, file_path, project_id=None, vault_id=None, folder_url=None):
        """Upload a document to Basecamp"""
        # Get access token
        if not self.get_access_token():
            return False
        
        # Parse folder URL if provided
        if folder_url:
            project_id, vault_id = self.parse_basecamp_url(folder_url)
            if not project_id or not vault_id:
                print("Could not parse project/vault IDs from URL")
                return False
        
        # Use provided IDs or defaults
        project_id = project_id or self.config.get('default_project_id')
        vault_id = vault_id or self.config.get('default_vault_id')
        
        if not project_id or not vault_id:
            print("\nProject ID and Vault ID are required.")
            folder_url = input("Enter Basecamp folder URL (or press Enter to enter IDs manually): ").strip()
            if folder_url:
                project_id, vault_id = self.parse_basecamp_url(folder_url)
            
            if not project_id or not vault_id:
                project_id = input("Enter Project ID: ").strip()
                vault_id = input("Enter Vault ID: ").strip()
            
            # Save as defaults
            save_defaults = input("Save as defaults? (y/n): ").lower() == 'y'
            if save_defaults:
                self.config['default_project_id'] = project_id
                self.config['default_vault_id'] = vault_id
                self.save_config()
        
        # Read file
        with open(file_path, 'r') as f:
            content = f.read()
        
        # Extract title from first H1 or use filename as fallback
        title = self.extract_title(content) or Path(file_path).stem.replace('-', ' ').replace('_', ' ').title()
        
        # Convert markdown to HTML
        html_content = self.markdown_to_html(content)
        
        # Upload to Basecamp
        url = f"https://3.basecampapi.com/{self.config.get('account_id', '999999999')}/buckets/{project_id}/vaults/{vault_id}/documents.json"
        
        data = {
            "title": title,
            "content": html_content,
            "status": "active"
        }
        
        json_data = json.dumps(data).encode('utf-8')
        
        req = urllib.request.Request(
            url,
            data=json_data,
            headers={
                "Authorization": f"Bearer {self.access_token}",
                "Content-Type": "application/json",
                "User-Agent": "BasecampSync (kate@example.com)"
            }
        )
        
        try:
            with urllib.request.urlopen(req) as response:
                doc = json.loads(response.read().decode())
                print(f"\n✓ Document uploaded successfully!")
                print(f"  Title: {doc['title']}")
                print(f"  URL: {doc.get('app_url', 'N/A')}")
                return True
        except urllib.error.HTTPError as e:
            error_text = e.read().decode()
            print(f"\n✗ Upload failed: {e.code}")
            print(error_text)
            
            # If it's a 404, we might need the account ID
            if e.code == 404 and 'account_id' not in self.config:
                print("\nLooks like we need your Basecamp account ID.")
                self.config['account_id'] = input("Enter your Basecamp Account ID: ").strip()
                self.save_config()
                return self.upload_document(file_path, project_id, vault_id)
            
            return False
    
    def create_vault(self, project_id, parent_vault_id, title):
        """Create a new vault (folder) in Basecamp"""
        url = f"https://3.basecampapi.com/{self.config.get('account_id', '999999999')}/buckets/{project_id}/vaults/{parent_vault_id}/vaults.json"
        
        data = {"title": title}
        json_data = json.dumps(data).encode('utf-8')
        
        req = urllib.request.Request(
            url,
            data=json_data,
            headers={
                "Authorization": f"Bearer {self.access_token}",
                "Content-Type": "application/json",
                "User-Agent": "BasecampSync (kate@example.com)"
            }
        )
        
        try:
            with urllib.request.urlopen(req) as response:
                vault = json.loads(response.read().decode())
                return vault['id']
        except urllib.error.HTTPError as e:
            error_text = e.read().decode()
            print(f"Failed to create vault '{title}': {e.code} - {error_text}")
            return None
    
    def upload_folder(self, folder_path, project_id=None, vault_id=None, folder_url=None):
        """Upload all markdown files in a folder to Basecamp"""
        # Get access token
        if not self.get_access_token():
            return False
        
        # Parse folder URL if provided
        if folder_url:
            project_id, vault_id = self.parse_basecamp_url(folder_url)
            if not project_id or not vault_id:
                print("Could not parse project/vault IDs from URL")
                return False
        
        # Use provided IDs or defaults
        project_id = project_id or self.config.get('default_project_id')
        vault_id = vault_id or self.config.get('default_vault_id')
        
        if not project_id or not vault_id:
            print("\nProject ID and Vault ID are required.")
            folder_url = input("Enter Basecamp folder URL (or press Enter to enter IDs manually): ").strip()
            if folder_url:
                project_id, vault_id = self.parse_basecamp_url(folder_url)
            
            if not project_id or not vault_id:
                project_id = input("Enter Project ID: ").strip()
                vault_id = input("Enter Vault ID: ").strip()
        
        folder_path = Path(folder_path)
        if not folder_path.is_dir():
            print(f"Error: '{folder_path}' is not a directory")
            return False
        
        # Create a new vault for this folder
        folder_name = folder_path.name
        new_vault_id = self.create_vault(project_id, vault_id, folder_name)
        if not new_vault_id:
            return False
        
        print(f"Created folder '{folder_name}' in Basecamp")
        
        # Find all markdown files
        md_files = []
        for pattern in ['*.md', '*.markdown']:
            md_files.extend(glob.glob(os.path.join(folder_path, pattern)))
        
        if not md_files:
            print(f"No markdown files found in '{folder_path}'")
            return False
        
        print(f"Found {len(md_files)} markdown files to upload...")
        
        # Upload each file
        success_count = 0
        for file_path in md_files:
            print(f"\nUploading: {Path(file_path).name}")
            if self.upload_single_document(file_path, project_id, new_vault_id):
                success_count += 1
            else:
                print(f"  ✗ Failed to upload {Path(file_path).name}")
        
        print(f"\n✓ Successfully uploaded {success_count}/{len(md_files)} documents")
        return success_count > 0
    
    def upload_single_document(self, file_path, project_id, vault_id):
        """Upload a single document without prompting for IDs"""
        try:
            # Read file
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Extract title from first H1 or use filename as fallback
            title = self.extract_title(content) or Path(file_path).stem.replace('-', ' ').replace('_', ' ').title()
            
            # Convert markdown to HTML
            html_content = self.markdown_to_html(content)
            
            # Upload to Basecamp
            url = f"https://3.basecampapi.com/{self.config.get('account_id', '999999999')}/buckets/{project_id}/vaults/{vault_id}/documents.json"
            
            data = {
                "title": title,
                "content": html_content,
                "status": "active"
            }
            
            json_data = json.dumps(data).encode('utf-8')
            
            req = urllib.request.Request(
                url,
                data=json_data,
                headers={
                    "Authorization": f"Bearer {self.access_token}",
                    "Content-Type": "application/json",
                    "User-Agent": "BasecampSync (kate@example.com)"
                }
            )
            
            with urllib.request.urlopen(req) as response:
                doc = json.loads(response.read().decode())
                print(f"  ✓ {doc['title']}")
                return True
                
        except Exception as e:
            print(f"  ✗ Error: {str(e)}")
            return False

def main():
    parser = argparse.ArgumentParser(
        description='Upload markdown files to Basecamp',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python sync_to_basecamp.py document.md
  python sync_to_basecamp.py my-folder/
  python sync_to_basecamp.py document.md --project-id 123456 --vault-id 789012
  python sync_to_basecamp.py my-folder/ --folder-url "https://3.basecamp.com/123/buckets/456/vaults/789"
  python sync_to_basecamp.py --setup
        """
    )
    
    parser.add_argument('file', nargs='?', help='Path to the markdown file or folder to upload')
    parser.add_argument('--project-id', '-p', help='Basecamp project ID')
    parser.add_argument('--vault-id', '-v', help='Basecamp vault ID')
    parser.add_argument('--folder-url', '-u', help='Basecamp folder URL (alternative to project/vault IDs)')
    parser.add_argument('--setup', action='store_true', help='Run OAuth setup')
    
    args = parser.parse_args()
    
    sync = BasecampSync()
    
    if args.setup:
        sync.setup_oauth()
    elif args.file:
        if not os.path.exists(args.file):
            print(f"Error: Path '{args.file}' not found")
            sys.exit(1)
        
        # Check if it's a directory or file
        if os.path.isdir(args.file):
            print(f"Uploading folder: {args.file}")
            sync.upload_folder(args.file, args.project_id, args.vault_id, args.folder_url)
        else:
            print(f"Uploading file: {args.file}")
            sync.upload_document(args.file, args.project_id, args.vault_id, args.folder_url)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()