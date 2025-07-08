# Chapter 50: Get Defensive

**Book:** Getting Real  
**Section:** Interface Design  
**Mental Model:** Design & Interface  
**Tags:** #defensive-design #error-handling #user-experience #crisis-management #interface-design

## Core Concept

**Design for when things go wrong.** Let's admit it: Things will go wrong online. No matter how carefully you design your app, no matter how much testing you do, customers will still encounter problems. So how do you handle these inevitable breakdowns? With defensive design.

## The Driving Analogy

"Defensive design is like defensive driving. The same way drivers must always be on the lookout for slick roads, reckless drivers, and other dangerous scenarios, site builders must constantly search for trouble spots that cause visitors confusion and frustration."

Key parallel:
- **Defensive driving**: Anticipate what could go wrong on the road
- **Defensive design**: Anticipate what could go wrong in your app

## The Make or Break Moment

"Good site defense can make or break the customer experience."

This is because:
- Errors are inevitable
- How you handle them defines you
- Users remember bad experiences
- Recovery builds or destroys trust

## Mental Model: Crisis Preparation

**Traditional Thinking:** Focus on preventing errors and hope they don't happen.

**Getting Real Thinking:** Accept errors will happen and design excellent recovery experiences.

### Decision Framework

For defensive design:
1. **What are the likely failure points?**
2. **How can we help users recover?**
3. **What information do they need?**
4. **How do we maintain their confidence?**

### Key Insight

Your app's true character shows in crisis. Design for when things go wrong, not just when they go right.

## The 37signals Book on Defensive Design

"We could fill a separate book with all the things we have to say about defensive design. In fact, we already have. 'Defensive Design for the Web' is the title and it's a great resource for anyone who wants to learn how to improve error screens and other crisis points."

## Common Crisis Points

### Technical Failures
- Server errors
- Database timeouts
- Network issues
- Third-party service failures

### User Errors
- Invalid inputs
- Missing information
- Incorrect formats
- Unauthorized actions

### Edge Cases
- Unusual data combinations
- Unexpected user paths
- Browser incompatibilities
- Concurrent user conflicts

### Business Logic Issues
- Insufficient permissions
- Expired accounts
- Limit violations
- Policy conflicts

## The 90/10 Rule

"Remember: Your app may work great 90% of the time. But if you abandon customers in their time of need, they're unlikely to forget it."

This means:
- Perfect operation isn't enough
- Crisis handling is disproportionately important
- Bad error experiences overshadow good normal experiences
- Users need you most when things break

## Principles of Defensive Design

### 1. Anticipate Problems
- Map potential failure points
- Understand user mistakes
- Test edge cases
- Plan for the unexpected

### 2. Communicate Clearly
- Explain what happened
- Use human language
- Avoid technical jargon
- Be specific and helpful

### 3. Provide Solutions
- Offer next steps
- Give alternatives
- Enable recovery
- Prevent dead ends

### 4. Maintain Trust
- Be honest about problems
- Show you care
- Respond quickly
- Follow through

## Real-World Application

### Error Message Design
- Clear problem description
- Actionable solutions
- Helpful tone
- Contact options

### Form Validation
- Inline error messages
- Specific field guidance
- Preserve user input
- Progressive enhancement

### System Failures
- Friendly error pages
- Status information
- Estimated resolution
- Alternative options

### Prevention Strategies
- Input constraints
- Clear instructions
- Confirmation dialogs
- Undo capabilities

## What Users Need During Errors

1. **Understanding**: What went wrong?
2. **Guidance**: What should I do now?
3. **Reassurance**: Is my data safe?
4. **Options**: What alternatives exist?
5. **Support**: Who can help me?

## Good Defensive Design Examples

### Helpful 404 Pages
- Explain the error
- Provide search
- Suggest popular pages
- Include navigation

### Form Error Recovery
- Highlight problem fields
- Preserve valid entries
- Specific error messages
- Inline help

### System Maintenance
- Advance notice
- Clear timeframes
- Progress updates
- Workarounds

## Building User Confidence

During errors:
- **Acknowledge** the problem
- **Apologize** if appropriate
- **Explain** in simple terms
- **Guide** to resolution
- **Learn** from patterns

## The Long-Term Impact

Good defensive design:
- Reduces support requests
- Builds user trust
- Differentiates from competitors
- Improves overall satisfaction
- Creates forgiving relationships

## Testing Defensive Design

1. **Error path testing**: Try to break things
2. **User observation**: Watch confusion points
3. **Support ticket analysis**: Find common problems
4. **Stress testing**: Push system limits
5. **Recovery testing**: Verify solutions work

## Investment Worth Making

Time spent on defensive design returns through:
- Fewer support tickets
- Higher user satisfaction
- Better brand perception
- Reduced abandonment
- Competitive advantage

## Related Concepts

- Chapter 48: Three State Solution (error state design)
- Chapter 49: The Blank Slate (first impressions)
- Chapter 82: Publicize Your Screwups (transparency in errors)
- Chapter 78: Zero Training (intuitive error recovery)