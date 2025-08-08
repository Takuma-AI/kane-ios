# Chapter 4: Partial Autonomy Applications

**Talk:** Andrej Karpathy: Software Is Changing (Again)  
**Mental Model:** Human-AI Cooperation  
**Tags:** #partial-autonomy #llm-apps #human-in-the-loop #autonomy-slider #verification-systems

## The Core Philosophy

"Why would you go directly to the operating system? It makes a lot more sense to have an app dedicated for this... I think cursor is a very good example of an early LLM app that has a bunch of properties that I think are useful across all the LLM apps."

Karpathy advocates for building applications that balance AI capabilities with human oversight, creating systems where humans and AI cooperate efficiently rather than pursuing full automation.

## The Problem with Direct LLM Interaction

### The Copy-Paste Nightmare
"You can certainly go to chat GPT directly, and you can start copy-pasting code around, and copy-pasting bug reports and stuff around, and getting code and copy-pasting everything around. Why would you, why would you do that?"

Direct interaction with LLMs is inefficient because:
- Manual context management
- No specialized interface
- Friction in the workflow
- Lack of domain-specific optimizations

## Core Properties of Effective LLM Apps

### 1. Context Management
"The LLM basically do a ton of the context management."

**What This Means**:
- Apps handle what information the LLM sees
- Automatic inclusion of relevant files/data
- Smart context window utilization
- No manual copy-pasting required

### 2. Multi-Model Orchestration
"They orchestrate multiple calls to LLM's. So in the case of cursor, there's under the hood embedding models for all your files, the actual chat models, models that apply diffs to the code, and this is all orchestrated for you."

**Components Often Orchestrated**:
- Embedding models for search
- Chat models for interaction
- Specialized models for specific tasks
- Different models for different capabilities

### 3. Application-Specific GUI
"A really big one that I think also may be not fully appreciated always is application specific GUI and the importance of it."

**Why GUI Matters**:
- "Text is very hard to read, interpret, understand"
- "You don't want to take some of these actions natively in text"
- "It's much better to just see a diff as like red and green change"
- "It's much easier to just do command Y to accept or command N to reject"

**Key Insight**: "GUI allows a human to audit the work of these fallible systems and to go faster."

### 4. The Autonomy Slider
"There's what I call the autonomy slider."

**Cursor's Implementation**:
- **Tab completion**: "You're mostly in charge"
- **Command K**: "Change just that chunk of code"
- **Command L**: "Change the entire file"
- **Command I**: "Let her do whatever you want in the entire repo"

"You are in charge of the autonomy slider. And depending on the complexity of the task at hand, you can tune the amount of autonomy that you're willing to give up for that task."

## Case Study: Perplexity

Karpathy highlights Perplexity as another exemplar of partial autonomy:

**Similar Features**:
- Packages information effectively
- Orchestrates multiple models
- GUI for auditing (cited sources)
- Autonomy slider (quick search → research → deep research)

"You can either just do a quick search or you can do research or we can do deep research and come back ten minutes later."

## The Generalization Question

"I feel like a lot of software will become partially autonomous. And I'm trying to think through like, what does that look like?"

**Key Questions for Product Builders**:
- "Can an LLM see everything that a human can see?"
- "Can an LLM act in all the ways that a human could act?"
- "Can humans supervise and stay in the loop of this activity?"

**Challenge**: "What does a diff look like in Photoshop or something like that?"

## Mental Model: Generation-Verification Loop

### The Core Dynamic
"We're now kind of like cooperating with AI's. And usually they are doing the generation and we as humans are doing the verification. It is in our interest to make this loop go as fast as possible so we're getting a lot of work done."

### Two Optimization Strategies

**1. Speed Up Verification**
"GUI's, for example, are extremely important to this because GUI utilizes your computer vision GPU in all of our head. Reading text is effortful and it's not fun, but looking at stuff is fun. And it's just kind of like a highway to your brain."

**2. Keep AI on the Leash**
"I think a lot of people are getting way over excited with AI agents. And it's not useful to me to get a dip of 1000 lines of code to my repo... Even though that 1000 lines come out instantly, I have to make sure that this thing is not introducing bugs."

## The Overexcited Agent Problem

### The Reality Check
"I'm still the bottleneck, right? Even though that 1000 lines come out instantly, I have to make sure that this thing is not introducing bugs. It's just like, and that is doing the correct thing, right? And that there's no security issues and so on."

### Karpathy's Workflow Philosophy
"In my own work, I'm always scared to get way too big dips. I always go in small incremental chunks. I want to make sure that everything is good. I want to spin this loop very, very fast. And I sort of work on small chunks of single concrete thing."

## Best Practices for AI-Assisted Development

### Prompt Engineering for Success
"If your prompt is big, then the AI might not do exactly what you want. And in that case, verification will fail... It makes a lot more sense to spend a bit more time to be more concrete in your prompts, which increases the probability of successful verification and you can move forward."

### The Education Example
Karpathy shares his approach to AI in education:

"I don't think it just works to go to ChashiPTM and be like, hey, teach me physics. I don't think this works because the AI gets lost in the woods."

**Solution Architecture**:
1. **Teacher App**: Creates courses
2. **Student App**: Serves courses
3. **Intermediate Artifact**: Auditable course content

"We now have this intermediate artifact of a course that is auditable and we can make sure it's good. We can make sure it's consistent. And the AI is kept on the leash with respect to a certain syllabus, a certain progression of projects."

## Lessons from Tesla Autopilot

### The Perfect Demo Trap
Karpathy recounts his 2013 Waymo ride:
- 30-minute perfect drive
- Zero interventions
- Felt like self-driving was imminent
- "Here we are 12 years later and we are still working on autonomy"

**Key Insight**: "Even now we haven't actually like fully solved the problem... there's still a lot of teleoperation and a lot of human in the loop."

### The Reality of Agent Development
"When I see things like, oh, 22, 25 is the year of agents, I get very concerned. And I kind of feel like, you know, this is the decade of agents and this is going to be quite some time. We need humans in the loop, we need to do this carefully. This is software, well, it's be serious here."

## The Iron Man Suit Paradigm

### Augmentation vs Automation
"What I love about the Iron Man suit is that it's both an augmentation and Tony Stark can drive it. And it's also an agent."

**The Autonomy Slider in Action**:
- Can be worn and controlled directly
- Can operate autonomously when needed
- Seamless transition between modes

### The Current Reality
"At this stage, I would say working with fallible Al Alems and so on. I would say, you know, it's less Iron Man robots and more Iron Man suits that you want to build."

**Practical Guidance**:
- Build augmentations, not replacements
- Focus on partial autonomy products
- Create custom GUIs for fast verification
- Maintain sight of eventual full automation

## Key Principles for Building LLM Apps

1. **Start with Augmentation**: "Building partial autonomy products" over "flashy demos of autonomous agents"
2. **Optimize the Loop**: Make generation-verification cycles extremely fast
3. **Progressive Autonomy**: Include an autonomy slider in your product
4. **Domain-Specific Design**: Custom interfaces for different problem domains
5. **Incremental Progress**: Small chunks over large autonomous actions

## Related Concepts
- Chapter 3: LLM Psychology and Limitations - Understanding why partial autonomy is necessary
- Chapter 5: AI-Assisted Development - Practical techniques for the loop
- Chapter 7: Building for Agents - Future infrastructure considerations