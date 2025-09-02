# Hotwire Native iOS Implementation - Initial Plan

## Project Overview
Convert KANE Rails app from PWA to native iOS app using Hotwire Native framework. Maintain Rails-driven business logic while providing native iOS experience.

## Implementation Approach

### Phase 1: Basic Native Shell ✅ COMPLETED
- [x] Add Hotwire Native package to iOS project
- [x] Configure SceneDelegate with Navigator and base URL
- [x] Environment-based URL configuration (#if DEBUG for localhost vs production)
- [x] Basic path configuration endpoint in Rails
- [x] Fix iOS build errors and storyboard issues
- [x] Native app detection via meta tag approach

### Phase 2: UI/UX Polish ✅ COMPLETED  
- [x] Hide white navigation bars in native app
- [x] Fix white flash during transitions (black window background)
- [x] CSS color inheritance using variables
- [x] Native-specific stylesheet loading

### Phase 3: Core Flow Integration 🔄 IN PROGRESS
- [x] Plaid OAuth modal configuration
- [ ] **CURRENT**: Test and fix user flows
- [ ] Navigation flow optimization
- [ ] Authentication persistence
- [ ] Error handling

### Phase 4: Future Enhancements
- [ ] Bridge components for enhanced interactions
- [ ] Push notifications
- [ ] Native sorting screen (optional)
- [ ] Offline capabilities

## Key Technical Decisions

### Architecture
- **Rails-first**: All business logic stays in Rails
- **URL-driven navigation**: Path configuration controls native behavior
- **Progressive enhancement**: Web works first, native enhances

### Environment Detection
```swift
#if DEBUG
    // Development: http://localhost:3000
#else  
    // Production: https://app.kane.money
#endif
```

### Native App Detection
```erb
<% if hotwire_native_app? %>
  <meta name="turbo-native-app" content="true">
<% end %>
```

## Current Issues Identified

### Known Working
- ✅ App builds and launches successfully
- ✅ Environment-based URL switching
- ✅ Basic navigation between screens
- ✅ CSS styling (black background, no white bars)
- ✅ Native app detection in Rails

### Known Issues
- ❌ Plaid OAuth modal may not dismiss properly after completion
- ❌ Navigation flow disruptions (redirecting to wrong screens)
- ❌ Some UI elements appearing web-like instead of native
- ❌ Potential issues with authentication persistence
- ❌ Refresh flow for new transactions unclear

## Next Steps
1. **Comprehensive flow testing** - Document expected vs actual behavior
2. **Holistic issue analysis** - Identify patterns across all flows
3. **Unified solution development** - Fix core issues that affect multiple flows
4. **Validation testing** - Ensure fixes work across all scenarios

## Success Criteria
- All user flows work seamlessly in native app
- No white flashes or navigation disruptions  
- Plaid OAuth completes and properly dismisses
- Authentication persists correctly
- Performance matches or exceeds PWA version