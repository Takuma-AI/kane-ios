# Chapter 7: Our Internal Systems

**Book:** Employee Handbook  
**Section:** Operations & Systems  
**Mental Model:** Minimal Viable Tooling  
**Tags:** #internal-tools #systems #monitoring #security #customer-privacy #operational-excellence

## Core Philosophy

37signals builds and uses internal systems that embody their philosophy: **Just enough tooling to do the job excellently**, without the bloat of enterprise software. Each system has a clear purpose and respects both employee productivity and customer privacy.

## The Internal Systems Landscape

### Dash - The Nervous System
**Location**: dash.37signals.com

Dash serves as the company's operational awareness platform:
- **Request performance** monitoring
- **Email delivery** tracking
- **Application health** metrics
- **Support case** analytics
- **Device usage** statistics

This isn't just monitoring—it's **operational intelligence** that informs decisions.

### Queenbee - The Business Brain
**Location**: billing.37signals.com

Handles the critical business operations:
- **Invoice management**
- **Accounting workflows**
- **Identity management**
- **Customer account** operations
- **Refund processing**

Critical feature: **Customer impersonation** capability (with strict controls)

### The 37 Command - The Swiss Army Knife
**Location**: github.com/basecamp/37

Multi-purpose interface for:
- **Production console** access
- **Log file** investigation
- **System debugging**
- **Cross-application** operations

This tool embodies "tools for makers by makers."

### Sentry - The Alert System
**Location**: getsentry.com

Exception tracking that:
- **Catches programming errors**
- **Alerts relevant teams**
- **Tracks error patterns**
- **Enables rapid response**

Primarily managed by SIP team, showing specialized ownership.

## Mental Model: Trust Through Transparency

**Traditional approach**: Lock down everything, hide operations  
**37signals approach**: Give access with accountability

This shows in:
- Engineers can access production systems
- Support can view customer accounts
- Everyone can see operational metrics
- Trust paired with audit trails

## Security & Access Philosophy

### Device Security Layer
**Kandji**: Modern configuration management
- Automated security policies
- Consistent configurations
- Non-invasive approach

**Shipshape**: Legacy but important
- GitHub access verification
- Periodic security testing
- Built in-house for specific needs

### Access Control Principles
- **Need-based access** to sensitive systems
- **Audit trails** for accountability
- **Time-limited permissions** where appropriate
- **Clear documentation** of who can do what

## The Customer Privacy Imperative

### Queenbee's Impersonation Feature
Allows customer login but with:
- **Strict permission** requirements
- **Clear audit** trails
- **Business purpose** only
- **Minimal access** philosophy

This tool exists because sometimes you need to see what customers see, but it's treated with appropriate gravity.

## Decision Framework for System Access

When requesting access:
1. **What's the business need?** → Clear justification required
2. **What's the minimum access needed?** → Principle of least privilege
3. **How long is access needed?** → Time-bound when possible
4. **Who needs to approve?** → Clear escalation path

## Operational Excellence Patterns

### Monitoring Without Micromanaging
Dash tracks system health, not employee activity:
- Application performance ✓
- Individual productivity ✗
- System errors ✓
- Personal metrics ✗

### Debugging With Purpose
The 37 Command provides power with responsibility:
- Access production when needed
- Investigate real issues
- Fix problems quickly
- Document what you did

## The Build vs. Buy Decision

### Built In-House
- **Shipshape**: Specific security needs
- **The 37 Command**: Integrated workflows
- **Internal integrations**: Custom requirements

### Bought/Subscribed
- **Sentry**: Industry-standard error tracking
- **Standard tools**: Where customization isn't valuable

The pattern: **Build when it's core to how you work, buy when it's commodity.**

## System Evolution

### Natural Lifecycle
- **Kandji replacing Shipshape** (partially)
- Shows willingness to evolve
- Modern tools adopted when superior
- Legacy preserved when still valuable

### Continuous Improvement
- Systems updated based on need
- Feedback incorporated
- Complexity avoided
- Purpose maintained

## Warning Signs

### System Bloat Indicators
- Too many tools for same purpose
- Unclear ownership
- Abandoned dashboards
- Complex permission matrices

### Healthy System Signs
- Clear purpose for each tool
- Active usage and maintenance
- Simple access patterns
- Regular updates

## The Competitive Advantage

This minimal tooling approach creates:
- **Faster onboarding** (fewer systems to learn)
- **Clearer responsibilities** (obvious tool purposes)
- **Better security** (smaller attack surface)
- **Higher productivity** (less tool switching)

## Power User Tips

### Making the Most of Internal Systems
- **Learn one deeply** before adding another
- **Document** your workflows
- **Share** useful patterns with team
- **Question** redundant tools

### Contributing Back
- Report bugs you find
- Suggest improvements
- Share useful queries/commands
- Help onboard others

## The Philosophy in Practice

These systems reflect core values:
- **Simplicity** over feature completeness
- **Trust** over surveillance
- **Purpose** over process
- **Evolution** over stagnation

## Related Concepts

- **Managing Work Devices** (Chapter 6) - Security foundation
- **How We Work** (Chapter 3) - Systems supporting async work
- **Getting Started** (Chapter 1) - Learning these systems
- **Code of Conduct** (Chapter 9) - Responsible system use