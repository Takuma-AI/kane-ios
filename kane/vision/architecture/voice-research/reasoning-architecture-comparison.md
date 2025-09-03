# Reasoning Architecture: Where Should Intelligence Live?

## The Core Question
Who should be the "brain" - the visual sketcher or the voice partner? And should they be separate at all?

## Architecture Option A: Sketcher as Secondary
```
Transcription → Light Pattern Matching → Quick Sketches
            ↘ Deep Understanding → Thoughtful Voice
```

**Problems with this approach:**
- Sketcher makes dumb mistakes (draws wrong cards)
- Voice has to correct visual mistakes
- Disconnected experience - hand doesn't know what mouth is doing

## Architecture Option B: Sketcher as Primary Brain
```
Transcription → DEEP REASONING → Intelligent Sketching
                              ↘ Voice just reads the plan
```

**This is actually better because:**
- Visual changes ARE the primary communication
- Voice becomes commentary on visual thinking
- One source of truth for understanding

## Architecture Option C: Unified Intelligence (Optimal)
```
                  ┌→ Visual Decisions
Transcription → UNIFIED BRAIN
                  └→ Voice Decisions

One reasoning engine, two output channels
```

## The Revelation: It's Actually One Brain

The "sketcher" and "partner" aren't separate entities. They're two hands of the same mind:

```python
class UnifiedKaneIntelligence:
    def __init__(self):
        self.understanding = ContinuousUnderstanding()
        self.confidence_threshold = 0.7
        
    async def process_stream(self, text_stream):
        # ONE brain processing everything
        async for text_chunk in text_stream:
            # Update understanding with new information
            self.understanding.integrate(text_chunk)
            
            # Make decisions about BOTH outputs
            decisions = self.reasoning_engine(self.understanding)
            
            # Execute decisions in parallel
            await asyncio.gather(
                self.maybe_update_visual(decisions.visual),
                self.maybe_speak(decisions.voice)
            )
    
    def reasoning_engine(self, understanding):
        """
        ONE brain making all decisions
        """
        decisions = {
            'visual': None,
            'voice': None
        }
        
        # Visual decisions (higher frequency, lower threshold)
        if understanding.has_pattern('task_mention'):
            decisions['visual'] = {
                'action': 'create_draft_card',
                'confidence': understanding.confidence,
                'data': understanding.extracted_task
            }
        
        if understanding.has_pattern('correction'):
            decisions['visual'] = {
                'action': 'modify_last_card',
                'confidence': 0.9,  # Corrections are usually clear
            }
        
        # Voice decisions (lower frequency, higher threshold)
        if understanding.needs_clarification and understanding.found_pause:
            decisions['voice'] = {
                'action': 'ask_question',
                'content': understanding.generate_question(),
                'timing': 'wait_for_pause'
            }
        
        if understanding.user_seems_stuck:
            decisions['voice'] = {
                'action': 'gentle_suggestion',
                'content': understanding.suggest_next(),
                'timing': 'immediate_soft'
            }
        
        return decisions
```

## The Key Insight: Confidence Gradients

Different actions require different confidence levels:

### Visual Updates (Low Threshold - 40-60% confidence)
- Creating draft cards
- Showing possibilities
- Visual thinking is exploratory
- Easy to undo/revise
- User expects iteration

### Voice Interjections (High Threshold - 70-90% confidence)
- Speaking interrupts flow
- Harder to take back
- Must add real value
- User expects thoughtfulness

## The Information Flow

```
Audio Stream
    ↓
Streaming Transcription
    ↓
┌─────────────────────────────────┐
│   UNIFIED UNDERSTANDING          │
│   - Accumulating context         │
│   - Building confidence          │
│   - Detecting patterns           │
│   - Tracking user state          │
└─────────────┬───────────────────┘
              ↓
    Decision Engine (every 100ms)
              ↓
       Parallel Outputs
         ├→ Visual Updates (frequent, exploratory)
         └→ Voice Responses (rare, confident)
```

## Why Unified is Better Than Separated

### Separated Problems:
1. **Duplicate reasoning** - Both need to understand context
2. **Synchronization issues** - "Why did you draw that?"
3. **Conflicting decisions** - Visual shows X while voice says Y
4. **Wasted computation** - Processing same data twice

### Unified Benefits:
1. **Single source of truth** - One understanding of user intent
2. **Coordinated actions** - Visual and voice complement each other
3. **Efficient processing** - Parse and understand once
4. **Learning accumulation** - One model improves over time

## The Practical Implementation

```python
# Not multiple brains, but one brain with multiple outputs
class KaneIntelligence:
    def __init__(self):
        # One understanding
        self.context = AccumulatingContext()
        self.patterns = PatternMatcher()
        self.confidence = ConfidenceTracker()
        
        # Different thresholds for different actions
        self.thresholds = {
            'create_draft': 0.4,
            'modify_draft': 0.5,
            'confirm_quest': 0.7,
            'voice_acknowledge': 0.6,
            'voice_question': 0.8,
            'voice_suggestion': 0.75
        }
    
    async def process_continuously(self, audio_stream):
        """
        One process, multiple decisions
        """
        async for chunk in audio_stream:
            # Single understanding pipeline
            text = await self.transcribe(chunk)
            self.context.add(text)
            patterns = self.patterns.detect(self.context)
            
            # Parallel decision execution
            await asyncio.gather(
                self.try_visual_action(patterns),
                self.try_voice_action(patterns)
            )
    
    async def try_visual_action(self, patterns):
        """Visual has lower threshold, higher frequency"""
        for pattern in patterns:
            if pattern.confidence > self.thresholds[pattern.visual_action]:
                await self.execute_visual(pattern.visual_action)
    
    async def try_voice_action(self, patterns):
        """Voice has higher threshold, lower frequency"""
        for pattern in patterns:
            if pattern.confidence > self.thresholds[pattern.voice_action]:
                if self.is_good_time_to_speak():
                    await self.execute_voice(pattern.voice_action)
```

## The Tradeoff Analysis

### Option 1: Dumb Sketcher + Smart Voice
- ❌ Disconnected experience
- ❌ Visual mistakes need verbal correction
- ❌ Feels like two different entities

### Option 2: Smart Sketcher + Dumb Voice
- ❌ Voice feels robotic
- ❌ Missed opportunities for clarification
- ✅ Visual intelligence is good

### Option 3: Two Smart Separated Systems
- ❌ Duplicate processing
- ❌ Synchronization complexity
- ❌ Conflicting decisions

### Option 4: Unified Intelligence (Recommended)
- ✅ Single source of truth
- ✅ Coordinated experience
- ✅ Efficient processing
- ✅ Feels like one thoughtful partner
- ❌ Slightly more complex initial setup

## The Mental Model That Works

Think of KANE as **one coworker** with:
- **Eyes and ears** (input processing)
- **A brain** (unified understanding)
- **Hands** (visual updates - frequent, exploratory)
- **A voice** (audio responses - thoughtful, selective)

The hands move quickly and experimentally.
The voice speaks carefully and purposefully.
But they're controlled by the same intelligence.

## Implementation Strategy

1. **Start with unified architecture** even if simpler at first
2. **Use confidence thresholds** to control action frequency
3. **Visual updates are cheap** - do them often
4. **Voice updates are expensive** - do them carefully
5. **Let them share understanding** - don't duplicate reasoning

This is why you need LiveKit - to orchestrate this unified intelligence with multiple parallel outputs.