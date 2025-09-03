# Real-Time Collaborative Architecture for KANE

## The Experience You Want: Coworker Whiteboarding

```
User: "So my main thing today is shipping the voice feature..."
        [AI starts drafting quest card on screen]

User: "...and I also need to handle the database stuff..."
        [AI adds another card while user keeps talking]

User: "...actually wait, the database can wait..."
        [AI grays out the database card]

User: "...the voice thing needs to work with LiveKit..."
        [AI updates the main quest card with details]

AI: "What about testing?" [WHILE user is still talking]
        [AI shows a suggested test card]

User: "Oh right, yeah testing too..."
        [AI confirms the test card]
```

## Why This REQUIRES LiveKit

### Direct Hume (Turn-Based Only)
```
User speaks → [SILENCE] → Hume responds → [SILENCE] → User speaks
```
- Can't draft while user talks
- Can't interject naturally
- Can't update UI until turn ends
- Feels robotic, not collaborative

### LiveKit + Hume (Real Collaboration)
```
User speaking ──┬─→ Streaming transcription
                ├─→ Real-time drafting on screen
                ├─→ Parallel processing
                └─→ Natural interjections
```

## The Architecture for Whiteboarding Behavior

```python
class WhiteboardingAgent:
    def __init__(self):
        self.drafting_state = {
            "current_cards": [],
            "pending_refinements": [],
            "confidence_levels": {}
        }
        self.interruption_threshold = 0.7
        
    async def process_streaming_speech(self, audio_stream):
        """
        This runs WHILE user is speaking, not after
        """
        partial_transcript = ""
        
        async for audio_chunk in audio_stream:
            # 1. Get partial transcription immediately
            new_text = await self.streaming_stt(audio_chunk)
            partial_transcript += new_text
            
            # 2. Extract intent AS THEY SPEAK
            intent = self.extract_streaming_intent(new_text)
            
            # 3. Update UI in real-time
            if intent.type == "new_quest":
                # Create draft card immediately
                card = await self.create_draft_card(intent.content)
                await self.ios.animate_card_appearance(card)
                
            elif intent.type == "correction":
                # User said "actually..." - start modifying
                await self.ios.highlight_last_card_for_edit()
                
            elif intent.type == "detail":
                # Adding detail to existing quest
                await self.ios.append_to_current_card(intent.content)
            
            # 4. Decide if AI should interject
            if self.should_interject(partial_transcript):
                await self.gentle_interjection()
    
    async def gentle_interjection(self):
        """
        AI can speak WHILE user is speaking (like a coworker would)
        """
        # Quick, non-interrupting phrases
        interjections = [
            "mmm-hmm",  # Acknowledgment
            "got it",    # Understanding
            "what about [missing piece]?",  # Gentle question
            "should I add [suggestion]?",   # Collaborative offer
        ]
        
        # Speak softly, don't take over
        await self.hume.speak_softly(
            random.choice(interjections),
            volume=0.7,  # Quieter than normal
            wait_for_gap=True  # Only speak in natural pauses
        )
    
    def should_interject(self, transcript):
        """
        Decide when it's natural to interject
        """
        # Detect natural pause points
        if transcript.endswith(("...", "um", "uh", "so")):
            return random.random() < 0.3  # 30% chance
            
        # Detect when they're struggling
        if "what was the other thing" in transcript.lower():
            return True  # Help them remember
            
        # Detect missing context
        if self.missing_success_criteria(transcript):
            return True  # Ask for clarity
            
        return False
```

## The Streaming Pipeline You Need

```
┌──────────────────────────────────────────────────┐
│ iOS Microphone                                   │
└─────────────┬────────────────────────────────────┘
              ↓ WebRTC (via LiveKit)
┌──────────────────────────────────────────────────┐
│ LiveKit Server (routes audio)                    │
└─────────────┬────────────────────────────────────┘
              ↓ Raw audio stream
┌──────────────────────────────────────────────────┐
│ Your Python Agent                                │
│                                                  │
│  ┌─────────────────────────────────────┐        │
│  │ Streaming STT (Deepgram/Assembly)   │        │
│  └─────────────┬───────────────────────┘        │
│                ↓ Partial transcripts             │
│  ┌─────────────────────────────────────┐        │
│  │ Intent Extraction (real-time)       │        │
│  └─────────────┬───────────────────────┘        │
│                ├─→ Update iOS UI                 │
│                ├─→ Draft quests                  │
│                └─→ Decide on interjection        │
│                                                  │
│  ┌─────────────────────────────────────┐        │
│  │ Hume EVI (for voice responses)      │        │
│  └─────────────────────────────────────┘        │
└──────────────────────────────────────────────────┘
```

## Critical Capabilities This Enables

### 1. Draft While They Speak
```python
# User: "I need to ship the voice feature..."
if "need to" in streaming_text:
    quest = extract_quest(streaming_text)
    await ios.show_draft(quest, confidence=0.6)
    # Card appears WHILE they're still talking
```

### 2. Natural Interjections
```python
# User: "...and then there's that other thing..."
if sounds_uncertain(streaming_text):
    await speak_softly("the database migration?")
    # AI helps without interrupting flow
```

### 3. Visual Thinking Partner
```python
# As user talks, the screen evolves
async def visual_whiteboard(text_stream):
    await parallel(
        show_main_quest_forming(),
        gray_out_deprioritized_items(),
        highlight_connections(),
        suggest_missing_pieces()
    )
```

### 4. Collaborative Refinement
```python
# User can SEE and CORRECT in real-time
User: "my main quest is X"
    [Card appears: "X"]
User: "actually make that Y"
    [Card morphs: "X" → "Y"]
User: "and it includes Z"
    [Card expands: "Y: including Z"]
```

## What Hume Direct CAN'T Do

- **No streaming transcription** - Must wait for complete utterance
- **No mid-speech drafting** - Can't update UI while user talks
- **No natural interjection** - Must wait for silence
- **No parallel processing** - Everything is sequential

## The Experience Difference

### Without LiveKit (Turn-Based)
```
User: [2 minute brain dump]
[Nothing happens on screen]
[Silence]
AI: "Okay, so you want to do X, Y, and Z?"
User: "Well, actually..."
```

### With LiveKit (Collaborative)
```
User: [starts brain dump]
[Cards start appearing as they speak]
[AI occasionally interjects with "mm-hmm" or questions]
[User sees their thoughts organizing in real-time]
[Can correct/refine while speaking]
[Feels like working with a thoughtful coworker]
```

## Implementation Timeline

### Day 1: Basic Streaming (Today)
- LiveKit setup
- Streaming transcription
- Basic draft-while-speaking

### Day 2: Interjection Logic
- Natural pause detection
- Gentle questioning patterns
- Volume/timing control

### Day 3: Visual Orchestration
- Card animations tied to speech
- Confidence visualization
- Connection mapping

### Day 4: Collaborative Refinement
- Real-time corrections
- Parallel understanding
- Pattern learning

## This is Why You Need LiveKit

The "coworker whiteboarding" experience is impossible without:
1. **Streaming transcription** (not waiting for turns)
2. **Parallel processing** (drafting while listening)
3. **Controlled interjection** (speaking at right moments)
4. **Real-time UI orchestration** (visual thinking partner)

All of this requires YOU to be in the middle of the data flow, which LiveKit provides.