# Hotwire Native iOS Development Modules

Complete implementation guide for converting Rails apps to native iOS apps using Hotwire Native.

## Module Loading Strategy

Load modules as needed to preserve token efficiency. Each module is comprehensive and self-contained.

## Available Modules

### Core Setup
- `00-overview.md` - Philosophy and architecture (start here)
- `01-basic-app-setup.md` - iOS project setup
- `02-url-driven-navigation.md` - Path configuration

### Feature Implementation  
- `03-component-communication.md` - Web-native bridge
- `04-bridge-components.md` - Native features (camera, SDKs)
- `05-native-screens.md` - Full native screens when needed

### Navigation Patterns
- `06-tab-navigation.md` - Native tab bars
- `07-authentication-sessions.md` - Auth flows

### Advanced Features
- `08-push-notifications.md` - Push setup
- `09-file-upload-camera.md` - Media handling
- `10-error-handling-recovery.md` - Error states

### Development & Deployment
- `11-testing-debugging.md` - Testing strategies
- `12-deployment-distribution.md` - App Store deployment

## When to Load Modules

Load specific modules based on the task:
- Building new iOS app? Start with 00-02
- Adding native features? Load 04-05
- Implementing tabs? Load 06
- Debugging issues? Load 11

## Remember

Rails does the work. iOS coordinates. Don't load all modules at once - be selective based on current needs.