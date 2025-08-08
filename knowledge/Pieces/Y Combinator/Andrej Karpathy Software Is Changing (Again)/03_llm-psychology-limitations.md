# Chapter 3: LLM Psychology and Limitations

**Talk:** Andrej Karpathy: Software Is Changing (Again)  
**Mental Model:** Cognitive Architecture  
**Tags:** #llm-psychology #cognitive-limitations #prompt-injection #memory-models #security-considerations

## The Core Philosophy

"The way I like to think about LLMs is that they're kind of like people spirits. They are stochastic simulations of people, and the simulator in this case happens to be an other aggressive transformer."

Karpathy presents a nuanced view of LLMs as entities with both superhuman capabilities and significant cognitive deficits that developers must understand to work effectively with them.

## Understanding the Simulator

### The Mechanics
"Transformer is a neural net, and it just kind of like goes on the level of tokens, it goes chunk, chunk, chunk, chunk. And there's an almost equal amount of compute for every single chunk."

**Training Process**: "We fit it to all of the texts that we have on the internet, and so on. And you end up with this kind of a simulator, and because it is trained on humans, it's got this emergent psychology that is human-like."

## Superhuman Capabilities

### Encyclopedic Memory
"LLMs have encyclopedic knowledge and memory, and they can remember lots of things, a lot more than any single individual human can because they read so many things."

**The Rainman Analogy**:
"It actually kind of reminds me of this movie, Rainman... Dustin Hoffman here is an autistic savant, who has almost perfect memory, so he can read like a phone book, and remember all of the names and phone numbers."

**Practical Examples**:
- Can remember SHA hashes
- Perfect recall of vast amounts of text
- Cross-domain knowledge synthesis

## Cognitive Deficits

### Hallucination
"They hallucinate quite a bit, and they kind of make up stuff, and don't have a very good sort of internal model of self-knowledge, not sufficient at least."

**Progress Note**: "This has gotten better, but not perfect."

### Jagged Intelligence
"They display jagged intelligence, so they're going to be superhuman in some problem-solving domains, and then they're going to make mistakes that basically no human will make."

**Famous Examples**:
- Insisting that 9.11 is greater than 9.9
- Claiming there are two R's in "strawberry"
- "Basically there are rough edges that you can trip on"

### Anterograde Amnesia
"They also kind of suffer from enterograde amnesia... if you have a coworker who joins your organization, this coworker will over time learn your organization, and they will understand and gain like a huge amount of context on the organization, and they go home, and they sleep, and they consolidate knowledge, and they develop expertise over time."

**Key Limitation**: "LLMs don't natively do this, and this is not something that has really been solved in the R&D of LLMs."

## Mental Model: Context Windows as Working Memory

### The Fixed Weights Problem
"Context windows are really kind of like working memory, and you have to sort of program the working memory quite directly, because they don't just kind of like get smarter by default."

### Pop Culture References
Karpathy recommends two films that illustrate this limitation:

**Memento & 50 First Dates**: "In both of these movies, the protagonists, their weights are fixed, and their context windows gets wiped every single morning, and it's really problematic to go to work or have relationships when this happens, and this happens to all of us all the time."

## Security Limitations

### Vulnerability Profile
"LLMs are quite gullible, they are susceptible to prompt injection risks, they might leak your data, et cetera."

**Security Considerations**:
- Prompt injection vulnerabilities
- Data leakage risks
- Gullibility to manipulation
- "Many other considerations security related"

## The Working Framework

### Simultaneous Duality
"You have to simultaneously think through this superhuman thing that has a bunch of cognitive deficits and issues. How do we, and yet, they are extremely like useful, and so how do we program them, and how do we work around their deficits, and enjoy their superhuman powers."

### Practical Implications
Developers must:
1. **Leverage Strengths**: Use their vast knowledge and pattern recognition
2. **Compensate for Weaknesses**: Build systems that work around limitations
3. **Design for Fallibility**: Assume errors will occur and plan accordingly
4. **Maintain Security**: Protect against known vulnerabilities

## Decision Framework for Working with LLMs

### When to Trust LLMs
- Tasks requiring broad knowledge synthesis
- Pattern recognition across domains
- Creative ideation and exploration
- Rapid prototyping and iteration

### When to Be Cautious
- Tasks requiring perfect accuracy
- Security-sensitive operations
- Long-term memory or learning requirements
- Edge cases and unusual scenarios

## Key Insight: The Paradox of Capability

LLMs represent a unique computational paradigm:
- **Simultaneously superhuman and subhuman**
- **Incredible breadth but unreliable depth**
- **Perfect memory but no learning**
- **Human-like but fundamentally alien**

Understanding this paradox is essential for building effective applications.

## Practical Strategies

### Working with Limitations
1. **External Memory Systems**: Compensate for lack of learning
2. **Verification Layers**: Check for hallucinations
3. **Constrained Contexts**: Limit scope to reduce errors
4. **Security Boundaries**: Protect against prompt injection

### Leveraging Strengths
1. **Knowledge Integration**: Use breadth of understanding
2. **Rapid Exploration**: Leverage speed and creativity
3. **Pattern Matching**: Apply to complex recognition tasks
4. **Natural Interface**: Utilize human-like interaction

## The Bottom Line

"Long story short, you have to load your, you have to simultaneously think through this superhuman thing that has a bunch of cognitive deficits and issues."

Success with LLMs requires embracing this duality and designing systems that maximize benefits while minimizing risks.

## Related Concepts
- Chapter 2: LLMs as Operating Systems - The platform these "spirits" run on
- Chapter 4: Partial Autonomy Applications - Building around these limitations
- Chapter 5: AI-Assisted Development - Practical workflows considering psychology