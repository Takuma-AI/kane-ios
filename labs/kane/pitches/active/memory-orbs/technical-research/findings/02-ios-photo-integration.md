# iOS Photo Library Integration - Research Findings

## Executive Summary
iOS provides robust but privacy-focused photo access. Can access timestamps and location without seeing photos. On-device processing recommended for privacy.

## Permission Model (iOS 14+)

### Three Levels
1. **No access**
2. **Selected photos only** (Limited Access)
3. **Full library access**

### PHPickerViewController (Recommended)
- Runs in separate process
- App never sees unselected photos
- Memory efficient with deferred loading
- **Source**: https://christianselig.com/2020/09/phpickerviewcontroller-efficiently/

## Metadata Without Photo Access

### Available Through PHAsset
```swift
let timestamp = asset.creationDate
let location = asset.location  
let dimensions = CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
```
- No need to download actual image
- Works even for iCloud photos
- **Source**: https://stackoverflow.com/questions/24462112/ios-8-photos-framework-access-photo-metadata

### Requires Full Image
- Complete EXIF data
- Custom metadata
- OCR/text recognition

## Performance Optimization

### Memory Management
- **Downsampling**: Reduce memory by 80-90%
- **Thumbnail loading**: 512px max for initial processing
- **Background processing**: Use DispatchQueue.global()
- **Source**: https://medium.com/codex/ios-downsampling-for-improved-performance-ed03b5e7627e

### Large Library Handling
- iOS Optimize Storage reduces to 10-20% of full size
- Vision framework processes 5,000+ object classes at 90%+ accuracy
- Neural Engine dramatically faster than CPU

## Privacy-Preserving Approaches

### Apple's Implementation
- **Enhanced Visual Search**: Homomorphic encryption
- **On-device matching**: Photos never leave device
- **OHTTP Relay**: Hides IP addresses
- **Source**: https://www.apple.com/privacy/features/

### Receipt Processing
- Vision framework for on-device OCR
- NSDataDetector for dates, amounts
- Process only high-confidence (>0.8) detections

## Implementation Strategy

### Phase 1: Privacy-First
1. Use PHPickerViewController for user-selected photos
2. Extract basic metadata without downloading
3. On-device Vision framework for receipts

### Phase 2: Enhanced Matching
1. Request limited library access with clear justification
2. Process only photos within transaction timeframes
3. Use downsampling for performance

### Phase 3: Power Users
1. Full library access for opt-in users
2. Core ML for sophisticated matching
3. All processing remains on-device

## Key WWDC Resources
- [WWDC20 - Meet the new Photos picker](https://developer.apple.com/videos/play/wwdc2020/10652/)
- [WWDC23 - Embed the Photos Picker](https://developer.apple.com/videos/play/wwdc2023/10107/)

## Implications for Memory Orbs

### What's Possible
- Match transaction timestamps to photo timestamps
- Extract location from photos to correlate with purchases
- Detect receipt photos for line-item extraction
- Show photos from purchase day without full access

### Privacy Constraints
- Start with picker, not full library access
- Process on-device whenever possible
- Request minimal permissions
- Build trust before asking for more access