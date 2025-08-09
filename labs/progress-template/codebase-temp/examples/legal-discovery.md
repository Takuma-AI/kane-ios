# Example: Legal Discovery

When working with email archives for legal purposes, create `process/CLAUDE.md`:

```markdown
# Legal Discovery Processing

## Citation Format
Every extracted item needs:
- Date: YYYY-MM-DD
- Parties: From → To
- Quote: "exact text"
- Source: seed/[path]

## Focus Areas
- Promises made
- Promises broken  
- Timeline of changes
- Documented damages

## Output Structure
Create separate documents for:
- Timeline of events
- Evidence by category
- Missing information that needs follow-up
```

Then dump emails in seed/ and the system will process accordingly.