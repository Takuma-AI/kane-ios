# Hotwire Native Overview - Rails Apps as iOS Apps

## What is Hotwire Native?

Hotwire Native lets you wrap your Rails app in a native iOS shell. Your Rails app provides all the business logic and UI, while the iOS app acts as a thin coordinator that manages web views. This is NOT a hybrid app framework—it's a different philosophy entirely.

## The Key Insight

**Your Rails app IS the iOS app.** The native code just provides:
- Navigation coordination
- Platform API access (camera, push notifications)
- Native UI elements when beneficial

## For Rails Developers (No Swift Required)

### What You Need to Know
1. **You keep writing Rails** - All your logic stays in Rails
2. **URLs drive everything** - Navigation happens through URLs
3. **I'll write the Swift** - You focus on Rails, I handle iOS
4. **Progressive enhancement** - Web works first, native enhances

### What We'll Build Together

**Phase 1: Basic iOS Shell (1 day)**
- Set up Xcode project
- Configure Hotwire Native
- Connect to your Rails app
- Basic navigation working

**Phase 2: Navigation Patterns (1 day)**
- Configure path rules in Rails
- Set up modals, tabs, and flows
- Handle authentication

**Phase 3: Native Enhancements (2 days)**
- Add camera access
- Enable push notifications
- Create bridge components

**Phase 4: Ship to TestFlight (1 day)**
- Configure deployment
- Submit to App Store Connect
- Beta testing setup

## The Three-Layer Architecture

```
┌─────────────────────────────────────────┐
│          Rails App (Layer 1)            │
│  • All business logic                   │
│  • All UI/UX                           │
│  • Navigation rules                    │
│  • Data persistence                    │
└─────────────────────────────────────────┘
                    ▲
                    │ URLs
                    ▼
┌─────────────────────────────────────────┐
│     Hotwire Native Framework (Layer 2)  │
│  • Navigator (coordinates navigation)    │
│  • Session (manages web views)          │
│  • Path Configuration (routing rules)   │
│  • Bridge (web-native communication)    │
└─────────────────────────────────────────┘
                    ▲
                    │ Minimal Code
                    ▼
┌─────────────────────────────────────────┐
│        iOS App Code (Layer 3)          │
│  • SceneDelegate (app lifecycle)       │
│  • Bridge Components (native features)  │
│  • Native Screens (when needed)        │
│  • Push notification handling          │
└─────────────────────────────────────────┘
```

## Quick Start Checklist

### Rails Side (You Do This)
- [ ] Add mobile detection helper
- [ ] Create path configuration endpoint
- [ ] Add iOS-specific layouts
- [ ] Configure navigation patterns
- [ ] Test in browser with mobile view

### iOS Side (I'll Do This)
- [ ] Create Xcode project
- [ ] Add Hotwire Native package
- [ ] Configure SceneDelegate
- [ ] Set up Navigator
- [ ] Connect to your Rails app

## Common Questions

### "Do I need to learn Swift?"
No. I'll write all the Swift code. You just need to:
- Tell me your Rails app URL
- Explain your navigation patterns
- Describe what native features you want

### "Will my Rails app still work on web?"
Yes! The same Rails app serves:
- Web browsers (full experience)
- iOS app (native-wrapped experience)
- Future Android app (same approach)

### "How is this different from PWAs?"
- **PWAs**: Web app with some native features
- **Hotwire Native**: Native app with web content
- **Key difference**: Full access to iOS APIs and App Store distribution

### "What about offline?"
Hotwire Native requires internet (like any Rails app). For offline:
- Cache critical pages
- Store essential data locally
- Show friendly offline states

## When to Use Hotwire Native

### Perfect For
- Rails apps that need iOS presence
- Teams without iOS developers
- Rapid mobile deployment
- Apps that change frequently

### Not Ideal For
- Games or graphics-heavy apps
- Offline-first applications
- Apps with complex animations
- Real-time video/audio processing

## Your First Steps

1. **Share your Rails app URL** - I'll create the iOS shell
2. **List your main screens** - I'll configure navigation
3. **Identify native features needed** - Camera? Notifications? 
4. **Pick an app name** - For the App Store

## Key Principles to Remember

1. **Rails owns the logic** - Don't duplicate in iOS
2. **URLs are commands** - Navigation through path configuration
3. **Progressive enhancement** - Web first, native polish
4. **Ship early** - Basic wrapper first, enhance iteratively

## What Success Looks Like

Week 1: Your Rails app running in iOS simulator
Week 2: Navigation patterns configured, basic features working
Week 3: Native enhancements added (camera, push)
Week 4: Submitted to TestFlight for beta testing

## Let's Get Started

Tell me:
1. What's your Rails app URL?
2. Do you have authentication?
3. What are your main screens?
4. Any native features you need?

I'll handle all the iOS complexity. You keep building in Rails.