# Voice Pipeline Testing Protocol

## Test 1: Hume AI Quick Evaluation (15 minutes)

### Setup
```bash
# Install Hume SDK
pip install hume

# Test script location
/Users/kate/Projects/takuma-os/kane/experiments/hume-test.py
```

### Test Script Structure
```python
# Core test points:
1. Initialize conversation
2. Send 2-minute monologue (test timeout handling)
3. Inject tool for quest creation
4. Access real-time transcript
5. Measure response latency
6. Test voice expressiveness
```

### Evaluation Checklist
- [ ] Can handle 2+ minute user monologue without timeout?
- [ ] Real-time transcript accessible during turn?
- [ ] Custom tool definitions work?
- [ ] Latency under 500ms?
- [ ] Voice quality better than 11Labs Turbo v2?
- [ ] Can interrupt mid-speech?

## Test 2: LiveKit Pipeline POC (30 minutes)

### Architecture Components
```yaml
Pipeline:
  Input:
    - LiveKit Room (WebRTC)
    - Deepgram STT (streaming)
  Processing:
    - Custom Python service
    - Claude for reasoning
    - Tool execution layer
  Output:
    - ElevenLabs/Cartesia TTS
    - LiveKit audio track
```

### Minimal Setup
```python
# Key components to test:
class KaneVoiceAgent:
    def __init__(self):
        self.stt = DeepgramSTT()
        self.llm = Claude()
        self.tts = ElevenLabs()
        self.context_manager = QuestContextManager()
    
    async def process_audio_stream(self, audio_frame):
        # 1. STT streaming
        text = await self.stt.transcribe(audio_frame)
        
        # 2. Context injection
        enriched_prompt = self.context_manager.inject_context(text)
        
        # 3. LLM reasoning
        response = await self.llm.process(enriched_prompt)
        
        # 4. Tool execution (CRUD)
        if response.has_tool_call:
            await self.execute_crud(response.tool)
        
        # 5. TTS generation
        audio = await self.tts.synthesize(response.text)
        
        return audio
```

### Complexity Assessment
- [ ] Can set up basic pipeline in 30 min?
- [ ] Each component latency acceptable?
- [ ] Total latency under 1 second?
- [ ] Context injection works smoothly?
- [ ] CRUD operations trigger correctly?

## Test 3: Quick iOS Integration Check (15 minutes)

### Current State Validation
```swift
// Verify existing components:
1. ConversationManager.swift - 11Labs integration
2. Core Data models for quests
3. Focus card UI components
4. Voice interface trigger
```

### Required Updates
```swift
// Data Model additions needed:
extension Quest {
    @NSManaged public var isDraft: Bool
    @NSManaged public var refinementNotes: String?
    @NSManaged public var lastModified: Date
}

// UI State management:
enum QuestState {
    case draft      // Wireframe appearance
    case refining   // Semi-transparent
    case confirmed  // Glowing/solid
}
```

## Decision Matrix

| Criteria | Hume AI | LiveKit Custom | Hybrid |
|----------|---------|---------------|---------|
| Setup Speed | 30 min | 2-3 hours | 1 hour |
| Flexibility | Medium | High | High |
| Latency | ~400ms | ~600ms | Varies |
| Long monologue support | ? | Yes | Yes |
| Context injection | Limited | Full | Full |
| Voice quality | Excellent | Good | Mixed |
| Cost per minute | $0.10 | $0.05 | $0.07 |

## Quick Implementation Path

### If Hume Works (High Probability)
```
1. Use Hume for voice pipeline
2. Build server wrapper for context management
3. Focus on prompt engineering
4. Ship today with draft → refined flow
```

### If LiveKit Needed (More Control)
```
1. Use Pipecat framework for faster setup
2. Start with basic STT → LLM → TTS
3. Add context injection layer
4. Iterate on latency optimization
```

## Conversational Prompt Skeleton

```markdown
# KANE - Daily Quest Architect

## Core Behavior
You help users shape their day through main quests and side quests.
You listen deeply, then help them find clarity on what actually matters.

## Conversation Flow

### Phase 1: Deep Listening
- Let them brain dump completely
- Don't interrupt with questions
- Track: projects mentioned, tasks, concerns, energy

### Phase 2: Clarity Coaching
- "What would make today successful?"
- "Which of these has the most energy?"
- Don't say "let's clarify" - just ask the right question

### Phase 3: Quest Drafting
- Create draft quests as they speak
- Main quest = primary success criterion
- Side quests = important but not focus

### Phase 4: Refinement
- Show draft visually (trigger UI update)
- "Does this capture it?"
- Iterate until it feels right

## Tool Usage
- create_quest(type: main/side, title, description, isDraft: true)
- update_quest(id, changes)
- confirm_quest(id) - changes isDraft to false
```

## Server Architecture Sketch

```javascript
// Minimal Node.js + Socket.io server
class KaneServer {
  constructor() {
    this.io = new Server(3000);
    this.voiceHandler = new VoiceHandler(); // Hume or LiveKit
    this.contextCache = new Map(); // User → context
  }

  handleConnection(socket) {
    socket.on('voice-start', async (userId) => {
      const context = await this.loadUserContext(userId);
      this.contextCache.set(userId, context);
      
      const session = await this.voiceHandler.createSession({
        onTranscript: (text) => this.handleTranscript(userId, text),
        onToolCall: (tool) => this.executeTool(userId, tool),
        context: context
      });
    });
  }

  async executeTool(userId, tool) {
    // Send CRUD operation to iOS app
    this.io.to(userId).emit('quest-operation', tool);
    
    // Update context cache
    this.contextCache.get(userId).quests = tool.result;
  }
}
```

## Today's Critical Path

### Hour 1: Voice Pipeline Decision
1. Test Hume AI with 2-minute monologue
2. Check tool flexibility
3. If blocked → LiveKit POC
4. **DECIDE** by 11am

### Hour 2-3: Server Setup
1. Choose framework based on Hour 1
2. Set up minimal voice → CRUD pipeline
3. Test with iOS app connection

### Hour 4-5: iOS Polish
1. Add draft states to Core Data
2. Update quest cards UI
3. Wire up visual transitions

### Hour 6: Full Integration Test
1. Voice brain dump
2. See drafts appear
3. Refine through conversation
4. Confirm and see visual change

## Success Criteria
✅ Can speak for 2+ minutes about my day
✅ See draft quests appear on screen as I talk
✅ Can refine them through conversation
✅ Visual distinction between draft and confirmed
✅ Feels magical, not mechanical