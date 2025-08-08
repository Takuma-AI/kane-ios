# Chapter 7: Building for Agents

**Talk:** Andrej Karpathy: Software Is Changing (Again)  
**Mental Model:** Infrastructure Evolution  
**Tags:** #agent-infrastructure #llm-accessibility #documentation-evolution #programmatic-access #mcp-protocol

## The Core Philosophy

"Roughly speaking, I think there's a new category of consumer and manipulator of digital information. It used to be just humans through GUIs or computers through APIs. And now we have a completely new thing. And agents are their computers, but they are human-like, kind of, right? They're people spirits."

Karpathy argues that our digital infrastructure needs fundamental restructuring to accommodate AI agents as first-class citizens alongside humans and traditional computers.

## The Infrastructure Problem

### The Current Frustration
Recalling the MenuGen development experience:
"The computer is telling me the actions I should be taking. Like you do it. Why am I doing this? What the hell?"

**The Absurdity**:
- Computers instructing humans to click buttons
- Multi-step manual processes
- Point-and-click configuration
- Humans as mechanical intermediaries

### The Vision
"Can we just build for agents? I don't want to do this work. Can agents do this?"

## Three Categories of Digital Consumers

### Traditional Model
1. **Humans**: Access through GUIs
2. **Computers**: Access through APIs

### New Reality
3. **Agents**: "Computers, but they are human-like"

**The Challenge**: "They're people spirits on the internet, and they need to interact with their software infrastructure."

## Building Agent-Friendly Infrastructure

### The robots.txt Analogy
"You can have robots.txt on your domain, and you can instruct, or like, advise, I suppose, web crawlers on how to behave on your website."

### Introducing llms.txt
"In the same way, you can have maybe Ellen's.txt file, which is just a simple markdown, that's telling LLMs what this domain is about."

**Benefits**:
- "Very readable to an LLM"
- Avoids error-prone HTML parsing
- Direct communication channel
- Structured information transfer

## Documentation Revolution

### The Current Problem
"A huge amount of documentation is currently written for people. So you will see things like lists, and bold, and pictures. And this is not directly accessible by an LLM."

### Early Movers
"Versel and Stripe, as an example, are early movers here, but there are a few more that I've seen already. And they offer their documentation in markdown."

**Why Markdown**: "Markdown is super easy for LLMs to understand. This is great."

## The Manim Success Story

### Traditional Approach Would Require:
- Reading extensive documentation
- Learning the library
- Understanding the API
- Trial and error

### The LLM-Enabled Approach
"I copy-pasted the whole thing to an LLM, and I described what I wanted, and it just worked out of the box. Like LLM just by coded me an animation, exactly what I wanted."

**Key Insight**: "If we can make docs legible to LLMs, it's going to unlock a huge amount of kind of use."

## Beyond Markdown: Behavioral Changes

### The Click Problem
"It's not just about taking your docs and making them appear in markdown. That's the easy part. We actually have to change the docs. Because anytime your docs stay click, this is bad. And LLM will not be able to natively take this action right now."

### The Vercel Solution
"Bersel, for example, is replacing every occurrence of click with the equivalent curl command that your LLM agent could take on your behalf."

**Transformation Required**:
- From: "Click this button"
- To: "Run this curl command"
- Enable programmatic action
- Remove GUI dependencies

## Protocol Development: MCP

### Model Context Protocol
"Of course, there's a model context protocol from Enfropic. And this is also another way it's a protocol speaking directly to agents as this new consumer and manipulator of digital information."

**Significance**: Industry-standard protocols for agent interaction emerging

## Tools for Agent-Friendly Access

### GitHub to GitHub Ingest
"When I go to a GitHub repo, like my NanagyPity repo, I can't feed this to an LLM and ask questions about it. Because it's, you know, this is a human interface of GitHub."

**The Solution**: "When you just change the URL from GitHub to GitHub ingest, then this will actually concatenate all the files into a single giant text."

**Features**:
- Directory structure included
- All files concatenated
- LLM-ready format
- Simple URL modification

### Deep Wiki: Enhanced Understanding
"It's not just the raw content of these files. This is from Devon, but also like they have Devon basically do analysis of the GitHub repo and Devon basically builds up a whole docs pages just for your repo."

**Value Add**: Pre-analyzed, structured information beyond raw content

## The Pragmatic Middle Ground

### Acknowledging Current Capabilities
"It is absolutely possible that in the future, LLMs will be able to, this is not even future, this is today. They'll be able to go around and they'll be able to click stuff and so on."

### The Efficiency Argument
"But I still think it's very worth basically meeting LLM halfway, LLMs halfway and making it easier for them to access all this information. Because this is still fairly expensive, I would say, to use and a lot more difficult."

### Long Tail Reality
"Lots of software, there will be a long tail where it won't adapt because these are not like live players or repositories or digital infrastructure. And we will need these tools."

## Design Principles for Agent-Friendly Systems

### 1. Direct Communication
- Provide llms.txt files
- Use structured markdown
- Explicit capability descriptions
- Clear interaction patterns

### 2. Programmatic Actions
- Replace GUI instructions with code
- Provide API equivalents
- Enable scriptable workflows
- Remove human-only steps

### 3. Structured Information
- Machine-readable formats
- Clear hierarchies
- Semantic markup
- Consistent patterns

### 4. Progressive Enhancement
- Maintain human interfaces
- Add agent capabilities
- Parallel access methods
- Graceful degradation

## Mental Model: The New Digital Ecology

### Traditional Stack
```
Humans → GUI → Application
Computers → API → Application
```

### Evolved Stack
```
Humans → GUI → Application
Computers → API → Application
Agents → LLM Interface → Application
```

### The Integration Challenge
Agents need:
- Semantic understanding (like humans)
- Programmatic access (like computers)
- New interface paradigms
- Infrastructure adaptation

## The URL Modification Pattern

Karpathy highlights a powerful pattern:
"I love all the little tools that basically where you just change the URL and it makes something accessible to an LLM."

**Examples**:
- github.com → githubingest.com
- Regular docs → Markdown docs
- Human view → Agent view

## Call to Action

### For Developers
1. **Audit Documentation**: Make it LLM-friendly
2. **Replace Click Instructions**: Provide programmatic alternatives
3. **Create Agent Interfaces**: llms.txt, markdown docs, structured data
4. **Build Translation Layers**: Tools that convert human to agent formats

### For Platform Builders
1. **Adopt Standards**: Like MCP for agent communication
2. **Parallel Interfaces**: Maintain both human and agent access
3. **Semantic Structure**: Make information parseable
4. **Action Enablement**: Allow programmatic control

## The Future Vision

"I think for everyone else, I think it's very worth meeting in some middle point."

The future isn't about replacing human interfaces but about creating a richer digital ecosystem where humans, traditional computers, and AI agents can all interact efficiently with our digital infrastructure.

## Key Takeaway

"There's a new category of consumer and manipulator of digital information... They're people spirits on the internet, and they need to interact with their software infrastructure. Like, can we build for them?"

Building for agents isn't just about technical capability—it's about recognizing them as a new class of digital citizen that requires thoughtful infrastructure design.

## Related Concepts
- Chapter 2: LLMs as Operating Systems - The platform agents run on
- Chapter 6: Vibe Coding and Natural Programming - Who needs this infrastructure
- Chapter 4: Partial Autonomy Applications - How agents interact with applications