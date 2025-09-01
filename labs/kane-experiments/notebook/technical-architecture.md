# Kane Native: Technical Architecture & Component Hierarchy

## View Hierarchy & Navigation Model

### Root View Controller Structure
```
AppRootView
├── OnboardingView (initial root, replaced entirely after completion)
└── HomeView (becomes root after onboarding)
    ├── DashboardContent (scrollable)
    │   ├── SunCircle
    │   ├── BudgetBar
    │   └── [Future] GenerativeContent
    ├── ElectricStrand (persistent bottom layer)
    └── OverlayContainer (manages modal overlays)
        ├── ConversationOverlay
        └── SortingOverlay
```

## Component Specifications

### ElectricStrand
**Type**: Persistent UI Component
**Layer**: Always bottom-most, z-index below all content
**Frame**: Full width, ~44pt height, anchored to safe area bottom

**View States**:
- `idle`: Static line, subtle gradient, opacity 1.0
- `hovering`: Responds to touch down, slight glow increase
- `vibrating`: Active waveform animation (Death Stranding style)
- `transitioning`: Opacity 0, prevents glitch during view changes
- `hidden`: Removed from view hierarchy (during onboarding)

**Gesture Recognizers**:
- `SwipeGestureRecognizer`: Horizontal swipe activates vibration
- `LongPressGestureRecognizer`: Duration 0.5s, triggers conversation overlay
- Hit testing confined to strand bounds only

**Opacity Management**:
- Fades out (0.2s) when any view transition begins
- Fades in (0.3s) after view transition completes
- Hidden during overlay animations

---

### OnboardingView
**Type**: Full Screen Root View
**Layer**: Replaces entire view hierarchy during onboarding
**Lifecycle**: Destroyed after completion, replaced by HomeView

**Timeline Sequence**:
1. **0.0s**: Black screen
2. **0.5s**: First text fades in
3. **3.0s**: Text transitions
4. **5.0s**: Philosophy statement
5. **8.0s**: Strand introduction (strand not actually visible yet)
6. **10.0s**: Voice prompt activation
7. **After voice**: Bank connection flow
8. **Completion**: Full fade to black, then fade in HomeView

**Transition to Home**:
- Not a navigation push
- Complete view hierarchy replacement
- Cross-fade transition over 0.6s

---

### HomeView
**Type**: Root Container View
**Layer**: Base layer after onboarding
**Scroll Behavior**: Vertical scroll for dashboard content

**Subview Layout**:
- `DashboardContent`: ScrollView containing main content
- `ElectricStrand`: Fixed position, doesn't scroll
- `OverlayContainer`: Full screen container for modal overlays

**State Management**:
```
@State activeOverlay: OverlayType?
@State isTransitioning: Bool
@State dashboardData: DashboardModel
```

---

### ConversationOverlay
**Type**: Modal Overlay
**Layer**: Above all content including ElectricStrand
**Presentation**: Slides up from bottom

**Animation Sequence**:
1. Background blur begins (0.1s)
2. Container slides up (0.3s spring)
3. Content fades in (0.2s after slide)

**Background Treatment**:
- Base: UIBlurEffect.Style.systemUltraThinMaterial
- Additional: Custom gaussian blur radius 20
- Tint: Dark mode - 80% black opacity overlay

**Content Layout**:
- SafeArea respected
- Transcript: 60% of screen height
- Dynamic text sizing based on content length
- No text input field (voice only)

**Dismiss Gesture**:
- Swipe down from anywhere
- Velocity threshold for quick dismiss
- Spring animation on release

---

### SortingOverlay
**Type**: Modal Overlay
**Layer**: Same z-index as ConversationOverlay (only one active at a time)
**Trigger**: Automatic when unsorted transactions exist

**Center Orb Specifications**:
- Size: 200pt diameter
- Position: Center screen, slightly above middle
- Glass effect: Multiple blur layers
- Animation: Subtle floating (2pt amplitude, 3s period)

**Transaction Display**:
- Text inside orb
- Human-readable format
- Font scales to fit
- Maximum 2 lines

