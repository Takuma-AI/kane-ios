# Kane Native Architecture - Mental Models

*Sparknotes of architecture discussion - key mental models and patterns*

## SwiftUI Mental Model

### Core Concepts
- **structs = lightweight classes** (value types, copied when passed)
- **Views are functions of state** - declarative, not imperative
- **It's Figma that runs code** - layers with properties that update automatically
- **Everything is a rectangle** containing other rectangles
- **Stacks determine arrangement**: Z (depth), V (vertical), H (horizontal)

### The View Hierarchy
```
ZStack {           // Layers (z-index)
    VStack {       // Vertical arrangement
        HStack {   // Horizontal arrangement
```

### State & Data Flow
- **@State** = reactive variables (changes trigger UI updates)
- **Data flows down, events bubble up** (never sideways)
- **Parent owns state, child reports changes**
- **ViewModels = Rails controllers** (orchestrate, don't implement)

### Positioning System
- **Stacks** for arrangement
- **Padding** for breathing room  
- **Spacers** push things apart
- **Offsets** nudge positions
- **Frames** set explicit sizes

## Code Quality & Architecture

### The Craftsperson's Mindset
- **Feel the physics** of interactions
- **Design in constraints** (embrace SwiftUI's opinions)
- **Think in flows, not screens**
- **Subtract relentlessly** (build half a product, not half-assed)
- **Respect the grain** of iOS

### SwiftUI Constraints Are Features
- Force clarity about what matters
- Enable consistency across the platform
- Handle accessibility/performance automatically
- Make impossible states impossible

### Code Architecture Patterns
- **Value types everywhere** (structs over classes)
- **Optionals handled gracefully** (never force unwrap)
- **Clear layers**: Views → ViewModels → Models → Services
- **Single source of truth** (no data duplication)
- **Protocols over inheritance**

## Animation Philosophy

### Animation Principles
- **Animations are behaviors, not mechanics**
- **Animation as language** (communicate intent, not decoration)
- **Performance is a feature** (60fps non-negotiable)
- **Error states are designed** (failure as part of experience)

### The Abstraction Evolution
1. **Specific**: "This transaction fades up"
2. **Reusable**: "These things fade up"  
3. **Generic**: "Anything can fade up"
4. **Behavioral**: "Dismissal means fade up"
5. **Semantic**: "Success means celebrate"

### When to Abstract
- **Rule of Three**: First time inline, second time copy, third time abstract
- **Abstract when pain of duplication > cost of abstraction**
- **You're ready when**: Copy-paste shame, naming moments, tweaking nightmares

### Animation Tools
- **SwiftUI native** for 80% of needs
- **Lottie** for complex illustrated animations (After Effects → JSON)
- **Rive** for interactive state-driven animations
- **Custom tools**: Jitter (Figma → animation), AI generation for quick iteration

## App Development Workflow

### The Right Sequence
1. **Design experience first** (find the feel)
2. **Discover minimal states** (what actually needs to change)
3. **Map user actions to state changes**
4. **Define business logic rules**
5. **Implement architecture that supports this**

### Interface-First Development
- **Start with what users see** (hardcoded HTML/views)
- **Make it feel right** before making it work
- **Extract data needs** from working interfaces
- **Never start with models** or database design

### The Testing Question
"Can I test this without UI/network/dependencies?" If no, dependencies are wrong.

## Server Integration Strategy

### When to Add Rails
- **Not when**: Still figuring out interactions, animations changing daily
- **Yes when**: Need persistent data, bank transactions, cross-device sync
- **Trigger moment**: "I wish this worked with my real bank account"

### The Right Order
1. **Perfect iOS UX with mocks** (find the patterns)
2. **Build Rails API to match iOS needs** (not the reverse)
3. **Connect directly** (skip local persistence for financial data)
4. **Add intelligent caching later** if needed

### API Architecture
- **ViewModels become API clients**
- **Optimistic updates**: UI changes immediately, sync in background
- **Rails does math, iOS does presentation**
- **Thin client, smart server**

## Voice Integration Architecture

### The Component Stack
```
Voice Input → Speech Recognition → Intent Processing → Rails API → Response → TTS
```

### Physical Architecture
- **iOS**: Real-time interface (audio processing, immediate feedback)
- **Rails**: Intelligence layer (all business logic, user understanding)
- **Voice APIs**: Utility services (transcription, synthesis)

### Real-Time Strategy
- **Local conversation flow** (immediate responses)
- **Background context sync** (server intelligence enhancement)
- **WebSocket for context updates**
- **Merge strategy**: Local responsiveness + server intelligence

### Context Management
- **Local context window**: Last 5-10 turns, current session
- **Server context**: Full history, behavioral patterns, predictions
- **Hybrid approach**: Conversation happens locally, gets smarter via server updates

## The Intelligence Moat

### The Understanding Layers
- **Behavioral**: When/how they make financial decisions
- **Conversational**: What they reveal through voice
- **Temporal**: How behavior changes over time
- **Contextual**: Circumstances around each decision

### The Evolution
- **Month 1**: Basic categorization
- **Month 3**: "You stress spend"
- **Month 6**: "Tuesday evenings after work calls, you order takeout"
- **Year 1**: "Your spending anxiety peaks before family visits, but you've developed coping mechanisms"

### The Compound Effect
Each data point becomes exponentially more valuable because it connects to everything else. Single purchase = transaction + emotional context + behavioral pattern + conversation history.

### The Architecture
- **Rails owns all intelligence** and learning
- **iOS streams context** to Rails continuously
- **Every interaction teaches** the system more
- **Understanding accumulates** as the defensible moat
- **Time creates switching costs** (irreplaceable personal understanding)

## Key Architecture Decisions

### Data Boundaries
- **@State**: Temporary UI state
- **ViewModels**: Screen orchestration, server communication
- **Rails**: All business logic, user understanding, persistence
- **Local storage**: User preferences only (skip for financial data)

### The Mental Models
- **SwiftUI = Figma with code**
- **ViewModels = Rails controllers**  
- **Animations = behaviors not mechanics**
- **Voice = another input method** (integrates with existing state)
- **Understanding = the moat** (time-based competitive advantage)

### The Workflow
- **Start with experience** → discover architecture
- **Mock everything** → perfect feel → add persistence
- **Local flow** → server intelligence
- **Abstract when pain demands it** (not before)

---

*The key insight: Build from user experience inward. Let the interface teach you what architecture it needs.*