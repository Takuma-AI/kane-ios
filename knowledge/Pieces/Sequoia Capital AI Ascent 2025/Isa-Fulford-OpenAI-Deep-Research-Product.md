# How OpenAI Built its Groundbreaking Deep Research Product ft. Isa Fulford

**Speaker**: Isa Fulford, Deep Research Team Lead at OpenAI  
**Event**: Sequoia AI Ascent 2025  
**Date**: May 8, 2025  
**Duration**: 8:55  
**Transcription Date**: August 23, 2025  
**URL**: https://youtube.com/watch?v=jFZ9hJKJKtw

---

## Executive Summary

Isa Fulford explains how OpenAI built Deep Research by fine-tuning O3 specifically for web browsing and data analysis. The product emerged from training directly on real user tasks rather than just math and science, creating an agent capable of research analyst-level work in minutes rather than hours.

## Product Definition and Capabilities

### Core Functionality
> "Deep Research is an agentic capability in chat GPT that conducts multi-step research um online to solve really complex tasks. So you give it a prompt and then Deep Research will spend 5 to 30 minutes looking through loads of online web sources um reasoning about the content it finds and then it will come back with a fully cited comprehensive report at around the level of a research analyst."

### Performance Comparison
> "It's able to do in a few minutes what would take a human many hours and so deep research is powered by a version of 03 that we fine-tuned specifically to be good at web browsing and data analysis."

## Development Philosophy: Training on Real User Tasks

### Beyond Math and Science Training
> "A little over a year ago we were seeing a lot of progress internally with um reinforcement learning and reasoning models and we were training mostly on math and science and coding tasks. And we saw some generalization from training on those kinds of tasks to other domains. But we wondered what would happen if we trained directly on tasks that users do in their daily lives."

### Online Browsing as Starting Point
> "We felt that online browsing was a really good first place to try this because a lot of people do online browsing across a really broad range of domains and jobs and also in their daily lives. And also it's a nice kind of uh first sandbox where readonly um agents is kind of a good place to start because the kind of safety considerations are maybe a little bit more constrained."

## Development Process: Demo-First Approach

### Rapid Prototyping Strategy
> "To do this we first needed to get people excited. So we hacked together a demo by just prompting models. I was actually working on this with Yash Patil and Thomas Simpson who's also here today. Um and we just made this demo of what the deep research product might look like. Um we didn't train any models, got people excited about it and then started the process of training a model to be good at deep research."

### Training Infrastructure
> "This involved creating tasks um reinforcement learning tasks to actually teach the model the browsing capabilities and data analysis capabilities that we wanted the model to learn and also creating tools and giving the model access to those tools um to use during training."

### Tool Integration
> "We needed to give it access to a browser so it could search and click on things and scroll through things and then also um a way to execute code to do like data analysis and plot graphs and things like that."

## User Experience Design

### Clarifying Questions Approach
> "The first thing that DP research will do is it will come back with some clarifying questions. The reason we designed it this way is because we felt that if you um the model is going to do something for you for quite a few minutes, you want to make sure that the output you get is exactly what you wanted and you we want the user to give as much detail as possible up front."

### Transparency Through Chain of Thought
> "In a minute we will be able to follow along with a summary of the its chain of thought and the actions that it's taking. So you'll be able to see interled chain of thought which is the model reasoning through the sources it's encountering and then also the tool calls that I make."

## Real-World Use Cases

### Professional Applications
> "Most of our users um use chatbt for professional use cases. So you know academics, VCs, so I've been told um consultants a lot of other things."

### Personal Use Cases
> "A lot of people have personal use cases. I would say that's probably my biggest use case would be like shopping and travel recommendations."

### Complex Multi-Constraint Searches
Isa's Korea example demonstrates sophisticated constraint handling:
> "I was looking for a night market that was maximum 15 minutes away from where I was and I wanted it to look at Reddit and also Korean sources that I'm not able to read myself and then within each of those markets find the best rated stores. So you can imagine that with normal search it's pretty hard to do a search that has all of these constraints in one go."

## Technical Architecture

### Citation System
> "For each thing there are citations. As you can see, the citations actually um also um site the specific um lines from the um from the sources that are relevant to the the sentence that it's citing."

### O3 Integration
> "If you've also used 03, you you'll know that 03 is also able to do search really well. So, if you're looking for a more like medium search, I'd recommend using 03. Deep research will really is kind of like the far end of how long it will take to to do a search query."

### Cross-Model Training Benefits
> "The reason 03 is good at searching is actually because it's trained with the same tools and browsing data sets that we developed for deep research."

## Future Roadmap

### Reliability Improvements
> "It's obviously not perfect. Sometimes it can hallucinate. So we're working on like improving um reliability."

### Integration with Core Models
> "We're also excited to like integrate deep research into the main reasoning models. So, you know, as you know, 03 is already good at search. We'll continue to like upstream things that we work on into the the bigger reasoning models."

### Private Context Integration
> "We're also really excited to bring um private context into deep research. So, your internal company knowledge um pay sources."

### Beyond Synthesis to Action
> "I think the next like big thing for us will be um not just synthesizing existing information but actually taking actions as well."

## Key Product Insights

### Demo-Driven Development
Starting with a quickly hacked demo to generate excitement before building the actual training infrastructure proved effective for getting organizational buy-in.

### Task-Specific Training
Training directly on real user tasks (browsing, research) rather than just math/science created more useful capabilities for everyday applications.

### User Experience Focus
Building in clarifying questions upfront prevents frustration from long-running tasks that don't meet user expectations.

### Transparency as Feature
Showing chain-of-thought reasoning builds user trust in the multi-minute research process.

### Safety-First Agent Design
Starting with read-only browsing agents provides a constrained environment for developing agentic capabilities.

---

*Isa Fulford's presentation reveals how OpenAI successfully translated research breakthroughs into consumer products by focusing on real user tasks, rapid prototyping, and thoughtful UX design for long-running AI agents.*