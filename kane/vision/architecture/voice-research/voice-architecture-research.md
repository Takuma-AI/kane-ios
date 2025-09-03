# KANE Voice Architecture Research Plan

## Core Requirements
- **Voice-first**: No text input initially
- **Real-time streaming**: Minimal latency
- **Context manipulation**: Ability to intercept and modify both user and agent speech
- **Visual feedback**: Draft states that transform to refined UI
- **Tool flexibility**: Custom CRUD operations for quest management

## Research Phase 1: Pipeline Architecture (1 Hour)

### Option A: Hume AI Evaluation
```
Research Focus:
├── Conversational API capabilities
├── Custom tool integration
├── Real-time transcript access
├── Latency benchmarks
└── Voice quality (expressiveness)

Key Questions:
- Can we access streaming transcripts mid-turn?
- How customizable are tool definitions?
- What's the actual latency in practice?
- Can we handle long user monologues without timeout?
```

### Option B: LiveKit Custom Pipeline
```
Architecture Components:
├── LiveKit for WebRTC orchestration
├── Deepgram/AssemblyAI for STT
├── Claude/GPT-4 for reasoning
├── ElevenLabs/Cartesia for TTS
└── Custom middleware for CRUD operations

Evaluation Criteria:
- Setup complexity vs flexibility
- Latency at each stage
- Cost per minute of conversation
- Ability to inject context mid-stream
```

### Option C: Hybrid Approach
```
Start with Hume/11Labs for MVP
Build custom pipeline in parallel
Swap when custom exceeds quality threshold
```

## Research Phase 2: Server Architecture (30 min)

### Core Server Requirements
```
Server Functions:
├── Voice stream processing
├── Context management (quest states)
├── Real-time CRUD to iOS Core Data
├── Conversation state caching
└── Background reasoning (future)

Technology Stack Options:
- Node.js + Socket.io (real-time)
- Python + FastAPI + WebSockets
- Go + WebRTC (performance)
```

### Context Management Design
```
Runtime Cache:
├── Current conversation context
├── Active quest drafts
├── User's daily priorities
└── Recent CRUD operations

Persistence Layer:
├── Quest/milestone relationships
├── Historical conversations
├── Success patterns
└── User preferences
```

## Implementation Phases

### Today: MVP Voice → Quest Pipeline
1. **Hour 1**: Research voice architectures
2. **Hour 2**: Set up chosen pipeline (likely Hume to start)
3. **Hour 3**: iOS data model updates for draft states
4. **Hour 4**: Conversational prompt engineering
5. **Hour 5**: Integration testing
6. **Hour 6**: Full flow: voice → draft → refine → confirm

### This Week: Context Persistence
- Tuesday: Quest lifecycle management
- Wednesday: Milestone relationship mapping
- Thursday: Context accumulation system
- Friday: Tomorrow's plan generation from context

### Next Week: Proactive Assistance
- Agent work planning
- Background task execution
- Proactive check-ins
- Integration points (MCP servers)

## Critical Decision Points

### 1. Voice Pipeline Choice
**Decide by**: End of first hour
**Criteria**: 
- Can we access real-time transcripts?
- Can we inject context mid-conversation?
- Is latency acceptable (<500ms)?
- Can we handle 5+ minute monologues?

### 2. Server Language/Framework
**Decide by**: Hour 2
**Criteria**:
- WebSocket/WebRTC support
- Fast prototyping capability
- iOS integration simplicity
- Future scalability

### 3. Data Model Architecture
**Decide by**: Hour 3
**Criteria**:
- Quest draft → refined states
- Relationship mapping (quest ↔ milestone)
- Temporal tracking (today/future)
- Sync strategy (server ↔ iOS)

## Success Metrics for Today

### Must Have
- [ ] Voice input → quest creation working
- [ ] Draft state visible on screen
- [ ] Refinement through conversation
- [ ] Main vs side quest distinction

### Nice to Have
- [ ] Better voice model than 11Labs
- [ ] Sub-second response latency
- [ ] Context persistence between sessions
- [ ] Visual polish on state transitions

## Research Resources

### Voice Pipeline Options
- [Hume AI Docs](https://docs.hume.ai/)
- [LiveKit Agents](https://docs.livekit.io/agents/)
- [Pipecat Framework](https://github.com/pipecat-ai/pipecat)
- [Daily + OpenAI Realtime](https://www.daily.co/blog/openai-realtime-api/)

### Prompt Engineering References
- Coaching vs directing patterns
- Clarity extraction techniques
- Long-form listening strategies
- Draft → refined state management

## Next Steps
1. Start with Hume AI API testing (15 min)
2. Parallel LiveKit setup exploration (15 min)
3. Compare latency and flexibility (15 min)
4. Make architecture decision (15 min)
5. Begin implementation of chosen path