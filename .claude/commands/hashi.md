# /hashi - Basecamp Todo Organization & Enrichment

Structure and enrich Basecamp todos using Takuma's systematic approach to progress management. Convert raw goals into actionable, philosophically-grounded todo systems.

## Core Philosophy

Todos aren't tasks - they're crystallized intent. Each list represents a success state by year-end, with immediate actionable steps and placeholder milestones that scope future work as reality clarifies.

### The Five Elements Framework (五行)

- **金 (Metal/Gold)**: Product/user outcomes
- **水 (Water)**: Client/consulting work (flowing with needs)
- **土 (Earth)**: Operations/systems (foundation)  
- **火 (Fire)**: Identity/communication (what illuminates)
- **木 (Wood)**: Internal practices/tooling (what grows)

## Initial Assessment

Always start by reading what already exists:

1. **Check current state**: List existing Basecamp todolists and their structure
2. **Understand context**: Read any recent progress updates or planning documents
3. **Identify gaps**: What success areas aren't represented?
4. **Assess quality**: Which lists need enrichment vs restructuring?

## Todo List Structure

### Title Format
Use past-tense success statements that would indicate victory by year-end:
- ✅ "10 people understand themselves through their spending" 
- ✅ "Company expenses running through company accounts"
- ❌ "Build KANE" or "Set up accounting"

### Description
Brief context explaining what success means and why it matters to Takuma's mission.

### Milestone Groups
Organize todos into progress gates - irreversible states that must be achieved in sequence:

#### Immediate Groups (this week/month)
- Contain specific, actionable todos with due dates
- Rich HTML descriptions following Hashi format
- Clear deliverables and excellence criteria

#### Future Groups (next quarter/later)
- Contain single "scope todos" that define future work
- Due dates set for when planning becomes relevant
- Document unknowns and dependencies

## Todo Description Format (HTML)

Follow this structure for all actionable todos:

```html
<div>
<h3>The Outcome</h3>
<p>Specific result this todo creates</p>

<h3>Why This Specific Step Matters</h3>
<p>How this serves the larger goal and Takuma philosophy</p>

<h3>Context That Shapes This</h3>
<p>Background, constraints, or philosophy that influences approach</p>

<h3>Starting Resources</h3>
<ul>
<li>Existing documents, tools, or context</li>
<li>People to involve or consult</li>
</ul>

<h3>Excellence Criteria</h3>
<p>What "done" looks like - specific, measurable</p>

<h3>Output/Deliverable</h3>
<p>Concrete artifact or outcome</p>
</div>
```

### For Scoping Todos (Future Milestones)

```html
<div>
<h3>The Outcome</h3>
<p>What this milestone will achieve when scoped properly</p>

<h3>Why This Becomes Relevant</h3>
<p>When and why this milestone activates</p>

<h3>Context That Shapes This</h3>
<p>Dependencies and constraints that will inform planning</p>

<h3>Key Unknowns to Resolve</h3>
<ul>
<li>Questions that must be answered</li>
<li>Dependencies that must be resolved</li>
</ul>

<h3>When This Becomes Active</h3>
<p>Timeline and triggers for detailed planning</p>

<h3>Output/Deliverable</h3>
<p>What scoping will produce (usually a detailed todo list)</p>
</div>
```

## Quality Standards

### Every Todo Must Have:
- **Due dates** for actionable items (specific dates, not ranges)
- **Rich context** in HTML descriptions  
- **Clear deliverables** - what gets created/completed
- **Excellence criteria** - how to know it's done well
- **Philosophical grounding** - why it serves Takuma's mission

### Anti-Patterns to Avoid:
- Vague todos like "Research X" without specific outcome
- Technical implementation details without user value
- Todos that don't connect to year-end success
- Empty groups without scoping todos
- Assumption-heavy planning for distant futures

## Takuma-Specific Principles

### Progressive Disclosure
- Ship what's known, test what's assumed
- Only detail immediate work, scope future milestones
- Let structure emerge from actual progress

### Human Agency First
- Every todo should increase human capability
- Avoid automation that replaces judgment
- Focus on amplifying expertise, not replacing it

### Words as Code
- Descriptions should be executable by someone else
- Clear enough to delegate without additional context
- Rich enough to preserve intent and quality standards

### Whetstone Philosophy
- Apply productive friction through questions and constraints
- Use obstacles to reveal what's essential
- Each todo should refine understanding, not just complete tasks

## Execution Process

1. **Assessment Phase**
   - List current Basecamp todos and structure
   - Read relevant context documents
   - Identify what needs creation vs enrichment

2. **Structure Phase**
   - Create/update lists with proper titles and descriptions
   - Organize into logical milestone groups
   - Ensure Five Elements coverage

3. **Content Phase**
   - Write rich todo descriptions using HTML format
   - Set appropriate due dates for actionable items
   - Create scoping todos for future milestones

4. **Quality Phase**
   - Verify each todo has clear deliverables
   - Check philosophical alignment with Takuma values
   - Ensure progressive disclosure principles

5. **Archive Phase**
   - Archive outdated or overly-detailed lists
   - Preserve useful content in appropriate locations
   - Clean up organizational structure

## Integration with Takuma OS

This command works with the broader Takuma OS by:
- Reading context from core/ and department CLAUDE.md files
- Integrating with progress tracking documents
- Aligning with company goals and philosophy
- Supporting the "words as code" paradigm

The todos created through this process become executable company behavior - clear enough for Claude to assist with execution while preserving human agency and judgment.

## Remember

Todos are crystallized intent. They should read like plans someone could execute months later without additional context. Every word serves progress toward the year-end success states that define Takuma's evolution.