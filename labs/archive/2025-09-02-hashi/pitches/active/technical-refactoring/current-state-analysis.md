# Current State Analysis - HASHI Codebase

## Architecture Overview

### Tech Stack Reality Check
```
Claimed (in docs):          Actual (in code):
- PostgreSQL               → SQLite
- "No background workers"  → ActiveJob with solid_queue
- "Synchronous"           → Actually async with job polling
```

This suggests rapid iteration where docs didn't keep up with implementation.

## Detailed Code Analysis

### 1. Stimulus Controller Complexity
`app/javascript/controllers/task_input_controller.js` - 500+ lines doing:
- Form validation
- API calls
- UI state management  
- Account switching logic
- Modal handling
- Error display
- Character counting (removed but code remains)

**Product Lab violation**: This should be multiple focused controllers:
- `extraction_controller.js` - Handle the API call
- `account_selector_controller.js` - Account switching
- `modal_controller.js` - Modal display logic

### 2. CSS Architecture Deep Dive

Current Tailwind usage in `home/index.html.erb`:
```erb
<!-- Semantic naming opportunity missed -->
<div class="fixed bottom-6 right-6 bg-[#151515] border border-gray-500 rounded-md px-6 py-3">

<!-- Should be -->
<div class="toast toast--success">
```

Color values hardcoded throughout:
- `bg-[#151515]` appears 12 times
- `border-[#202020]` appears 8 times  
- `text-[#6b6b6b]` appears 6 times

No CSS variables or semantic color system.

### 3. Service Object Analysis

`TodoExtractionService` (Good pattern, poor execution):
```ruby
def extract_and_create_todos
  # Good: Single responsibility
  extraction_result = extract_todos_with_gemini
  create_result = create_todolist_in_basecamp(extraction_result[:data])
  
  # Bad: Complex nested error handling
  if !create_result[:success] && create_result[:dock]
    return { success: false, error: create_result[:error], dock: create_result[:dock] }
  end
end
```

### 4. Routes Analysis

Current routes show evolution of thinking:
```ruby
# Original simple idea
get "bridge" => "home#index"

# Added complexity
post "bridge/extract_todos" => "ai#extract_todos"
get "bridge/extract_todos_status" => "ai#extract_todos_status"

# Test routes left in production code
get "bridge/send_static_fail" => "home#send_static_fail"
get "bridge/send_static_partial" => "home#send_static_partial"
```

### 5. The Hidden Epicenter

Found it! In `TodoExtractionService#extract_todos_with_gemini`:
```ruby
prompt = <<~PROMPT
  You are an AI assistant that extracts actionable todos from unstructured text...
  [FULL PROMPT NOT SHOWN - This is the core IP]
PROMPT
```

This prompt is the magic - must be preserved exactly.

### 6. View Complexity

The main view (`home/index.html.erb`) is 221 lines of:
- Inline Tailwind classes
- JavaScript data attributes mixed with Ruby
- Multiple hidden modals
- Conditional rendering logic

Violates interface-first principle of starting simple.

### 7. Testing Gap

Test files exist but are mostly Rails boilerplate:
```ruby
# test/controllers/home_controller_test.rb
test "should get index" do
  get home_index_url
  assert_response :success
end
```

No tests for:
- The extraction flow
- OAuth authentication
- Error scenarios
- The actual user journey

## Anti-Patterns Found

### 1. Premature Abstraction
Account switching UI built for multiple accounts, but most users have one.

### 2. State Management Chaos
State lives in:
- Stimulus controller values
- Hidden form fields
- JavaScript instance variables
- Rails flash messages
- URL parameters

### 3. Error Handling Inconsistency
- Some errors return JSON
- Some use Turbo Streams
- Some set flash messages
- Some use JavaScript alerts

### 4. Development Artifacts in Production
Test routes, console.logs, commented code throughout.

## Good Patterns to Preserve

### 1. Service Objects
Clean separation of concerns in services/

### 2. Background Jobs  
Proper ActiveJob implementation prevents timeouts

### 3. Security
- CSRF protection properly implemented
- OAuth tokens encrypted
- No credentials in code

### 4. Hotwire Usage
When used, it's used correctly (Turbo Streams for updates)

## The Real Problems

1. **No Design System**: Every element styled individually
2. **JavaScript Doing Too Much**: Business logic in Stimulus
3. **Unclear Information Architecture**: "bridge" vs "extract" vs "todos"
4. **Mixed Paradigms**: REST + custom routes + Turbo Streams
5. **No Clear Conventions**: Each feature built differently

## Recommendations Priority

### Must Fix
1. CSS architecture - establish semantic design system
2. Stimulus controller breakdown - separate concerns
3. Route reorganization - RESTful resources
4. Remove test/debug code

### Should Fix  
1. Consistent error handling
2. Add integration tests
3. Simplify account selection
4. Clean up views

### Nice to Have
1. PostgreSQL migration
2. View components/partials
3. API versioning preparation
4. Development/production parity