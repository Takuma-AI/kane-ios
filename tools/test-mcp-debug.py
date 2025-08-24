#!/usr/bin/env python3
"""Debug MCP server startup issues"""

import subprocess
import sys
import os
import time

servers = [
    ("basecamp", "/Users/kate/Projects/takuma-os/tools/servers/basecamp"),
    ("pdf-generator", "/Users/kate/Projects/takuma-os/tools/servers/pdf-generator"),
    ("perplexity-deep-research", "/Users/kate/Projects/takuma-os/tools/servers/perplexity-deep-research"),
    ("youtube-transcribe", "/Users/kate/Projects/takuma-os/tools/servers/youtube-transcribe")
]

print("Testing MCP server startup...\n")

for name, path in servers:
    print(f"Testing {name}...")
    server_py = os.path.join(path, "server.py")
    venv_python = os.path.join(path, "venv/bin/python")
    
    if not os.path.exists(venv_python):
        print(f"  ❌ Virtual environment not found")
        continue
    
    if not os.path.exists(server_py):
        print(f"  ❌ server.py not found")
        continue
    
    # Test basic import
    try:
        result = subprocess.run(
            [venv_python, "-c", f"import sys; sys.path.insert(0, '{path}'); import server; print('Import OK')"],
            capture_output=True,
            text=True,
            timeout=5,
            cwd=path
        )
        if result.returncode == 0:
            print(f"  ✅ Server imports successfully")
        else:
            print(f"  ❌ Import failed: {result.stderr}")
    except subprocess.TimeoutExpired:
        print(f"  ⚠️  Import timed out (might be waiting for stdin)")
    except Exception as e:
        print(f"  ❌ Error: {e}")
    
    # Test MCP protocol initialization
    try:
        # Send initialization request to see if server responds
        cmd = [venv_python, server_py]
        proc = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            cwd=path
        )
        
        # Send MCP initialization
        init_request = '{"jsonrpc":"2.0","method":"initialize","params":{"protocolVersion":"1.0.0","capabilities":{}},"id":1}\n'
        stdout, stderr = proc.communicate(input=init_request, timeout=2)
        
        if "result" in stdout:
            print(f"  ✅ MCP server responds to initialization")
        else:
            print(f"  ❌ No MCP response. Stdout: {stdout[:100]}")
            if stderr:
                print(f"     Stderr: {stderr[:100]}")
    except subprocess.TimeoutExpired:
        print(f"  ✅ Server started (waiting for input)")
        proc.kill()
    except Exception as e:
        print(f"  ❌ Error testing MCP: {e}")
    
    print()

print("\nChecking Claude MCP configuration...")
result = subprocess.run(["claude", "mcp", "list"], capture_output=True, text=True)
print(result.stdout)