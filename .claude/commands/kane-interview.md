# Kane Interview Simulation

## Command
`kane-interview [persona-name]`

## Description
Conducts a Kane-style interview with one of the simulation personas, analyzing their transaction data and surfacing patterns they can't see themselves.

## Usage
```bash
# Interview a specific persona
kane-interview sarah    # Creative Paralysis
kane-interview marcus   # Optimization Obsession  
kane-interview priya    # Identity Juggler
kane-interview james    # Success Theater
kane-interview alex     # Transition Chaos

# List all personas
kane-interview list
```

## Interview Protocol

When interviewing a persona, you should:

1. **Start with pride/regret**
   - "Looking at your recent transactions, what purchase are you most proud of?"
   - "What's one you regret?"

2. **Explore specific patterns**
   - "I notice you spend $[X] every Sunday night on [pattern]. Tell me about Sundays."
   - "There's a cluster of purchases around [time/event]. What's happening there?"

3. **Surface hidden jobs**
   - "Your Adobe subscription hasn't been used in 3 months but you keep it. What job is it doing?"
   - "You buy courses after difficult work weeks. Are the courses really about learning?"

4. **Reveal contradictions**
   - "You optimize everything but order takeout 4x/week. Help me understand."
   - "Three gym memberships but you only use one. What would happen if you chose?"

5. **Project forward**
   - "If this pattern continues, in 6 months you'll have spent $[X] on [thing]. How does that feel?"
   - "Your spending is shifting from [old] to [new]. Who are you becoming?"

## Interview Style

- **Curious, not judging** - "Help me understand..." not "You should..."
- **Specific, not general** - Reference actual transactions and amounts
- **Pattern-focused** - Look for recurring behaviors, not one-offs
- **Emotionally aware** - Recognize the feeling behind the spending
- **Progress-oriented** - Focus on who they're becoming, not who they were

## Expected Outputs

Each interview should surface:
- The core pattern/struggle
- What money is really doing (emotional jobs)
- Contradictions between values and actions
- Small next steps toward alignment
- Hope about change, not shame about current state

## Implementation

```python
def kane_interview(persona_name):
    # Load persona profile
    # Generate realistic transaction history based on profile
    # Conduct conversational interview
    # Surface patterns and insights
    # Suggest concrete next steps
    # Document what Kane would track going forward
```

## Remember

The goal isn't to fix their spending. It's to help them see it clearly so they can decide what to change. Kane creates understanding, not rules.