# Development Workflow

Building software is discovering software. Every step reveals the next. Don't plan the journey - walk it.

## Interface-First Development

The interface isn't just what users see. It's what the product IS. Start there.

### The Discovery Process

1. **Get the Sketch**
   - "Draw what you're imagining"
   - Napkin sketches are perfect
   - Words lie, pictures reveal intent
   - If they can't sketch it, they don't know what they want

2. **Build the Real Thing (Hardcoded)**
   ```erb
   <!-- In the actual view file -->
   <div class="transaction">
     <h3>Starbucks Coffee</h3>
     <span class="amount">$4.50</span>
     <span class="category">Drinks</span>
     <button>Mark as Need</button>
   </div>
   ```
   - Real HTML in real views
   - Hardcoded data that tells the story
   - Actual styles that show the design
   - Working interactions (even if they don't persist)

3. **Review in Browser**
   - "Is this what you meant?"
   - Click through it together
   - Feel it working
   - Discover what's missing by using it

4. **Only Then: Backend**
   - Models for what needs persistence
   - Validations for what actually breaks
   - Logic for what varies
   - Never assume - build from usage

## The Assumption Test

Before adding any complexity, ask:
- **"What do we know?"** → Build this
- **"What do we assume?"** → Test this
- **"What don't we know?"** → Skip this

Every feature beyond the known adds assumptions. Ship the known to test the assumed.

## Progressive Implementation

Not about speed. About confidence.

### Stage 1: Make It Real
```erb
# app/views/transactions/index.html.erb
<div class="transactions">
  <div class="transaction">
    <h3>Whole Foods</h3>
    <p>$127.50 - Groceries</p>
    <button onclick="alert('Marked as Need')">Need</button>
  </div>
  <div class="transaction">
    <h3>Netflix</h3>
    <p>$15.99 - Entertainment</p>
    <button onclick="alert('Marked as Want')">Want</button>
  </div>
</div>
```
**Ship when**: It looks right and tells the story

### Stage 2: Make It Work
```ruby
# app/controllers/transactions_controller.rb
def index
  @transactions = [
    { merchant: "Whole Foods", amount: 127.50, category: "Groceries" },
    { merchant: "Netflix", amount: 15.99, category: "Entertainment" }
  ]
end
```
**Ship when**: Core interaction functions

### Stage 3: Make It Right
```ruby
# app/models/transaction.rb
class Transaction < ApplicationRecord
  validates :merchant, presence: true
  validates :amount, numericality: { greater_than: 0 }
  
  def need!
    update(category: 'need')
  end
end
```
**Ship when**: Real usage reveals what needs protection

### Stage 4: Make It Fast
Only if reality demands it. Most things never need this.

## Build From the Epicenter

The epicenter is the one thing that, if it doesn't work, nothing else matters.

### Finding the Epicenter
- "If we could only build one screen, which would it be?"
- "What's the core interaction that everything else supports?"
- "What would make this immediately useful?"

### Epicenter-Out Development
```
1. Core Screen (the epicenter)
   ↓
2. Supporting Screens (what the core needs)
   ↓
3. Adjacent Features (what enhances the core)
   ↓
4. Edge Cases (what reality demands)
   ↓
5. Polish (what delights)
```

Never work on step 3 while step 1 is broken.

## The Mockup vs. Production Workflow

### Mockups Are Lies
- They promise more than they know
- They hide complexity
- They assume everything works
- They're pictures, not products

### Production Is Truth
- Build in the real app
- Use real views with fake data
- Style with real CSS
- Interact with real browsers

### The Only Mockup That Matters
```erb
<!-- The actual ERB file with hardcoded data -->
<!-- This IS the mockup AND the beginning of production -->
```

## Handling Feature Requests

### The Question Cascade
1. **"What's the struggle?"** (find the pain)
2. **"Show me what you mean"** (get the sketch)
3. **"What if we didn't build this?"** (test importance)
4. **"What's the simplest version?"** (reduce assumptions)
5. **"What do we know for sure?"** (find solid ground)

### The Response Pattern
- **Never**: "Sure, I'll add that"
- **Always**: "Let me understand why"
- **Default**: "No, but convince me"

## Code Review Philosophy

You're not reviewing code. You're reviewing assumptions:
- Does this build on what we know?
- Does this add unnecessary assumptions?
- Does this preserve the ability to change?
- Does this make the next step obvious?

## Shipping Discipline

### Ship When
- The core use case works
- The interface feels right
- The assumption is testable
- Progress is visible

### Don't Ship When
- It's clever but not clear
- It handles cases that don't exist
- It builds on untested assumptions
- It makes the product more complex without more capable

## Daily Practice

### Morning Questions
- "What do we know today we didn't know yesterday?"
- "What assumption proved wrong?"
- "What's the epicenter today?"

### During Development
- Build the interface first
- Hardcode before abstracting
- Ship before perfecting
- Learn before assuming

### Evening Reflection
- "What did we ship?"
- "What did we learn?"
- "What can we remove?"
- "What assumption should we test next?"

## Remember

You're not building features. You're testing assumptions through the simplest implementation that creates progress.

Every line of code is a bet. Bet on what you know, not what you guess.

The interface reveals the product. The product reveals the need. The need reveals the next step.

Ship to learn. Learn to improve. Improve to ship.