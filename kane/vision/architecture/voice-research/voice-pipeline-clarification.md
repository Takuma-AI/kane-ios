# Voice Pipeline Clarification - What You Actually Need

## The Reality: No GPU Required! 🎉

You don't need a cloud GPU or complex infrastructure. Voice AI pipelines run on regular servers (like your Rails apps on Render). Here's what's actually happening:

## Option 1: Hume AI (Simplest - Like Stripe)
```javascript
// This runs on a regular Node.js server (Render, Railway, etc)
// No GPU needed - Hume handles everything

const { HumeClient } = require('hume');

const client = new HumeClient({ apiKey: 'your-key' });

// Hume provides:
// - Voice in/out (WebRTC)
// - Speech recognition
// - LLM reasoning
// - Speech synthesis
// - All in one API call

await client.empathicVoice.chat({
  // Your conversation happens here
  // Just like calling Stripe or Twilio
});
```

**What you deploy:** A simple Node.js app on Render
**What Hume handles:** All the AI/voice complexity
**Your cost:** ~$0.075 per minute of conversation

## Option 2: Hume + LiveKit (Still Simple)

Actually, Hume CAN work with LiveKit! LiveKit is just a transport layer (like Socket.io for voice). You can:

```python
# Use LiveKit to handle WebRTC connections
# But still use Hume for the AI parts

from livekit import agents
from hume import HumeVoiceClient

class KaneAgent:
    def __init__(self):
        # LiveKit handles the voice streaming
        self.room = LiveKitRoom()
        
        # Hume handles the AI conversation
        self.hume = HumeVoiceClient(api_key='...')
    
    async def on_audio(self, audio_frame):
        # Send audio to Hume
        response = await self.hume.process(audio_frame)
        return response
```

## Option 3: Full Custom Pipeline (You Don't Need This)

The "custom pipeline" would mean:
- Using Deepgram API for speech-to-text ($0.0125/min)
- Using Claude API for reasoning ($0.003 per 1K tokens)
- Using ElevenLabs API for text-to-speech ($0.18/min)
- Orchestrating them yourself

**This is like building your own Stripe instead of just using Stripe.**

## What "Setting Up a Pipeline" Really Means

It's just API orchestration on a normal server:

```javascript
// This runs on Render, just like Rails
// No GPU, no special infrastructure

app.post('/voice-webhook', async (req, res) => {
  const userAudio = req.body.audio;
  
  // Step 1: Convert speech to text (API call)
  const text = await deepgram.transcribe(userAudio);
  
  // Step 2: Get AI response (API call)
  const response = await openai.complete(text);
  
  // Step 3: Convert response to speech (API call)
  const responseAudio = await elevenlabs.speak(response);
  
  res.send(responseAudio);
});
```

## The Simplest Path for Today

### Use Hume's Hosted Solution (Like Using Heroku)

1. **Sign up for Hume AI** (5 minutes)
   - Get API key
   - They handle ALL the complexity

2. **Create a simple Node.js server** (30 minutes)
   ```bash
   mkdir kane-server
   cd kane-server
   npm init -y
   npm install express hume socket.io
   ```

3. **Deploy to Render** (10 minutes)
   - Just like your Rails apps
   - No special configuration needed

4. **Connect your iOS app** (20 minutes)
   - Change WebSocket URL from ElevenLabs to your server
   - Done!

### What This Looks Like

```javascript
// server.js - Runs on Render (not a GPU!)
const express = require('express');
const { HumeClient } = require('hume');
const io = require('socket.io');

const app = express();
const hume = new HumeClient({ 
  apiKey: process.env.HUME_API_KEY 
});

// iOS app connects here
io.on('connection', (socket) => {
  socket.on('start-conversation', async () => {
    const conversation = await hume.empathicVoice.chat({
      // Your KANE-specific configuration
      systemPrompt: kanePrompt,
      tools: questCreationTools,
      
      onToolCall: (tool) => {
        // Send quest updates to iOS
        socket.emit('quest-update', tool.params);
      }
    });
    
    // Bridge audio between iOS and Hume
    socket.on('audio', (data) => conversation.send(data));
    conversation.on('audio', (data) => socket.emit('audio', data));
  });
});

app.listen(3000);
```

## Comparison: What You're Used To vs Voice AI

| Rails on Render | Voice AI on Render |
|-----------------|-------------------|
| Processes HTTP requests | Processes WebSocket audio |
| Calls Stripe API | Calls Hume/OpenAI API |
| Returns HTML/JSON | Returns audio |
| Uses Postgres | Uses same Postgres |
| Costs ~$7/month | Costs ~$7/month + API usage |

## LiveKit Clarification

**LiveKit is NOT required.** It's just one way to handle WebRTC (real-time audio streaming). Think of it like:
- Hume = Stripe (the actual service)
- LiveKit = Socket.io (the transport layer)

You can use:
- Hume alone (they handle WebRTC)
- Hume + LiveKit (if you want more control)
- Hume + your own WebSocket code

## Today's Actual Steps

1. **Try Hume's Playground** (5 min)
   - https://app.hume.ai
   - Test if voice quality is good enough

2. **If yes, create simple server** (1 hour)
   ```bash
   # No different from creating an Express app
   npx create-node-app kane-server
   npm install hume socket.io
   # Write 50 lines of code
   # Deploy to Render
   ```

3. **Update iOS app** (30 min)
   - Change WebSocket URL
   - Keep existing UI/Core Data code

4. **Test** (30 min)
   - Voice in → Quest appears → Refine → Confirm

## The Bottom Line

- **No GPU needed** - Just regular server like Rails
- **No LiveKit needed** - Unless you want extra control
- **Hume + LiveKit possible** - They can work together
- **Cost:** ~$7/month hosting + ~$0.075/min conversation
- **Complexity:** Like integrating Stripe or Twilio

## Recommended: Start Super Simple

```javascript
// Literally your entire server to start:
const { HumeClient } = require('hume');
const io = require('socket.io')(3000);

const hume = new HumeClient({ 
  apiKey: 'your-key',
  // Your KANE prompt here
});

io.on('connection', (socket) => {
  // Bridge iOS ↔ Hume
  // That's it!
});
```

Deploy this on Render exactly like Rails. No GPUs, no complexity.

Want me to write the exact server code you need?