**Gesture Zones**:
- **Swipe up zone**: Top 60% of screen
- **Swipe down zone**: Bottom 60% of screen
- **Overlap zone**: Requires velocity to determine direction

**Animation Feedback**:
- **Swipe up**: Orb fades + scales down + moves up
- **Swipe down**: Orb glows + scales slightly + sinks down
- Duration: 0.4s with spring damping

---

### SunCircle
**Type**: View Component
**Container**: DashboardContent
**Size**: 280pt diameter (responsive to screen size)

**Visual Structure**:
- Single CAShapeLayer with gradient fill
- Dividing line at horizontal center
- Top gradient: Light to medium (wants)
- Bottom gradient: Medium to dark (kills)

**Animation Triggers**:
- Proportion changes after sorting
- Initial load from API
- Pull-to-refresh

**Interactive Elements**:
- Not directly interactive in Phase 1
- Future: Tap for details, long press for context

---

### BudgetBar
**Type**: Interactive Component
**Container**: DashboardContent (below SunCircle)
**Layout**: Horizontal bar, full width minus padding

**Segments**:
- `needs`: Fixed width based on data, non-interactive
- `wants`: Variable width, green gradient
- `kills`: Variable width, red gradient
- `threshold`: Draggable vertical line

**Drag Interaction**:
- Threshold line has 44pt hit area
- Haptic feedback on drag
- Snaps to logical positions
- Updates in real-time

---

## Overlay Management System

### State Controller
Single source of truth for overlay states:

```
enum OverlayType {
    case conversation
    case sorting
    case none
}

class OverlayManager {
    - currentOverlay: OverlayType
    - transitionInProgress: Bool
    - queue: [OverlayType]
}
```

### Transition Rules
1. Only one overlay active at a time
2. New overlay request queues if transition in progress
3. ElectricStrand hides during overlay transitions
4. Background content freezes during overlay

### Lifecycle Hooks
- `willPresent`: Prepare animations
- `didPresent`: Enable interactions
- `willDismiss`: Disable interactions
- `didDismiss`: Clean up resources

---

## Gesture Priority System

**Hierarchy** (highest to lowest):
1. Active overlay gestures
2. ElectricStrand gestures
3. Dashboard scroll/interaction
4. Background taps

**Conflict Resolution**:
- Overlays consume all gestures when active
- ElectricStrand only responds to direct hits
- Scroll gestures disabled during transitions

---

## Animation Standards

### Timing Curves
- **Spring**: Response 0.6, damping 0.8
- **EaseInOut**: Default for opacity
- **Linear**: Progress indicators only

### Duration Standards
- **Micro**: 0.15s (hover states)
- **Quick**: 0.25s (small transitions)
- **Normal**: 0.35s (overlay presentations)
- **Slow**: 0.6s (major view changes)

### Performance Targets
- 60fps minimum for all animations
- 120fps on ProMotion displays
- Gesture response under 50ms
- No frame drops during transitions

---

## Memory & State Management

### View Lifecycle
- **Onboarding**: Deallocated after completion
- **Overlays**: Lazy loaded, cached after first use
- **Dashboard**: Always in memory while app active

### State Persistence
- Sorting progress: Saved immediately
- Dashboard proportions: Cached, sync with API
- Conversation history: Limited to session
- User preferences: UserDefaults

### Background Behavior
- ElectricStrand: Pauses animations
- Overlays: Dismissed automatically
- API sync: Continues if in progress
- Voice: Stops recording

---

## Future Architecture Considerations

### Domain Carousel
- Horizontal PageViewController
- Lazy loading of domain views
- Shared gesture recognition with ElectricStrand

### Generative UI Container
- Dynamic height ScrollView
- Component registry for AI-generated elements
- Constraint-based layout system

### Context System
- Long press gesture recognizer on all elements
- Context extraction protocol
- Overlay presentation with context

---

## Testing Considerations

### Gesture Testing
- Mock gesture recognizers for unit tests
- UI test recordings for gesture sequences
- Accessibility testing for VoiceOver

### Animation Testing
- Snapshot tests at key frames
- Performance profiling during transitions
- Memory leak detection in overlays

### State Testing
- State machine validation
- Overlay queue behavior
- Persistence across app launches