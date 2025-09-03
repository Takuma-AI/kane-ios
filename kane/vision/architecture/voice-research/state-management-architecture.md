# State Management Architecture: How the Brain Knows What's Real

## The Challenge: Multiple Sources of Truth

The brain needs to track:
1. **What the user said** (conversation state)
2. **What's on screen** (iOS UI state)  
3. **What's in the database** (persistent state)
4. **What's being drafted** (temporary state)

These can diverge! User might say "delete that" but the deletion hasn't happened yet.

## The Solution: Unified State Manager

```python
class UnifiedStateManager:
    def __init__(self):
        # The authoritative state
        self.state = {
            "quests": {
                "confirmed": [],      # Actually saved
                "draft": [],         # Shown but not confirmed
                "pending_changes": [] # Spoken but not shown yet
            },
            "ui": {
                "current_screen": "home",
                "selected_quest": None,
                "user_looking_at": None  # Eye tracking or tap data
            },
            "conversation": {
                "last_mentioned_quest": None,
                "correction_context": None,
                "uncertainty_level": 0.0
            }
        }
        
        # State change queue (atomic operations)
        self.pending_operations = Queue()
```

## The State Flow Architecture

```
User Speech → Intent → Pending Operation → UI Update → Database Save
                ↑                    ↓           ↓            ↓
            State Manager tracks all stages and can roll back
```

## How State Stays Synchronized

### 1. Optimistic UI Updates with Rollback
```python
async def handle_user_intent(self, intent):
    # 1. Create pending operation
    operation = self.create_operation(intent)
    operation_id = self.queue_operation(operation)
    
    # 2. Optimistically update UI (immediate feedback)
    await self.ios.update_ui(operation)
    self.state["quests"]["draft"].append(operation.quest)
    
    # 3. Try to persist
    try:
        await self.database.save(operation)
        self.state["quests"]["confirmed"].append(operation.quest)
        self.state["quests"]["draft"].remove(operation.quest)
    except:
        # 4. Rollback if failed
        await self.ios.rollback(operation_id)
        self.state["quests"]["draft"].remove(operation.quest)
        await self.voice.say("Hmm, couldn't save that. Let me try again.")
```

### 2. Reference Resolution ("that", "it", "the last one")
```python
def resolve_reference(self, user_text):
    """
    User: 'Change that to...' - what is 'that'?
    """
    if "that" in user_text or "it" in user_text:
        # Check multiple contexts
        candidates = [
            self.state["conversation"]["last_mentioned_quest"],
            self.state["ui"]["selected_quest"],
            self.state["quests"]["draft"][-1] if self.state["quests"]["draft"] else None,
            self.last_created_quest
        ]
        
        # Return most likely reference
        return self.score_candidates(candidates, user_text)
```

### 3. State Reconciliation Loops
```python
async def reconciliation_loop(self):
    """
    Runs every 100ms to ensure state consistency
    """
    while True:
        # Get truth from each source
        ios_state = await self.ios.get_current_state()
        db_state = await self.database.get_current_state()
        
        # Detect divergence
        if self.has_diverged(ios_state, db_state):
            # Decide which is authoritative
            if self.user_is_actively_editing():
                # iOS is truth - user's edits matter most
                await self.database.sync_from_ios(ios_state)
            else:
                # Database is truth - restore consistency
                await self.ios.sync_from_database(db_state)
        
        await asyncio.sleep(0.1)
```

## The Context Object Pattern

```python
class ConversationContext:
    """
    Everything the brain needs to understand 'what is'
    """
    def __init__(self):
        self.working_memory = WorkingMemory()  # Last 30 seconds
        self.quest_registry = QuestRegistry()  # All quests by ID
        self.reference_stack = []              # For resolving "that"
        
    def update_from_speech(self, text):
        # Extract what user is referring to
        if quest := self.extract_quest_reference(text):
            self.reference_stack.append(quest)
            self.working_memory.add("user_discussing", quest)
    
    def update_from_ui(self, ui_event):
        # User tapped on a quest
        if ui_event.type == "quest_selected":
            self.reference_stack.append(ui_event.quest_id)
            self.working_memory.add("user_viewing", ui_event.quest_id)
    
    def get_current_focus(self):
        # What is user most likely talking about?
        return self.reference_stack[-1] if self.reference_stack else None
```

## Handling State Mutations

### User Says: "Change that to ship the database feature"
```python
async def handle_change_request(self, user_text):
    # 1. What is "that"?
    target = self.context.resolve_reference("that")
    # Might be: quest_id_123 (the last created quest)
    
    # 2. What's the current state?
    current_quest = self.state.get_quest(target)
    # {"id": "123", "title": "Ship voice feature", "is_draft": true}
    
    # 3. What's the change?
    new_title = self.extract_new_value(user_text)
    # "Ship the database feature"
    
    # 4. Apply change optimistically
    self.state.update_quest(target, {"title": new_title})
    await self.ios.update_quest_card(target, {"title": new_title})
    
    # 5. Persist when possible
    await self.queue_database_update(target, {"title": new_title})
```

## The Three-Layer State Model

### Layer 1: Immediate State (Memory)
- What user just said
- What's being displayed
- Pending operations
- Updates every ~100ms

### Layer 2: Session State (Server)
- Current quests (draft and confirmed)
- Conversation history
- User patterns this session
- Persists during conversation

### Layer 3: Persistent State (Database)
- All historical data
- Confirmed quests only
- User patterns over time
- Survives between sessions

## State Synchronization Strategy

```python
class StateSynchronizer:
    async def maintain_consistency(self):
        # Real-time sync between memory and UI
        self.sync_memory_to_ui()      # Every 100ms
        
        # Batch sync to database
        self.batch_sync_to_database()  # Every 1 second
        
        # Full reconciliation
        self.full_reconciliation()      # Every 10 seconds
    
    def handle_conflict(self, conflict):
        # User intent is always authoritative
        if conflict.source == "user_speech":
            return conflict.user_value
        
        # Recent beats old
        return conflict.most_recent_value
```

## The LiveKit Advantage Here

LiveKit enables this complex state management because:

1. **Persistent connection** - State maintained across conversation
2. **Bidirectional data** - iOS can push state changes back
3. **Custom data channels** - Send state updates outside audio
4. **Room state** - LiveKit maintains connection state for you

Without LiveKit, you'd need to rebuild all this infrastructure.

## The Mental Model

Think of it like Google Docs:
- **Local state** (what you're typing) - immediate
- **Server state** (what's synced) - near real-time
- **Database state** (what's saved) - eventually consistent

The brain maintains all three and knows which to trust when.