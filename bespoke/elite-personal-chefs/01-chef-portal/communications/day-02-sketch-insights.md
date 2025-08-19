# Day 02 - Product Design Insights & Consolidated Sketch

## Core Takeaway: One Screen, One Job

Today we learned a fundamental lesson from Shape Up: **every screen should do one job well**. When we asked "What is the chef really trying to get out of this screen?" the answer wasn't "manage all my data." It was simply: "What's my schedule?"

Once we got clear on that, everything else fell into place.

## Key Design Decisions We Made

### 1. This Isn't a Spreadsheet

When a chef opens this page, they're asking: "Can I go to the movies on Friday?" or "Where do I need to be tomorrow?" So we organized by time (Today, Later This Week) instead of cramming everything into rows and columns. If the job is knowing your schedule, then being able to edit 30 grocery amounts at once doesn't matter.

### 2. Unpaid Invoices Stay in Your Face

We put pending payments right at the top of the schedule - "3 days ago, $4,200, NUDGE via Square." Yes, it's annoying. That's the point. Unpaid invoices aren't done, and the value isn't real yet. By keeping them visible, we're reinforcing a culture of accountability and ownership. This is akin to Basecamp's "My Assignments" screen showing all the overdue things before you can see today's assignments.

### 3. Product Experience as Education

We reinforce the full $4,000 total contract value over the $3,400 cash payout. Why? Because the 15% isn't just a hidden commission, it's their equity stake on the platform. We're using the interface to train their perception and help them understand the value they're creating.

### 4. Different Jobs Need Different Tools

Chef teams who send 30 invoices at once have a different job than individual chefs. Instead of compromising both experiences, we're building the individual chef experience first. Bulk operations can come later as a separate "admin mode" - because editing spreadsheet-style and checking your schedule are fundamentally different activities.

Similarly, looking at past services and the money that's been made serves a different job. That is the "Show Me My Worth" screen that Austin has been dreaming up for years. For now, we'll keep it simple as a "history" page; our goal is to ship a good MVP of the schedule page so we have time to work on that next week.

## What's in the Sketch

After our conversation, I worked on distilling everything we discussed into the attached consolidated sketch. This is my synthesis of the ideas we explored - taking our 90 minutes of discussion and turning it into something concrete:

**"Home Screen" - Your Schedule:**

- **Pending payments** sit at the top in a box you can't miss - "3 days ago" with client name, amount, and NUDGE button
- **Today** shows who you're cooking for and how much the contract is worth
- **Later This Week** groups everything else chronologically
- Each service shows: Date, Client details, Contract Value, and a simple button to view details

**"Service Detail" Popup - Two Clear Parts:**

- **Left:** Service basics (client info, date, any notes about the event)
- **Right:** The money flow - Total contract → minus deposit → equals what's due. Then groceries and reimbursements → your cash payout and equity payout
- **Bottom:** Two buttons - Save (updates the numbers) or Send Invoice (gets you paid)

## What We're Still Figuring Out

**Recurring weekly clients:** When Chef Eric delivers to the same 30 clients every Monday, how does he duplicate last week's services? Click into history and copy? Or a "repeat last week" button? We'll test both.

**Addresses:** Some clients always use their home. Others book different venues. We're leaning toward addresses being part of each service (not tied to the client) so you can change them as needed.

## Your Three Actions

1. **Look at the sketch** - Does this feel right? We're not asking if it has every feature. We're asking if it does the main job well.

2. **Send us real data** - Check the [data collection request](./day-02-mockup-data-request.md). We need actual chef schedules and payments to make this real, not theoretical.

3. **4:30pm EST call** - We'll get onboarded to our new repo and create one mockup of the screen. The goal isn't perfection; it's to get started.

## In Closing: Why Details Matter

Today's session proved something important: the difference between a spreadsheet and a product isn't features - it's opinions.

A spreadsheet shows you everything and lets you edit anything. A product knows what job you're doing and optimizes for that. When you're checking if you can go bowling Friday, you don't need to edit 30 grocery amounts. When you see the $4,000 contract value instead of the $3,400 cash payroll, you're reminded that the 15% wasn't just "taken" from you.

These aren't just aesthetic decisions. They're decisions about what kind of company EPC wants to be and how professional chefs should think about their business.

That's why we spent 90 minutes on one screen. Now more than ever, getting the epicenter right is the necessary foundation for shipping fast.

---

*Next: 4:30pm EST - From sketch to code*