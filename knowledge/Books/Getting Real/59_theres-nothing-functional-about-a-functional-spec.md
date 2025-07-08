# Chapter 59: There's Nothing Functional about a Functional Spec

**Book:** Getting Real  
**Section:** Words  
**Mental Model:** Process & Execution  
**Tags:** #documentation #specifications #agile #process #interface-first

## Core Concept

**Don't write a functional specifications document.** These blueprint docs usually wind up having almost nothing to do with the finished product. Here's why:

## Why Functional Specs Fail

### 1. Functional Specs Are Fantasies
"They don't reflect reality. An app is not real until builders are building it, designers are designing it, and people are using it. Functional specs are just words on paper."

### 2. Functional Specs Are About Appeasement
"They're about making everyone feel involved and happy which, while warm and fuzzy, isn't all that helpful. They're never about making tough choices and exposing costs, things that need to happen to build a great app."

### 3. Functional Specs Only Lead to an Illusion of Agreement
"A bunch of people agreeing on paragraphs of text isn't a true agreement. Everyone may be reading the same thing but they're thinking something different. This inevitably comes out later on: 'Wait, that's not what I had in mind.' 'Huh? That's not how we described it.' 'Yes it was and we all agreed on it — you even signed off on it.' You know the drill."

### 4. Functional Specs Force You to Make the Most Important Decisions When You Have the Least Information
"You know the least about something when you begin to build it. The more you build it, the more you use it, the more you know it. That's when you should be making decisions — when you have more information, not less."

### 5. Functional Specs Lead to Feature Overload
"There's no pushback during spec phase. There's no cost to writing something down and adding another bullet point. You can please someone who's a pain by adding their pet feature. And then you wind up designing to those bullet points, not to humans. And that's how you wind up with an overloaded site that's got 30 tabs across the top of the screen."

### 6. Functional Specs Don't Let You Evolve, Change, and Reassess
"A feature is signed off and agreed on. Even if you realize during development that it's a bad idea, you're stuck with it. Specs don't deal with the reality that once you start building something, everything changes."

## Mental Model: Living Documentation

**Traditional Thinking:** Lock down every detail in a spec before building begins.

**Getting Real Thinking:** Let the interface be the spec and evolve it through building.

### Decision Framework

Instead of specs:
1. **Can we show it instead of describe it?**
2. **Can we build a simple version quickly?**
3. **Can we get real feedback sooner?**
4. **Can we keep decisions fluid?**

### Key Insight

The best spec is working software. Everything else is just guessing.

## The Alternative Approach

"So what should you do in place of a spec? Go with a briefer alternative that moves you toward something real."

### Step 1: One Page Story
- Write what the app needs to do
- Use plain language
- Make it quick
- Keep it to one page maximum

**The rule**: "If it takes more than a page to explain it, then it's too complex. This process shouldn't take more than one day."

### Step 2: Build the Interface
"Then begin building the interface — the interface will be the alternative to the functional spec."

The progression:
1. **Draw quick paper sketches**
2. **Start coding it into HTML**
3. **Create common ground everyone can see**

## Why Interfaces Beat Specs

"Unlike paragraphs of text that are open to alternate interpretations, interface designs are common ground that everyone can agree on."

Benefits:
- **Clarity**: "Confusion disappears when everyone starts using the same screens"
- **Tangibility**: "Build an interface everyone can start looking at, using, clicking through, and 'feeling'"
- **Customer focus**: "Get yourself in front of the customer experience as much as possible"
- **Flexibility**: "Keep change cheap and stay flexible"

## Supporting Perspectives

### Linus Torvalds on Specs

"A 'spec' is close to useless. I have never seen a spec that was both big enough to be useful and accurate."

His devastating critique: "And I have seen lots of total crap work that was based on specs. It's the single worst way to write software, because it by definition means that the software was written to match theory, not reality."

### Mark Gallagher on Blockers

"I found the people insisting on extensive requirements documents before starting any design were really 'blockers' just trying to slow the process down (and usually people with nothing to contribute on design or innovative thinking)."

His successful approach: "All our best work was done with a few concepts in our heads about improving a site, doing a quick prototype (static), changing the design a bit and then building a live prototype with real data. After kicking the tires on this prototype, we usually had a real project in motion and good result."

## The Real Process

What actually works:
1. **Few concepts** in your head
2. **Quick prototype** (static)
3. **Design iterations**
4. **Live prototype** with real data
5. **Kick the tires**
6. **Real project** in motion

## The Cost of Specs

Functional specs create:
- **False confidence**: Feeling of progress without reality
- **Locked-in thinking**: Rigid adherence to outdated ideas
- **Political documents**: Compromise instead of vision
- **Wasted time**: Months of meetings and revisions
- **Feature creep**: Every idea gets included
- **Reality gap**: Spec vs. actual needs

## When to Make Decisions

The Getting Real timeline:
- **Early**: Make few decisions, stay flexible
- **During building**: Learn and adapt
- **With real usage**: Make informed choices
- **Based on feedback**: Adjust to reality

Not the spec timeline:
- **Beginning**: Make all decisions
- **During building**: Stick to decisions
- **Ignore feedback**: Spec is law
- **Ship and pray**: Hope it works

## Red Flags

You're falling into spec trap when:
- Meetings about documents exceed building time
- Arguments center on document interpretation
- "But the spec says..." becomes common
- Change becomes politically difficult
- Building hasn't started after weeks
- Everyone's happy but nothing's real

## The Freedom of No Specs

Without specs you gain:
- **Agility**: Change based on learning
- **Speed**: Start building immediately
- **Reality**: Deal with actual not theoretical
- **Quality**: Focus on user not document
- **Efficiency**: No spec maintenance overhead

## Related Concepts

- Chapter 46: Interface First (interfaces over specifications)
- Chapter 60: Don't Do Dead Documents (avoiding paperwork)
- Chapter 31: From Idea to Implementation (quick iteration)
- Chapter 11: Lower Your Cost of Change (flexibility over rigidity)