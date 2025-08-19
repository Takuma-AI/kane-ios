#!/usr/bin/env python3
"""
OAuth helper for Basecamp MCP Server
Handles the OAuth flow by spinning up a temporary local server
"""

import os
import json
import webbrowser
import secrets
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs
import httpx
import asyncio
from threading import Thread
import time

class OAuthCallbackHandler(BaseHTTPRequestHandler):
    """Handles the OAuth callback from Basecamp"""
    
    def do_GET(self):
        # Parse the query parameters
        query = urlparse(self.path).query
        params = parse_qs(query)
        
        if 'code' in params:
            # Store the authorization code
            self.server.auth_code = params['code'][0]
            self.server.state = params.get('state', [None])[0]
            
            # Send success response to browser
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b"""
                <html>
                <body>
                    <h1>Authorization Successful!</h1>
                    <p>You can close this window and return to your terminal.</p>
                    <script>window.close();</script>
                </body>
                </html>
            """)
        else:
            # Handle error
            error = params.get('error', ['Unknown error'])[0]
            self.send_response(400)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(f"""
                <html>
                <body>
                    <h1>Authorization Failed</h1>
                    <p>Error: {error}</p>
                </body>
                </html>
            """.encode())
    
    def log_message(self, format, *args):
        # Suppress default logging
        pass

class BasecampOAuth:
    def __init__(self, client_id=None, client_secret=None, port=8888):
        self.client_id = client_id or os.getenv('BASECAMP_CLIENT_ID')
        self.client_secret = client_secret or os.getenv('BASECAMP_CLIENT_SECRET')
        self.port = port
        self.redirect_uri = f"http://localhost:{port}/callback"
        
    async def authenticate(self):
        """Run the full OAuth flow and return tokens"""
        
        if not self.client_id or not self.client_secret:
            raise ValueError("Missing BASECAMP_CLIENT_ID or BASECAMP_CLIENT_SECRET")
        
        # Generate state for CSRF protection
        state = secrets.token_urlsafe(32)
        
        # Build authorization URL
        auth_params = {
            'type': 'web_server',
            'client_id': self.client_id,
            'redirect_uri': self.redirect_uri,
            'state': state
        }
        auth_url = f"https://launchpad.37signals.com/authorization/new?{'&'.join(f'{k}={v}' for k,v in auth_params.items())}"
        
        print(f"\n🔐 Opening browser for Basecamp authorization...")
        print(f"If browser doesn't open, visit: {auth_url}\n")
        
        # Start local server in background
        server = HTTPServer(('localhost', self.port), OAuthCallbackHandler)
        server.auth_code = None
        server.state = None
        
        def run_server():
            server.handle_request()  # Handle one request then stop
        
        server_thread = Thread(target=run_server)
        server_thread.daemon = True
        server_thread.start()
        
        # Open browser
        webbrowser.open(auth_url)
        
        # Wait for callback (max 2 minutes)
        timeout = 120
        start = time.time()
        while server.auth_code is None and (time.time() - start) < timeout:
            await asyncio.sleep(0.5)
        
        if server.auth_code is None:
            raise TimeoutError("OAuth callback timeout - no authorization code received")
        
        if server.state != state:
            raise ValueError("Invalid state parameter - possible CSRF attack")
        
        print("✅ Authorization code received, exchanging for tokens...")
        
        # Exchange code for tokens
        token_params = {
            'type': 'web_server',
            'client_id': self.client_id,
            'redirect_uri': self.redirect_uri,
            'client_secret': self.client_secret,
            'code': server.auth_code
        }
        token_url = f"https://launchpad.37signals.com/authorization/token?{'&'.join(f'{k}={v}' for k,v in token_params.items())}"
        
        async with httpx.AsyncClient() as client:
            response = await client.post(
                token_url,
                data={'grant_type': 'authorization_code'},
                headers={'Content-Type': 'application/x-www-form-urlencoded'}
            )
            
            if response.status_code != 200:
                raise Exception(f"Token exchange failed: {response.status_code} - {response.text}")
            
            tokens = response.json()
            
            # Get user info and account details
            auth_response = await client.get(
                "https://launchpad.37signals.com/authorization.json",
                headers={
                    'Authorization': f"Bearer {tokens['access_token']}",
                    'Content-Type': 'application/json',
                    'User-Agent': 'Basecamp-MCP (hello@takuma.com)'
                }
            )
            
            if auth_response.status_code != 200:
                raise Exception(f"Failed to get user info: {auth_response.status_code}")
            
            user_data = auth_response.json()
            
            # Extract account ID (first account)
            account_id = None
            if user_data.get('accounts'):
                account_id = user_data['accounts'][0]['id']
            
            return {
                'access_token': tokens['access_token'],
                'refresh_token': tokens['refresh_token'],
                'expires_in': tokens['expires_in'],
                'account_id': account_id,
                'user': user_data.get('identity', {})
            }
    
    async def refresh_token(self, refresh_token):
        """Refresh an expired token"""
        
        async with httpx.AsyncClient() as client:
            response = await client.post(
                'https://launchpad.37signals.com/authorization/token',
                data={
                    'type': 'refresh',
                    'refresh_token': refresh_token,
                    'client_id': self.client_id,
                    'client_secret': self.client_secret,
                    'redirect_uri': self.redirect_uri
                }
            )
            
            if response.status_code != 200:
                raise Exception(f"Token refresh failed: {response.status_code} - {response.text}")
            
            return response.json()

async def main():
    """CLI tool to get Basecamp tokens"""
    
    print("🚀 Basecamp OAuth Setup for MCP Server")
    print("=" * 40)
    
    # Check for existing credentials
    creds_file = os.path.expanduser("~/.basecamp_mcp_credentials.json")
    
    if os.path.exists(creds_file):
        print(f"\n📁 Found existing credentials at {creds_file}")
        with open(creds_file, 'r') as f:
            creds = json.load(f)
        print(f"   Account ID: {creds.get('account_id')}")
        print(f"   User: {creds.get('user', {}).get('email_address', 'Unknown')}")
        
        choice = input("\nUse existing credentials? (y/n): ").lower()
        if choice == 'y':
            return creds
    
    # Run OAuth flow
    oauth = BasecampOAuth()
    
    try:
        result = await oauth.authenticate()
        
        print(f"\n✅ Successfully authenticated!")
        print(f"   Account ID: {result['account_id']}")
        print(f"   User: {result['user'].get('email_address', 'Unknown')}")
        
        # Save credentials
        with open(creds_file, 'w') as f:
            json.dump(result, f, indent=2)
        os.chmod(creds_file, 0o600)  # Secure file permissions
        
        print(f"\n💾 Credentials saved to {creds_file}")
        print("\nTo use in MCP server, set these environment variables:")
        print(f"  export BASECAMP_TOKEN={result['access_token']}")
        print(f"  export BASECAMP_ACCOUNT_ID={result['account_id']}")
        print(f"  export BASECAMP_REFRESH_TOKEN={result['refresh_token']}")
        
        return result
        
    except Exception as e:
        print(f"\n❌ OAuth failed: {e}")
        return None

if __name__ == "__main__":
    asyncio.run(main())