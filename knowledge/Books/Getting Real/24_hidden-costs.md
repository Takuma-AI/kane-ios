# Chapter 24: Hidden Costs

**Book:** Getting Real  
**Section:** Feature Selection  
**Mental Model:** Total Cost Awareness  
**Tags:** #features #hidden-costs #feature-loops #complexity #total-impact

## Expose the Price of New Features

"Even if a feature makes it past the 'no' stage, you still need to **expose its hidden costs**."

## The Feature Loop Problem

"For example, be on the lookout for **feature loops** (i.e. features that lead to more features). We've had requests to add a meetings tab to Basecamp. Seems simple enough until you examine it closely. Think of all the different items a meetings tab might require: **location, time, room, people, email invites, calendar integration, support documentation**, etc. That's not to mention that we'd have to change **promotional screenshots, tour pages, faq/help pages, the terms of service**, and more. Before you know it, **a simple idea can snowball into a major headache**."

## The Complete Feature Checklist

"For every new feature you need to…

1. Say no.
2. Force the feature to prove its value.
3. If "no" again, end here. If "yes," continue…
4. Sketch the screen(s)/ui.
5. Design the screen(s)/ui.
6. Code it.
7-15. Test, tweak, test, tweak, test, tweak, test, tweak…
16. Check to see if help text needs to be modified.
17. Update the product tour (if necessary).
18. Update the marketing copy (if necessary).
19. Update the terms of service (if necessary).
20. Check to see if any promises were broken.
21. Check to see if pricing structure is affected.
22. Launch.
23. Hold breath."

## Mental Model: The Iceberg Effect

### What's Visible:
- The feature request
- The basic functionality
- The user benefit

### What's Hidden Below:
- **Feature loops** - Features requiring features
- **Documentation burden** - Help, FAQs, tours
- **Marketing updates** - Screenshots, copy, demos
- **Legal implications** - Terms of service
- **Promise conflicts** - Breaking existing commitments
- **Pricing complexity** - Structure changes

## The Meetings Tab Case Study

### Initial Request:
"Add a meetings tab" - Seems simple

### Hidden Requirements Revealed:
- **Location** field
- **Time** picker
- **Room** booking
- **People** invitations
- **Email** notifications
- **Calendar** integration
- **Support** documentation

### Cascade Effects:
- Update promotional screenshots
- Revise tour pages
- Modify FAQ/help sections
- Change terms of service
- And more...

### Result:
**"Simple idea → Major headache"**

## The 23-Step Reality

### Pre-Development (Steps 1-3):
- Initial resistance
- Value proof required
- Second chance to stop

### Development (Steps 4-15):
- Sketch → Design → Code
- **Eight rounds** of test/tweak
- Not just build, but refine

### Integration (Steps 16-21):
- Help text modifications
- Product tour updates
- Marketing copy changes
- Terms of service review
- Promise compatibility check
- Pricing impact analysis

### Release (Steps 22-23):
- Launch
- **"Hold breath"** - The anxiety moment

## Types of Hidden Costs

### Technical Debt:
- Code complexity increase
- Testing surface expansion
- Performance implications
- Maintenance burden

### Documentation Overhead:
- Help articles
- Video tutorials
- FAQ updates
- Support scripts

### Marketing Burden:
- Screenshot updates
- Feature matrices
- Sales materials
- Website copy

### Organizational Impact:
- Training requirements
- Support ticket increase
- Team cognitive load
- Decision complexity

### Strategic Costs:
- Promise conflicts
- Pricing complications
- Positioning changes
- Vision dilution

## The Promise Check

"**Check to see if any promises were broken**"

### Common Broken Promises:
- "We keep it simple" → Feature bloat
- "No learning curve" → Complex addition
- "Fast and responsive" → Performance hit
- "Focused tool" → Feature creep

### Why This Matters:
- Trust erosion
- Brand confusion
- User disappointment
- Marketing conflicts

## Decision Framework

### Before Saying Yes, Map:

1. **Direct Requirements**
   - What must be built?
   - How complex is it?

2. **Feature Loops**
   - What features does this feature need?
   - And what do those need?

3. **Update Cascade**
   - What documentation changes?
   - What marketing updates?
   - What legal reviews?

4. **Promise Compatibility**
   - Does this conflict with brand?
   - Break existing commitments?

5. **Total Effort**
   - All 23 steps considered?
   - True cost vs. benefit?

## The Snowball Effect

"**A simple idea can snowball into a major headache**"

### How Snowballing Happens:
1. Innocent feature request
2. Seems reasonable in isolation
3. Dependencies emerge
4. Requirements multiply
5. Complexity explodes
6. Original simplicity lost

### Prevention:
- Examine closely upfront
- Map all dependencies
- Count all costs
- Question each addition
- Stop before snowball forms

## Cultural Insights & Communication Style

### Process Transparency:
- Shows exact 23 steps
- Nothing hidden or glossed over
- Reality of feature addition

### Visceral Language:
- **"Major headache"** - Physical pain metaphor
- **"Snowball"** - Uncontrolled growth
- **"Hold breath"** - Launch anxiety

### Specific Examples:
- Meetings tab case study
- Detailed requirement list
- Concrete cascade effects

### Numbered Precision:
- Steps 7-15 collapsed (test/tweak cycle)
- Shows repetitive nature
- Eight iterations minimum

### Cautionary Tone:
- **"Be on the lookout"** - Warning language
- **"Even if it makes it past"** - Second barrier
- **"Expose hidden costs"** - Detective work

### Completeness Emphasis:
- **"That's not to mention"** - More beyond obvious
- Every aspect considered
- Nothing left unexamined

## Related Concepts

- **Start With No** (Chapter 23) - First line of defense
- **It Just Doesn't Matter** (Chapter 22) - Avoid costs entirely
- **Can You Handle It?** (Chapter 25) - Organizational capacity
- **Half, Not Half-Assed** (Chapter 21) - Quality despite complexity
- **Build Less** (Chapter 4) - Fundamental avoidance strategy