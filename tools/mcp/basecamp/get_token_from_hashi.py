#!/usr/bin/env python3
"""
Get Basecamp token from existing Hashi Rails app
This connects to your running Hashi instance to retrieve valid tokens
"""

import os
import json
import sys
import httpx
import asyncio
from pathlib import Path

HASHI_BASE_URL = os.getenv('HASHI_URL', 'http://localhost:3000')  # Change to production URL if needed

async def get_token_from_hashi():
    """
    Instructions for getting token from Hashi:
    
    1. Make sure Hashi Rails app is running
    2. Log into Hashi via browser
    3. This script will help you extract the token
    """
    
    print("🔗 Getting Basecamp Token from Hashi")
    print("=" * 40)
    print("\nThis requires you to:")
    print("1. Have Hashi running (locally or deployed)")
    print("2. Be logged into Hashi with Basecamp")
    print("\nHashi URL:", HASHI_BASE_URL)
    
    # For now, we'll use a manual approach
    # In production, you could add an API endpoint to Hashi that returns tokens for authenticated users
    
    print("\n📝 Manual Token Extraction Steps:")
    print("1. Open Hashi in your browser and log in with Basecamp")
    print("2. Open browser DevTools (F12)")
    print("3. Go to Application/Storage > Cookies")
    print("4. Find your session cookie value")
    print("\nOR if you have Rails console access:")
    print("1. Run: rails console")
    print("2. Run: user = User.find_by(email: 'your-email')")
    print("3. Run: user.basecamp_credential.token")
    print("4. Run: user.basecamp_credential.refresh_token")
    print("5. Run: user.basecamp_credential.account_id")
    
    # Prompt for manual input
    print("\n" + "=" * 40)
    token = input("Paste your Basecamp access token: ").strip()
    refresh_token = input("Paste your refresh token (or press Enter to skip): ").strip()
    account_id = input("Enter your Basecamp account ID: ").strip()
    
    if not token or not account_id:
        print("❌ Token and account ID are required")
        return None
    
    # Save credentials
    creds = {
        'access_token': token,
        'refresh_token': refresh_token or None,
        'account_id': account_id,
        'source': 'hashi'
    }
    
    creds_file = os.path.expanduser("~/.basecamp_mcp_credentials.json")
    with open(creds_file, 'w') as f:
        json.dump(creds, f, indent=2)
    os.chmod(creds_file, 0o600)
    
    print(f"\n✅ Credentials saved to {creds_file}")
    print("\nTo use in MCP server, the server will auto-load from this file")
    print("Or set environment variables:")
    print(f"  export BASECAMP_TOKEN={token}")
    print(f"  export BASECAMP_ACCOUNT_ID={account_id}")
    if refresh_token:
        print(f"  export BASECAMP_REFRESH_TOKEN={refresh_token}")
    
    return creds

async def add_hashi_api_endpoint():
    """
    This is what you'd add to Hashi to make token retrieval automatic
    Save this as a reference for adding to the Rails app
    """
    
    endpoint_code = '''
# Add to config/routes.rb:
namespace :api do
  get 'mcp_credentials', to: 'mcp#credentials'
end

# Create app/controllers/api/mcp_controller.rb:
class Api::McpController < ApplicationController
  before_action :require_login
  
  def credentials
    credential = current_user.basecamp_credential
    
    if credential.present?
      # Refresh if needed
      if credential.expiring_soon?
        current_user.refresh_basecamp_token
        credential.reload
      end
      
      render json: {
        access_token: credential.token,
        refresh_token: credential.refresh_token,
        account_id: session[:current_basecamp_account_id],
        expires_at: credential.expires_at
      }
    else
      render json: { error: 'No Basecamp credentials found' }, status: :not_found
    end
  end
  
  private
  
  def require_login
    unless logged_in?
      render json: { error: 'Not authenticated' }, status: :unauthorized
    end
  end
end
'''
    
    print("\n📝 To automate this in the future, add this endpoint to Hashi:")
    print(endpoint_code)
    print("\nThen the MCP server could fetch tokens automatically using your Hashi session.")

if __name__ == "__main__":
    asyncio.run(get_token_from_hashi())