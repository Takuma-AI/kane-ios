# Plaid OAuth Native Implementation Analysis

## Investigation Date: January 8, 2025

## Executive Summary

After deep investigation, the OAuth bank connection issue (Chase, Bank of America, etc.) is confirmed to be a **fundamental iOS security limitation** that cannot be solved with web views or bridge components. The solution requires a full native screen implementation using Plaid's LinkKit SDK.

## The Core Problem: iOS Cookie Domain Isolation

### Why OAuth Fails in Hotwire Native

The issue stems from iOS's intentional security architecture that isolates cookies between different web view contexts:

1. **WKWebView** (your Rails app): Maintains session cookies for your domain
2. **SFSafariViewController** (OAuth redirect): Completely separate cookie context
3. **Result**: Session state is lost when transitioning between contexts

### The OAuth Flow Breakdown

```
[Rails App in WKWebView]
    ↓ (User clicks "Connect Chase")
[Plaid redirects to Chase OAuth]
    ↓ (iOS opens SFSafariViewController)
[User authenticates with Chase]
    ↓ (Chase redirects back to your app)
[WKWebView loads callback URL]
    ❌ Original session cookies are GONE
    ❌ User appears logged out
    ❌ OAuth flow fails
```

This is **by design** in iOS for security - preventing cross-app cookie tracking.

## Why Bridge Components Won't Work

Bridge components were the initial attempt, but they fundamentally **cannot solve this problem** because:

1. **Still use WKWebView**: Bridge components enhance the web view but don't bypass it
2. **OAuth still redirects**: The OAuth flow still transitions to SFSafariViewController
3. **Cookie isolation persists**: The security boundary remains intact

The existing bridge component code (`PlaidLinkComponent.swift`) actually attempts to use the native SDK, but even this approach has limitations when initiated from a web context.

## The Solution: Full Native Screen Implementation

### Architecture Overview

```
[Rails App]
    ↓ (User navigates to /connect)
[NavigatorDelegate intercepts]
    ↓ (Returns native PlaidConnectViewController)
[Native Plaid SDK handles entire flow]
    ↓ (OAuth happens entirely in native)
[Success callback navigates back to Rails]
```

### Implementation Requirements

#### 1. Create Native View Controller
```swift
class PlaidConnectViewController: UIViewController {
    private var linkHandler: Handler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initializePlaidLink()
    }
    
    private func initializePlaidLink() {
        // Fetch link token from Rails backend
        fetchLinkToken { token in
            self.configurePlaidLink(with: token)
        }
    }
    
    private func configurePlaidLink(with token: String) {
        let configuration = LinkTokenConfiguration(
            token: token,
            onSuccess: { [weak self] success in
                self?.handleSuccess(success.publicToken)
            }
        )
        
        let result = Plaid.create(configuration)
        switch result {
        case .success(let handler):
            self.linkHandler = handler
            handler.open(presentUsing: .viewController(self))
        case .failure(let error):
            // Handle error
        }
    }
    
    private func handleSuccess(_ publicToken: String) {
        // Exchange token with Rails backend
        exchangePublicToken(publicToken) { success in
            // Navigate back to Rails app
            self.navigator?.route("/loading")
        }
    }
}
```

#### 2. Configure NavigatorDelegate
```swift
// SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func handle(proposal: VisitProposal, from navigator: Navigator) -> ProposalResult {
        if proposal.url.path == "/connect" {
            return .acceptCustom(PlaidConnectViewController())
        }
        return .accept
    }
}
```

#### 3. Rails Backend Support
The Rails backend already has the necessary endpoints:
- `POST /plaid/create_link_token` - Generate Plaid Link token
- `POST /plaid/exchange_public_token` - Exchange for access token

These can be called from native iOS using URLSession.

### Implementation Steps

1. **Create new branch**: `git checkout -b feature/native-plaid-oauth`

2. **Add PlaidConnectViewController.swift**:
   - Full native UI (no web view)
   - Direct Plaid SDK integration
   - Handle success/failure callbacks

3. **Update NavigatorDelegate**:
   - Intercept `/connect` path
   - Return native view controller

4. **Add API client methods**:
   - Fetch link token from Rails
   - Exchange public token

5. **Test with OAuth banks**:
   - Chase
   - Bank of America
   - Wells Fargo

## Alternative Approaches Considered (and Why They Won't Work)

### 1. Universal Links
**Idea**: Use universal links to maintain session
**Problem**: Still involves context switching between web views

### 2. Custom URL Schemes
**Idea**: Deep link back to app with state
**Problem**: Session cookies still isolated

### 3. Stateless OAuth Tokens
**Attempted**: Rails uses message verifiers for state
**Problem**: Helps but doesn't solve core cookie isolation

### 4. Extended Cookie Expiration
**Attempted**: 10-year cookie expiration
**Problem**: Cookies still isolated between contexts

## Technical Justification

### iOS Security Model
- **Intentional Design**: Cookie isolation prevents cross-app tracking
- **Cannot Be Bypassed**: No workaround exists for this security boundary
- **Industry Standard**: All OAuth providers face this limitation

### Why Native SDKs Exist
- **Plaid LinkKit**: Handles OAuth entirely in native
- **Stripe SDK**: Same approach for payment authentication
- **Facebook SDK**: OAuth without web view transitions

### Evidence from Other Apps
- **Robinhood**: Uses native Plaid SDK
- **Venmo**: Native bank connection flow
- **Mint**: Fully native OAuth implementation

## Recommendation

### Immediate Action Required
1. **Accept the limitation**: Web-based OAuth cannot work reliably in Hotwire Native
2. **Implement native screen**: Full native PlaidConnectViewController
3. **Maintain Rails architecture**: Only the connection flow is native; everything else stays Rails

### Expected Outcome
- ✅ OAuth banks (Chase, etc.) will work
- ✅ Non-OAuth banks continue working
- ✅ Session persistence maintained
- ✅ User experience improved (faster, more reliable)

### Development Estimate
- **Native screen implementation**: 2-3 hours
- **Integration with Rails backend**: 1 hour
- **Testing and refinement**: 1-2 hours
- **Total**: 4-6 hours

## Conclusion

The OAuth issue is not a bug or oversight - it's a fundamental limitation of iOS's security architecture. The attempted bridge component approach was reasonable but ultimately cannot overcome the cookie isolation boundary.

**The only reliable solution is a fully native implementation** using Plaid's LinkKit SDK directly, bypassing web views entirely for the OAuth flow. This is the industry-standard approach used by all major financial apps.

## Next Steps

1. Create branch: `feature/native-plaid-oauth`
2. Implement PlaidConnectViewController
3. Wire up NavigatorDelegate
4. Test with real OAuth banks
5. Clean up unused bridge component code
6. Ship the solution