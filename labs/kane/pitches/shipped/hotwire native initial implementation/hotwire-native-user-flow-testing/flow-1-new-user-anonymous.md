# Flow 1: New User - Anonymous Sorting

## Test Scenario
**Goal**: First-time user opens KANE app and tries sorting without creating account first
**User Type**: Anonymous (no authentication)
**Expected Duration**: 2-3 minutes for complete flow

## Expected Flow Sequence

### Step 1: App Launch
**Action**: Open KANE iOS app
**Expected**: 
- App launches to `/` (transactions#index)
- **IF** no transactions available: Redirect to `/connect` (connect screen)
- **IF** demo/sample transactions available: Show sorting interface
- Black background, no white navigation bars
- Smooth launch animation

### Step 2: Connect Screen (if no transactions)
**Action**: Land on connect screen
**Expected**:
- Single "Connect" button centered on screen
- Black background (#0A0A0A)
- GameFont typography
- Button styled as large circle per KANE design
- No web navigation elements visible

### Step 3: Initiate Bank Connection
**Action**: Tap "Connect" button
**Expected**:
- Button shows active state (scale animation)
- Plaid Link modal opens within the app
- Modal should be native-feeling, not web-iframe-like
- Background remains KANE black

### Step 4: Plaid OAuth Flow
**Action**: Complete bank authentication in Plaid modal
**Expected**:
- Standard Plaid interface for bank selection and login
- OAuth redirects handle properly within modal
- Modal stays contained within KANE app
- No external browser launches

### Step 5: OAuth Completion
**Action**: Successfully link bank account
**Expected**:
- **CRITICAL**: Modal automatically closes/dismisses
- Navigate to `/loading` screen
- NO redirect to external app or browser
- Smooth transition from modal close to loading screen

### Step 6: Loading Screen
**Action**: Automatic progression from Plaid completion
**Expected**:
- "Loading..." text with dimmed game buttons
- Black background maintained
- Buttons visible but inactive (not clickable)
- Automatic progression when transactions loaded

### Step 7: Sorting Interface
**Action**: Automatic navigation when loading complete
**Expected**:
- First transaction displayed in circular card
- Three game buttons active and responsive
- Need (blue), Want (green), Kill (red) buttons
- Transaction shows: date, merchant, amount
- Smooth animation entrance

### Step 8: Transaction Sorting
**Action**: Tap one of the three sorting buttons (Need/Want/Kill)
**Expected**:
- Immediate visual feedback (button scale animation)
- Transaction card fades out
- Next transaction fades in (if available)
- Smooth, game-like animation timing
- No page refreshes or jarring transitions

### Step 9: Complete All Sorting
**Action**: Sort final transaction
**Expected**:
- Navigate to `/complete` screen
- "Nothing new for you." message
- Buttons in corner (inactive state)
- Feeling of completion/accomplishment

### Step 10: Account Creation Prompt (Anonymous User)
**Action**: Automatic or triggered prompt
**Expected**:
- Modal or screen prompting to save progress
- Option to create account with email/password
- Option to continue anonymously (if possible)
- Clear value proposition for creating account

## Test Documentation Template

```markdown
## Flow 1 Test Session - [Date]

### Environment
- Device: [iOS Simulator 15.5 / iPhone 14]
- Rails Server: [localhost:3000 / app.kane.money]
- App Version: [Current build]

### Actual Flow Results

#### Step 1: App Launch
**What I did**: Opened KANE app
**What happened**: [Describe exactly what you see]
**Issues**: [Any problems noted]

#### Step 2: Connect Screen  
**What I did**: [Describe your action]
**What happened**: [Describe what you see]
**Issues**: [Any problems noted]

[Continue for each step...]

### Critical Issues Identified
- [ ] **Plaid modal dismissal**: Does modal close properly after OAuth?
- [ ] **Navigation flow**: Any wrong redirects or broken progression?
- [ ] **UI consistency**: White bars, wrong colors, web elements?
- [ ] **Animation quality**: Smooth or janky transitions?
- [ ] **Account creation**: Clear and accessible?

### Overall Assessment
- **Flow completion**: ✅ Success / ❌ Blocked / ⚠️ Issues
- **User experience**: [Rate 1-5 and describe]
- **Critical blockers**: [List any showstoppers]
- **Polish needed**: [List UI/UX improvements needed]
```

## Key Areas for Attention

### Critical Path Elements
1. **Plaid OAuth completion**: Must dismiss modal and navigate correctly
2. **Transaction loading**: Should be smooth and fast
3. **Sorting interactions**: Must feel responsive and game-like
4. **Navigation consistency**: No unexpected redirects

### Native App Specific
1. **Modal behavior**: Plaid should feel native, not web-iframe
2. **Navigation bars**: Should be completely hidden
3. **Transitions**: No white flashes between screens
4. **Touch responsiveness**: Immediate feedback on taps

### KANE Brand Experience
1. **Color consistency**: Black background throughout
2. **Typography**: GameFont loaded and rendering
3. **Button styling**: Circular game controller aesthetic
4. **Animation quality**: Smooth, deliberate, game-like

This flow represents the core value proposition of KANE - seamless connection to banking data and immediate sorting experience. Any friction here significantly impacts user acquisition and retention.