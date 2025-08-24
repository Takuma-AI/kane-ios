# Ambient Agents and the New Agent Inbox ft. Harrison Chase

**Speaker**: Harrison Chase, Co-founder and CEO of LangChain  
**Event**: Sequoia AI Ascent 2025  
**Date**: May 7, 2025  
**Duration**: 8:04  
**Transcription Date**: August 23, 2025  
**URL**: https://youtube.com/watch?v=egSh4TxS5go

---

## Executive Summary

Harrison Chase introduces the concept of "ambient agents" - AI agents that listen to event streams and act autonomously in the background, contrasting with traditional chat-based agents. He outlines the technical infrastructure, human-in-the-loop patterns, and introduces the "agent inbox" as a new UX paradigm for managing ambient agents.

## Defining Ambient Agents

### Core Definition and Characteristics

**What is an Ambient Agent?**
> "The way that I like to define an ambient agent is ambient agents listen to an event stream and act on it accordingly, potentially acting on multiple events at a time."

**Key Differentiators from Chat Agents**:

**1. Trigger Mechanisms**
> "What are the trigger? So it's no longer a human coming in and sending a message. It's an event that happens in in in the background."

**2. Scale and Concurrency**
> "With chat, you can usually only interact with one agent at a time. Maybe you open a few windows and you have a few running at the same time, but it's generally one. With ambient style agents because it's listening to these events... it can be a far bigger type of number... there can be thousands of them running in the background."

**3. Latency Requirements**
> "With chat, you message, you expect some response back pretty quickly or you get bored and you go to another website or something like that. Because these ambient agents run in the background, they're triggered by events. They can run for a lot longer period of time before you need a response in any shape or form. So there's generally much less strict latency requirements."

**4. User Experience Paradigm**
> "For these chat agents, it's mostly chat bots. That's a pretty familiar interface by now. I think there's a little bit of a question of how do you interact with these agents that are in the background because they they they are running without you knowing that they're running."

### Practical Example

**Email Agent Use Case**
> "An example of an ambient agent could be an email agent that listens to emails coming in and acts on them accordingly and maybe tries to respond or maybe tries to schedule meetings or maybe pings you or pings other people on the team."

## The Value Proposition of Ambient Agents

### 1. Massive Scale Multiplier

**Personal Impact Amplification**
> "First, they let us scale ourselves. So, if you interact with a chat agent, it's generally one-to-one. You're doing one thing at a time. When you have these ambient agents, there can be thousands of them running in the background. And so that just lets us scale our impact a lot more."

### 2. Complex Operation Capability

**Beyond Simple Chat Interactions**
> "They can get at kind of like more complex operations. So when you're interacting with a chat agent, it's generally because of the latency requirements, it's generally a simpler operation that it's doing... Maybe it calls a tool, maybe two tools. The longer more tools it calls, the longer it takes to run."

**Ambient Agent Advantages**
> "You can't do that with ambient agents because you don't have this as strict latency requirement. You can call a ton of tools and do more and more complex operations. You can add in other steps as well. So you can add in explicit planning or reflection steps and generally build up the complexity of the agents that you're building."

## Human-in-the-Loop Design Philosophy

### Core Principle: Not Fully Autonomous

**Essential Human Interaction**
> "One thing that I really want to highlight is ambient does not mean fully autonomous. So I still think it's really important that we are able to interact with these ambient agents."

### Four Human Interaction Patterns

**1. Approval/Rejection Workflow**
> "One is approving or rejecting certain actions that these agents want to do. If you want to have an ambient agent that's potentially giving refunds to customers who are emailing in, definitely when it starts, you're going to want to have a human in there approving some of those things."

**2. Action Editing**
> "Second is a more uh advanced option of this editing the actions that they do. So maybe they suggest something you don't want to approve or reject it, but you want to explicitly edit it and have it do that."

**3. Question Answering (Collaborative Problem-Solving)**
> "Third, these agents can get stuck kind of like halfway down and so there should be an ability for you to answer questions that they might have, uh, just like you would answer questions of a co-worker if they're working on a deep problem or something like that."

**4. Time Travel (Historical State Interaction)**
> "Fourth, because these agents take a lot of steps, it might be very useful for you to go back to the 10th out of a hundred steps or something like that, interact with it there, modify what it's doing, give it some feedback. And so this is what we call time travel."

### Why Human-in-the-Loop Matters

**1. Better Results**
> "First, it just gives better results. So, if you think about deep research, which isn't exactly an ambient agent, but it is a long-running agent, there's a period of time up front where it asks you some clarifying questions to go back and forth, and that generally helps produce way better results than if it just went off whatever your initial kind of like question or statement was."

