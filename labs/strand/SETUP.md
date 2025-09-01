# Strand Setup Instructions

## 1. Xcode Project Setup (5 min)

1. Open Xcode → Create New Project → iOS App
2. Product Name: `Strand`
3. Interface: SwiftUI
4. Language: Swift
5. Use Core Data: ✓
6. Include Tests: ✗

## 2. Add ElevenLabs SDK (2 min)

1. File → Add Package Dependencies
2. Enter: `https://github.com/elevenlabs/elevenlabs-swift-sdk`
3. Version: Up to Next Major → 2.0.0
4. Add Package

## 3. Replace Xcode Files (3 min)

Delete all generated files except `Assets.xcassets`
Drag all provided files into project:
- StrandApp.swift
- Views/
- Models/
- Services/

## 4. Core Data Setup (2 min)

1. Delete the auto-generated .xcdatamodeld file
2. File → New → Data Model → Name: `StrandModel`
3. Add entities manually:
   - **Focus**: id (UUID), title (String), context (String), date (Date), completed (Boolean), createdAt (Date)
   - **Task**: id (UUID), content (String), isBlocker (Boolean), aiProgress (String), completedAt (Date), createdAt (Date)
4. Create relationship: Focus → tasks (to-many), Task → focus (to-one)

## 5. Info.plist Permissions (1 min)

Add to Info.plist:
```xml
<key>NSMicrophoneUsageDescription</key>
<string>Strand needs microphone access for voice conversations</string>
```

## 6. ElevenLabs Agent Setup (10 min)

### Create Agent
1. Go to https://elevenlabs.io
2. Create new Conversational AI agent
3. Name: "Strand Focus Partner"

### System Prompt
```
You are a focus partner helping users identify what truly matters today.

Start each day by asking: "What's the one thing that really matters for you to get done today?"

Through conversation, help them:
1. Identify 2-3 success criteria (not tasks but end states)
2. Surface any blockers preventing focus
3. Create clear, actionable priorities

Key principles:
- Success criteria describe outcomes, not activities
- Ask "why" to understand true priorities
- Keep focus narrow - 2-3 things maximum
- Blockers are separate from main focus areas

Remember: You're helping them think, not telling them what to do.
```

### Configure Tools

Start with just ONE tool to verify the flow works:

**Tool: create_focus**
- Type: Client
- Wait for response: ✓
- Parameters:
  - title (String, required): "The success criteria title"
  - context (String, required): "Why this matters and what done looks like"

(Add other tools after testing basic flow)

### Get Agent ID
Copy the agent ID from dashboard → Settings

## 7. Add Credentials (1 min)

In `ConversationManager.swift`, replace:
```swift
private let agentId = "YOUR_AGENT_ID"
```

## 8. Build & Run (2 min)

1. Select iPhone simulator
2. Product → Run (⌘R)
3. Allow microphone permissions when prompted

## Testing Flow

### Test 1: Basic Connection
1. Tap the strand
2. Should see waves animating
3. Say "Hello"
4. Verify agent responds

### Test 2: Create Focus
1. Say "I need to finish the product demo today"
2. Agent should probe for details
3. Confirm tool creates Focus object
4. Check UI updates with new card

### Test 3: Create Blocker
1. Say "I'm blocked because I need to schedule meetings first"
2. Verify task appears in blockers section
3. Check isBlocker = true in CoreData

### Test 4: State Query
1. Say "What am I working on?"
2. Agent should call get_current_state
3. Verify response matches UI

## Troubleshooting

**No voice response:**
- Check agent ID is correct
- Verify microphone permissions
- Check internet connection

**Tools not firing:**
- Verify tool names match exactly
- Check "Wait for response" is enabled
- Review agent system prompt

**UI not updating:**
- Check CoreData saves properly
- Verify @FetchRequest predicates
- Check viewContext is set

## How It Works - Mental Model

### The Flow
1. **User taps strand** → Activates conversation
2. **User speaks** → ElevenLabs processes audio
3. **Agent decides** → Calls appropriate tool
4. **Tool executes** → Creates/updates CoreData
5. **CoreData changes** → Triggers @FetchRequest
6. **SwiftUI updates** → Shows new content

### The Key Insight
The agent isn't just responding - it's actively manipulating your app's data through tools. When it calls `create_focus`, that's a real function in your iOS app creating a real CoreData object, which immediately appears on screen.

### The Architecture
```
Voice → ElevenLabs Agent → Tool Call → iOS Function → CoreData → SwiftUI
```

This is fundamentally different from traditional commands. The AI understands context and intent, then uses your app's tools to shape the data accordingly. You're having a conversation that directly manipulates state.