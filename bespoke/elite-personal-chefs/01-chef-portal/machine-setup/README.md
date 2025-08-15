# Machine Setup Documentation

## What's Here

This folder contains battle-tested setup guides for local Rails development after learning the hard way what doesn't work.

## Files

### `windows-problems-analysis.md`
Detailed breakdown of why Rails on native Windows fails. Read this to understand the ~15 different cascading failures we encountered and why band-aid fixes don't work.

### `windows-wsl2-setup-guide.md` 
The industry-standard solution. Step-by-step WSL2 setup that actually works. This is what professional Rails teams use for Windows developers.

### `local-development-guide.md`
Platform-specific setup instructions. Windows users are directed to WSL2, Mac/Linux users get native instructions.

## Key Learnings

### What Doesn't Work
- Native Windows Ruby/Rails (SQLite3 failures, permission issues, line endings)
- PowerShell for Rails commands (Unix command expectations)
- Storing code in Windows directories when using WSL
- Mixing Windows and Linux tools

### What Works
- WSL2 with code stored in Linux filesystem
- Docker with WSL2 backend as alternative
- Cursor's WSL2 integration
- Following platform conventions instead of forcing compatibility

## Setup Time

- **WSL2 Setup**: 30 minutes once, works forever
- **Native Windows Attempts**: 2+ hours of frustration, still breaks

## For New Developers

1. **Windows Users**: Go directly to `windows-wsl2-setup-guide.md`
2. **Mac/Linux Users**: Follow `local-development-guide.md`
3. **Never**: Try to run Rails natively on Windows PowerShell

## Support

If you encounter issues not covered here:
1. Check if you're actually in WSL2 (not PowerShell)
2. Verify code is in `~/projects` (not `C:\`)
3. Run `wsl --shutdown` and restart if things get weird
4. Use Docker as backup plan

## Why This Matters

This documentation exists because we lost 2+ hours to problems that shouldn't exist. The Rails ecosystem has standardized on WSL2 for Windows. Don't fight it - embrace it.