# Flow 3: Refresh for New Transactions

## Test Scenario
**Goal**: User has completed sorting and wants to check for new transactions
**User Type**: Authenticated user who reached "Nothing new" state
**Expected Duration**: 10-30 seconds depending on new transaction availability

## Expected Flow Sequence

### Step 1: Complete State
**Action**: User is on `/complete` screen after finishing sorting
**Expected**:
- "Nothing new for you." message displayed
- Game buttons in corner (inactive/dimmed state)
- Clear indication that all current transactions are sorted
- Some mechanism to refresh/check for new transactions

### Step 2: Initiate Refresh
**Action**: User triggers refresh for new transactions
**Expected Options**:
- **Pull-to-refresh gesture** (native iOS pattern)
- **Refresh button** somewhere on screen
- **Automatic refresh** after time period
- **Tap on inactive buttons** as refresh trigger
**Expected Behavior**:
- Clear visual feedback that refresh is happening
- POST request to `/transactions/refresh`
- Loading state during refresh

### Step 3: Refresh Processing
**Action**: System checks for new transactions
**Expected**:
- Loading indicator (spinner, animation, etc.)
- Brief pause while checking bank data
- Maintain KANE visual design during loading
- No jarring transitions or white flashes

### Step 4A: New Transactions Found
**Action**: Refresh discovers unsorted transactions
**Expected**:
- Navigate back to `/` (transactions#index)
- Show first new transaction in sorting interface
- Clear indication these are "new" transactions
- Smooth transition from complete to sorting state
- Resume normal sorting flow

### Step 4B: No New Transactions
**Action**: Refresh finds no new transactions
**Expected**:
- Stay on `/complete` screen
- Brief feedback indicating "Still nothing new"
- Return to complete state visual design
- No jarring "failed" or error messaging
- Maybe timestamp of last check

### Step 5: Continue Sorting (if new transactions)
**Action**: User sorts newly found transactions
**Expected**:
- Normal sorting flow resumes
- New transactions mixed appropriately with any remaining old ones
- Progress indication if multiple new transactions
- Same sorting UX as previous flows

### Step 6: Return to Complete
**Action**: User finishes sorting any new transactions
**Expected**:
- Return to `/complete` screen
- Updated "Nothing new" state
- Refresh mechanism ready for next use
- Cycle can repeat as needed

## Refresh Mechanisms

### Native iOS Patterns
**Pull-to-Refresh**:
- Standard iOS gesture from top of screen
- Built-in UIRefreshControl behavior
- Native animation and feedback
- Works with KANE's visual design

**Button-Based Refresh**:
- Explicit refresh button or control
- Clear visual feedback when pressed
- Styled to match KANE's game aesthetic
- Positioned logically within complete screen

**Gesture-Based Refresh**:
- Tap on inactive buttons to refresh
- Double-tap screen to refresh
- Custom gesture that feels natural
- Clear affordance that action is available

### Automatic Behaviors
**Time-Based Refresh**:
- Automatic check after time period
- Background refresh when app becomes active
- Smart timing based on user patterns
- Non-intrusive background behavior

## Error Handling

### Network Issues
**Expected**:
- Graceful handling of offline state
- Clear messaging about connectivity
- Retry mechanisms for failed requests
- Fallback to cached state if needed

### API Failures
**Expected**:
- Clear but non-alarming error messages
- Retry options for users
- Fallback to previous state
- No breaking of complete screen state

### Rate Limiting
**Expected**:
- Appropriate handling of API rate limits
- Clear messaging about timing restrictions
- Prevent spam refreshing
- Smooth user experience despite limits

## Test Documentation Template

```markdown
## Flow 3 Test Session - [Date]

### Environment
- Device: [iOS Simulator 15.5 / iPhone 14]
- Rails Server: [localhost:3000 / app.kane.money]
- Account: [Authenticated with sorted transactions]
- Refresh Method: [Pull-to-refresh / Button / Auto]

### Pre-Test Setup
**Starting State**: On `/complete` screen with all transactions sorted
**Expected New Transactions**: [None / Some / Many / Unknown]
**Refresh Mechanism Available**: [Describe what you see]

### Actual Flow Results

#### Step 1: Complete State Analysis
**What I see**: [Describe complete screen exactly]
**Refresh options**: [What refresh mechanisms are visible/available]
**Visual state**: [Button states, messaging, overall feel]

#### Step 2: Refresh Initiation
**What I did**: [Describe how you triggered refresh]
**Immediate feedback**: [Visual response to refresh action]
**Loading indication**: [How system shows refresh is happening]

#### Step 3: Refresh Processing
**Loading experience**: [Duration, visual feedback, user feedback]
**Network activity**: [Any visible network indicators]
**Visual stability**: [Any UI jumps, flashes, or inconsistencies]

#### Step 4: Refresh Results
**Outcome**: [New transactions found / No new transactions]
**Navigation**: [Where did app go after refresh]
**Messaging**: [Any feedback to user about results]
**Transition quality**: [Smooth / Jarring / Broken]

[Continue based on results...]

### Refresh Mechanism Issues
- [ ] **Discoverability**: Is it clear how to refresh?
- [ ] **Feedback**: Clear indication that refresh is happening?
- [ ] **Performance**: Reasonable speed for refresh operation?
- [ ] **Error handling**: Graceful handling of failures?

### User Experience Issues
- [ ] **Navigation flow**: Smooth transitions between states?
- [ ] **Visual consistency**: KANE design maintained throughout?
- [ ] **Intuitive operation**: Refresh feels natural and expected?
- [ ] **State management**: Proper handling of various refresh outcomes?

### Technical Issues
- [ ] **Network handling**: Proper offline/online behavior?
- [ ] **API integration**: Correct interaction with Rails backend?
- [ ] **Performance**: No unnecessary delays or blocking?
- [ ] **Memory management**: No leaks or growing memory usage?

### Overall Assessment
- **Refresh mechanism**: ✅ Intuitive / ❌ Confusing / ⚠️ Issues
- **Performance**: ✅ Fast / ❌ Slow / ⚠️ Inconsistent
- **User experience**: [Rate 1-5 and describe]
- **Critical issues**: [List any blockers or major problems]
```

## Key Areas for Attention

### User Experience
1. **Discoverability**: Users should easily understand how to refresh
2. **Feedback**: Clear indication of refresh status and results
3. **Performance**: Refresh should feel fast and responsive
4. **Consistency**: Maintain KANE's visual design throughout

### Technical Integration
1. **Rails API**: Proper integration with refresh endpoint
2. **State management**: Correct handling of transaction states
3. **Navigation**: Smooth transitions between complete and sorting
4. **Error resilience**: Graceful handling of various failure modes

### iOS Native Patterns
1. **Pull-to-refresh**: Use standard iOS gesture if implemented
2. **Loading states**: Native iOS loading indicators and feedback
3. **Gesture recognition**: Responsive and accurate touch handling
4. **Background processing**: Proper app lifecycle management

This flow represents the daily habit formation aspect of KANE - users should be able to quickly check for and sort new transactions as part of their routine. The refresh mechanism should feel natural and encourage regular engagement without being intrusive or demanding.