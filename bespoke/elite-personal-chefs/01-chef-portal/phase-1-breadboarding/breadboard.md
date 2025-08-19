# Chef Payment Portal - Breadboard Draft
*Intentionally simple starting point for Monday's session*

## Core Flow
Chef enters job → Collects payment → Payment confirmed → Auto-flows to spreadsheet → Chef sees earnings

---

## Screens

### 1. Job List
Where chefs see their active jobs

**User needs to:**
- View today's jobs
- Add new job (when Amy assigns)
- See job status (unpaid/paid)

**What's shown:**
- Client name
- Service type
- Expected amount

---

### 2. Job Entry
Where chef defines what they're charging for

**User needs to:**
- Enter client name
- Select: dinner party or meal prep
- Enter guest count (actual vs expected)
- Enter grocery costs
- Note deposit already paid (if any)

**Calculates:**
- Total due
- Suggested tip

*Question: How do we handle team splits here?*

---

### 3. Payment Collection
Where chef gets the money

**For dinner parties (on-site):**
- Show total to client
- [Collect Now] → Opens Square POS
- [Mark as Paid] confirmation

**For meal prep (remote):**
- [Send Invoice] → Through Square
- Shows invoice status

*Question: What if client wants to pay later at dinner party?*

---

### 4. Payment Confirmation
Where chef verifies payment happened

**User needs to:**
- Confirm amount collected
- Note any additional tip
- Mark complete

**Shows:**
- Payment received ✓
- Chef's cut (after 15%)
- When it pays out

---

### 5. Chef Earnings Dashboard
Where chef tracks their money

**Shows:**
- Already paid out (last payroll)
- Pending for next payroll
- Jobs awaiting client payment
- Total earnings this month

**User needs to:**
- See breakdown by job
- Know when next payout is
- Track unpaid invoices

*This replaces chefs checking spreadsheets*

---

## Behind the Scenes: Automated Spreadsheet

### What happens when payment is confirmed

**Square webhook triggers Zapier to:**
- Create new row with invoice details
- Mark payment as received
- Calculate chef payout (85% of base + 100% groceries + 100% tips)
- Add to "Ready for Payroll" queue

**Lee's Monday workflow becomes:**
- Open spreadsheet
- See all confirmed payments
- Export totals for Square Payroll
- Mark as paid after processing

**What stays manual (for now):**
- Team split calculations
- Edge case adjustments
- Refund handling

*The spreadsheet remains the source of truth, just automated*

---

## What This Doesn't Address Yet

1. **Team splits** - How do 4 chefs split one invoice?
2. **Deposit tracking** - How does deposit from Amy flow to chef's view?
3. **Edge cases** - Refunds, partial payments, disputes
4. **Spreadsheet integration** - How exactly does Zapier connect Square to sheets?
5. **Guest count changes** - What if 10 becomes 12 at the event?

---

## Core Assumption to Validate

**If chefs are responsible for payment collection, and they can't claim payroll until payment is confirmed, does this solve 80% of Lee's manual work?**

---

## Monday's Goal

Take this skeleton and:
1. Fill in the missing pieces that matter for Week 1
2. Remove anything that's "Week 10"
3. Get crystal clear on the minimum viable flow