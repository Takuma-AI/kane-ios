# Takuma OS Tools

Utilities that support the Progress Management workflow.

## Available Tools

### basecamp-sync
Upload markdown documents to Basecamp with proper formatting.

**Setup:**
```bash
cd tools/basecamp-sync
./sync --setup
```

**Usage:**
```bash
./sync path/to/document.md
```

### youtube-transcribe
Download and transcribe YouTube videos for knowledge extraction.

**Setup:**
```bash
cd tools/youtube-transcribe
pip install -r requirements.txt
```

**Usage:**
```bash
python transcribe.py [youtube-url]
```

## Tool Development Guidelines

When creating new tools for Takuma OS:

1. **Single Purpose**: Each tool should do one thing well
2. **Clear Documentation**: Include README with setup and usage
3. **Minimal Dependencies**: Keep external requirements light
4. **Error Handling**: Fail gracefully with helpful messages
5. **Cross-Platform**: Should work on macOS, Linux, and Windows when possible

## Contributing Tools

To add a new tool:
1. Create a directory under `tools/`
2. Include a README.md with setup instructions
3. Add any required dependency files (requirements.txt, package.json, etc.)
4. Test on a fresh system before sharing

Remember: Tools should reduce friction, not add complexity.