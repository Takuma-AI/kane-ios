# KANE Hotwire Native iOS Implementation Plan

## Overview
Transform KANE's Rails web app into a native iOS experience using Hotwire Native. The goal is to preserve the meditation-like simplicity while adding native polish where it enhances the core experience.

## Core Principle
Following Hotwire Native philosophy: **The Rails app IS the iOS app**. We're not building a separate iOS app - we're wrapping our Rails app in a native shell that provides platform integration where valuable.

## Architecture Analysis

### What Stays in Rails (Everything Core)
1. **All Business Logic**
   - Transaction sorting logic
   - Pile assignments (Need/Want/Kill)
   - User sessions and data persistence
   - Plaid webhook processing

2. **All UI/UX**
   - Transaction cards
   - Sorting interface
   - Loading states
   - Complete screen
   - Error states

3. **Navigation Flow**
   - Connect → Loading → Sort → Complete cycle
   - All screen transitions
   - Modal presentations

### What Needs Native Implementation

#### 1. Plaid Integration (Required Native)
**Why Native**: Plaid SDK no longer supports web views as of 2023
**Implementation**: Native screen that launches Plaid Link SDK
**Data Flow**: 
- Rails triggers navigation to `/plaid/connect`
- Path configuration routes to native PlaidViewController
- Native screen handles Plaid Link
- On success, navigates back to Rails with public token

#### 2. Bridge Components

**Sorting Buttons Enhancement**
- Already prepared in Rails with `data-controller="bridge--button"`
- Native will add haptic feedback on tap
- Falls back gracefully to web buttons

**Refresh Button**
- Could add pull-to-refresh gesture
- Web fallback: existing refresh button

#### 3. Navigation Patterns

**Path Configuration Rules**:
```json
{
  "rules": [
    {
      "patterns": ["/plaid/connect"],
      "properties": {
        "view_controller": "PlaidViewController"
      }
    },
    {
      "patterns": ["/sign_in$", "/sign_up$"],
      "properties": {
        "presentation": "modal",
        "context": "authentication"
      }
    },
    {
      "patterns": ["/sign_out$"],
      "properties": {
        "presentation": "clear_all"
      }
    },
    {
      "patterns": ["/transactions"],
      "properties": {
        "pull_to_refresh": true
      }
    }
  ]
}
```

### What We're NOT Making Native
- Transaction display (stays HTML)
- Sorting logic (stays Rails)
- Navigation between screens (URL-driven)
- Complete screen (stays HTML)
- User authentication (Rails cookies)

## Implementation Phases

### Phase 1: Basic iOS Shell (Day 1)
- [ ] Add Hotwire Native Swift package
- [ ] Configure SceneDelegate with base URL
- [ ] Set up Navigator and Session
- [ ] Test basic navigation works
- [ ] Hide web navigation elements for native

### Phase 2: Path Configuration (Day 1)
- [ ] Implement configurations#ios_v1 endpoint
- [ ] Configure modal presentations
- [ ] Set up pull-to-refresh for transactions
- [ ] Test navigation patterns

### Phase 3: Plaid Native Integration (Day 2-3)
- [ ] Create PlaidViewController
- [ ] Integrate Plaid Link SDK
- [ ] Handle success/failure callbacks
- [ ] Pass public token back to Rails
- [ ] Test full connection flow

### Phase 4: Bridge Components (Day 4)
- [ ] Implement button bridge component
- [ ] Add haptic feedback to sorting buttons
- [ ] Progressive enhancement testing
- [ ] Ensure web fallbacks work

### Phase 5: Polish & Ship (Day 5-6)
- [ ] App icon and launch screen
- [ ] TestFlight deployment
- [ ] Performance optimization
- [ ] Final testing across flows

## Technical Decisions

### Why These Choices

**Minimal Native Code**
- Following Hotwire Native principles
- Easier maintenance
- Faster feature development
- Single source of truth (Rails)

**Native Only for Platform Features**
- Plaid requires native (no choice)
- Haptics enhance the meditation experience
- Everything else works great as web

**Progressive Enhancement**
- Web app works without iOS app
- iOS app works without bridge components
- Each layer adds value without breaking others

### Authentication Strategy
- **Existing Rails Implementation**: User accounts with email/password
- **Session Management**: 
  - Rails session stores `user_id` and `account_id`
  - Use permanent cookies for native app persistence
  - Sessions survive app restarts
- **Sign In/Up Flows**:
  - `/sign_in` and `/sign_up` present as modals in native
  - After auth success, navigate to `/complete` or transactions
  - Sign out clears navigation stack and redirects to root
- **Account Continuity**:
  - Users' Plaid accounts persist across sessions
  - Anonymous accounts can be upgraded to user accounts

### Error Handling
- Network errors show Rails error pages
- Plaid errors handled in native, shown in Rails
- Graceful degradation for bridge components

## Risks & Mitigations

### Risk: Plaid Integration Complexity
**Mitigation**: Start with Plaid early, use their iOS SDK examples

### Risk: Navigation State Management
**Mitigation**: Let Hotwire Native handle it, don't fight the framework

### Risk: Performance on Slow Networks
**Mitigation**: Local caching of path configuration, minimal data transfer

## Success Criteria
1. User can complete full flow: Connect → Sort → Complete
2. Plaid connection works reliably
3. Sorting feels native with haptic feedback
4. App store ready within 6 days
5. Maintenance burden remains low

## What We're Explicitly NOT Building
- Custom navigation animations
- Offline mode
- Native transaction storage
- Complex gesture controls
- iPad-specific layouts
- Push notifications (yet)
- Analytics tracking
- Native settings screens

## Next Steps
1. Set up iOS project dependencies
2. Implement basic shell
3. Test with local Rails server
4. Move to Plaid integration

---

**Remember**: The magic of Hotwire Native is what we DON'T build in Swift. Every line of native code is a future maintenance burden. Keep it minimal.