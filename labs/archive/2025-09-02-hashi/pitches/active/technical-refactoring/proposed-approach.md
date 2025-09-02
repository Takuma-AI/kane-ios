# Proposed Refactoring Approach

## Recommendation: Surgical Refactoring with CSS Foundation Reset

After analyzing the codebase, I recommend the **Surgical Refactoring** approach with a focus on establishing proper CSS architecture first. The core functionality works - we need to set foundations for sustainable growth.

## Phase 1: CSS Architecture (Day 1-2)

### Current State to Target State
```scss
// FROM: Inline Tailwind everywhere
<div class="fixed bottom-6 right-6 bg-[#151515] border border-gray-500">

// TO: Semantic component classes
<div class="toast toast--success">
```

### Implementation Plan

1. **Extract Design Tokens**
   ```scss
   // app/assets/stylesheets/config/colors.scss
   :root {
     --color-background: #0d0d0d;
     --color-surface: #151515;
     --color-border: #202020;
     --color-text-muted: #6b6b6b;
   }
   ```

2. **Create Component Library**
   ```scss
   // app/assets/stylesheets/components/toast.scss
   .toast {
     position: fixed;
     bottom: 1.5rem;
     right: 1.5rem;
     background: var(--color-surface);
     border: 1px solid var(--color-border);
     // etc...
   }
   ```

3. **Semantic Naming Pattern**
   - Components: `.extraction-form`, `.project-selector`
   - States: `.extraction--processing`, `.toast--error`
   - Elements: `.extraction__textarea`, `.project-selector__dropdown`

## Phase 2: Stimulus Decomposition (Day 2-3)

### Split the Monolith
Current: `task_input_controller.js` (500+ lines)

Target:
```
controllers/
├── extraction_controller.js    # API calls, processing state
├── project_selector_controller.js   # Account/project selection
├── modal_controller.js         # Generic modal behavior
└── form_validation_controller.js    # Input validation
```

### Example Decomposition
```javascript
// extraction_controller.js - Just handles extraction
export default class extends Controller {
  static targets = ["input", "submitButton"]
  
  async extract() {
    const text = this.inputTarget.value
    // Dispatch event for other controllers
    this.dispatch("extraction:started", { detail: { text } })
    
    // API call logic
    const result = await this.performExtraction(text)
    
    // Dispatch completion
    this.dispatch("extraction:completed", { detail: result })
  }
}
```

## Phase 3: RESTful Routes (Day 3-4)

### Current to Target Mapping
```ruby
# FROM:
post "bridge/extract_todos" => "ai#extract_todos"
get "bridge/extract_todos_status" => "ai#extract_todos_status"

# TO:
resources :extractions, only: [:new, :create, :show] do
  member do
    get :status
  end
end
```

### Controller Reorganization
```ruby
# app/controllers/extractions_controller.rb
class ExtractionsController < ApplicationController
  def new
    # Current home#index logic
  end
  
  def create
    # Current ai#extract_todos
  end
  
  def status
    # Current ai#extract_todos_status  
  end
end
```

## Phase 4: Database Alignment & Testing (Day 4-5)

### Standardize on PostgreSQL
```ruby
# Gemfile
- gem "sqlite3", ">= 2.1"
+ gem "pg", "~> 1.1"

# config/database.yml
development:
  adapter: postgresql
  encoding: unicode
  database: hashi_development
  pool: 5
```

### Docker Compose for Development
```yaml
# docker-compose.yml
version: '3'
services:
  db:
    image: postgres:15
    environment:
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

volumes:
  postgres_data:
```

## Phase 5: Test Suite Creation (Day 5)

### Testing Philosophy
Not just coverage - test the actual user journey and the magic moments.

