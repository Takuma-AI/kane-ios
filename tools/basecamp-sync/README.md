# Basecamp Document Sync Tool

Simple command-line tool to upload markdown files to Basecamp documents.

## Quick Start

1. **Initial Setup** (one-time only):
   ```bash
   ./sync --setup
   ```
   This will guide you through OAuth setup with your Basecamp credentials.

2. **Upload a document**:
   ```bash
   ./sync path/to/your/document.md
   ```

## Usage Examples

```bash
# Upload a document (will prompt for project/vault IDs if not set)
./sync my-document.md

# Upload with specific project and vault IDs
./sync my-document.md --project-id 123456 --vault-id 789012

# Run setup again if needed
./sync --setup
```

## What You Need

1. **Basecamp App Credentials**:
   - Go to https://launchpad.37signals.com/integrations
   - Create a new integration
   - Use `urn:ietf:wg:oauth:2.0:oob` as the redirect URI
   - Get your Client ID and Client Secret

2. **Basecamp IDs**:
   - Project ID (from the URL when viewing your project)
   - Vault ID (from the URL when viewing Docs & Files)

## How It Works

- Converts markdown to Basecamp-compatible HTML
- Stores OAuth credentials locally in `.basecamp_config.json`
- Automatically refreshes access tokens
- Uses the filename as the document title (with formatting)