# Anthropic CPO Mike Krieger: Building AI Products From the Bottom Up

**Speaker**: Mike Krieger, Chief Product Officer at Anthropic (Co-founder of Instagram)  
**Event**: Sequoia AI Ascent 2025  
**Date**: May 9, 2025  
**Duration**: 23:58  
**Transcription Date**: August 23, 2025  
**URL**: https://youtube.com/watch?v=Js1gU6L1Zi8

---

## Executive Summary

Mike Krieger, Instagram co-founder and current Anthropic CPO, discusses the fundamental shift from top-down to bottom-up product development in AI. He shares insights on building AI products, the evolution of MCP, internal AI adoption patterns, and critical challenges in creating truly AI-native applications.

## The Bottom-Up Product Philosophy Revolution

### From Instagram's Top-Down to AI's Bottom-Up

**Traditional Product Development**
> "On Instagram we did a much more sort of tops down you know 3 to six month time frame you know of of planning. Thomas in the third row can relate to this. We were definitely much more like plan and deliver it."

**AI Product Development Reality**
> "You just have to allow for much more bottoms of creativity because most I think the best products are the ones that are built very close to the model and you can only kind of tell what they're capable of like pretty late in the process and so I've just learned to kind of invert the sort of part of the like creative process to be much more bottoms up."

**Personal Adaptation Challenge**
> "Which you know as like a bit of a control person it's like a little hard but I think it's also like opened up some really interesting things like artifacts was a research prototype that then got taken by like a designer and an engineer and then shipped to production."

### Core Product Principles That Remain Unchanged

**Fundamental Product Questions**
> "The things that were useful in the Instagram age are still useful now, right? Which is like are you solving a real problem for people? Like if you're creating a developer tool, are you enabling you to do something interesting and novel and quickly? If you're building an enduser product, like are you meeting the needs of people where they actually are?"

## The MCP Origin Story: From Pain to Protocol

### The Three-Time Pattern Recognition

**Organic Problem Discovery**
> "It really started from like watching us try to implement I think at the time we're implementing like Google Drive integration and then we were implementing GitHub integration and like those things should have more in common than not, right? It's like you're bringing context into the model."

**The Abstraction Moment**
> "We had done like two completely different implementations internally and the third one that we were like queuing up was going to be like yet another uh completely you know bespoke thing and you know usually like my general pattern is like do things three times and on the third time you can try to figure out what the abstractions are."

**Bottom-Up Genesis**
> "It definitely was not like a top down like we need a protocol for like better interacting with models it was again two engineers being like yes I think this is a good idea let's go let's go prototype and build it."

### MCP Evolution and Enterprise Reality

**Open Standards Philosophy**
> "Let's make it truly open so it's going to get adopted beyond entropic because we think there's value in not just us like owning a protocol but instead it being much more standardized."

**Enterprise Integration Complexity**
> "Now it's gotten much more of a community flavor where you know we tropic you know we're over a thousand people but still feels very startupy like we're working with like places like Microsoft and Amazon that have like all sorts of four-letter acronyms like you know I actually was going to cite them but I don't even remember some of them but it's like deep you know authentication like identity management with Exchange servers. I'm like, these are not the considerations that we think of a priority, but they are when you actually open it up to a broader group."

### MCP Future Vision

**Beyond Context Retrieval**
> "The two areas like MCP adjacent I get most excited about. One is around just taking action. So a lot of like V1 of these projects was around like how do you bring context into the models? um like we launch our integrations where you can pull in like GitHub, you can launch like Zapier actions, but I think like the the right mode or like the actually taking actions is going to be much more uh important going forward."

**Agent Economy Emergence**
> "The second one is like when MCPs and just agents more generally interact with each other and what the right protocol is. It feels early to try to standardize this too much... internally we talk about like at what point will your agents hire other agents and what does that economy of you know uh of things even look like."

## Coding at Anthropic: The 70% Reality

### Internal Usage Statistics

**Massive Code Generation Adoption**
> "We use it a ton. Over half of our pull requests are cloud code generated. Probably at this point it's probably over 70%."

**Code Review Challenge**
> "What does that mean for code review is something that we're figuring like you can get then you can get cloud code review or PR but then it's like turtles all the way down and like at what point do you have that that like oversight around like is this like going to lead us to an architectural dead end?"

**Technical Debt Paradigm Shift**
> "Does that matter if you can like overpower the usual like tech debt rewrite with um AI coding like we're and I think probably other folks like in labs working on like coding models like kind of patient zero for some of these for better and for worse."

### Second-Order Organizational Effects

**Amplified Inefficiencies**
> "What I'm realizing is like it makes all of your other inefficiencies as a product organization like extremely painful because now it's like the alignment meeting is like it's not just standing in the way of like an hour of engineering work that would happen. it's like standing in the way of like the equivalent of like four or eight hours."

