# Strand Implementation Plans

## 1. Background Agents for Task Progress

### Conceptual Architecture
The system needs to run agents that make progress on tasks without blocking the main conversation. These agents operate like workers that take a task, do what they can, then report back.

### What Needs to Happen
- **Agent Orchestration Layer**: A separate service that manages background agents, similar to a job queue but for AI work
- **Task Assignment**: When a task is created with `isBlocker = true`, it gets assigned to a background agent pool
- **Progress Tracking**: Each agent updates the `aiProgress` field on the Task entity as it works
- **Agent Capabilities**: Start with simple agents (research, draft emails, find information) before complex ones (book appointments, make purchases)

### Implementation Approach
The conversation agent creates tasks and marks them for background processing. A separate agent coordinator picks these up and assigns them to specialized agents based on task type. These agents run on a timer (every few minutes), check for work, make progress, and update the task's `aiProgress` field. The UI automatically reflects these updates through CoreData observation.

### Technical Reality
Background agents need their own ElevenLabs agent configurations with specific tools for their domains (research agent has web search tools, scheduling agent has calendar tools). They communicate progress back through a shared data layer, likely through server-side webhooks that update the iOS app's CoreData via push notifications.

## 2. Proactive Notification System

### Conceptual Architecture
The agent needs to surface insights and suggestions without user initiation. These appear as contextual cards that invite engagement rather than demand attention.

### What Needs to Happen
- **Context Analysis Service**: Continuously evaluates the user's current state (what's incomplete, what's upcoming, what patterns exist)
- **Insight Generation**: The agent creates prompts for itself based on patterns ("You haven't reflected on yesterday's progress")
- **Card Creation**: These insights become SwiftUI cards that appear on the home screen
- **Conversation Grounding**: Tapping a card starts a conversation with that specific context injected

### Implementation Approach
A background process (timer-based initially, then server-pushed) analyzes the current Focus and Task entities. When patterns are detected (incomplete focus from yesterday, recurring blocker, time for reflection), it creates a "ProactiveCard" entity with a title, prompt, and conversation starter. These cards appear above the focus cards in the UI. When tapped, they inject their prompt into the conversation as initial context.

### Technical Reality
The agent needs a separate "analysis mode" where it periodically reviews all data and generates insights. This happens server-side (to avoid draining battery) and pushes cards to the device. Each card contains the full context needed to start a grounded conversation, stored as a conversation template that gets injected when activated.

## 3. End-of-Day Reflection Flow

### Conceptual Architecture
A structured conversation that helps users process what actually happened versus what they intended, updating the system's understanding of their patterns.

### What Needs to Happen
- **Reflection Trigger**: At a set time (or when user initiates), start reflection mode
- **Guided Conversation**: The agent asks about each focus area, what got done, what didn't, why
- **Progress Capture**: Updates Focus entities with actual outcomes, archives completed items
- **Pattern Recognition**: Identifies recurring themes (always blocked by meetings, consistently underestimate certain tasks)
- **Tomorrow Seeding**: Based on reflection, proposes tomorrow's focus areas

### Implementation Approach
The reflection is a special conversation mode with a structured flow. The agent has access to today's Focus and Task entities and guides the user through each one. As the user recounts their day, the agent updates completion states, adds reflection notes, and identifies patterns. This creates a "DayRecord" entity that captures the full picture. Tomorrow's Focus entities are pre-seeded based on patterns and incomplete items.

### Technical Reality
This needs a different agent configuration or conversation mode that follows a script while remaining conversational. The agent needs tools to update multiple entities in sequence, archive completed items, and create new Focus entities for tomorrow. The conversation transcript itself becomes valuable data for pattern matching over time.

## 4. Task Persistence Model

### Conceptual Architecture
Tasks need to exist across time without fixed deadlines, flowing naturally as the user's priorities shift.

### What Needs to Happen
- **Temporal Flexibility**: Tasks don't have hard deadlines but "relevance decay" - they become less prominent over time unless refreshed
- **Context Preservation**: Each task maintains its creation context and all attempts to complete it
- **Intelligent Surfacing**: The agent decides which tasks to surface based on current context, not just age
- **Natural Pruning**: Tasks that lose relevance get archived automatically through conversation

### Implementation Approach
Tasks gain a "relevance score" that decreases over time but increases when mentioned in conversation or when related focuses are active. The agent uses this score to decide what to surface. During conversations, if a task hasn't been mentioned in weeks and seems irrelevant, the agent might ask "Is fixing the printer still important?" and archive based on response.

### Technical Reality
Add fields to Task entity: `relevanceScore`, `lastMentioned`, `attemptCount`. Create a background process that adjusts relevance scores daily. The conversation agent has tools to boost relevance when tasks are discussed. The fetch requests for displaying tasks filter by relevance threshold rather than date.

## 5. Money Integration

### Conceptual Architecture
Money becomes another resource the user allocates toward their focuses, with transactions automatically categorized based on current priorities.

### What Needs to Happen
- **Transaction Import**: Pull transactions from Plaid or bank APIs
- **Contextual Categorization**: Instead of traditional categories, map spending to current Focus areas
- **Resource Awareness**: The agent understands money as finite resource like time
- **Integrated Reflection**: "You spent $200 on tools for the demo project" during end-of-day review
- **Priority Alignment**: Spending patterns reveal true priorities vs stated ones

### Implementation Approach
Add a Transaction entity linked to Focus entities. When transactions import, the agent analyzes them in context of current focuses and asks for categorization only when unclear. During focus creation, the agent can ask "What resources will this require?" including time and money. The daily reflection includes financial reflection: "Your spending aligned with your stated priority of shipping the demo."

### Technical Reality
Integrate Plaid SDK for transaction import. Create Transaction entity with relationship to Focus. The conversation agent needs tools to query transactions, categorize them, and surface spending insights. The UI shows money flow as part of each Focus card (time invested, money invested, progress made).

## 6. Key Insight: The Agent as Living System

The crucial understanding across all these features: The agent isn't executing commands but maintaining a living mental model of the user's life. Every conversation updates this model. Every background process enriches it. Every reflection refines it.

This is why traditional task apps fail - they're static databases. This agent is a dynamic partner that understands context, patterns, and evolution. The technical architecture must support this living quality through continuous learning, pattern matching, and proactive engagement.

## Implementation Priority

1. **First**: Verify basic voice-to-data flow works
2. **Second**: Task persistence model (foundation for everything else)
3. **Third**: End-of-day reflection (establishes the rhythm)
4. **Fourth**: Proactive notifications (builds on patterns from reflection)
5. **Fifth**: Background agents (requires server infrastructure)
6. **Sixth**: Money integration (builds on established patterns)

Each layer enriches the agent's understanding, creating compounding value over time.