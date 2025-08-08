# Chapter 2: Web Architecture & Privacy Models

**Book:** Intentional Tech: Designing AI for Human Flourishing  
**Section:** Architecture & Privacy  
**Mental Model:** System Design & Architecture  
**Tags:** #same-origin-paradigm #data-gravity #privacy #web-architecture #confidential-computing

## The Same Origin Paradigm Problem

The web's fundamental security model, largely unknown even to developers, shapes everything about how we interact with technology:

> "Same origin paradigm is the laws of physics of how the web works...It's the security and privacy model that we've used for 30 years. It kind of actually grew up as an accident actually."

This "accidental" architecture has profound consequences for how data flows, who controls it, and what's possible to build.

## The Iron Triangle of Web Security

Komoroske identifies a fundamental constraint - you can only have two of three:

1. **Untrusted code** - Apps from unknown developers
2. **Sensitive data** - Personal information 
3. **Network access** - Ability to communicate

### Current Model Limitations

**Web Model:** Untrusted code + Network access (no sensitive data)
- Safe to try new apps
- But they start with zero knowledge of you
- High friction to share any data

**App Store Model:** Sensitive data + Network access (trusted code only)
- Apps can access your data
- But must go through gatekeepers
- 30% tax and approval required

> "Imagine that you have two use cases. One is some cool startup that says, they're going to do this amazing new thing with your calendar and scheduling. And one is Google Calendar that says they have a similar kind of feature. Which one do you pick?"

## The Data Gravity Problem

### How Isolation Creates Centralization

The same origin paradigm creates isolated data islands:
- Each domain/app is completely separate
- Users must manually move data between services
- Incumbents with existing data have massive advantages
- New entrants face impossible cold start problems

> "This leads to ask you or I'll just do the one that already has it. So this is a phenomenon you might call data gravity. It tends to accumulate in the places that already exist. And they become massive."

### The Aggregation Spiral

1. Data accumulates with early winners
2. Users reluctant to re-enter data elsewhere
3. Network effects strengthen incumbents
4. Innovation stifled as switching costs rise
5. Only features that serve millions get built

## Mental Model: Data Architecture and User Agency

**Traditional Architecture Logic:**
- Apps own the data they collect
- Security through isolation
- Trust established by gatekeepers
- Users adapt to app boundaries

**User-Centric Architecture Logic:**
- Users own their data
- Security through encryption/attestation
- Trust established cryptographically
- Apps adapt to user needs

## Alternative Architecture: Contextual Flow Control

### Breaking the Iron Triangle

New technologies enable having all three properties:
- Untrusted code
- Sensitive data
- Network access

Key enabler: **Confidential Computing**

> "Confidential compute is secure enclaves in the cloud. It allows VMs to be run fully encrypted in memory. It means that even someone with physical access to the machine like a Google SRE can't peek inside."

### Open Attested Runtimes

The solution combines:
1. **Open source code** - Publicly auditable
2. **Hardware attestation** - Cryptographic proof of what's running
3. **Remote verification** - Users can verify code hasn't been modified
4. **Encrypted execution** - Data invisible even to operators

> "It allows you remotely as a savvy user to verify, it's running an unmodified version of that software...Because we can all see, can't do anything different than what it says it will do."

## Privacy as Contextual Integrity

### Beyond Lawyers and Technologists

Komoroske references Helen Nissenbaum's framework:

**Lawyers think privacy = consent**
- "Did user sign the EULA?"
- Legally sufficient but practically meaningless

**Technologists think privacy = encryption**  
- "Is it end-to-end encrypted?"
- Technically secure but ignores usage

**Users think privacy = contextual integrity**
- "Is my data used how I expect?"
- "Does it align with my interests?"
- "Am I surprised by how it's used?"

## The File System Alternative

> "The file system allows, fundamentally, multiple apps are all allowed to work on the same data. They can coordinate via the file system. And that allows you to not get stuck."

File systems demonstrate an alternative model where:
- Data exists independently of applications
- Multiple tools can access the same information
- Users control what goes where
- No single app owns your digital life

## Implications for AI Systems

### Current AI Privacy Problems

With LLMs maintaining context about users:
- Mixing contexts inappropriately (therapist + work)
- Hidden dossiers users can't inspect
- Behavioral tracking and profiling
- No clear boundaries or user control

> "It includes things about stuff you said in the past. It could include things like your insecure about your weight...And then it also says...9% of your interactions with the chatbot have been bad."

### Requirements for Private AI

1. **User-controlled context** - You decide what's shared
2. **Inspectable state** - See what the system knows
3. **Separable contexts** - Work, personal, therapy don't mix
4. **Portable data** - Take your context anywhere
5. **Verifiable behavior** - Prove system works for you

## Practical Architecture Patterns

### For Builders

**Design Principles:**
- Separate data from application logic
- Use encryption at rest and in transit
- Implement user-controlled access
- Enable data portability
- Build on open standards

**Technical Approaches:**
- Confidential computing for sensitive operations
- Client-side encryption with user keys
- Federated architectures
- Zero-knowledge proofs
- Decentralized identity

### For Users

**What to Look For:**
- Services that let you export your data
- Clear separation of contexts
- Ability to verify privacy claims
- Business models aligned with privacy
- Open source or auditable code

## Key Insight

The architecture we choose determines the power dynamics. Current models create data monopolies by design, not by accident. Alternative architectures that preserve user agency are possible but require intentional choices now, before patterns solidify.

## Related Concepts

- [Chapter 1: Intentional Tech Philosophy](01_intentional-tech-philosophy.md) - Why privacy matters for human flourishing
- [Chapter 4: The Prompt Injection Crisis](04_prompt-injection-crisis.md) - Security implications of current architectures
- [Chapter 3: Beyond Chatbots - Coactive Systems](03_beyond-chatbots-coactive-systems.md) - New interaction models enabled by better privacy