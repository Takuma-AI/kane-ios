# Natural Dialogue Architecture for KANE

## The Real Mental Model: Thoughtful Partner

Not "visual primary, voice secondary" but rather:
**A thoughtful partner who speaks naturally and visualizes when helpful**

## Context-Driven Responses

### When User is Clear and Flowing
```
User: "My main quest today is shipping the voice pipeline"
Visual: [Quest card appears]
Voice: [Stays quiet - no need to interrupt flow]

User: "It needs LiveKit integration and Hume's voice"
Visual: [Details appear on card]
Voice: [Still quiet - user has momentum]
```

### When User is Uncertain
```
User: "I need to work on... hmm... there's that thing..."
Voice: "The voice pipeline you mentioned yesterday?"
Visual: [Shows yesterday's context as reminder]

User: "Yeah but I don't know where to start"
Voice: "What would make you feel most accomplished by end of day?"
Visual: [Shows potential quest options based on history]
```

### When User is Exploring
```
User: "Should I focus on the backend or the iOS part?"
Voice: "Which one is blocking the other?"
Visual: [Shows both as potential quests, highlighting dependencies]

User: "Oh right, backend needs to work first"
Visual: [Backend quest becomes solid, iOS quest grays out]
Voice: "So backend is your main quest?"
```

## The Unified Intelligence Pattern

```python
class NaturalDialogueAgent:
    def __init__(self):
        self.understanding = ContinuousUnderstanding()
        self.conversation_style = self.detect_style()
        
    async def respond_naturally(self, text_stream):
        # Build understanding
        self.understanding.update(text_stream)
        
        # Detect what kind of response fits the moment
        response_type = self.what_would_be_helpful()
        
        if response_type == "uncertain_exploration":
            # User needs help thinking
            await parallel(
                self.ask_clarifying_question(),
                self.show_visual_options()
            )
            
        elif response_type == "clear_declaration":
            # User knows what they want
            await self.visualize_understanding()
            # Voice stays quiet unless confirmation needed
            
        elif response_type == "stuck_frustrated":
            # User needs encouragement
            await parallel(
                self.offer_gentle_suggestion(),
                self.show_simplified_options()
            )
            
        elif response_type == "correction":
            # User is refining
            await parallel(
                self.acknowledge_verbally("Got it, changing that..."),
                self.update_visual_immediately()
            )
    
    def what_would_be_helpful(self):
        """
        Decide based on user's state, not rigid rules
        """
        indicators = {
            "uncertainty": ["hmm", "uh", "I don't know", "maybe", "..."],
            "clarity": ["I need to", "main quest is", "definitely"],
            "frustration": ["ugh", "I can't", "too much", "overwhelming"],
            "correction": ["actually", "wait no", "change that", "not that"]
        }
        
        # Read the emotional and cognitive state
        return self.match_user_state(indicators)
```

## Natural Conversation Patterns

### Pattern 1: Collaborative Thinking
```
User: "There's so much to do today"
Voice: "Let's find your main focus. What can't wait?"
User: "The voice feature needs to work"
Visual: [Quest appears: Voice Feature]
Voice: "What specifically about the voice feature?"
User: "The real-time streaming part"
Visual: [Quest refines: Real-time Voice Streaming]
```

### Pattern 2: Supportive Clarification
```
User: "I guess I should work on testing"
Voice: "You sound unsure. Is testing what would move you forward most?"
User: "Actually no, I need the feature working first"
Visual: [Testing quest fades, Feature quest appears]
Voice: "That makes sense. Testing can be a side quest for later"
```

### Pattern 3: Natural Acknowledgment
```
User: "Main quest is LiveKit setup, side quest is database schema"
Visual: [Both quests appear immediately]
Voice: "Got it. LiveKit first, database when you have time"
```

## The Key Principles

### 1. Read the Room
- Clear and flowing? → Visualize, stay quiet
- Uncertain? → Ask helpful questions
- Stuck? → Offer suggestions
- Correcting? → Acknowledge and update

### 2. Both Channels Serve the Conversation
- Visual shows understanding
- Voice provides dialogue
- Neither is "primary" - they work together
- Context determines the mix

### 3. Natural Timing
```python
def should_speak(self):
    return any([
        self.user_seems_uncertain(),
        self.natural_pause_detected(),
        self.clarification_would_help(),
        self.encouragement_needed(),
        self.user_asked_question()
    ])

def should_visualize(self):
    return any([
        self.concrete_task_mentioned(),
        self.showing_options_would_help(),
        self.structure_emerging(),
        self.correction_needed()
    ])
```

## The Experience This Creates

It feels like talking to a **thoughtful colleague** who:
- Asks good questions when you're stuck
- Takes visual notes you can see and correct
- Knows when to be quiet and let you think
- Knows when to jump in and help
- Makes you feel heard and understood

## Not Rules, But Situational Awareness

**Wrong approach:**
- "Visual confidence > 0.7 → show"
- "Voice confidence > 0.9 → speak"

**Right approach:**
- "User uncertain → help them explore"
- "User clear → capture and confirm"
- "User stuck → provide gentle guidance"

## The Implementation Reality

```python
class KaneDialogue:
    async def engage(self, user_stream):
        # Not sequential processing but parallel understanding
        await parallel(
            self.maintain_understanding(user_stream),
            self.provide_visual_feedback(),
            self.engage_in_dialogue()
        )
    
    async def engage_in_dialogue(self):
        # Natural conversation, not rigid rules
        while self.conversation_active:
            if self.user_needs_help():
                await self.offer_assistance()
            elif self.confirmation_helpful():
                await self.confirm_understanding()
            elif self.user_asked_something():
                await self.respond_thoughtfully()
            else:
                await self.listen_actively()
```

## The LiveKit Advantage for This

LiveKit enables this natural dialogue because:
1. **Parallel processing** - Voice and visual can happen simultaneously
2. **Stream processing** - Respond to emotional cues immediately
3. **Interruption handling** - Natural back-and-forth
4. **State awareness** - Know when user needs what

This isn't possible with turn-based systems. You need the real-time stream processing that LiveKit provides.