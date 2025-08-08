# Chapter 48: Three State Solution

**Book:** Getting Real  
**Section:** Interface Design  
**Mental Model:** Design & Interface  
**Tags:** #interface-design #user-states #edge-cases #comprehensive-design #user-experience

## Core Concept

**Design for regular, blank, and error states.** For each screen, you need to consider three possible states:

1. **Regular** - The screen people see when everything's working fine and your app is flush with data.
2. **Blank** - The screen people see when using the app for the first time, before data is entered.
3. **Error** - The screen people see when something goes wrong.

## The Overlooked States

"The regular state is a no-brainer. This is the screen where you'll spend most of your time. But don't forget to invest time on the other states too."

Most designers focus exclusively on the regular state because:
- It's what they see most often during development
- It's the "ideal" version of the screen
- It's what demos well
- It's the most visually appealing

But this leaves critical gaps in the user experience.

## Mental Model: Complete State Design

**Traditional Thinking:** Design for the happy path when everything works perfectly.

**Getting Real Thinking:** Design for all states users will actually encounter.

### Decision Framework

For every screen ask:
1. **What does this look like with data?** (Regular)
2. **What does this look like without data?** (Blank)
3. **What does this look like when things break?** (Error)

### Key Insight

Users judge your app most harshly in blank and error states. These states deserve as much design attention as the regular state.

## Why Each State Matters

### Regular State
- Where users spend most time
- Must be efficient and clear
- The "promised land" of functionality
- What you're selling

### Blank State
- Critical first impression
- Onboarding opportunity
- Sets expectations
- Determines if users continue

### Error State
- Tests user trust
- Shows product polish
- Prevents abandonment
- Differentiates from competitors

## Real-World Application

### Regular State Design
- Optimize for efficiency
- Show full functionality
- Handle data elegantly
- Enable power user features

### Blank State Design
- Welcome new users
- Provide guidance
- Show possibilities
- Reduce intimidation

### Error State Design
- Explain what went wrong
- Provide next steps
- Maintain user confidence
- Prevent panic

## Common Mistakes

### Ignoring Blank States
- Showing empty tables
- Cryptic empty screens
- No guidance for new users
- Missing onboarding

### Poor Error States
- Technical jargon
- Dead ends
- Blaming users
- No recovery path

### Inconsistent States
- Different design languages
- Mismatched tone
- Varying quality levels
- Confusing transitions

## The State Transition Flow

Users move between states:
- **Blank → Regular**: Through successful onboarding
- **Regular → Error**: When something fails
- **Error → Regular**: Through recovery
- **Any → Blank**: Through data deletion or reset

Each transition needs design consideration.

## Design Principles for All States

### Consistency
- Maintain visual language
- Keep navigation stable
- Use consistent tone
- Preserve brand identity

### Clarity
- Make state obvious
- Explain current situation
- Provide clear actions
- Set proper expectations

### Helpfulness
- Guide users forward
- Prevent dead ends
- Offer assistance
- Build confidence

## Testing the Three States

### Regular State Testing
- Full functionality
- Performance under load
- Edge cases with data
- Power user workflows

### Blank State Testing
- First-time user experience
- Onboarding flow
- Time to first value
- Confusion points

### Error State Testing
- Common failure scenarios
- Recovery processes
- Error message clarity
- User confidence maintenance

## Signs of Good Three-State Design

- Users know what to do in any state
- Transitions feel natural
- No dead ends exist
- Each state feels polished
- Users remain confident throughout

## Implementation Strategy

1. **Map all screens** that need three-state design
2. **Design regular state** first for functionality
3. **Create blank state** with onboarding in mind
4. **Design error states** for common failures
5. **Test transitions** between states
6. **Polish all states** to equal quality

## The Investment Return

Time spent on blank and error states pays off through:
- Higher conversion rates
- Lower support burden
- Better user satisfaction
- Competitive differentiation
- Reduced abandonment

## Related Concepts

- Chapter 49: The Blank Slate (deep dive on blank state)
- Chapter 50: Get Defensive (error state design)
- Chapter 46: Interface First (comprehensive design thinking)
- Chapter 78: Zero Training (states should be self-explanatory)