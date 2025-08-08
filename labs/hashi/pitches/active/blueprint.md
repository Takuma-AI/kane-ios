# Blueprint

## Problem
HASHI feels like a dice roll - we submit a transcript and wait to see what comes out. The issue isn't that we don't know what to prompt for, it's that we don't know what needs correcting until we see the AI starting to misinterpret. Unknown unknowns.

Common misinterpretations we can't pre-correct:
- **Wrong audience**: "Ciera should send playlist" when Ciera is reading the tasks
- **Past vs. future**: Including "what we already tried" as upcoming tasks
- **Rejected ideas**: Treating brainstormed-but-rejected approaches as action items
- **Mixed priorities**: Combining urgent data cleanup with long-term strategy
- **Wrong scope**: Turning "explore possibilities" into "implement everything"

We can't anticipate which interpretation the AI will choose until we see it start to form.

## Forces at Play
- Push: The AI misreading intent - wrong audience, wrong timeline, wrong scope
- Pull: Wanting to catch misinterpretations before they cascade into 20+ tasks
- Anxiety: What if the preview step slows everything down?
- Habit: Current one-shot generation is simple, even if interpretation is wrong

## Appetite
2 days - One crucial feedback loop, minimal backend changes

## Solution
Show the blueprint before building the structure:

1. We input transcript
2. AI shows a blueprint:
   ```
   Title: Investment Performance Restored by August 1
   
   Milestones:
   • Data Discrepancies Resolved - All 167 companies properly reflected in Techstars system
   • Portfolio Health Visible - Red/yellow/green status tracked across all investments
   • Founder Data Verified - Current information confirmed with each portfolio CEO
   • Investment Metrics Accurate - IRR and performance calculations corrected for leadership
   ```
3. We can respond:
   - "This is mixing the urgent data cleanup with the longer-term VC outreach project"
   - "We already tried contacting founders last month - focus on the new approach"
   - "Frame this for Ciera and Avni to execute, not for Neal to do himself"
   - "The red/yellow/green system was just an idea, not decided yet"
   - "Looks good, continue"
4. AI generates full tasks using this corrected blueprint as the guide

## Technical Approach
Keep it simple - wrapper, not refactor:
- Separate LLM call generates the outline preview
- User feedback + outline get prepended to original prompt
- Original todo generation remains unchanged
- No architectural changes to existing flow

Example prompt structure:
```
Using the following outline and user feedback:
Outline: [generated milestone preview]
Our feedback: "Frame this for Ciera and Avni to execute, not for Neal"

[Original prompt + transcript continues as normal]
```

## Rabbit Holes
- Major refactoring of prompt architecture
- Building complex multi-step workflows
- Creating sub-agent systems (save for future)
- Trying to handle every edge case
- Over-engineering the preview format

## No-Goes  
- Changing core LLM architecture
- Multiple rounds of back-and-forth
- Detailed editing at preview stage
- Breaking existing transcript → tasks flow

## Success
- We catch misinterpretations early: wrong audience, past vs. future, rejected ideas
- Milestone titles read as completed outcomes, not action items
- The AI's understanding is visible and correctable before it generates 20+ tasks
- Implementation stays simple - just a wrapper around existing flow
- Feature ships in 2 days without breaking existing functionality