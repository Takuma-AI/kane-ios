# Memory Orbs

## Problem

"BLUE BOTTLE COFFEE $14.50" tells us nothing. Was it your morning ritual? Meeting someone? Two coffees means what - treating a friend or double-caffeinating? We can't learn from spending we can't remember.

## Enemy

Bank statements that show WHERE but not WHY.

## Vision

Transform transactions into memories by building context around each purchase.

## Forces

**Push:** Merchant codes feel meaningless  
**Pull:** We want to understand why we spend  
**Anxiety:** Will context feel invasive?  
**Habit:** Quick fraud checks, no reflection  

## Appetite

One week.

## Solution

### The Core Insight: Context Accumulates

Transactions don't need to be "matched" - they need context to accumulate around them. Like memories forming in our minds, each transaction gathers meaning from the signals around it.

**A transaction arrives:** "Amazon $176.38"

**Context begins to build:**
- An order confirmation email from yesterday  
- The item ships today, triggering the charge
- A shipping notification tomorrow with tracking

**After one hour, a memory forms:** "Netflix 4K projector for apartment"

### The Architecture

Your receipts forward to KANE (one-time setup, 60 seconds). Then:

1. **Context pools** - Every email becomes searchable context
2. **Transactions wait** - One hour for context to gather
3. **Memories crystallize** - The best available context transforms the transaction

Not forced matching. Not manual entry. Just context naturally accumulating around each transaction.

## Rabbit Holes

- Building email parsing infrastructure (use existing services)
- Complex matching algorithms (simple proximity search works)
- Perfect accuracy (80% is magical compared to 0%)

## No-Goes

- Manual categorization UI
- Rules engines
- Complex configuration

## Success

Users say "I finally understand my Amazon spending" without having done any work.