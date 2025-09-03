# KANE Voice Implementation - Next Steps

## What We've Prepared

✅ **Research Documents Created:**
- `/kane/vision/seed/voice-architecture-research.md` - Complete architecture options
- `/kane/vision/seed/voice-pipeline-testing.md` - Detailed testing protocol
- `/kane/experiments/test-hume-quick.py` - Hume AI evaluation script
- `/kane/experiments/test-livekit-quick.py` - LiveKit comparison script

## Current State

**iOS App (Swift/SwiftUI):**
- ✅ ConversationManager using ElevenLabs SDK
- ✅ Core Data setup for data persistence
- ✅ Focus cards UI ready
- ⚠️ Missing: Draft states in data model
- ⚠️ Missing: Visual transitions for draft → refined

**Voice Pipeline:**
- Currently using ElevenLabs conversational API
- Issues: Robotic voice, timeouts on long input, limited tool customization

## Immediate Next Steps (Next 2 Hours)

### Step 1: Run Pipeline Tests (30 min)
```bash
# 1. Get Hume API key
export HUME_API_KEY='your-key'

# 2. Run Hume test
cd /Users/kate/Projects/takuma-os/kane/experiments
python3 test-hume-quick.py

# 3. Review LiveKit comparison
python3 test-livekit-quick.py
```

### Step 2: Make Architecture Decision (15 min)

**If Hume passes tests → Quick Path:**
1. Use Hume for voice pipeline
2. Build lightweight Node.js wrapper
3. Focus on prompt engineering

**If Hume fails → LiveKit Path:**
1. Set up Pipecat framework
2. Use Deepgram + Claude + ElevenLabs
3. More setup time but full control

### Step 3: Set Up Server (45 min)

**Option A: Hume Server (Simpler)**
```javascript
// /kane/server/index.js
import { HumeVoiceClient } from 'hume';
import { Server } from 'socket.io';

class KaneServer {
  constructor() {
    this.io = new Server(3000);
    this.setupHume();
  }
  
  async setupHume() {
    this.hume = new HumeVoiceClient({
      apiKey: process.env.HUME_API_KEY,
      tools: this.questTools(),
      systemPrompt: this.kanePrompt()
    });
  }
  
  questTools() {
    return [{
      name: 'create_quest',
      handler: async (params) => {
        // Send to iOS via WebSocket
        this.io.emit('quest-update', params);
      }
    }];
  }
}
```

**Option B: LiveKit Server (More Control)**
```python
# /kane/server/pipeline.py
from pipecat import Pipeline
from deepgram import DeepgramSTT
from anthropic import Claude
from elevenlabs import ElevenLabsTTS

class KanePipeline:
    def __init__(self):
        self.pipeline = Pipeline([
            DeepgramSTT(),
            self.context_injector,
            Claude(model="claude-3.5-sonnet"),
            self.tool_executor,
            ElevenLabsTTS()
        ])
```

### Step 4: iOS Updates (30 min)

```swift
// 1. Update Core Data model
// Add to Quest entity:
// - isDraft: Boolean
// - refinementNotes: String
// - visualState: String (draft/refining/confirmed)

// 2. Update ConversationManager
// Replace ElevenLabs with WebSocket connection to server

// 3. Add visual states to quest cards
// Draft: Wireframe appearance
// Refining: Semi-transparent
// Confirmed: Solid/glowing
```

## The Conversational Prompt (Critical)

```markdown
# KANE - Mise en Place for Your Mind

You help users shape their day through main quests and side quests.
Not a task manager - a thought partner who helps find clarity.

## Core Behavior

1. **Listen Deeply**: Let them brain dump. Don't interrupt.
2. **Find the Epicenter**: What has the most energy? What would make today successful?
3. **Draft Visually**: Create quests as they speak (isDraft: true)
4. **Refine Together**: "Does this capture it?" Iterate until it feels right
5. **Confirm with Clarity**: Transform draft to confirmed when aligned

## What NOT to do
- Don't say "let's clarify" - just ask the right question
- Don't request every detail - just enough for success criteria
- Don't interrupt flow - let them get it all out first

## Tool Usage Pattern
1. create_quest() as they speak
2. update_quest() as they refine
3. confirm_quest() when it feels right
```

## Success Metrics for Today

### Must Ship
- [ ] Voice input works for 2+ minute monologues
- [ ] Draft quests appear on screen as user speaks
- [ ] Can refine through conversation
- [ ] Visual distinction: draft vs confirmed

### Would Be Nice
- [ ] Sub-second response latency
- [ ] Expressive voice (better than 11Labs Turbo v2)
- [ ] Smooth transitions between states

## Timeline

**Morning (2 hours)**
- Hour 1: Test pipelines, make decision
- Hour 2: Set up chosen pipeline + server

**Afternoon (3 hours)**
- Hour 3: iOS data model + WebSocket integration
- Hour 4: Conversational prompt refinement
- Hour 5: Full integration testing

**Evening (1 hour)**
- Polish visual transitions
- Test with real brain dump scenarios
- Document what works

## The Epicenter

Remember: The core magic is turning messy thoughts into clear priorities through conversation. Everything else is implementation detail.

If the user can:
1. Brain dump for 2 minutes
2. See draft quests appear
3. Say "actually that's not quite right"
4. See the quest update
5. Feel clarity emerge

...then you've succeeded.

## Quick Start Commands

```bash
# Terminal 1: Start server
cd /Users/kate/Projects/takuma-os/kane/server
npm init -y
npm install socket.io hume  # or your chosen stack
node index.js

# Terminal 2: iOS app
cd /Users/kate/Projects/takuma-os/kane/codebase
open kane.xcodeproj
# Update ConversationManager to connect to localhost:3000
# Run on simulator

# Terminal 3: Monitor
tail -f /tmp/kane-voice.log
```

Ship something magical by end of day. The rest can wait.