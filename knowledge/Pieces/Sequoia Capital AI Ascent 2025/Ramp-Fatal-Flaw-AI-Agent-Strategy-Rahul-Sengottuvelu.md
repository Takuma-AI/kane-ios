# How Ramp Solved the Fatal Flaw in AI Agent Strategy - Rahul Sengottuvelu

**Source**: Sequoia Capital AI Ascent 2025  
**Speaker**: Rahul Sengottuvelu, Ramp  
**Date**: 2025-05-12  
**Duration**: 5:52  
**Context**: Short talk on AI agent implementation strategy for mature companies

---

## The Core Insight: Computer Use Your Own Frontend

Rahul Sengottuvelu from Ramp reveals a counterintuitive solution to the "fatal flaw" that causes most AI agents to fail: instead of building tools one-by-one to match your frontend features, use computer use to interact with your own frontend.

> **"Here's the core insight. So instead of you going through every single feature one by one, every single endpoint, and strapping on tools on your back end, you actually want a computer use yourself, on the front end."**

---

## The Universal Pattern of AI Agent Failure

### The Frustrating User Experience

Every mature software company falls into the same trap with their AI agents:

> **"It's like you ask this AI agent assistant, you're like, hey, book a flight for me, and it ends up booking it for you. And then you try to do anything else and it immediately fails resulting in a really frustrating experience."**

Examples of this pattern:
- Google Slides AI: "Sorry, I can't do that" for basic formatting
- Siri: "Sorry, I can't help with that" for common requests
- Flight booking agents that can book but can't change seats

> **"The pattern is people are building this feature and complete second class experiences that frustrates their users, and it seems like everyone fails in the same way."**

### Why This Happens: The Complexity Reality

The mental model vs. reality disconnect:

> **"Usually, there's a front end, there's a back end, and this is probably your mental model of what's going on behind the scenes. But actually, the bigger you are and the older you are, your app gets really complex and really wide, and so there's tons of API endpoints and features, and it gets really horizontal, and quite messy over time."**

---

## The Traditional Approach: A Doomed Strategy

### The Feature Parity Trap

When companies build AI agents the traditional way, they get stuck:

> **"You're actually stuck on this really long path to feature parity with your existing front end. So you're slowly building more and more tools that the LM can use in order to do stuff for users."**

The communication problem:

> **"Maybe you gave the LM a book of flight tool, but change my seat is, like, all the way down the future road map, it's very hard to communicate to your user that that's not supported and what exactly the feature set is."**

### The Resource Allocation Problem

The structural disadvantage built into traditional approaches:

> **"You have this, like, really stacked, like, Jack front end team and PMs and designers, UI UX people building this great front end experience for humans, and then you have this agent team strap onto the side and they're trying to catch up and build the same tools and every feature that comes out."**

> **"So you're already starting off, like, far behind, and you're also much slower or weaker than the people who are building your main product."**

---

## Ramp's Solution: Self Computer Use

### The Strategic Insight

Instead of rebuilding your entire feature set as tools, leverage what you already have:

> **"So before you let someone computer use you, you can either computer use yourself or you can build heuristics and scaffolding on top of your front end to make this really easy."**

### Practical Implementation at Ramp

Real example of how this works in practice:

> **"So if you ask the ramp assistant to change your card branding, it's actually really, like, niche feature that we have in our product, and we probably wouldn't get to adding that as a tool to our agent if we just built the traditional way. We actually end up building this, like, computer use agent that spins up a browser with that user's credentials in the background, pulls up, and then navigates the front end. The user doesn't see that, though. The user, of course, just sees that the agent did work for them."**

### The Benefits Compounding

Multiple advantages from this approach:

> **"And in this way, you're actually, like, end up supporting all your tools in one fell swoop as opposed to going one by one and, like, building a frustrating experience for users."**

---

## Why This Works: Leveraging Existing Infrastructure

### Authentication and Permissions

Solving the enterprise software complexity:

> **"There's authentication involved. You wanna give, the agent access to the same features and documents and tools that the user has access to. Typically, in enterprise software, there's, like, user roles and provisioning authentication that is also really frustrating and really hard to support."**

### Don't Reinvent the Wheel

Strategic resource utilization:

> **"If you end up building tools off your front end, you're actually leveraging all the work, not fighting against it, of all your front end, designers and PMs. So don't reinvent the wheel."**

---

## Making Computer Use Reliable

### The Reliability Challenge

Current state of computer use technology:

> **"Not only is, do you have feature complete agent, you also end up simplifying the task for computer usage. So maybe it'll work in a few years, maybe in a while, but if you do end up using it today, it's probably not gonna be reliable."**

### Building Your Own Scaffolding

How to make it work today:

> **"So if you build it yourself, you end up having your own tree. You can simplify with, DOM heuristics, and if you have a component library, you can render that into a CLI. You can scaffold the unreliable parts and focus on what's broken and not the other way where you start off with nothing."**

---

## Target Audience and Strategic Context

### Who This Strategy Serves

> **"So this talk is for people with distribution, so people are already winning, people that have users and mature software products that have been built over time."**

### The Broader Agent Economy

Looking toward the future:

> **"You probably wanna build a tool calling interface over all your features, not just some of them, and expose it to as many agents as possible. Because agents will be calling lots of tools, in their work, and the sooner you just you have those tools that are complete over your feature set, the better better off you might be."**

---

## Key Takeaways

1. **The Fatal Flaw**: Building AI agent tools one-by-one leads to incomplete, frustrating experiences
2. **The Solution**: Use computer use to interact with your own frontend instead of rebuilding everything
3. **The Advantage**: Instant feature parity, proper authentication, and leveraging existing design work
4. **The Implementation**: Build scaffolding and heuristics to make computer use reliable for your specific interface
5. **The Strategic Value**: Position yourself for the coming agent economy with complete tool coverage

This approach transforms the traditional "catch-up" mentality of AI agent development into a "leverage what exists" strategy, turning a company's existing frontend investment into an immediate competitive advantage in AI agent capabilities.