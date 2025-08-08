# Magic Link Authentication

## Problem
Users lose access to their financial data when cookies expire or are cleared. The current session-based approach using Plaid account IDs provides no recovery method. Each browser restart risks losing connection to bank accounts, forcing users to reconnect through Plaid repeatedly.

## Forces at Play
- Push: Frustration of re-connecting bank accounts after every cookie clear
- Pull: Seamless return to sorting transactions across devices and sessions
- Anxiety: "What if I enter the wrong email?" or "What if the email doesn't arrive?"
- Habit: People expect password-based login or social auth

## Appetite
2 days

## Solution
Implement persistent magic link authentication that requires email entry only once per device. After clicking the magic link, users stay logged in indefinitely (like Slack).

### Key Screens
1. **Email Entry**: Single email field with "Send Magic Link" button
2. **Check Email**: Confirmation screen while user checks email
3. **Magic Link Landing**: User clicks link, gets redirected to app

### Implementation Approach
- User model with email and session token
- Permanent encrypted cookie for persistent sessions
- Link accounts to users (not sessions)
- Simple email templates for magic links

### User Flow
```
First Visit → Enter Email → Check Email → Click Link → Permanent Login
                                ↓
                        Link expires after 15 min
Returning Visit → Already Logged In (via permanent cookie)
                        ↓
                  Cookie deleted?
                        ↓
                  Enter Email Again
```

## Rabbit Holes
- Complex email verification flows
- Password reset functionality (not needed)
- Multi-factor authentication
- Session management UI
- Email delivery optimization

## No-Goes
- No passwords at all
- No OAuth/social login for v1
- No user profile pages
- No session timeout (stay logged in forever)
- No account management beyond email

## Success
Users can clear cookies and still recover their accounts by entering their email. Cross-device access just works. The auth system becomes invisible after first use.