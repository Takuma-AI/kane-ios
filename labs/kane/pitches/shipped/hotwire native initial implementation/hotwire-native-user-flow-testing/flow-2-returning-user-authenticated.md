# Flow 2: Returning User - Authenticated Sorting

## Test Scenario
**Goal**: Existing user with account opens app to sort new transactions
**User Type**: Authenticated (has existing account and session)
**Expected Duration**: 30 seconds - 2 minutes depending on transactions available

## Expected Flow Sequence

### Step 1: App Launch (Authenticated User)
**Action**: Open KANE iOS app with existing session
**Expected**:
- Check authentication status automatically
- **IF** valid session: Skip to sorting OR complete screen
- **IF** expired session: Navigate to `/sign_in`
- **IF** first launch after install: Navigate to `/sign_in`
- No unnecessary authentication prompts

### Step 2A: Direct to Sorting (Valid Session)
**Action**: Automatic navigation with valid session
**Expected**:
- Navigate directly to `/` (transactions#index)
- Show first unsorted transaction immediately
- Sorting interface ready and responsive
- No intermediate loading screens if possible

### Step 2B: Sign-In Required (Expired/No Session)
**Action**: Land on sign-in screen
**Expected**:
- Clean sign-in form with email/password fields
- Native keyboard integration (not web form feel)
- "Sign In" button styled per KANE design
- Black background, GameFont typography
- Link to sign-up option if needed

### Step 3: Authentication (if required)
**Action**: Enter credentials and submit
**Expected**:
- Form validation and submission
- Loading state during authentication
- **Success**: Navigate to sorting interface
- **Failure**: Clear error messages, stay on form
- Session persistence for future launches

### Step 4: Sorting Interface
**Action**: Automatic navigation after auth (or direct if session valid)
**Expected**:
- **IF** unsorted transactions available: Show sorting interface
- **IF** no new transactions: Navigate to `/complete` screen
- Transaction card displays properly
- Three game buttons active and responsive

### Step 5: Transaction Sorting (if transactions available)
**Action**: Sort through available transactions
**Expected**:
- Same sorting behavior as Flow 1
- Smooth animations between transactions
- Progress indication (subtle, not intrusive)
- Responsive button feedback

### Step 6A: Complete Sorting
**Action**: Sort final transaction
**Expected**:
- Navigate to `/complete` screen
- "Nothing new for you." message
- Buttons in corner (inactive state)
- Option to refresh for new transactions

### Step 6B: No New Transactions
**Action**: Direct navigation if no unsorted transactions
**Expected**:
- Immediate navigation to `/complete` screen
- Clear messaging about status
- Easy way to refresh/check for new transactions

## Previous Sorting Context

### State Preservation
**Expected**:
- App remembers previous sorting decisions
- No re-sorting of previously categorized transactions
- Clear distinction between new and sorted transactions
- Proper filtering of transaction list

### Progress Indicators
**Expected**:
- Subtle indication of how many transactions remain
- No overwhelming progress bars or counters
- Natural completion feeling

## Authentication Edge Cases

### Session Management
**Expected**:
- Sessions persist between app launches
- Graceful handling of expired sessions
- Clear feedback when re-authentication needed
- No unexpected logouts during sorting

### Account States
**Expected**:
- Proper handling of various account states
- Clear messaging for any account issues
- Smooth transitions between authenticated states

## Test Documentation Template

```markdown
## Flow 2 Test Session - [Date]

### Environment  
- Device: [iOS Simulator 15.5 / iPhone 14]
- Rails Server: [localhost:3000 / app.kane.money]
- Account Status: [New session / Existing session / Expired session]
- Previous Data: [Has sorted transactions / Clean account]

### Pre-Test Setup
**Authentication State**: [Signed in / Signed out / Unknown]
**Previous Transactions**: [Number sorted previously]
**Expected Behavior**: [Based on current state]

### Actual Flow Results

#### Step 1: App Launch
**What I did**: Opened KANE app
**What happened**: [Describe authentication check and navigation]
**Session status**: [Auto-signed in / Required sign-in / Error]

#### Step 2: Authentication (if required)
**What I did**: [Entered credentials / Auto-authenticated]
**What happened**: [Describe sign-in process and results]
**Issues**: [Any authentication problems]

#### Step 3: Post-Auth Navigation
**What I did**: [Nothing - automatic]
**What happened**: [Where app navigated after auth]
**Expected vs Actual**: [Compare to expected flow]

[Continue for each step...]

### Authentication-Specific Issues
- [ ] **Session persistence**: Does app remember login between launches?
- [ ] **Auth transitions**: Smooth flow from sign-in to sorting?
- [ ] **Error handling**: Clear messaging for auth failures?
- [ ] **State management**: Proper handling of various account states?

### Sorting Experience Issues
- [ ] **Transaction filtering**: Only shows unsorted transactions?
- [ ] **Progress indication**: Clear sense of remaining work?
- [ ] **Performance**: Fast loading of transaction data?
- [ ] **State preservation**: Remembers previous sorting decisions?

### Overall Assessment
- **Authentication flow**: ✅ Smooth / ❌ Broken / ⚠️ Issues
- **Sorting performance**: ✅ Fast / ❌ Slow / ⚠️ Inconsistent
- **User experience**: [Rate 1-5 and describe]
- **Critical blockers**: [List any showstoppers]
```

## Key Areas for Attention

### Session Management
1. **Persistence**: App should remember authentication
2. **Expiry handling**: Graceful re-authentication when needed
3. **Security**: Proper token/session management
4. **Performance**: Fast authentication checks

### Data Synchronization
1. **Transaction updates**: New transactions since last session
2. **Sorting persistence**: Previous decisions remembered
3. **Progress tracking**: Clear state of completion
4. **Refresh mechanisms**: Easy way to check for updates

### User Experience Continuity
1. **Smooth re-entry**: Minimal friction for returning users
2. **Context preservation**: Pick up where user left off
3. **Performance**: Fast app launch and data loading
4. **Predictable navigation**: Consistent behavior patterns

This flow represents the daily usage pattern for engaged KANE users. It should feel fast, familiar, and frictionless - users should be able to quickly sort new transactions and get on with their day.