# Chapter 1: The Three Software Paradigms

**Talk:** Andrej Karpathy: Software Is Changing (Again)  
**Mental Model:** Software Evolution  
**Tags:** #software-paradigms #neural-networks #llms #programming-evolution #software-history

## The Core Philosophy

"Software is changing again. And I say again because I actually gave this talk already. But the problem is that software keeps changing, so I actually have a lot of material to create new talks. And I think it's changing quite fundamentally, I think roughly speaking, software has not changed much on such a fundamental level for 70 years."

Karpathy introduces a revolutionary framework for understanding software evolution: three distinct paradigms that represent fundamentally different ways of programming computers.

## The Three Paradigms Defined

### Software 1.0: Traditional Code
- **Definition**: "The code you write for the computer"
- **Representation**: Traditional programming languages (Python, C++, JavaScript, etc.)
- **Creation Method**: Humans explicitly write instructions
- **Visualization**: GitHub repositories - "instructions to the computer for carrying out tasks in the digital space"

### Software 2.0: Neural Network Weights
- **Definition**: "The weights of a neural network"
- **Key Insight**: "You're not writing this code directly. You are more kind of like tuning the data sets and then you're running an optimizer to create the parameters of this neural network."
- **Representation**: Model parameters (like those on Hugging Face)
- **Example**: "The giant circle, the point in the middle, these are the parameters of flux, the image generator"

### Software 3.0: Natural Language Prompts
- **Revolutionary Change**: "Neural networks became programmable with large language models"
- **Definition**: "Your prompts are now programs that program the LLM"
- **Key Innovation**: "Remarkably these prompts are written in English. So it's kind of a very interesting programming language."

## Mental Model: Evolution vs Revolution

**Traditional View**: Neural networks are just another type of classifier  
**Karpathy's View**: Each paradigm represents a fundamentally new type of computer

### The Shift in Perspective
"It's new kind of a computer. And so in my mind it's worth giving it a new designation of software 3.0."

This isn't just about different tools - it's about entirely different computational substrates:
- Software 1.0 programs computers
- Software 2.0 programs neural networks
- Software 3.0 programs large language models

## Real-World Migration: The Tesla Autopilot Story

Karpathy shares a compelling case study from his time at Tesla:

"Over time as we made the autopilot better, basically the neural network grew in capability and size. And in addition to that, all the C++ code was being deleted... a lot of the capabilities and functionality that was originally written 1.0 was migrated to 2.0."

**Key Examples of Migration**:
- Image stitching across cameras
- Temporal information fusion
- Various perception tasks

"The software 2.0 stack would quite literally eat through the software stack of the autopilot."

## The Programming Revolution

### Natural Language as Code
"Remarkably we're now programming computers in English."

This represents a seismic shift:
- **Accessibility**: No longer need years of training to program
- **Speed**: Can express complex intentions quickly
- **Flexibility**: Natural language can capture nuance traditional code cannot

### Example: Sentiment Classification
```
# Software 1.0 Approach
Writing Python code with rules and logic

# Software 2.0 Approach
Training a neural network on labeled data

# Software 3.0 Approach
A few-shot prompt: "Classify the sentiment of these reviews..."
```

## Practical Implications for Developers

"If you're entering the industry, it's a very good idea to be fluent in all of them because they all have slight pros and cons."

### Decision Framework
When building functionality, developers must now choose:
- **Write explicit code?** (1.0)
- **Train a neural network?** (2.0)
- **Prompt an LLM?** (3.0)

"You may want to program some functionality in 1.0 or 2.0 or 3.0... We'll have to make these decisions and actually potentially fluidly transition between these paradigms."

## The Mixed Future

"We're seeing, maybe you've seen a lot of GitHub code is not just like code anymore. There's a bunch of like English interspersed with code."

The future isn't about one paradigm replacing another, but about:
- **Hybrid Systems**: Combining all three paradigms
- **Fluid Transitions**: Moving between paradigms as needed
- **Optimal Selection**: Choosing the right tool for each task

## Key Insight: A Unique Historical Moment

"I think it's actually like an extremely unique and very interesting time to enter the industry right now... there's just a huge amount of work to do, a huge amount of software to write and rewrite."

This isn't incremental change - it's a fundamental restructuring of how we create software, offering unprecedented opportunities for those entering the field.

## Related Concepts
- Chapter 2: LLMs as Operating Systems - Understanding the computational platform
- Chapter 4: Partial Autonomy Applications - How to build with these paradigms
- Chapter 6: Vibe Coding and Natural Programming - The democratization effect