# Technical Refactoring Pitch - HASHI Foundation Reset

## Problem
HASHI was built quickly with Cursor using familiar technologies without deliberate architectural decisions. While functional, the codebase doesn't embody the Product Lab principles of interface-first development, semantic CSS, and Rails conventions. Setting a stronger foundation now will enable the ambitious features ahead (approach selection, subagents, etc.).

## Current State Analysis

### What's Working Well
- **Background Jobs**: Actually using ActiveJob with solid_queue (not synchronous as thought)
- **Service Objects**: Clean separation with TodoExtractionService
- **OAuth Flow**: Properly implemented with secure token handling
- **Hotwire Usage**: Stimulus controllers and Turbo Streams in place
- **Rails 8**: On latest Rails with modern defaults

### What Needs Rethinking

#### 1. CSS Architecture (Critical)
**Current**: Using Tailwind with utility classes directly in ERB
```erb
<div class="fixed bottom-6 right-6 bg-[#151515] border border-gray-500 rounded-md px-6 py-3">
```

**Product Lab Principle**: Semantic CSS that describes purpose
```erb
<div class="success-toast">
```

**Impact**: Current approach makes the interface hard to understand and maintain. Can't tell what elements do from their classes.

#### 2. Interface-First Development Gap
**Current**: Started with backend logic, bolted on UI
- Complex Stimulus controller (300+ lines) handling too much
- Business logic bleeding into JavaScript
- ERB views with mixed concerns

**Product Lab Principle**: Start with hardcoded views, add behavior later
- Simple ERB with semantic markup
- Progressive enhancement with Hotwire
- Controllers stay thin

#### 3. Route Naming & Organization
**Current**: Mix of naming conventions
```ruby
get "bridge" => "home#index"
get "connect" => "sessions#new"
post "bridge/extract_todos" => "ai#extract_todos"
```

**Rails Convention**: RESTful resources
```ruby
resources :extractions, only: [:new, :create, :show]
resource :session, only: [:new, :create, :destroy]
```

#### 4. Database Environment Mismatch (Critical)
**Current**: SQLite in development, PostgreSQL in production
```ruby
gem "sqlite3", ">= 2.1"  # Development
# But production uses PostgreSQL
```

**Issues This Creates**:
- Different SQL dialects (ILIKE vs LIKE)
- Missing PostgreSQL-specific errors in dev
- Data type differences (arrays, JSON)
- False confidence from passing tests

**Rails Best Practice**: Use the same database everywhere
```ruby
# All environments should use:
gem "pg", "~> 1.1"
```

#### 5. Testing Approach (Non-Existent)
**Current**: Rails-generated boilerplate, zero actual tests
```ruby
# Every test file:
# test "the truth" do
#   assert true
# end
```

**What's Missing**:
- No extraction flow tests
- No OAuth authentication tests  
- No error scenario coverage
- No API integration tests
- No system/feature tests

**Product Lab Principle**: Test what users actually do
- System tests for complete flows
- Service object unit tests
- API stub fixtures for Gemini/Basecamp
- Test the magic, not the framework

### Unknown Unknowns to Investigate

1. **Gemini Prompt Location**: Where is the core extraction prompt that's the "epicenter"? Need to find and preserve this.

2. **Error Handling Patterns**: How are Basecamp API failures handled? Network errors?

3. **Token Refresh Logic**: How does OAuth token refresh work? Is it automatic?

4. **Development/Production Parity**: What environment-specific code exists?

5. **Asset Pipeline**: Is Tailwind being processed correctly for production?

## Solution Approaches

### Option A: Surgical Refactoring (Recommended)
Keep the working core, fix foundational issues:
1. Extract semantic CSS system from current Tailwind usage
2. Simplify Stimulus controller into focused controllers
3. Clean up routes to be RESTful
4. Add proper test coverage
5. Document architectural decisions

**Appetite**: 6 days

### Option B: Interface-First Rebuild
Start fresh with Product Lab principles:
1. Build new ERB views with hardcoded data
2. Extract semantic CSS as we go
3. Port core Gemini logic
4. Add Basecamp integration last
5. Delete old code once working

**Appetite**: 6 days

### Option C: Hybrid Approach
1. Keep services and jobs (they're solid)
2. Rebuild views and controllers from scratch
3. Create new CSS architecture
4. Gradually migrate features

**Appetite**: 4-6 days

## Rabbit Holes to Avoid
- Don't rebuild OAuth (it works)
- Don't change Gemini integration (it's the epicenter)
- Don't add new features during refactoring
- Don't over-engineer for scale

## No-Gos
- No new dependencies beyond Rails defaults
- No JavaScript frameworks
- No complex build tools
- No feature additions

## Success Criteria
- Can understand what any element does from its CSS class
- Views are simple ERB with minimal logic
- Controllers are thin and RESTful  
- New developer could understand structure in 10 minutes
- Tests cover the happy path
- Same features work as before

## Next Steps
1. Find and document the Gemini prompt (epicenter)
2. Map current Tailwind usage to semantic patterns
3. Choose approach based on findings
4. Set up proper test harness
5. Execute refactoring

## Decision Needed
Which approach resonates? The surgical refactoring preserves more work but might carry forward bad patterns. The rebuild is cleaner but requires more trust in our ability to preserve the magic.