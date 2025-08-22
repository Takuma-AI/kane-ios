# /librarian - Knowledge Base Content Processor

Process new content from the inbox directory and organize it into the knowledge base following the guidelines in knowledge/CLAUDE.md.

## Core Workflow

1. **Check inbox**: Look for new content in `/knowledge/_inbox/`
2. **Analyze content**: Determine type and appropriate destination
3. **Transform content**: Follow the comprehensive preservation guidelines in knowledge/CLAUDE.md
4. **Organize**: Place in correct folder structure
5. **Index**: Create/update indexes as needed
6. **Clean up**: Remove processed files from inbox

## Content Destinations

- **Books** (full or excerpts) → `knowledge/Books/`
- **Articles/Essays/Podcasts/Videos** → `knowledge/Pieces/[Source]/`

## Key Principles

- **Comprehensive preservation**: Include all substantive content
- **Maintain source structure**: Follow author's organization
- **Maximum fidelity**: Extensive quotes, original terminology
- **Clear accessibility**: Well-formatted for future retrieval

## Index Guidelines

- Create indexes when multiple pieces from same source exist
- All indexes named `_index.md` (underscore prefix ensures top placement)
- Include piece summaries and topic organization

## Execution

1. Run `ls knowledge/_inbox/` to see pending content
2. Process each file according to knowledge/CLAUDE.md guidelines
3. Report what was processed and where it was placed

For detailed transformation guidelines, structure templates, and quality standards, refer to:
**knowledge/CLAUDE.md**