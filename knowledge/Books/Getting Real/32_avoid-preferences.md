# Chapter 32: Avoid Preferences

**Book:** Getting Real  
**Section:** Process  
**Mental Model:** Opinionated Simplicity  
**Tags:** #preferences #decisions #simplicity #complexity #user-burden

## Decide the Little Details So Your Customers Don't Have To

"You're faced with a tough decision: how many messages do we include on each page? Your first inclination may be to say, 'Let's just make it a preference where people can choose 25, 50, or 100.' That's the easy way out though. **Just make a decision.**"

## The Truth About Preferences

"**Preferences are a way to avoid making tough decisions**"

"Instead of using your expertise to choose the best path, you're leaving it in the hands of customers. It may seem like you're doing them a favor but **you're just making busy work for them** (and it's likely they're busy enough). For customers, preference screens with an endless amount of options are a headache, not a blessing. **Customers shouldn't have to think about every nitty gritty detail** — don't put that burden on them when it should be your responsibility."

## The Hidden Evil of Preferences

"Preferences are also evil because they **create more software**. More options require more code. And there's all the extra testing and designing you need to do too. You'll also wind up with **preference permutations and interface screens that you never even see**. That means bugs that you don't know about: broken layouts, busted tables, strange pagination issues, etc."

## Make the Call

"Make simple decisions on behalf of your customers. That's what we did in Basecamp. The number of messages per page is **25**. On the overview page, the last **25** items are shown. Messages are sorted in **reverse chronological order**. The five most recent projects are shown in the dashboard. **There aren't any options. That's just the way it is.**"

## Embracing Being Wrong

"Yes, you might make a bad call. **But so what.** If you do, people will complain and tell you about it. As always, you can adjust. **Getting Real is all about being able to change on the fly.**"

## Mental Model: The Cost of Preferences

Havoc Pennington (tech lead, Red Hat) validates this approach:

"It turns out that **preferences have a cost**. Of course, some preferences also have important benefits — and can be crucial interface features. But each one has a price, and **you have to carefully consider its value**. Many users and developers don't understand this, and end up with a lot of cost and little value for their preferences dollar…I find that if you're **hard-core disciplined about having good defaults that Just Work** instead of lazily adding preferences, that naturally leads the overall ui in the right direction."

## Why Preferences Seem Like a Good Idea

### The Temptation:
- Avoid tough decisions
- Please everyone
- Maximum flexibility
- Customer "empowerment"
- Political safety

### The Reality:
- **Burden shifting**
- **Complexity explosion**
- **Testing nightmare**
- **Maintenance hell**
- **Confused users**

## The True Cost of Preferences

### Development Costs:
- More code to write
- More interfaces to design
- More tests to create
- More bugs to fix
- More documentation

### Hidden Costs:
- **Preference permutations**
- **Unseen interface states**
- **Unknown bugs**
- **Broken layouts**
- **Strange edge cases**

### User Costs:
- Decision fatigue
- Configuration burden
- Learning curve
- Confusion
- Wasted time

## The Basecamp Example

### Decisions Made:
- **25** messages per page
- **25** items on overview
- **Reverse chronological** order
- **5** most recent projects
- **No options**

### The Statement:
**"That's just the way it is."**

### Benefits:
- Clear experience
- No configuration
- Consistent behavior
- Predictable interface
- Less code

## Decision-Making Framework

### When Tempted by Preferences:

1. **Identify the best default**
   - What works for 80%?
   - What's simplest?
   - What's clearest?

2. **Make the decision**
   - Choose confidently
   - Document why
   - Implement it

3. **Ship without options**
   - No preference screen
   - No configuration
   - Just the default

4. **Listen and adjust**
   - If complaints arise
   - If data shows issues
   - Change the default
   - Still no preferences

## The "Just Work" Philosophy

### Good Defaults:
- Work for most users
- Feel natural
- Require no thought
- Create no burden
- Guide behavior

### Bad Preferences:
- Lazy decision avoidance
- Complexity addition
- User punishment
- False empowerment
- Hidden problems

## Handling Pushback

### When Users Want Options:

**Remember:**
- You're the expert
- It's your responsibility
- Simplicity has value
- Most won't configure anyway
- Defaults matter most

**Response:**
- Listen to the need
- Understand the problem
- Adjust the default if needed
- Keep it simple for everyone

## The Change Advantage

"**Getting Real is all about being able to change on the fly**"

### Why This Matters:
- Bad decisions aren't permanent
- Can adjust based on data
- No legacy preference burden
- Clean codebase
- Easy pivots

### Traditional Problem:
- Preferences lock you in
- Can't remove options
- Complexity accumulates
- Change becomes harder
- Technical debt grows

## Cultural Insights & Communication Style

### Direct Challenge:
- **"That's the easy way out"**
- Calls out laziness
- Challenges developers
- No sugar-coating

### Burden Language:
- **"Busy work for them"**
- **"Don't put that burden on them"**
- Customer empathy
- Responsibility ownership

### Evil Characterization:
- **"Preferences are also evil"**
- Strong moral stance
- Not just bad, evil
- Memorable positioning

### Specific Numbers:
- **25** messages
- **5** projects
- Concrete decisions
- No wishy-washy

### Defiant Tone:
- **"That's just the way it is"**
- No apologies
- Confident stance
- Take it or leave it

### Permission to Fail:
- **"But so what"**
- Reduces decision fear
- Encourages action
- Normalizes mistakes

### Cost Analysis:
- Pennington quote
- **"Preferences have a cost"**
- Economic framing
- Value consideration

## Related Concepts

- **Make Opinionated Software** (Chapter 20) - Preferences dilute opinions
- **Just Make a Decision** (Chapter 33 - "Done!") - Decision velocity
- **Build Less** (Chapter 4) - Preferences add complexity
- **It Just Doesn't Matter** (Chapter 22) - Most preferences don't
- **There's Nothing Functional about a Functional Spec** (Chapter 59) - Real decisions beat options