**Organizational Breaking Points**
> "I think our product organization is going to break very much so with like with faster uh with code jet it just makes it very painful when you're like like it's even more wasted time with like driving alignment and the models are not helpful with that really."

**Current Model Limitations**
> "They can synthesize meetings they can maybe like tee up the next conversation but they're not like they're not yet at the point where they're like organizationally driving uh decision-making."

## Internal AI Adoption Patterns

### Beyond Technical Users

**Cross-Functional Adoption**
> "What's been cool has been seeing like different disciplines inside the company that are not technical start using the models a lot. um and whether that's you know people in sales using it for meeting prep and you know they start from just using like what's available and then like some blocker becomes really apparent then maybe we'll build something bespoke in there."

**Uneven Distribution Reality**
> "It's still less evenly distributed than you might expect even at an AI lab. I think there's uh even within a team like the salesperson that knows how to use it really well and the people are like doing it more traditionally and like the former person might be more effective or more like you know hit fewer blockers but it's not yet like yes it's like a requirement that everybody's going to use."

### Personal Usage Evolution

**Thought Partner Integration**
> "Myself like I just use it as a thought partner. So whenever I write anything whether it's like a strategy doc or a planning thing or performance review like uh I kind of re it's almost like in the same way that I started feeling weird trying to code on flights like after co-pilot where you're like oh wait I really feel like I'm half the engineer I usually am because this thing is not uh helping me go through like I feel that way now about if I write something and I don't have that extra sort of cycle through claude I'm like ah this is probably not like getting fully vetted."

### Social Dynamics and Stigma Breaking

**Shared Visibility Importance**
> "Some of our most successful internal products are ones that have shared visibility. like we like do a lot of things within Slack with with cloud integrated with internal tooling and I've learned that's really helpful for breaking down even at anthropic this like ooh did you make that with AI versus like yeah I did like it saved me like two hours like of course like I did other like better things to do than like write this performance review or something right."

**Public AI Usage Normalization**
> "What was happening around performance review season just a couple weeks ago is people using it to like generate their first drafts which was like very interesting in public so I don't know like I I wonder how much people who come up with just the assumption that you're going to use AI for a lot of what you're doing are just going to be more comfortable and not have that stigma around usage it kind of reminds me of the early midjourney days."

**Generational Expectations**
> "It's like also surprising seeing like how people enter the workplace like we've been doing more work with universities and like you know they'll come into work in a very different way in terms of like the expectation of how much they're going to use Genai and like there not being a stigma for it."

## Content and AI Future Perspective

### Story Over Technology

**Human Connection Remains Central**
> "I think regardless of like the medium or how much AI is being used to create things, I think you'll keep coming back to like is there a story being told? Is there a person behind the content that people can connect to and ultimately like react to over time? Um, and so it's like another tool in the toolbox of a storyteller."

**Beyond AI Generation Labels**
> "The majority of content will be AI generated so the distinction of like was this made by AI or not I think is going to be a not useful one. Um, I think there will still be interesting questions of like derivation and providence and and those kinds of things."

**Provenance and Attribution**
> "The things that were important in the past world like what did you source like is there a citation like when I think about like documents is still important and more doable now. Um but like whether it's AI generated I think is like not the interesting question going forward."

## Product Development Challenges and Insights

### The Usability Gap

**Current Product Reality**
> "I still think I'll speak for our products, but I think this is generally true. Like these products are really like hard to use effectively for most people approaching it for the first time. Um like we'll build things that I think are useful and then like they'll be good workflows, but it's still a little bit too much of like if you hold it the right way, you can have like incredible results."

**Instagram Simplicity Comparison**
> "We're very far from like the first time you open Instagram it's like what do you do this thing you take a photo and like it's like it's definitely not that and part of that's being you know primarily more like work oriented than than like pure sort of like you know personal use case oriented but that keeps me up at night which is like I like there's still a huge overhang of like how models are useful to people and their capabilities today."

### Application Layer Development Patterns

**AI-Light to AI-Heavy Problems**
> "Products that start sort of AI light and go AI heavy like tend to put AI like either in like a sidebar or like a it it ends up feeling like a secondary sort of surface and then especially as you move more and more agentically it's like harder and harder to make that like as full fullfeatured as you would want it to be."

**Primitive Exposure Issue**
> "A shocking number of AI like native products don't expose the primitives of the application to the models enough. And what I mean by that is like you ask it something and you're like oh I can't sorry I can't do that for you Dave because like it hasn't been built that way."

