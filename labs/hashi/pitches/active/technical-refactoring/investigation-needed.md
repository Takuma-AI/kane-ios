# Investigation Needed - Unknown Unknowns

## Before Starting Refactoring

### 1. OAuth Token Refresh Mechanism
**Question**: How does token refresh work? Is it automatic?
**Where to look**: 
- `app/models/user.rb` - `basecamp_token_valid?` method
- `app/controllers/application_controller.rb` - authentication handling
**Why it matters**: Don't break auth during refactoring

### 2. Background Job Infrastructure
**Question**: Is solid_queue properly configured for production?
**Where to look**:
- `config/queue.yml`
- `config/recurring.yml` 
- Production deployment config
**Why it matters**: Ensures async processing works after refactor

### 3. Error Tracking in Production
**Question**: How are errors currently tracked? Sentry? Rollbar? Logs only?
**Where to look**:
- Gemfile for error tracking gems
- `config/initializers/` for error service setup
- Production environment config
**Why it matters**: Need to preserve error visibility

### 4. Deployment Pipeline
**Question**: How is HASHI deployed? Heroku? AWS? Docker?
**Where to look**:
- `Dockerfile` exists (suggests containerized)
- `Procfile.dev` exists (suggests Heroku-style)
- `kamal` gem included (new Rails deployment tool)
**Why it matters**: Refactoring might affect deployment

### 5. Environment-Specific Code
**Question**: Any production-only features or dev-only hacks?
**Where to look**:
- Environment files in `config/environments/`
- Conditionals checking `Rails.env`
- ENV variable usage
**Why it matters**: Don't break environment-specific behavior

### 6. The "Dock" Mystery
**Found in**: `TodoExtractionService` line 34
```ruby
if !create_result[:success] && create_result[:dock]
  return { success: false, error: create_result[:error], dock: create_result[:dock] }
end
```
**Question**: What is "dock"? Basecamp-specific error type?
**Why it matters**: Might be important error handling

### 7. Account Switching Complexity
**Question**: Why the complex multi-account UI if most have one account?
**Where to look**:
- User feedback or requirements
- `basecampAccountsValue` in Stimulus controller
**Why it matters**: Might be able to simplify significantly

### 8. Test Route Usage
**Found**: Several test routes in production routes file
```ruby
get "test/token_error" => "home#trigger_token_error"
get "bridge/send_static_fail" => "home#send_static_fail"
```
**Question**: Are these used for monitoring or just dev artifacts?
**Why it matters**: Need to know if safe to remove

### 9. Gemini API Key vs Credentials
**Inconsistency found**:
- README mentions Google credentials JSON file
- Code uses simple API key
**Question**: Which is correct for production?
**Why it matters**: Auth method affects deployment

### 10. Character Limit Remnants
**Found**: Removed character limit code but UI references remain
**Question**: Was there a Gemini input limit? Basecamp limit?
**Why it matters**: Might need to restore some validation

## Questions for Product Owner

1. **CSS Framework Decision**: Is Tailwind a requirement or can we move to semantic CSS?

2. **Browser Support**: What browsers must be supported? (Affects CSS approach)

3. **Performance Requirements**: Any specific load time targets?

4. **Accessibility Requirements**: WCAG compliance level needed?

5. **Mobile Usage**: How important is mobile? (Current design is mobile-first)

## Pre-Refactoring Checklist

- [ ] Run full test suite (establish baseline)
- [ ] Document current routes and their usage
- [ ] Screenshot all UI states
- [ ] Verify Gemini prompt hasn't changed
- [ ] Check production logs for actual usage patterns
- [ ] Backup production database
- [ ] Document all ENV variables needed

## Recommendation

Before starting the refactoring, spend 2-3 hours investigating these unknowns. The answers will inform whether surgical refactoring or rebuild is more appropriate.