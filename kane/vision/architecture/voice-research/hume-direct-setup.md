# Using Hume Directly from iOS (No Server Needed)

## The Simplest Path - Direct Hume Integration

Since you want Hume's voice and don't need a server intermediary, here's the direct path:

## Step 1: Get Hume API Access

1. Sign up at https://www.hume.ai
2. Get your API key
3. Test in their playground first to confirm voice quality

## Step 2: iOS Integration Options

### Option A: Hume's WebSocket API from iOS
```swift
// In your ConversationManager.swift
import Foundation

class HumeConversationManager: ObservableObject {
    private var webSocket: URLSessionWebSocketTask?
    private let humeWSURL = "wss://api.hume.ai/v0/evi/chat"
    
    func startConversation() {
        // Connect directly to Hume's WebSocket
        let url = URL(string: humeWSURL)!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(humeAPIKey)", forHTTPHeaderField: "Authorization")
        
        webSocket = URLSession.shared.webSocketTask(with: request)
        webSocket?.resume()
        
        // Send initial config
        let config = [
            "type": "session_settings",
            "system_prompt": kanePrompt,
            "voice": "evi_2",  // Their expressive voice
            "tools": questTools
        ]
        
        sendMessage(config)
        receiveMessages()
    }
    
    private func sendAudio(_ audioData: Data) {
        // Send audio directly to Hume
        let message = [
            "type": "audio_input",
            "data": audioData.base64EncodedString()
        ]
        sendMessage(message)
    }
    
    private func handleToolCall(_ tool: [String: Any]) {
        // Create/update quests in Core Data
        if tool["name"] as? String == "create_quest" {
            createLocalQuest(tool["parameters"])
        }
    }
}
```

### Option B: Using Hume's Swift SDK (If Available)
```swift
import HumeEVI  // Check if they have iOS SDK

class KaneConversationManager {
    let hume = HumeClient(apiKey: "your-key")
    
    func startVoiceSession() async {
        let session = try await hume.chat.create(
            systemPrompt: kaneSystemPrompt,
            voice: .evi2,  // Expressive voice
            tools: [
                Tool(
                    name: "create_quest",
                    description: "Create a main or side quest",
                    parameters: questSchema,
                    handler: { params in
                        // Direct Core Data updates
                        self.createQuest(params)
                    }
                )
            ]
        )
        
        // Audio I/O handled by Hume
        session.start()
    }
}
```

## Step 3: The Quest Creation Tools

```swift
let questTools = [
    [
        "type": "tool",
        "name": "create_quest",
        "description": "Create a new quest (main or side)",
        "parameters": [
            "type": "object",
            "properties": [
                "title": ["type": "string"],
                "description": ["type": "string"],
                "quest_type": ["type": "string", "enum": ["main", "side"]],
                "is_draft": ["type": "boolean", "default": true]
            ]
        ]
    ],
    [
        "type": "tool", 
        "name": "update_quest",
        "description": "Update an existing quest",
        "parameters": [
            "type": "object",
            "properties": [
                "quest_id": ["type": "string"],
                "updates": ["type": "object"]
            ]
        ]
    ]
]
```

## Step 4: The KANE System Prompt for Hume

```swift
let kaneSystemPrompt = """
You are KANE, a voice-first AI that helps users plan their day through main quests and side quests.

CRITICAL: You have access to create_quest and update_quest tools. Use them actively as the user speaks.

Core Behavior:
1. Listen to their full brain dump without interrupting
2. Create draft quests AS they mention tasks (don't wait)
3. Main quest = their primary focus (max 1-2)
4. Side quests = important but secondary (max 3-5)

When user says something like:
- "I need to ship the voice pipeline" → create_quest(title: "Ship the voice pipeline", type: "main", is_draft: true)
- "Also handle emails" → create_quest(title: "Handle emails", type: "side", is_draft: true)

Keep responses short and natural for voice.
Don't over-explain.
Use their exact words in quest titles.
"""
```

## What Hume Gives You (Without Any Server)

1. **Expressive Voice** - EVI model with emotions
2. **Low Latency** - Direct connection, no middleman
3. **Tool Calling** - Built-in support for quest operations
4. **Context Management** - Hume maintains conversation state
5. **Voice Activity Detection** - Knows when user stops talking
6. **Interruption Handling** - Natural conversation flow

## Testing Flow

1. **Connect to Hume WebSocket**
   - Your iOS app → Hume's API directly
   - No server needed

2. **User speaks**: "My main quest today is shipping the KANE voice feature"
   
3. **Hume processes** with your prompt and tools
   
4. **Hume calls tool**: `create_quest({title: "Ship KANE voice", type: "main"})`
   
5. **Your iOS app** receives tool call and updates Core Data
   
6. **Quest appears** on screen as draft
   
7. **Hume responds** with voice: "Got it, shipping KANE voice is your main focus"

## Why No Server Needed?

- Hume IS the server
- They handle all voice processing
- They execute your tools
- They maintain context
- You just handle UI updates

## When You'd Want a Server Later

Only add a server if you need:
- Custom prompt manipulation mid-conversation
- Your own conversation storage
- Complex multi-agent orchestration
- Integration with other services

But for your MVP today? Direct to Hume is perfect.

## Next Steps

1. Get Hume API key
2. Test their voices at https://app.hume.ai
3. Implement WebSocket connection in iOS
4. Add tool handlers for quest CRUD
5. Ship by end of day