# The $200 AI That's Too Smart to Use (GPT-5 Pro Paradox Explained)

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-14  
**URL**: https://youtube.com/watch?v=7-LFn11dNHA  
**Duration**: 0:23:51  
**Views**: 46,605  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

This is your introduction to GPT5 Pro. Now, I know that not everybody has Chad GPT5 Pro. The reason I'm covering Chad GPT5 Pro is because it represents a different kind of computing. It gives us a hint of where AI is scaling next. And figuring out how to apply it in your business is not nearly as simple as taking all the AI use cases and adding GPT5 Pro to them. It takes a lot of judgment. What follows are my field notes as I've dug into the use cases that I'm seeing actually work and the rationale for why those use cases work so you can figure out where GPT5 Pro might work in your business. The central thesis I want to explore over the course of these notes is this. GPT5 Pro is the first AI model that is provably smarter and also experientially worse. and that this paradox reveals something really fundamental about the future of AI development. So, I'm gonna say it again because I think that people are going to kind of cough and spit out their coffee. This this model is smarter, yes, which everybody expected, but it's also experientially worse. And I'm going to get into why and kind of how that works. We're going to dive into the details on this one because I want you to walk away with the tools that you need to figure out where GPT5 Pro fits in your workflow and whether it's worth upgrading, right? because some people they are asking the question like I'm an individual user. Should I pay the really expensive $200 a month to get this thing? And I want you to walk away with the tools to make that decision. Okay, first let's talk about the architecture of GPT5 Pro because that underlies everything else we're going to discuss today. OpenAI has reimagined intelligence in terms of time. Now, I've talked about inference compute a fair bit, but it is worth revisiting because fundamentally with GPT5 Pro, that is where the smarts come from. It is not just model size. It is compute time. Specifically, GPT5 Pro, it doesn't just process your query. It's running multiple parallel reasoning chains at once. It can explore multiple solution paths independently. It evaluates them against each other and then it synthesizes the best approach out of all those reasoning chains. What this enables it to do is to think like a panel of experts that's debating internally before presenting a unified answer. I don't want to pretend to you that chat GPT has a monopoly on this general approach to inference time compute. It doesn't. There's other model makers out there that are working on this too. However, what GPT5 Pro does really, really well is it actually takes all of that parallel reasoning and it judges really coherently what is the correct decision or approach. And this emphasis on judging correctly is one of the hallmarks of GPT5 Pro and it's something that you'll see as a throughine when we get to the use cases that work. I think it is why GPT5 Pro with internet access scored so well on the IQ test. Now, I don't I'm not a huge believer in IQ tests. I think they're interesting directionally. It is unquestionably true that if you are following the story of LLMs and IQ tests, GPT5 Pro is really good. I think it scored a 148. Like, it's a phenomenally smart model in that specific measured test environment. And I think why is because that test environment values correctness too. And so GPT5 Pro is sort of in its element there. But this idea, let's come back to this idea of this panel of experts debating. This mirrors how humans actually solve hard problems. And I haven't seen this part discussed a ton online. When you face a difficult decision, you don't really just think linearly. If A then B, right? Like that's not how we actually think. It may be how we write, but it's not how we think. you are actually considering multiple perspectives like facets simultaneously. When you ruminate, when you think about an idea, it's almost like you're walking through different ideas at once and kind of even in the back of your head turning them over and looking at different angles of the idea. You might be saying, "What are the risks? What are the opportunities? How does this affect this other concept? What would happen if in a sense GPT5 Pro is mechanizing this parallel deliberation that we do in our heads?" It's trying to simulate it a little bit. You're not just paying $200 for access to a smarter model. You're paying for the compute to run multiple reasoning threads at once. And that gives you a clue as to why it's reserved for the smarter model. It's not cheap to run. Every query spawns parallel processes that take real compute resources. The thing is you get an advance on correctness. And so you can look at different sort of tests that show that you know this test 100% on advanced mathematics, right? Or 88.4% on graduate level reasoning, 22% fewer major errors in the bench. Okay, fine. Right? Like I have learned to take the test with a grain of salt. What I'm more interested in is the architecture that leads to correctness because that's what actually gets us where we need to go. However, before we get into use cases, this is where I talk about the disappointments or the fact that this is both a smarter model, which I think I've talked about with this concept of of inference time compute and the value and correctness. That's one of the things GPT5 Pro has really emphasized. We have a trade-off here. This is one of the reasons why this experience is somewhat disappointing. The parallel processing that makes GPT5 Pro really smart also breaks it depending on how you define broken in some very specific and predictable ways. The first one is a little bit ironic and it's worth paying attention to if you're in a business context. Right now GPT5 Pro is much much more vulnerable from a security perspective than GPT. And that's not just me saying that. that's widely reported across the security uh publications that matter. They are using adversarial techniques, jailbreaking techniques to test these models. And what they're discovering is GPT5 Pro and the GPT5 family overall don't test well. And by the way, if you're wondering what is the difference between pro and GPT5 thinking, very simply, it's about how much you're turning up the dial on that parallel reasoning. And GPT5 Pro is turned up to 11 like Spinal Tap, right? Like it that's just how it works. When the model is exploring multiple perspectives, adversarial prompts can poison a particular thread and influence the eventual synthesis. Essentially, you have more surface area for the prompts to attack. That's the architectural cost of parallel reasoning. Now, is somebody at OpenAI hard at work fixing that? I have no doubt. But at the moment, that is part of the challenge right now with GPT5 Pro. When you expand parallel threads, you expand surface attack vectors. You just do. Trade-off number two, personality loss. When you synthesize multiple reasoning chains, you get a synthesis. The model can struggle to maintain a consistent voice when it's aggregating perspectives. This is why you sometimes get really clean, really correct, but what users might call robotic responses from GPT5 Pro. It's part of the root cause for the frustration with the move from 40, which was an emotional model, to GPT5, which is a model that values correctness. When you when you look at multiple viewpoints and you pick the exact right one, and you're averaging and synthesizing, a lot of the personality just isn't there anymore. Trade-off number three, context degradation. Maintaining coherent context across parallel threads is much much harder than maintaining a single narrative thread which creates challenges because the parallel paths can start to diverge and create sort of memory fragmentation issues etc. This will come back as we talk about use cases and where to use GPT. The fourth one because before we jump on from this Chad GPT has done a lot of work behind the scenes I think to manage the risk of this so it's still usable for context. So, we'll we'll get into that. The fourth trade-off, data structure requirements. GPT5 Pro is hungry for data, but it needs data organized for multi-perspective analysis. A financial document, for example, should not just contain the numbers. It should contain multiple structured layers where it can account from a strategic perspective, a risk perspective, an accounting perspective. Organizations that are used to holding a lot of those strategic layers in the CFO's head or in multiple people's heads really are going to struggle with presenting GPT5 Pro with the kind of data it needs to thrive. So, let's get into the use cases. We've talked about some of the things that GPT5 Pro does well. We've talked about how that very power, the parallel reasoning creates vulnerabilities. Let's start to dive into where do we have use cases that work and where do we have use cases that don't. And I want to give you a key so that you can start to use these for yourself. Use GPT5 in cases where parallel reasoning is going to serve you really really well and correctness really really matters. as an example, scientific re research when uh Amgen and I believe this is a real example analyzes polymer structures, GPT5 Pro can evaluate chemical properties. It can evaluate structural integrity, manufacturing feasibility, and regulatory compliance all at once. We actually have like a lot of documentation on the web about the way GPT5 Pro and the way other OER reasoning models have helped to advance scientific research. And you see this thread over at Google as well. It's not the Oser model. They have their own reasoning models, but they are fundamentally going after scientific research because it enables you to reason across different perspectives on a body of data at once and it enables you to converge on a correct solution and correctness really matters. And so in the GPT5 Pro case, if you're analyzing these polymer structures, you can bring in multiple perspectives in each reasoning thread, right? domain expertise. You can bring in the structure of the molecule etc. And eventually the synthesis can produce insights that a single reasoning trace could not match and critically that can advance the field or at least act as a very strong thought partner to a PhD level researcher. And that is part of the reason why scientific research is so emphasized by modelmakers. They're good at it. The model's good at it. Not too many of us are scientists. So I want to give you some other examples of GPT5 Pro use cases that feel a little more accessible. Financial modeling. Every business at a certain scale has to financially model. GPT5 Pro is the kind of model that can simultaneously parse income statements, balance sheet, and cash flows and cross reference them for consistency. It can look at reconciling multiple data sources. It can look at accounting standards. It can look at time periods. If you process the data and feed it in a structured manner, it actually is going to do a great job of this. One of the things that I chuckled about when I did my review of Chat GPT5 is that I deliberately didn't do this as a way to test the model. And this is my chance to make it up to GPT5 Pro. I know I gave it really dirty data on purpose as a way of testing its reasoning ability. It did okay. I would recommend in practice you put the effort in to giving GPT5 Pro multiple perspectives at different layers in the business and make the data as clean as you possibly can because then you're going to get more useful information back. I do think financial modeling is a nice use case for GPT5 Pro. Legal analysis. Do some due diligence on large collections of documents. Look at contract terms. Maybe you identify legal risk. Look at dependencies. These reasoning traces can look at things from multiple perspectives and the synthesis can catch things that human reviewers might miss. This is not about saying the humans don't need to review the legal documents. It is about saying how can a tool that is designed for parallel reasoning converge toward correctness when a correct answer is available. Because in legal analysis also a correct answer is available. there's a correct and optimal legal stance on a particular due diligence question. You can name the top risks and you would be wrong if you missed one. Similarly, with financial modeling, you can name the overall correct financial output statement and you would be incorrect not just if a number was wrong, but if you did not take account of all of the components of the business and the financial model. GPT5 Pro excels at that kind of analysis. And so you have opportunities. And by the way, the financial modeling, the legal analysis also based on early insights from teams. And so science and finance and legal. Fine. What about something that's closer to tech? McKay Wriggley is both a content creator and also a coder. One of the things that he's called out is that he is excited about GPT5 Pro in the coding space specifically for architectural decisions. And that has been one of the areas where LLMs have historically struggled. Defining how you put technical systems together has been hard. GPT5 Pro with a sizable context window can enable you to look across large chunks of your codebase and make architectural recommendations about that codebase and it reasons toward correctness. like it will think through coding best practices run multiple reasoning traces all of those hallmarks of parallel reasoning and where it sings they come through and it thinks correctly. If you want to talk about marketing if you want to talk about product and where those things have GPT5 pro use cases look for areas where you have a correct or optimal decision and you can feed the model multiple parallel perspectives. And so if you are trying to enter into the market and your your product team and your marketing team are there and they're trying to figure out how to crack the market with a product, great great opportunity. Bring in some user interviews, bring in a survey of the market, bring in a company profile, bring in some product opportunities. Lot of grounds that help GPT5 Pro reason in parallel and you're going to get to a correct answer. That is the goal, right? Like you're going to get to something that gives you an optimal path through all of those variables. Let's look at a few cases where parallel reasoning probably doesn't help. I'm going to suggest to you that GPT5 Pro requires you to think architecturally to the extent that it may not help you with thinking sequentially. And that's where parallel reasoning can be a challenge because it can produce an overall coherent perspective in the ways I've described. That's really good. But for example, coding, which a lot of other LLM agents are actually quite good at. Coding is a much lower level of decisioning than architecture. Coding requires very sequential logic. There are reports already coming out that GPT5 Pro can weirdly lose the plot sometimes when it is producing code. And that is likely because it is running multiple plots, multiple sequential coding threads simultaneously. So be aware of that. You may not want to use it for coding. creative writing, you have to have a narrative with a particular singular voice. I would not use GPT5 Pro for this. And I don't know of many people who are, so this feels like an easy one. But you're going to get maybe some really coherent, thoughtful plot feedback from this model, plot architecture, where it's going to give you its solution to a particular plot problem, but it's not going to make the bold creative choice. It's not going to write in a particular voice. That is not really what this model does. conversation and this is a really important LLM use case. A lot of the LLM use cases that we see in production are conversational use cases. This is not a model for conversation. One, it takes a long time. And two, human dialogue needs consistency and personality. If it feels robotic, which GPT5 Pro is going to feel robotic, if it doesn't feel sequential, if it if it jumps around, humans aren't going to like it. And I think that is part of the reason why 40 is preferred by a lot of people and why ultimately Chad GPT had to bring it back. So those are a few cases. I hope they give you a sense of where parallel reasoning works well, where parallel reasoning doesn't work well. The key is can you give it the data it needs. And that brings me to the infrastructure cost of using GPT5 Pro. Success with GPT Pro requires a fundamental data restructuring that organizations tend to underestimate. Instead of linear documents that you feed, it would be ideal to feed GPT5 Pro more multi-dimensional data architectures. So if you're doing financial analysis, feed it the core data statements. These are facts, metrics, these are calculations. And then feed it perspectives. Here's a risk lens. What we think could go wrong. Here's a growth lens. What are the opportunities in the space? Here's a competitive lens with our market positioning. Then feed it cross references, temporal cross references, how metrics change over time, relational, how departments interact. Basically, you need to start thinking of it as giving this multiple thread reasoning agent as much context as you can in a very structured way because each parallel thread will need a coherent data path to run. And so you want to think about how you are orchestrating a symphony of reasoning threads that need to maintain some degree of coherence. One of the things that's interesting is the responses API is able to main maintain some chain of thought persistence across threads. And so if you're giving it multiple whacks at the apple, if you're giving it multiple attacks at the problem with context, this kind of multi-dimensional data architecture can let you start to feed it perspectives that build over time. I think the thing I want to call out here is that most organizations don't have the actual patience in practice to do this. And if you're going to use GPT5 Pro at its best, this underlines one of the consistent themes with AI, which is that we need to change to take advantage of what AI brings to the table. Our data needs to change to take advantage of what GPT5 Pro and other AIs bring to the table. And GPT5 Pro really forces that with a parallel reasoning architecture. So what are the strategic implications here? I would argue that GPT5 Pro presents the industry with some interesting strategic questions. So for OpenAI, they've proven that they can innovate on inference time compute and they can command premium pricing for specific use cases, but they haven't yet shown they can expand these use cases more generally. I've had to spend a lot of this video talking about where you don't use GPT5 Pro, and I think that's indicative. Claude is not actually an inference time compute model. Claude 4.1, Opus 4.1, it is using tools. It is interpreting, but it is not a traditional inference time compute model the way I've described GPT5. That's really interesting. Anthropic has been happy to train a model that is very good at tool use and tool calling and has been getting great results and great reviews, especially in the coding arena for that choice. Does Anthropic want to keep going down that path? Do they want to keep optimizing for coding because they believe coding has so much explanatory power long term over technical development trajectories? Or do they want to start to lean in on a thinking and reasoning model? And if they do, how does it reinforce their core value proposition around coding and their core value proposition around their personality? Because people love Claude's personality. Do they want to risk losing that? It's an interesting question. Google has to figure out how they are going to get to a model with a chat surface that is widely used and decide where they want to apply that reasoning power that they do have. They have reasoning power now that they employ to get phenomenal results in academic and technical domains. They have the the awards for science research and for protein folding and for math olympiad etc etc. It's not that they're missing the knowhow here at all, nor are they missing the technical architecture to get it done. They have their own separate architecture based on tranium chips, but they have to figure out where to productize that architectural innovation so that they have a unique product surface that people know to go to Google for. And that's something that Google has been struggling with for a while. Right now, the reason to go to Google is either you're already in Google Cloud or you really want the cheapest tokens per intelligence and you go to Google for that. Is that enough to sustain a strategic advantage or strategic share of the market over time? That's a question and I think it's a question GPT5 Pro puts a fine point on because what OpenAI is basically saying is we have a scaling paradigm here. We're going to keep making the model smarter and we're kind of going to dare you to beat us on smart reasoning models and Anthropic has their own corner with coding and non-reasoning models and Google's sort of in the middle right now. We are entering an era of architectural specialization. The next breakthrough and I and I think that people need to get past this idea of bigger models. The next breakthrough may not be a bigger model. It may be how we use reasoning architecture for specific cognitive tasks. Now that we're in the LLM era, we may see more specialization. That would not surprise me. So where do I want to leave you? Intelligence is not the same as utility. GPT5, however you measure it, is a very intelligent model, but its intelligence is not what makes it a success or a failure. The key is understanding that intelligence and utility are diverging as we get farther into the LLM era. And it's up to you to figure out if parallel reasoning makes AI smarter for the tasks that you want to accomplish. I think we're headed toward a future of AI stratification. I think we're going to have deep reasoning systems for very high stakes analysis. We're going to have conversational systems for daily interaction and we're going to have specialized tools for specific domains. The dream of one model that's better is I think it's dead. I don't think it's happening. And I think what's ironic is it's killed by the very GPT generation that promised the one model better at everything. I think what GPT5 Pro is showing us is that it's possible to have a model that is indeed better and also in some ways worse than its predecessors. There will not be one model to rule them all. And so the question for you isn't whether GPT5 Pro is worth $200 a month. It's whether you can define use cases that fit better with specialized tools or with deep reasoning systems or with conversational systems. If you are a conversational model person, do not pay the $200 a month. If you are a deep reasoning person, well, now you have to think about the analysis and whether you have the data to get ready and then maybe you're ready for GPT5 Pro. And if you're someone who only uses specialized tools, maybe you're not even using Chad GPT at all. This is the opening move in a new AI game where architectural differentiation is going to matter more and more. And that is why I've spent so much of this video explaining architectures and how they work and why GPT5 Pro is different. I hope this has been helpful. I hope you have a sense of where to use GPT5 Pro or whether or not to get it at all. Tears.

