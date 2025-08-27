# Flowchart Drawing Templates

## For Kate's Preparation

### Expected Current State Flow
Based on transcript analysis, Lee's workflow likely follows this pattern:

```
[Square Email Arrives]
    ↓
[Open Email - Identify Payment]
    ↓
[Determine Chef from Email/Memory] ←---[Sometimes unclear]
    ↓
[Open Spreadsheet]
    ↓
[Navigate to Chef's Tab] ←---[55+ tabs to search]
    ↓
[Find/Create Client Row]
    ↓
[Check Payment Amount]
    ↓
[Verify Against Invoice] ←---[Sometimes wrong]
    ↓
[Check for Previous Unpaid] ←---[Scroll through history]
    ↓
[Update Cell to Yellow] 
    ↓
[Enter Grocery Costs] ←---[May need to verify]
    ↓
[Calculate Commission]
    ↓
[Monday: Sum All Yellow Cells] ←---[Across all 55 sheets]
    ↓
[Enter in Square Payroll]
    ↓
[Update Cells to Green]
    ↓
[Calculate KPIs]
```

### Edge Cases to Probe
- Team splits (4-person teams)
- Partial payments
- Tips handling
- Refunds/adjustments
- Deposit reconciliation
- Late payments from weeks ago

### Ideal Automated Flow
What Make.com enables:

```
[Square Payment Event]
    ↓
[Make.com Receives Webhook]
    ↓
[Parse Payment Data]
    ↓
[Match Chef via Metadata/Rules] 
    ↓
[Calculate Commission Split]
    ↓
[Add Row to Master Log]
    ↓
[Update Chef Summary Tab]
    ↓
[Check for Exceptions] →---[Team Split?]→[Flag for Review]
    ↓                              ↓
[Normal Processing]          [Add to Exception Queue]
    ↓
[Monday: Review Queue]
    ↓
[One-Click Approve]
    ↓
[Auto-Update Status]
```

## Drawing Symbols to Use

### Standard Flowchart Symbols
- **Rectangle** = Process/Action step
- **Diamond** = Decision point
- **Oval** = Start/End
- **Parallelogram** = Data input/output
- **Wavy bottom** = Document
- **Circle** = Connector (when flow gets complex)

### Workshop Additions
- **Red X** = Pain point
- **Clock symbol** = Time sink
- **Question mark** = Unclear/variable
- **Lightning bolt** = Could be automated
- **Hand symbol** = Needs human judgment
- **Eye symbol** = Needs human verification

## Questions to Have Ready

### For Current State Validation
1. "Walk me through the last payment you processed"
2. "What's different for team payments?"
3. "How do you know which chef gets which payment?"
4. "What happens when a payment doesn't match?"
5. "Show me the Monday payroll process"

### For Ideal State Design
1. "What part of this do you actually enjoy?"
2. "What would you never want to delegate?"
3. "Where do mistakes happen most?"
4. "What would 'perfect' look like?"
5. "What other workflows connect to this?"

## Materials Checklist
- [ ] Large format paper (11x17 or bigger)
- [ ] Regular pens (black for main flow)
- [ ] Colored markers (red, green, yellow)
- [ ] Sticky notes (for annotations)
- [ ] Phone/camera (to capture drawings)
- [ ] Ruler (for clean lines if wanted)

## Time Management
- 10 min - Individual drawing
- 10 min - Compare and discuss
- 5 min - Break/reset
- 10 min - Individual ideal state
- 10 min - Converge on automation plan
- 15 min - Translate to spreadsheet structure
- 60 min - Build in Make.com

Total: 120 minutes