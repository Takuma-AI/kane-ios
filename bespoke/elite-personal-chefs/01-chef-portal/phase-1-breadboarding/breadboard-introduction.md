# What is a Breadboard? (5-minute introduction)

## The Concept (1 minute)

Imagine you're explaining the Chef Portal to someone over the phone. You can't show them pictures, so you use words:

"First, there's a screen where you see your jobs. From there, you click to enter job details. Then it takes you to payment collection..."

That's breadboarding - mapping out the system using only:
- **Places** (screens where things happen)
- **Affordances** (things users can click/tap/do)
- **Connection lines** (how screens connect)

No colors. No fonts. No layout. Just structure.

## Why This Matters for Chef Portal (1 minute)

Right now, your payment process lives in:
- Amy's head (job assignments)
- Square POS (payment collection)
- Lee's spreadsheet (payroll calculation)
- Multiple text threads (coordination)

A breadboard helps us see the whole flow in one place before we commit to any visual design. It's like planning the rooms of a house before choosing the furniture.

## What We're NOT Doing Today (1 minute)

**Not this:**
- "Should the button be blue or green?"
- "Where exactly on the screen does this go?"
- "What font should we use?"
- "Should we use cards or lists?"

**Instead this:**
- "What screens exist?"
- "What can a chef do on each screen?"
- "How do screens connect?"
- "What information moves between them?"

## Your Breadboard Components (1 minute)

Draw these three things only:

1. **Boxes = Screens**
   - Label: "Job Entry"
   - Not: A mockup of the job entry screen

2. **Words = What users can do**
   - Write: "Enter guest count"
   - Not: Draw an input field

3. **Arrows = Navigation**
   - Show: "Goes to → Payment Screen"
   - Not: Design a next button

## The Chef Portal Example (1 minute)

Here's a tiny breadboard snippet:

```
[Job List]
- See today's jobs
- Add new job
- Click job → goes to →

[Job Details]
- Enter guest count
- Enter grocery costs
- Calculate total → goes to →

[Payment Collection]
- Show amount to client
- Collect via Square
- Confirm → goes to →

[Success Screen]
- Shows chef earnings
- Shows payout date
```

That's it. No UI. Just structure.

## Your Task Now

In the next 15 minutes, create YOUR version of the complete chef payment flow. 

Start with: "A chef needs to collect payment"
End with: "Chef sees their earnings"

Map every screen in between. Note what happens on each.

Remember: You're not designing how it looks. You're defining what it is.

---

*Based on Shape Up by Ryan Singer - breadboarding is about getting the right level of abstraction to move fast without getting stuck in unnecessary details.*