---

## Timestamped Transcript

[0:00:00] This is your introduction to GPT5 Pro.
[0:00:03] Now, I know that not everybody has Chad
[0:00:05] GPT5 Pro. The reason I'm covering Chad
[0:00:08] GPT5 Pro is because it represents a
[0:00:11] different kind of computing. It gives us
[0:00:14] a hint of where AI is scaling next. And
[0:00:17] figuring out how to apply it in your
[0:00:19] business is not nearly as simple as
[0:00:22] taking all the AI use cases and adding
[0:00:24] GPT5 Pro to them. It takes a lot of
[0:00:26] judgment. What follows are my field
[0:00:29] notes as I've dug into the use cases
[0:00:32] that I'm seeing actually work and the
[0:00:35] rationale for why those use cases work
[0:00:38] so you can figure out where GPT5 Pro
[0:00:40] might work in your business. The central
[0:00:43] thesis I want to explore over the course
[0:00:45] of these notes is this. GPT5 Pro is the
[0:00:48] first AI model that is provably smarter
[0:00:52] and also experientially worse. and that
[0:00:56] this paradox reveals something really
[0:00:58] fundamental about the future of AI
[0:01:00] development. So, I'm gonna say it again
[0:01:01] because I think that people are going to
[0:01:03] kind of cough and spit out their coffee.
[0:01:04] This this model is smarter, yes, which
[0:01:07] everybody expected, but it's also
[0:01:09] experientially worse. And I'm going to
[0:01:11] get into why and kind of how that works.
[0:01:13] We're going to dive into the details on
[0:01:14] this one because I want you to walk away
[0:01:16] with the tools that you need to figure
[0:01:18] out where GPT5 Pro fits in your workflow
[0:01:21] and whether it's worth upgrading, right?
[0:01:23] because some people they are asking the
[0:01:25] question like I'm an individual user.
[0:01:26] Should I pay the really expensive $200 a
[0:01:29] month to get this thing? And I want you
[0:01:31] to walk away with the tools to make that
[0:01:32] decision. Okay, first let's talk about
[0:01:34] the architecture of GPT5 Pro because
[0:01:37] that underlies everything else we're
[0:01:39] going to discuss today. OpenAI has
[0:01:42] reimagined intelligence in terms of
[0:01:44] time. Now, I've talked about inference
[0:01:47] compute a fair bit, but it is worth
[0:01:49] revisiting because fundamentally with
[0:01:51] GPT5 Pro, that is where the smarts come
[0:01:54] from. It is not just model size. It is
[0:01:58] compute time. Specifically, GPT5 Pro, it
[0:02:02] doesn't just process your query. It's
[0:02:04] running multiple parallel reasoning
[0:02:06] chains at once. It can explore multiple
[0:02:10] solution paths independently. It
[0:02:12] evaluates them against each other and
[0:02:14] then it synthesizes the best approach
[0:02:17] out of all those reasoning chains. What
[0:02:19] this enables it to do is to think like a
[0:02:21] panel of experts that's debating
[0:02:23] internally before presenting a unified
[0:02:25] answer. I don't want to pretend to you
[0:02:27] that chat GPT has a monopoly on this
[0:02:30] general approach to inference time
[0:02:31] compute. It doesn't. There's other model
[0:02:34] makers out there that are working on
[0:02:35] this too. However, what GPT5 Pro does
[0:02:38] really, really well is it actually takes
[0:02:42] all of that parallel reasoning and it
[0:02:44] judges really coherently what is the
[0:02:47] correct decision or approach. And this
[0:02:51] emphasis on judging correctly is one of
[0:02:53] the hallmarks of GPT5 Pro and it's
[0:02:57] something that you'll see as a
[0:02:58] throughine when we get to the use cases
[0:03:00] that work. I think it is why GPT5 Pro
[0:03:04] with internet access scored so well on
[0:03:07] the IQ test. Now, I don't I'm not a huge
[0:03:10] believer in IQ tests. I think they're
[0:03:12] interesting directionally. It is
[0:03:14] unquestionably true that if you are
[0:03:16] following the story of LLMs and IQ
[0:03:18] tests, GPT5 Pro is really good. I think
[0:03:21] it scored a 148. Like, it's a
[0:03:23] phenomenally smart model in that
[0:03:25] specific measured test environment. And
[0:03:27] I think why is because that test
[0:03:30] environment values correctness too. And
[0:03:33] so GPT5 Pro is sort of in its element
[0:03:35] there. But this idea, let's come back to
[0:03:37] this idea of this panel of experts
[0:03:39] debating. This mirrors how humans
[0:03:42] actually solve hard problems. And I
[0:03:44] haven't seen this part discussed a ton
[0:03:46] online. When you face a difficult
[0:03:48] decision, you don't really just think
[0:03:50] linearly. If A then B, right? Like
[0:03:52] that's not how we actually think. It may
[0:03:54] be how we write, but it's not how we
[0:03:55] think. you are actually considering
[0:03:58] multiple perspectives like facets
[0:03:59] simultaneously. When you ruminate, when
[0:04:02] you think about an idea, it's almost
[0:04:03] like you're walking through different
[0:04:05] ideas at once and kind of even in the
[0:04:07] back of your head turning them over and
[0:04:08] looking at different angles of the idea.
[0:04:10] You might be saying, "What are the
[0:04:11] risks? What are the opportunities? How
[0:04:13] does this affect this other concept?
[0:04:14] What would happen if in a sense GPT5 Pro
[0:04:18] is mechanizing this parallel
[0:04:19] deliberation that we do in our heads?"
[0:04:21] It's trying to simulate it a little bit.
[0:04:24] You're not just paying $200 for access
[0:04:27] to a smarter model. You're paying for
[0:04:30] the compute to run multiple reasoning
[0:04:33] threads at once. And that gives you a
[0:04:35] clue as to why it's reserved for the
[0:04:36] smarter model. It's not cheap to run.
[0:04:39] Every query spawns parallel processes
[0:04:42] that take real compute resources. The
[0:04:45] thing is you get an advance on
[0:04:47] correctness. And so you can look at
[0:04:49] different sort of tests that show that
[0:04:51] you know this test 100% on advanced
[0:04:53] mathematics, right? Or 88.4% on graduate
[0:04:56] level reasoning, 22% fewer major errors
[0:04:59] in the bench. Okay, fine. Right? Like I
[0:05:02] have learned to take the test with a
[0:05:03] grain of salt. What I'm more interested
[0:05:05] in is the architecture that leads to
[0:05:07] correctness because that's what actually
[0:05:09] gets us where we need to go. However,
[0:05:11] before we get into use cases, this is
[0:05:13] where I talk about the disappointments
[0:05:15] or the fact that this is both a smarter
[0:05:17] model, which I think I've talked about
[0:05:18] with this concept of of inference time
[0:05:21] compute and the value and correctness.
[0:05:22] That's one of the things GPT5 Pro has
[0:05:25] really emphasized. We have a trade-off
[0:05:27] here. This is one of the reasons why
[0:05:28] this experience is somewhat
[0:05:30] disappointing. The parallel processing
[0:05:32] that makes GPT5 Pro really smart also
[0:05:36] breaks it depending on how you define
[0:05:38] broken in some very specific and
[0:05:40] predictable ways. The first one is a
[0:05:42] little bit ironic and it's worth paying
[0:05:44] attention to if you're in a business
[0:05:45] context. Right now GPT5
[0:05:49] Pro is much much more vulnerable from a
[0:05:53] security perspective than GPT. And
[0:05:56] that's not just me saying that. that's
[0:05:57] widely reported across the security uh
[0:06:00] publications that matter. They are using
[0:06:02] adversarial techniques, jailbreaking
[0:06:05] techniques to test these models. And
[0:06:07] what they're discovering is GPT5 Pro and
[0:06:10] the GPT5 family overall don't test well.
[0:06:14] And by the way, if you're wondering what
[0:06:15] is the difference between pro and GPT5
[0:06:18] thinking, very simply, it's about how
[0:06:20] much you're turning up the dial on that
[0:06:22] parallel reasoning. And GPT5 Pro is
[0:06:24] turned up to 11 like Spinal Tap, right?
[0:06:26] Like it that's just how it works. When
[0:06:28] the model is exploring multiple
[0:06:30] perspectives, adversarial prompts can
[0:06:33] poison a particular thread and influence
[0:06:35] the eventual synthesis. Essentially, you
[0:06:38] have more surface area for the prompts
[0:06:40] to attack. That's the architectural cost
[0:06:43] of parallel reasoning. Now, is somebody
[0:06:45] at OpenAI hard at work fixing that? I
[0:06:47] have no doubt. But at the moment, that
[0:06:50] is part of the challenge right now with
[0:06:52] GPT5 Pro. When you expand parallel
[0:06:54] threads, you expand surface attack
[0:06:56] vectors. You just do. Trade-off number
[0:06:58] two, personality loss. When you
[0:07:01] synthesize multiple reasoning chains,
[0:07:03] you get a synthesis. The model can
[0:07:06] struggle to maintain a consistent voice
[0:07:10] when it's aggregating perspectives. This
[0:07:12] is why you sometimes get really clean,
[0:07:15] really correct, but what users might
[0:07:17] call robotic responses from GPT5 Pro.
[0:07:20] It's part of the root cause for the
[0:07:22] frustration
[0:07:24] with the move from 40, which was an
[0:07:26] emotional model, to GPT5, which is a
[0:07:29] model that values correctness.
[0:07:32] When you when you look at multiple
[0:07:34] viewpoints and you pick the exact right
[0:07:36] one, and you're averaging and
[0:07:37] synthesizing, a lot of the personality
[0:07:39] just isn't there anymore. Trade-off
[0:07:41] number three, context degradation.
[0:07:44] Maintaining coherent context across
[0:07:47] parallel threads is much much harder
[0:07:49] than maintaining a single narrative
[0:07:52] thread which creates challenges because
[0:07:55] the parallel paths can start to diverge
[0:07:57] and create sort of memory fragmentation
[0:07:59] issues etc. This will come back as we
[0:08:01] talk about use cases and where to use
[0:08:03] GPT. The fourth one because before we
[0:08:06] jump on from this Chad GPT has done a
[0:08:08] lot of work behind the scenes I think to
[0:08:10] manage the risk of this so it's still
[0:08:12] usable for context. So, we'll we'll get
[0:08:14] into that. The fourth trade-off, data
[0:08:16] structure requirements. GPT5 Pro is
[0:08:19] hungry for data, but it needs data
[0:08:21] organized for multi-perspective
[0:08:23] analysis. A financial document, for
[0:08:25] example, should not just contain the
[0:08:28] numbers. It should contain multiple
[0:08:30] structured layers where it can account
[0:08:32] from a strategic perspective, a risk
[0:08:34] perspective, an accounting perspective.
[0:08:35] Organizations that are used to holding a
[0:08:38] lot of those strategic layers in the
[0:08:40] CFO's head or in multiple people's heads
[0:08:43] really are going to struggle with
[0:08:46] presenting GPT5 Pro with the kind of
[0:08:48] data it needs to thrive. So, let's get
[0:08:51] into the use cases. We've talked about
[0:08:54] some of the things that GPT5 Pro does
[0:08:56] well. We've talked about how that very
[0:08:58] power, the parallel reasoning creates
[0:09:00] vulnerabilities. Let's start to dive
[0:09:02] into where do we have use cases that
[0:09:06] work and where do we have use cases that
[0:09:08] don't. And I want to give you a key so
[0:09:11] that you can start to use these for
[0:09:13] yourself. Use GPT5 in cases where
[0:09:17] parallel reasoning is going to serve you
[0:09:20] really really well and correctness
[0:09:22] really really matters. as an example,
[0:09:24] scientific re research when uh Amgen and
[0:09:28] I believe this is a real example
[0:09:29] analyzes polymer structures, GPT5 Pro
[0:09:33] can evaluate chemical properties. It can
[0:09:35] evaluate structural integrity,
[0:09:37] manufacturing feasibility, and
[0:09:38] regulatory compliance all at once. We
[0:09:41] actually have like a lot of
[0:09:42] documentation on the web about the way
[0:09:45] GPT5 Pro and the way other OER reasoning
[0:09:49] models have helped to advance scientific
[0:09:52] research. And you see this thread over
[0:09:54] at Google as well. It's not the Oser
[0:09:55] model. They have their own reasoning
[0:09:57] models, but they are fundamentally going
[0:09:59] after scientific research because it
[0:10:02] enables you to reason across different
[0:10:05] perspectives on a body of data at once
[0:10:08] and it enables you to converge on a
[0:10:10] correct solution and correctness really
[0:10:12] matters. And so in the GPT5 Pro case, if
[0:10:15] you're analyzing these polymer
[0:10:16] structures, you can bring in multiple
[0:10:19] perspectives in each reasoning thread,
[0:10:20] right? domain expertise. You can bring
[0:10:22] in the structure of the molecule etc.
[0:10:26] And eventually the synthesis can produce
[0:10:28] insights that a single reasoning trace
[0:10:31] could not match and critically that can
[0:10:33] advance the field or at least act as a
[0:10:35] very strong thought partner to a PhD
[0:10:38] level researcher. And that is part of
[0:10:40] the reason why scientific research is so
[0:10:43] emphasized by modelmakers. They're good
[0:10:45] at it. The model's good at it. Not too
[0:10:48] many of us are scientists. So I want to
[0:10:50] give you some other examples of GPT5 Pro
[0:10:52] use cases that feel a little more
[0:10:54] accessible. Financial modeling. Every
[0:10:57] business at a certain scale has to
[0:10:58] financially model. GPT5 Pro is the kind
[0:11:01] of model that can simultaneously parse
[0:11:04] income statements, balance sheet, and
[0:11:06] cash flows and cross reference them for
[0:11:09] consistency. It can look at reconciling
[0:11:12] multiple data sources. It can look at
[0:11:14] accounting standards. It can look at
[0:11:15] time periods. If you process the data
[0:11:18] and feed it in a structured manner, it
[0:11:20] actually is going to do a great job of
[0:11:22] this. One of the things that I chuckled
[0:11:24] about when I did my review of Chat GPT5
[0:11:26] is that I deliberately didn't do this as
[0:11:28] a way to test the model. And this is my
[0:11:30] chance to make it up to GPT5 Pro. I know
[0:11:33] I gave it really dirty data on purpose
[0:11:36] as a way of testing its reasoning
[0:11:38] ability. It did okay. I would recommend
[0:11:40] in practice you put the effort in to
[0:11:42] giving GPT5 Pro multiple perspectives at
[0:11:45] different layers in the business and
[0:11:46] make the data as clean as you possibly
[0:11:48] can because then you're going to get
[0:11:50] more useful information back. I do think
[0:11:52] financial modeling is a nice use case
[0:11:54] for GPT5 Pro. Legal analysis. Do some
[0:11:57] due diligence on large collections of
[0:12:00] documents. Look at contract terms. Maybe
[0:12:03] you identify legal risk. Look at
[0:12:05] dependencies. These reasoning traces can
[0:12:08] look at things from multiple
[0:12:09] perspectives and the synthesis can catch
[0:12:12] things that human reviewers might miss.
[0:12:14] This is not about saying the humans
[0:12:16] don't need to review the legal
[0:12:18] documents. It is about saying how can a
[0:12:23] tool that is designed for parallel
[0:12:25] reasoning converge toward correctness
[0:12:27] when a correct answer is available.
[0:12:29] Because in legal analysis also a correct
[0:12:32] answer is available. there's a correct
[0:12:33] and optimal legal stance on a particular
[0:12:36] due diligence question. You can name the
[0:12:38] top risks and you would be wrong if you
[0:12:40] missed one. Similarly, with financial
[0:12:42] modeling, you can name the overall
[0:12:45] correct financial output statement and
[0:12:48] you would be incorrect not just if a
[0:12:50] number was wrong, but if you did not
[0:12:53] take account of all of the components of
[0:12:56] the business and the financial model.
[0:12:58] GPT5 Pro excels at that kind of
[0:13:00] analysis. And so you have opportunities.
[0:13:03] And by the way, the financial modeling,
[0:13:04] the legal analysis also based on early
[0:13:07] insights from teams. And so science and
[0:13:09] finance and legal. Fine. What about
[0:13:11] something that's closer to tech? McKay
[0:13:14] Wriggley is both a content creator and
[0:13:17] also a coder. One of the things that
[0:13:19] he's called out is that he is excited
[0:13:21] about GPT5 Pro in the coding space
[0:13:25] specifically for architectural
[0:13:27] decisions. And that has been one of the
[0:13:29] areas where LLMs have historically
[0:13:31] struggled. Defining how you put
[0:13:33] technical systems together has been
[0:13:36] hard. GPT5 Pro with a sizable context
[0:13:40] window can enable you to look across
[0:13:43] large chunks of your codebase and make
[0:13:46] architectural recommendations about that
[0:13:49] codebase and it reasons toward
[0:13:51] correctness. like it will think through
[0:13:52] coding best practices run multiple
[0:13:55] reasoning traces all of those hallmarks
[0:13:57] of parallel reasoning and where it sings
[0:13:59] they come through and it thinks
[0:14:00] correctly. If you want to talk about
[0:14:02] marketing if you want to talk about
[0:14:03] product and where those things have GPT5
[0:14:07] pro use cases look for areas where you
[0:14:09] have a correct or optimal decision and
[0:14:11] you can feed the model multiple parallel
[0:14:13] perspectives. And so if you are trying
[0:14:15] to enter into the market and your your
[0:14:17] product team and your marketing team are
[0:14:18] there and they're trying to figure out
[0:14:19] how to crack the market with a product,
[0:14:21] great great opportunity. Bring in some
[0:14:24] user interviews, bring in a survey of
[0:14:26] the market, bring in a company profile,
[0:14:28] bring in some product opportunities. Lot
[0:14:30] of grounds that help GPT5 Pro reason in
[0:14:34] parallel and you're going to get to a
[0:14:36] correct answer. That is the goal, right?
[0:14:39] Like you're going to get to something
[0:14:40] that gives you an optimal path through
[0:14:42] all of those variables. Let's look at a
[0:14:44] few cases where parallel reasoning
[0:14:47] probably doesn't help. I'm going to
[0:14:49] suggest to you that GPT5 Pro requires
[0:14:53] you to think architecturally to the
[0:14:57] extent that it may not help you with
[0:15:00] thinking sequentially. And that's where
[0:15:02] parallel reasoning can be a challenge
[0:15:03] because it can produce an overall
[0:15:05] coherent perspective in the ways I've
[0:15:07] described. That's really good. But for
[0:15:09] example, coding, which a lot of other
[0:15:10] LLM agents are actually quite good at.
[0:15:12] Coding is a much lower level of
[0:15:14] decisioning than architecture. Coding
[0:15:16] requires very sequential logic. There
[0:15:18] are reports already coming out that GPT5
[0:15:22] Pro can weirdly lose the plot sometimes
[0:15:24] when it is producing code. And that is
[0:15:26] likely because it is running multiple
[0:15:28] plots, multiple sequential coding
[0:15:30] threads simultaneously. So be aware of
[0:15:33] that. You may not want to use it for
[0:15:35] coding. creative writing, you have to
[0:15:37] have a narrative with a particular
[0:15:40] singular voice. I would not use GPT5 Pro
[0:15:43] for this. And I don't know of many
[0:15:45] people who are, so this feels like an
[0:15:46] easy one. But you're going to get maybe
[0:15:49] some really coherent, thoughtful plot
[0:15:51] feedback from this model, plot
[0:15:53] architecture, where it's going to give
[0:15:55] you its solution to a particular plot
[0:15:57] problem, but it's not going to make the
[0:15:59] bold creative choice. It's not going to
[0:16:01] write in a particular voice. That is not
[0:16:03] really what this model does.
[0:16:05] conversation and this is a really
[0:16:07] important LLM use case. A lot of the LLM
[0:16:09] use cases that we see in production are
[0:16:13] conversational use cases. This is not a
[0:16:15] model for conversation. One, it takes a
[0:16:17] long time. And two, human dialogue needs
[0:16:20] consistency and personality. If it feels
[0:16:22] robotic, which GPT5 Pro is going to feel
[0:16:25] robotic, if it doesn't feel sequential,
[0:16:26] if it if it jumps around, humans aren't
[0:16:28] going to like it. And I think that is
[0:16:30] part of the reason why 40 is preferred
[0:16:33] by a lot of people and why ultimately
[0:16:36] Chad GPT had to bring it back. So those
[0:16:38] are a few cases. I hope they give you a
[0:16:39] sense of where parallel reasoning works
[0:16:41] well, where parallel reasoning doesn't
[0:16:42] work well. The key is can you give it
[0:16:44] the data it needs. And that brings me to
[0:16:47] the infrastructure cost of using GPT5
[0:16:50] Pro. Success with GPT Pro requires a
[0:16:54] fundamental data restructuring that
[0:16:56] organizations tend to underestimate.
[0:16:59] Instead of linear documents that you
[0:17:01] feed, it would be ideal to feed GPT5
[0:17:05] Pro more multi-dimensional data
[0:17:08] architectures. So if you're doing
[0:17:09] financial analysis, feed it the core
[0:17:12] data statements. These are facts,
[0:17:13] metrics, these are calculations. And
[0:17:15] then feed it perspectives. Here's a risk
[0:17:17] lens. What we think could go wrong.
[0:17:19] Here's a growth lens. What are the
[0:17:20] opportunities in the space? Here's a
[0:17:22] competitive lens with our market
[0:17:23] positioning. Then feed it cross
[0:17:24] references, temporal cross references,
[0:17:27] how metrics change over time,
[0:17:28] relational, how departments interact.
[0:17:31] Basically, you need to start thinking of
[0:17:32] it as giving this multiple thread
[0:17:37] reasoning agent as much context as you
[0:17:39] can in a very structured way because
[0:17:41] each parallel thread will need a
[0:17:43] coherent data path to run. And so you
[0:17:46] want to think about how you are
[0:17:49] orchestrating a symphony of reasoning
[0:17:52] threads that need to maintain some
[0:17:54] degree of coherence. One of the things
[0:17:57] that's interesting is the responses API
[0:18:00] is able to main maintain some chain of
[0:18:02] thought persistence across threads. And
[0:18:05] so if you're giving it multiple whacks
[0:18:06] at the apple, if you're giving it
[0:18:08] multiple attacks at the problem with
[0:18:10] context, this kind of multi-dimensional
[0:18:12] data architecture can let you start to
[0:18:14] feed it perspectives that build over
[0:18:16] time. I think the thing I want to call
[0:18:18] out here is that most organizations
[0:18:20] don't have the actual patience in
[0:18:22] practice to do this. And if you're going
[0:18:24] to use GPT5 Pro at its best, this
[0:18:27] underlines one of the consistent themes
[0:18:29] with AI, which is that we need to change
[0:18:32] to take advantage of what AI brings to
[0:18:34] the table. Our data needs to change to
[0:18:36] take advantage of what GPT5 Pro and
[0:18:39] other AIs bring to the table. And GPT5
[0:18:41] Pro really forces that with a parallel
[0:18:43] reasoning architecture. So what are the
[0:18:44] strategic implications here? I would
[0:18:46] argue that GPT5 Pro presents the
[0:18:50] industry with some interesting strategic
[0:18:53] questions. So for OpenAI, they've proven
[0:18:57] that they can innovate on inference time
[0:19:00] compute and they can command premium
[0:19:02] pricing for specific use cases, but they
[0:19:05] haven't yet shown they can expand these
[0:19:06] use cases more generally. I've had to
[0:19:08] spend a lot of this video talking about
[0:19:10] where you don't use GPT5 Pro, and I
[0:19:13] think that's indicative. Claude is not
[0:19:16] actually an inference time compute
[0:19:18] model. Claude 4.1, Opus 4.1, it is using
[0:19:23] tools. It is interpreting, but it is not
[0:19:26] a traditional inference time compute
[0:19:28] model the way I've described GPT5.
[0:19:30] That's really interesting. Anthropic has
[0:19:32] been happy to train a model that is very
[0:19:35] good at tool use and tool calling and
[0:19:37] has been getting great results and great
[0:19:39] reviews, especially in the coding arena
[0:19:42] for that choice. Does Anthropic want to
[0:19:44] keep going down that path? Do they want
[0:19:46] to keep optimizing for coding because
[0:19:49] they believe coding has so much
[0:19:50] explanatory power long term over
[0:19:53] technical development trajectories? Or
[0:19:55] do they want to start to lean in on a
[0:19:57] thinking and reasoning model? And if
[0:19:58] they do, how does it reinforce their
[0:20:00] core value proposition around coding and
[0:20:02] their core value proposition around
[0:20:03] their personality? Because people love
[0:20:05] Claude's personality. Do they want to
[0:20:07] risk losing that? It's an interesting
[0:20:08] question. Google has to figure out how
[0:20:11] they are going to get to a model with a
[0:20:15] chat surface that is widely used and
[0:20:19] decide where they want to apply that
[0:20:22] reasoning power that they do have. They
[0:20:25] have reasoning power now that they
[0:20:28] employ to get phenomenal results in
[0:20:30] academic and technical domains. They
[0:20:32] have the the awards for science research
[0:20:34] and for protein folding and for math
[0:20:36] olympiad etc etc. It's not that they're
[0:20:39] missing the knowhow here at all, nor are
[0:20:41] they missing the technical architecture
[0:20:43] to get it done. They have their own
[0:20:45] separate architecture based on tranium
[0:20:46] chips, but they have to figure out where
[0:20:50] to productize that architectural
[0:20:52] innovation so that they have a unique
[0:20:55] product surface that people know to go
[0:20:58] to Google for. And that's something that
[0:21:00] Google has been struggling with for a
[0:21:02] while. Right now, the reason to go to
[0:21:05] Google is either you're already in
[0:21:06] Google Cloud or you really want the
[0:21:09] cheapest tokens per intelligence and you
[0:21:11] go to Google for that. Is that enough to
[0:21:13] sustain a strategic advantage or
[0:21:17] strategic share of the market over time?
[0:21:19] That's a question and I think it's a
[0:21:21] question GPT5 Pro puts a fine point on
[0:21:23] because what OpenAI is basically saying
[0:21:25] is we have a scaling paradigm here.
[0:21:27] We're going to keep making the model
[0:21:28] smarter and we're kind of going to dare
[0:21:30] you to beat us on smart reasoning models
[0:21:32] and Anthropic has their own corner with
[0:21:34] coding and non-reasoning models and
[0:21:36] Google's sort of in the middle right
[0:21:37] now. We are entering an era of
[0:21:39] architectural specialization. The next
[0:21:42] breakthrough and I and I think that
[0:21:43] people need to get past this idea of
[0:21:44] bigger models. The next breakthrough may
[0:21:46] not be a bigger model. It may be how we
[0:21:48] use reasoning architecture for specific
[0:21:50] cognitive tasks. Now that we're in the
[0:21:52] LLM era, we may see more specialization.
[0:21:55] That would not surprise me. So where do
[0:21:57] I want to leave you? Intelligence is not
[0:21:59] the same as utility. GPT5, however you
[0:22:03] measure it, is a very intelligent model,
[0:22:05] but its intelligence is not what makes
[0:22:07] it a success or a failure. The key is
[0:22:10] understanding that intelligence and
[0:22:11] utility are diverging as we get farther
[0:22:13] into the LLM era. And it's up to you to
[0:22:16] figure out if parallel reasoning makes
[0:22:18] AI smarter for the tasks that you want
[0:22:21] to accomplish. I think we're headed
[0:22:23] toward a future of AI stratification. I
[0:22:25] think we're going to have deep reasoning
[0:22:26] systems for very high stakes analysis.
[0:22:28] We're going to have conversational
[0:22:30] systems for daily interaction and we're
[0:22:32] going to have specialized tools for
[0:22:33] specific domains. The dream of one model
[0:22:36] that's better is I think it's dead. I
[0:22:39] don't think it's happening. And I think
[0:22:40] what's ironic is it's killed by the very
[0:22:43] GPT generation that promised the one
[0:22:46] model better at everything. I think what
[0:22:48] GPT5 Pro is showing us is that it's
[0:22:51] possible to have a model that is indeed
[0:22:53] better and also in some ways worse than
[0:22:55] its predecessors. There will not be one
[0:22:57] model to rule them all. And so the
[0:23:00] question for you isn't whether GPT5 Pro
[0:23:03] is worth $200 a month. It's whether you
[0:23:06] can define use cases that fit better
[0:23:10] with specialized tools or with deep
[0:23:12] reasoning systems or with conversational
[0:23:14] systems. If you are a conversational
[0:23:16] model person, do not pay the $200 a
[0:23:18] month. If you are a deep reasoning
[0:23:20] person, well, now you have to think
[0:23:21] about the analysis and whether you have
[0:23:23] the data to get ready and then maybe
[0:23:24] you're ready for GPT5 Pro. And if you're
[0:23:26] someone who only uses specialized tools,
[0:23:29] maybe you're not even using Chad GPT at
[0:23:31] all. This is the opening move in a new
[0:23:34] AI game where architectural
[0:23:36] differentiation is going to matter more
[0:23:37] and more. And that is why I've spent so
[0:23:39] much of this video explaining
[0:23:41] architectures and how they work and why
[0:23:43] GPT5 Pro is different. I hope this has
[0:23:45] been helpful. I hope you have a sense of
[0:23:47] where to use GPT5 Pro or whether or not
[0:23:49] to get it at all. Tears.

---

*Extracted from YouTube Auto-generated captions*