### 1. System Tests - The Complete Flow
```ruby
# test/system/extraction_flow_test.rb
class ExtractionFlowTest < ApplicationSystemTestCase
  setup do
    @user = users(:kate)
    sign_in_as @user
    stub_basecamp_api
    stub_gemini_api
  end

  test "complete extraction from meeting notes to Basecamp" do
    visit new_extraction_path
    
    # Test the actual user experience
    fill_in "text", with: meeting_notes_fixture
    select "Q1 Planning", from: "project"
    
    click_button "Send to Basecamp"
    
    # Verify processing state
    assert_text "Creating tasks in Basecamp..."
    
    # Wait for completion
    assert_text "Tasks sent!", wait: 10
    
    # Verify the magic happened
    assert_basecamp_received_structured_todos
  end

  test "handles Gemini timeout gracefully" do
    stub_gemini_timeout
    # ... test error handling
  end
end
```

### 2. Service Object Tests
```ruby
# test/services/todo_extraction_service_test.rb  
class TodoExtractionServiceTest < ActiveSupport::TestCase
  test "preserves HTML formatting in descriptions" do
    service = TodoExtractionService.new(user, transcript, project_id, todoset_id, account_id)
    result = service.extract_todos_with_gemini
    
    # The magic: HTML drafts preserved
    assert_match /<h1>Objective/, result[:data]["groups"][0]["tasks"][0]["description"]
    assert_match /fully drafted email/, result[:data]["groups"][0]["tasks"][0]["description"]
  end

  test "groups tasks into milestones" do
    # Test the milestone philosophy
  end
end
```

### 3. API Integration Tests
```ruby
# test/integration/basecamp_api_test.rb
class BasecampApiTest < ActionDispatch::IntegrationTest
  test "creates nested todos with groups" do
    VCR.use_cassette("basecamp_todo_creation") do
      # Test actual API integration
    end
  end
end
```

### 4. JavaScript Tests
```ruby
# test/system/javascript_test.rb
class JavaScriptTest < ApplicationSystemTestCase
  test "project selector updates on account change" do
    # Test Stimulus controller behavior
  end
end
```

### Test Fixtures & Helpers
```ruby
# test/fixtures/meeting_transcripts.yml
investor_update:
  content: |
    We need to send investor update by Thursday.
    Include metrics from Q4, highlight the new hires,
    and mention the upcoming product launch.

# test/support/api_stubs.rb
def stub_gemini_api
  # Return realistic extraction results
end

def stub_basecamp_api  
  # Mock Basecamp responses
end
```

### Architecture Decision Records
Create `docs/architecture/decisions/` with:
- 001-semantic-css-over-utility.md
- 002-stimulus-over-react.md
- 003-restful-routes.md
- 004-postgresql-everywhere.md

## Phase 6: Polish & Deploy (Day 6)

### Cleanup Tasks
- Remove test routes from production
- Delete commented code
- Update README with new architecture
- Configure proper error tracking
- Run full test suite on PostgreSQL

### Deployment Checklist
- [ ] All tests passing
- [ ] CSS components documented
- [ ] Routes are RESTful
- [ ] Stimulus controllers focused
- [ ] Production secrets configured

## What We're NOT Doing

1. **Not touching the Gemini prompt** - It's the epicenter
2. **Not changing OAuth** - It works perfectly
3. **Not adding features** - Pure refactoring
4. **Not switching technologies** - Rails + Hotwire stays

## Success Metrics

Before refactoring:
- 500+ line Stimulus controller
- Inline Tailwind everywhere
- Mixed routing conventions
- No meaningful tests

After refactoring:
- No Stimulus controller over 100 lines
- Semantic CSS components
- RESTful routes throughout
- System tests for happy path
- New developer can understand in 10 minutes

## Risk Mitigation

1. **Keep old code running** - Branch, don't break
2. **Test extraction flow constantly** - The magic must work
3. **Visual regression testing** - Screenshots before/after
4. **Incremental deployment** - Feature flags if needed

## Decision Point

This surgical approach:
- Preserves all working code
- Establishes proper foundations
- Can be done in 6 days
- Sets up for future features

Ready to proceed?