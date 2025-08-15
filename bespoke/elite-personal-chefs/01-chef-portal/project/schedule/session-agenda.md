# Chef Portal Discovery Session Agenda
**Duration:** 45 minutes
**Goal:** Align on the epicenter and sketch the core solution

---

## Phase 1: Current Reality (10 min)
**Objective:** Understand the pain viscerally

### Opening Question
"Lee, walk me through last Monday morning. From the moment you sit down to run payroll, what actually happens? Every step, every spreadsheet, every check you have to do."

### Follow-up Probes
- "How long did that take?"
- "What went wrong that required investigation?"
- "How many times did you have to message or call someone?"
- "What would you rather have been doing with that time?"

### Listen For
- Manual verification steps
- Chasing payments
- Spreadsheet errors
- Trust/verification issues

---

## Phase 2: Finding the Epicenter (10 min)
**Objective:** Get agreement on what would make the problem disappear

### Transition
"Let's step back from how it works today. What would need to be true for this problem to just... not exist?"

### Guiding Questions
1. **"If chefs never made invoice errors, would that solve it?"**
   - Push until they see it's about collection, not just accuracy

2. **"If clients always paid immediately, would that solve it?"**
   - Guide toward "payment at point of service"

3. **"If you could trust that every payment in the system was real and confirmed, what would change?"**
   - Looking for "I'd just run payroll, no verification"

### The Convergence Question
"So if we boil it down: If chefs could easily collect the right amount at the right time, and you could trust that what's marked paid is actually paid, the problem disappears?"

### Boundary Setting
"Who should be responsible for making sure payment happens?"
- Chef's job: Collect payment
- EPC's job: Process confirmed payments
- System's job: Make it foolproof

**Get explicit agreement:** "So chefs own collection, EPC owns processing. Fair?"

---

## Phase 3: Breadboard Discovery (25 min)
**Objective:** Draw the solution together

### Transition (minute 20)
"Let's sketch what this could look like. I'll draw as we talk."

### Build It Step by Step

**Start with the end:**
"Lee, what do you need to see Monday morning?"
```
Draw: [Payroll Queue]
```

"What needs to happen for something to appear in that queue?"
```
Draw: [Payment Confirmed] → [Payroll Queue]
```

"How does payment confirmation happen?"

**For Dinner Parties:**
```
Draw: [Collect Payment] → [Payment Confirmed]
```

"What does the chef need to collect the right amount?"
```
Draw: [Job Details] → [Collect Payment]
```

**For Meal Prep:**
```
Draw: [Send Invoice] → [Square Webhook] → [Payment Confirmed]
```

### Reveal the Screens

"Let me show you what each of these boxes could look like..."

**Screen by screen, draw on the board:**

1. **Job Selection**
2. **Details Confirmation** (actual guests, expenses)
3. **Payment Collection** (two paths: immediate or invoice)
4. **Payment Confirmation** 
5. **Chef's Receipt**
6. **Lee's Dashboard**

### Test the Solution

"Walk me through a dinner party with this system..."
- Chef selects job
- Confirms 12 guests (not 10)
- Enters groceries
- Collects payment on spot
- Done

"Now meal prep..."
- Chef selects job
- Confirms details
- Sends invoice
- Square confirms when paid
- Shows in Lee's queue

### Address Concerns
As they raise issues:
- "Is that week one or week ten?"
- "How often does that happen?"
- "Could Lee handle that manually while we test?"

---

## Closing (Last 5 min)

### The Commitment
"Here's what I propose:
- Week 1: We design these 6 screens together
- Week 2: We wire up the Square integration
- Test with one chef, real jobs
- Learn what actually breaks"

### Final Alignment
"Before we proceed, are we aligned that:
1. This epicenter solves 80% of the problem?
2. Chefs own payment collection?
3. Everything else is optimization?"

### Next Steps
"Tuesday we start designing the interface. By end of week, you'll have mockups. Week 2, we make it real."

---

## Facilitation Notes

### Keep Handy
- Push for responsibility boundaries
- Don't let them solution before understanding problem
- "Simple now, complex later"
- Focus on the dinner party and meal prep scenarios only

### If They Spiral
- "What breaks if we don't have that?"
- "Is that stopping us from testing the core idea?"
- "How many times this month?"

### Success Metrics
- They say "just making payment collection foolproof"
- They agree chefs own collection
- They see 6 screens as sufficient to start
- Lee smiles thinking about automated Monday mornings