**AI-Native Architecture Imperative**
> "At what point do you rethink the kind of core sort of building blocks of your of your product to actually be more AI native... when you build like I've built a guey and then like I've stapled a model on top. you don't necessarily think that like that model should actually be your like primary user of your application in a lot of ways."

## Future Vision and Strategy

### Agent-Centric Roadmap

**Long-Running Agent Goal**
> "A lot of the like coding is the fir I think of as the first uh example of a broader theme which is can the models work for hours at a time like there was the meta chart from earlier and I think that that like is like I'm not going to call it our road map but it is like our goal which is like can the models work autonomously for longer."

**Infrastructure Requirements**
> "They're going to need things like memory they're going to need like advanced tool use they're going to need to onboard themselves organizationally like it's not stops being just about the model also is like the kind of full complement of things that you build around it like is it verifiable is like what does logging look like when you have a hundred agents working in your company rather than just one."

### Compute Allocation Dilemmas

**Research vs Product Tensions**
> "That allocation of relative compute is going to be incredibly more important and then at one point you're like wow Like if we have a very large product that is going to take a lot of inference and like that's highly profitable and that's useful but it is like directly taking time from from capacity for research."

**Innovation Risk**
> "That's not even like research for the known runs it's also research for your wacky ideas from the two people in a room that like have an interesting new idea about how to scale that could become the next test time compute."

**Market Feedback Value**
> "I feel like we've learned a lot from having our models out in the wild. I don't think we would have built like 37 sonnet the way we did it if it hadn't been for the like market feedback and seeing real use cases. So, I'm a big believer in having like an offering in the market."

## Agent-to-Agent Communication Challenges

### Unsolved Research Problems

**Discernment and Privacy**
> "A question that I don't think anybody has solved yet from a research perspective, at least nothing that I've seen publicly, that is going to be very important, especially when agents start being sort of like your avatar out in the world representative of you or your company is like better discernment around like what you reveal and what you engage in."

**Information Sharing Nuance**
> "If you're transacting with a vendor, sure you can reveal a credit card information, but it's just like some other random agent you're talking to, probably not, right? if it's company to company what gets revealed and what gets um sort of withheld."

**Model Behavior Challenges**
> "Models sometimes like they want to please so they want they'll want to tell you information but like how do we or they want to be too they're going to be too refusally if you like like never reveal any company information right so that sort of nuance and discernment feels unsolved."

### Identity and Memory Systems

**Longitudinal Agent Memory**
> "Feels like an agent should be better at doing the hundth task in the first which implies some kind of like longitudinal memory right um and there's going to be ones that are more like your extension of your work versus ones that are like wholly like an entire other employee right."

**Agent Identity Questions**
> "What is identity management for agents and like what is you know do they have names like I don't know that feels kind of a little bit too anthropomorphic but maybe that's useful."

## Strategic Market Positioning

### Multi-Product Ecosystem Reality

**Subscription Bundling Evolution**
> "There's what we find is like a lot of people at least at this phase in the product evolution like are comfortable like moving across or paying for multiple, right? And I'm sure you guys have seen this as well where it's like they're not replacement, right?"

**Token Portability Vision**
> "A product idea or concept that we've been thinking about is like it might be useful to be able to bring your tokens to other products as well which especially if you're bootstrapping a product and you might not be ready to pay get somebody to pay $ 20 to $200 a month like but they're already paying $200 somewhere else."

**Cable Bundle Analogy**
> "Maybe in the long run there's going to be like maybe more desire for consolidation or maybe we end up with some maybe this sounds really dystopian like some version of like the like cable bundle of some of these things."

## Key Insights and Frameworks

### Product Development Philosophy

**Bottom-Up Innovation**: AI product development requires embracing uncertainty and allowing model capabilities to guide product direction, inverting traditional top-down planning

**The Three-Time Rule**: "Do things three times and on the third time you can try to figure out what the abstractions are"

**Close-to-Model Development**: "The best products are the ones that are built very close to the model"

### Organizational Transformation

**AI Amplifies Inefficiencies**: Traditional organizational bottlenecks become exponentially more expensive when engineering productivity increases 4-8x

**Shared Visibility Reduces Stigma**: Public AI usage in internal tools helps normalize AI adoption across teams

**Generational Expectations**: New workforce enters with AI-native assumptions, reducing adoption friction

### Technical Architecture Principles

**AI-Native Design**: Applications should be architected with AI as the primary user interface, not bolted-on afterward

**Primitive Exposure**: AI systems need deep access to application primitives to be truly effective

**Research-Product Integration**: 10% of research team should be dedicated to product-specific fine-tuning and optimization

---

*This conversation reveals the fundamental shift occurring in product development methodology as AI capabilities continue to evolve, emphasizing the need for new organizational structures, development processes, and user experience paradigms.*