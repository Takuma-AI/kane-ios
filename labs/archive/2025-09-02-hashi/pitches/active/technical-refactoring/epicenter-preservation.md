# Epicenter Preservation - The Core Magic of HASHI

## The Heart of HASHI

Found in `config/initializers/gemini.rb`, this is the system prompt that transforms fleeting thinking into structured action:

### Key Innovations in the Prompt

1. **Rich HTML Descriptions Required**
   - Not just "what to do" but complete HTML-formatted instructions
   - For communication tasks: includes the FULL DRAFT
   - Basecamp Rich Text API format (div, h1, ul, etc.)

2. **Milestone-Based Organization**  
   - Groups = irreversible progress gates
   - Past/perfect tense naming ("User feedback gathered")
   - Forces thinking in terms of progress, not just tasks

3. **"First Draft" Philosophy**
   ```
   "For tasks involving drafting communications, content creation, 
   or complex planning, supply a **fully drafted version in HTML** 
   within the description."
   ```
   This is the KEY - HASHI doesn't just remind, it provides a starting point.

4. **Structured Schema with Flexibility**
   - Strict JSON schema for reliable output
   - But descriptions can contain anything in HTML
   - Perfect balance of structure and expressiveness

## What Makes This Different

Traditional todo extraction:
```
Task: "Send stakeholder update"
Description: "Update stakeholders on progress"
```

HASHI extraction:
```
Task: "Draft and send stakeholder update email"
Description: <full HTML with complete email draft, pre-send checklist, distribution list location>
```

## Technical Implementation Notes

### Current Setup
- Using Gemini 2.5 Flash Preview
- System instruction + user prompt pattern
- Structured JSON output with responseSchema
- 160 second timeout for complex extractions

### Critical Elements to Preserve
1. The exact system prompt text
2. The JSON schema structure
3. The HTML formatting requirements
4. The milestone grouping philosophy

## Refactoring Implications

### MUST Preserve
- This exact prompt and schema
- The Gemini configuration
- The HTML-in-JSON approach

### Can Change  
- How the prompt is stored (currently inline)
- Error handling around the API call
- The service object structure

### Should Consider
- Versioning the prompt for A/B testing
- Extracting prompt to configuration
- Adding prompt enhancement based on use case

## The Real Innovation

The epicenter isn't just the prompt - it's the insight that todos should contain:
1. The thinking behind the task
2. A first draft or starting point
3. Research guidance for unknowns
4. Clear success criteria

This transforms task management from "reminders" to "knowledge transfer."

## Recommendation

Whatever refactoring approach we take, this prompt and its philosophy must remain untouched. It's not just code - it's codified methodology for preserving and transferring human thinking.