# Workshop Facilitation Guide

## Core Principle
Start with pen and paper. Make the invisible visible. Build understanding before automation.

---

## Hour 1: Discovery Through Drawing (60 min)

### Opening (5 min)
"Before we touch any technology, let's map out what actually happens when a payment comes in. We're going to draw this together."

**Materials needed:**
- Large paper or whiteboard
- Different colored markers
- Sticky notes for edge cases

### Part 1: Individual Current State Mapping (20 min)

**Silent drawing phase (10 min):**

"Let's each draw out the payment workflow as it happens today. Start with 'Payment received from Square' and end with 'Chef gets paid'. Don't worry about being perfect - just capture what actually happens."

**Give Lee:**
- Blank paper
- Pen (commit to the lines)
- Sticky notes for annotations

**Kate draws simultaneously:**
- Your understanding from transcripts
- Assumptions to validate
- Questions that emerge

**Convergence discussion (10 min):**

Place both drawings side by side.

**Compare and discuss:**
- "I notice you have this step that I missed..."
- "Tell me more about this decision point..."
- "Why does this loop back here?"
- "What makes this step take so long?"

**Mark up the differences:**
- Green check = we both captured this
- Yellow highlight = unique to Lee's view (critical insight)
- Red X = pain point both drawings show
- Question mark = needs clarification

**Synthesis:**
Create a merged "true" workflow on fresh paper together

### Part 2: Information Architecture (15 min)

**Question:** "What information moves through this system?"

Draw data buckets:
```
PAYMENT DATA          CHEF DATA           BUSINESS DATA
- Amount             - Name              - Commission (15%)
- Date               - Payment history   - Tips handling
- Client             - Team splits       - Reimbursables
- Method             - Bank info         - KPIs
```

**Critical insight moment:** 
"Notice how the same data appears in multiple places? That's where errors creep in."

### Part 3: Individual Ideal Flow Design (20 min)

**Silent reimagining phase (10 min):**

"Now let's each draw the ideal workflow. Same start and end points, but imagine you had a magic assistant who never makes mistakes. What would you still want to do yourself? What would you delegate?"

**Prompts on the wall:**
- What requires your expertise?
- What's just moving data?
- Where do exceptions happen?
- What needs human judgment?

**Kate draws:**
- The technically optimal flow
- Automation boundaries
- Integration points

**Lee draws:**
- The business optimal flow
- Control points they want to keep
- Safety checks they need

**Convergence and negotiation (10 min):**

**Compare ideal flows:**
- "I kept this human because..."
- "I automated this because..."
- "What if we tried..."

**Find the sweet spot:**
- Green = definitely automate
- Yellow = automate with notification
- Red = keep manual (for now)

**Create final "v1 automation" flow together**

---

## Hour 2: Building the Solution (60 min)

### Part 1: Spreadsheet Restructuring (15 min)

**Translate drawing to data structure:**

Current: 55 chef tabs with mixed data
New: Clean separation of concerns

Draw the new spreadsheet architecture:
```
Tab 1: PAYMENT LOG (Raw data from Square)
- One row per payment
- Never edited manually
- Source of truth

Tab 2: PAYROLL QUEUE (What Lee sees)
- Filtered view of unpaid items
- Checkbox to mark as paid
- Running totals by chef

Tab 3: CHEF SUMMARY (Dashboard)
- Pivot table from payment log
- YTD earnings
- Current balance due

Tab 4: EDGE CASES (Manual handling)
- Team splits
- Adjustments
- Special rates
```

**Key moment:** "See how each tab has one job? That's what makes automation possible."

### Part 2: Make.com Translation (30 min)

**Map the drawn workflow to Make.com modules:**

Take the ideal flow drawing and show:
1. "This trigger box becomes..." → [Square Watch Events module]
2. "This recognition step becomes..." → [Router with filters]
3. "This calculation becomes..." → [Formula module]
4. "This update becomes..." → [Google Sheets Add Row]

**Build together:**
- Lee drives the mouse
- Kate guides the connections
- Test with real payment data

**Teaching moments:**
- "See how this looks like your drawing?"
- "Each module does one thing well"
- "The lines show data flowing"

### Part 3: Test and Iterate (15 min)

**Three test scenarios from Lee's examples:**
1. Normal payment → Should appear in log
2. Team split → Should route to edge cases
3. Previously failed payment → Should handle gracefully

**For each test:**
- Trace the path on paper diagram
- Watch it execute in Make.com
- See result in spreadsheet
- Mark any adjustments needed

---

## Closing: Ownership Transfer (5 min)

**Three artifacts Lee keeps:**
1. **The paper flowchart** - Their business logic visualized
2. **The new spreadsheet** - Clean data structure
3. **The Make.com scenario** - Automation they can modify

**Capability check:**
"Show me how you'd add a new chef"
"What would you change to adjust commission rate?"
"Where would you look if something went wrong?"

**Success moment:**
"You just eliminated 10 hours of weekly work. What will you do with that time?"

---

## Facilitator Notes

### Watch for these moments:
- When Lee says "but sometimes..." - That's an edge case to document
- When eyes glaze over - Step back to the drawing
- When excitement peaks - That's where the value lives

### Keep returning to:
- The paper diagram (visual anchor)
- Real payment examples (concrete > abstract)
- Time saved (the why)

### If stuck:
- "Let's look at your drawing"
- "Show me a real example"
- "What would make this easier?"

### Remember:
This is Lee's system. We're just making it visible, then automating the repetitive parts. Every decision should make sense to Lee, not just technically work.