**2. Trust Building**
> "It also helps build more trust. Um, so if you're doing explicit actions like giving giving or sending payments or approving things, having the human loop just builds more trust."

**3. Memory and Learning**
> "Third, and this is maybe the most subtle one, is I think it it helps a lot with the memory of the agent. So when I'm talking about memory, I'm talking about learning from user interactions. If you don't have the user interacting with the agent, then there are no user interactions to learn from... having this human in the loop helps inform a lot of the memory things that you want to be building into the agent so that it can do better in the future."

## The Agent Inbox: New UX Paradigm

### Conceptual Framework

**Interface Design**
> "This is one thing that we've kind of built as a prototype at Langchain, which is the concept, we call it an agent inbox. It's an inbox for your agent to send things to. You can see when it requires actions. You can see some descriptions. If you click into a row, you can then see a more detailed description of of of what's going on, what explicitly it wants approval for or or whether you want to respond to it."

### Technical Infrastructure Requirements

**1. LangGraph: Persistence-First Architecture**
> "We've paid a lot of attention uh in Langraph, which is our agent orchestration framework to make it good at ambient agents. In particular, we've paid a ton of attention to the persistence layer that backs it."

**State Management Capabilities**
> "This enables a lot of these human interaction patterns because basically you can run your langraph agent. You can stop at any point in time. The entire state as well as previous states are persisted. And so then you can have the all the human and loop interaction patterns."

**Temporal Flexibility**
> "You can wait for a second, a day, an hour, however long, have the user come in, see the state, modify it, go back to previous states, things like that."

**2. LangGraph Platform: Infrastructure Scaling**
> "We're spending a lot of time right now on Lingraph platform as infrastructure for running these agents. These agents are often way more long-running. They're often bursty because they're triggered by events. So, you could get thousands of events at a time. So, you need to be able to scale up."

**Failure Resilience**
> "They're flaky in nature, not just because of typical software things, but also because of this human in the loop pattern. You want to be able to correct mistakes."

**3. LangSmith: Observability and Debugging**
> "Finally, we're we're building Langsmith as well for these agents. They're really long running. They can often mess up. They're doing more complex things. Having visibility and observability into what they're doing is really really important."

## Real-World Implementation Example

### Harrison's Personal Email Agent

**Practical Deployment**
> "As a concrete example of this, uh, one of the things that I built on the side is an email agent. So, if you've emailed me in the past, uh, year or so, uh, it's it's drafted a response or sent a calendar invite. It's still human in the loop. I use the agent inbox all the time. It's open source and on GitHub."

## Technical Architecture Implications

### Infrastructure Requirements for Ambient Agents

**Persistence Layer**: Critical for state management and time travel functionality
**Event Stream Processing**: Must handle burst traffic and thousands of concurrent events
**Human Interaction Queues**: Agent inbox paradigm requires specialized UI/UX infrastructure
**Observability Stack**: Long-running, complex operations demand comprehensive monitoring

### Scaling Characteristics

**Concurrency**: Thousands of agents can run simultaneously
**Duration**: Agents can run for extended periods (hours, days) without user interaction
**Complexity**: Multi-step operations with planning and reflection capabilities
**Resilience**: Built-in failure recovery and human correction capabilities

## Strategic Implications

### For Developers
- Traditional chat agent frameworks insufficient for ambient agent requirements
- Persistence-first architecture becomes foundational requirement
- Human-in-the-loop patterns require specialized tooling and UX design

### For Organizations
- Ambient agents enable massive personal productivity scaling
- Trust and control mechanisms essential for enterprise adoption
- Observability becomes critical for managing complex, long-running operations

### For AI Industry
- New UX paradigm beyond chat interfaces emerging
- Event-driven AI architecture becomes mainstream
- Human-AI collaboration patterns becoming more sophisticated

## Key Terminology and Concepts

- **Ambient Agents**: AI agents triggered by event streams, operating in background
- **Agent Inbox**: Centralized interface for managing human-agent interactions
- **Time Travel**: Ability to interact with agents at any point in their execution history
- **Persistence Layer**: Infrastructure enabling state management across extended time periods
- **Event Stream Processing**: Handling multiple concurrent background events triggering agent actions
- **Human-in-the-Loop Patterns**: Structured approaches for human oversight and correction of agent behavior

## Future Vision

Harrison's presentation suggests a fundamental shift from synchronous, chat-based AI interaction to asynchronous, event-driven ambient intelligence. The agent inbox represents a new category of user interface specifically designed for managing multiple concurrent AI agents working autonomously on complex, long-running tasks while maintaining human oversight and control.

---

*This knowledge piece captures the emergence of ambient agents as a distinct paradigm shift in AI agent architecture, moving beyond traditional chatbot interfaces to persistent, event-driven systems that can scale human capability while maintaining necessary human oversight.*