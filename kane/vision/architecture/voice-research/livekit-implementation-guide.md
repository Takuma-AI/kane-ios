# LiveKit Implementation Guide - Full Control Over KANE

## What You Get With This Setup

### Complete Data Access
Every single piece of conversation data flows through YOUR code:
- Raw audio frames
- Partial transcripts as user speaks
- Emotional tone analysis
- Complete transcripts
- AI responses before they're spoken
- Tool calls before they execute
- UI state at every moment

### Real Examples of What You Can Do

#### 1. Update UI While User Is Speaking
```python
# As they say "my main quest is..."
async for partial in transcription_stream:
    if "main quest" in partial:
        # Immediately show draft card on iOS
        await ios.show_draft_card("main", confidence=0.6)
```

#### 2. Modify Context Based on Screen State
```python
# User looking at specific quest? Add context
if ios_state["current_screen"] == "quest_detail":
    context = f"User is looking at quest: {ios_state['selected_quest']}"
    # AI knows exactly what they're referring to
```

#### 3. Store Everything for Learning
```python
# Every conversation stored in YOUR database
await db.store({
    "raw_audio": audio_data,
    "transcript": text,
    "quest_operations": quests,
    "ui_interactions": taps_and_swipes,
    "emotional_journey": emotion_over_time
})

# Tomorrow: Use patterns to pre-draft
patterns = await db.analyze_user_patterns()
tomorrows_draft = generate_draft_from_patterns(patterns)
```

#### 4. Parallel Processing
```python
# While Hume generates voice response, you can:
await asyncio.gather(
    hume.generate_voice(response),  # Takes 400ms
    ios.update_quests(new_quests),  # Happens immediately
    db.store_turn(conversation),     # Background storage
    analytics.track_interaction()    # Your metrics
)
```

## Setup Time: 2-3 Hours Total

### Hour 1: Core Infrastructure
```bash
# 1. Install LiveKit server locally (15 min)
brew install livekit
livekit-server --dev

# 2. Set up Python environment (15 min)
cd /Users/kate/Projects/takuma-os/kane/server
chmod +x setup-livekit.sh
./setup-livekit.sh

# 3. Configure Postgres (30 min)
createdb kane_conversations
psql kane_conversations < schema.sql
```

### Hour 2: Agent Implementation
```python
# Adapt the template I created to your needs
# Key customization points:

1. Quest extraction logic (line 156)
   - Define YOUR rules for what becomes a quest
   
2. UI state management (line 298)
   - Control exactly when/how iOS UI updates
   
3. Conversation storage (line 234)
   - Structure YOUR database however you want
   
4. Response orchestration (line 112)
   - Decide when to coach vs acknowledge
```

### Hour 3: iOS Integration
```swift
// Update ConversationManager.swift
import LiveKit

class KaneConversationManager {
    let room = Room()
    
    func connect() async {
        let token = generateToken()  // Your auth
        try await room.connect(
            "ws://localhost:7880",  // Local LiveKit
            token: token
        )
        
        // Receive real-time updates
        room.delegate = self
    }
    
    func roomDidReceiveData(_ data: Data) {
        // Parse updates from your Python agent
        let update = try! JSONDecoder().decode(Update.self, from: data)
        
        switch update.type {
        case "partial_transcript":
            // Update UI immediately
        case "quest_created":
            // Add to Core Data
        case "emotion_changed":
            // Adjust UI mood
        }
    }
}
```

## Database Schema for Full Control

```sql
-- Complete conversation storage
CREATE TABLE conversations (
    id UUID PRIMARY KEY,
    user_id VARCHAR(255),
    timestamp TIMESTAMP,
    
    -- Raw data
    audio_url TEXT,  -- Store audio files
    transcript TEXT,
    ai_response TEXT,
    
    -- Structured data
    quests_created JSONB,
    quest_refinements JSONB,
    emotional_journey JSONB,
    
    -- Patterns for learning
    speaking_pace FLOAT,
    clarity_score FLOAT,
    correction_count INTEGER,
    main_quest_identified BOOLEAN,
    success_criteria_defined BOOLEAN
);

-- Quest evolution tracking
CREATE TABLE quest_history (
    id UUID PRIMARY KEY,
    quest_id VARCHAR(255),
    version INTEGER,
    title TEXT,
    changes_from_previous JSONB,
    trigger_phrase TEXT,  -- What user said to create/modify
    confidence FLOAT,
    timestamp TIMESTAMP
);

-- User patterns for prediction
CREATE TABLE user_patterns (
    user_id VARCHAR(255) PRIMARY KEY,
    common_main_quests JSONB,  -- {"ship features": 0.7, "fix bugs": 0.3}
    speaking_triggers JSONB,    -- {"actually": "correction", "main thing": "priority"}
    average_quests_per_day FLOAT,
    preferred_session_time TIME,
    needs_coaching_probability FLOAT
);
```

## Deployment Options

### Option A: Local Development (Today)
```bash
# Everything runs on your Mac
1. LiveKit server: localhost:7880
2. Python agent: localhost:8000
3. Postgres: localhost:5432
4. iOS app: Connects to localhost
```

### Option B: Cloud Deployment (Later)
```bash
# Deploy to Render/Railway/Fly.io
1. LiveKit Cloud: $49/month
2. Python agent: Render $7/month  
3. Postgres: Render $7/month
4. Total: ~$63/month + API costs
```

## The Payoff: What This Enables

### Week 1: Foundation
- ✅ Voice to quest pipeline with full data access
- ✅ All conversations stored in your database
- ✅ Real-time UI updates as user speaks

### Week 2: Learning
- Use stored patterns to pre-draft plans
- Detect when user needs coaching
- Personalized prompts based on history

### Week 3: Proactive
- Agent works on quests in background
- Checks in at optimal times
- Learns from success/failure patterns

### Month 2: Intelligence
- Predict what user will say
- Pre-populate quests before they speak
- Truly personalized AI assistant

## Decision Point

**Use LiveKit if you want:**
- Complete control over conversation flow ✅
- Store everything in your database ✅
- Real-time UI orchestration ✅
- Multi-stage processing ✅
- Learning from patterns ✅

**Skip LiveKit if you:**
- Just need basic voice → quest
- Don't care about storing conversations
- Want to ship in 1 hour instead of 3

Given your requirements ("directly process conversation data and manipulate it"), LiveKit is the right choice.

## Quick Start Commands

```bash
# Terminal 1: LiveKit Server
livekit-server --dev

# Terminal 2: KANE Agent  
cd /Users/kate/Projects/takuma-os/kane/server
source venv/bin/activate
python livekit-kane-agent.py

# Terminal 3: Test
curl http://localhost:8000/health

# Terminal 4: iOS App
# Update WebSocket URL to localhost:7880
# Run in simulator
```

You now have COMPLETE control over every aspect of the conversation.