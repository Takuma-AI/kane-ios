# Inside ChatGPT-5's Brain: System Prompt Secrets for First Movers

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-12  
**URL**: https://youtube.com/watch?v=aVXtoWm1DEM  
**Duration**: 0:14:09  
**Views**: 16,238  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

I've spent the last few hours just digging super deeply into chat GPT5 system prompt. System prompts are super useful to understand once they leak, which they seem to really reliably just a few days after the product launches, thanks to Elder Plyus, who is an internet personality with a habit of leaking prompts. So, I studied the prompt leak that Elder Plyus posted on GitHub. I can sort of stick it in the comments here so you can see it. The key is understanding not just the prompt itself, but how the prompt shapes GPT5's interaction and what that means for your prompting behavior versus other models versus Claude versus Gemini versus Chad GPT40. The number one thing I want to call out is that the system prompt suggests to us that GPT5 has an extraordinary bias to ship. So instead of asking should I proceed, it just proceeds as much as it possibly can. It may ask one clarifying question max and that's straight from the prompt and then it just goes into execution mode. This is a deliberate paradigm shift from positioning the chatbot as a helpful employee or helpful assistant to you personally to moving it toward a full agentic colleague. And this matters because tasks that take five back and forths are now going to happen in one. And it means that wrong assumptions that you may inadvertently have placed in the prompt, they compound into very nicel looking disasters instead of helpful clarifications. So you have to keep in mind when you work with chat GPT5, the thing wants to ship. I've called it a PM on crack uh to its face because that's how like wildly excited it is about shipping fast. The specification piece is also something we need to talk about. That's the second big thing I want to call out. We have been used to writing sort of iterative conversations where we converse back and forth and gradually arrive at meaning. This worked well with Claude. It still does. It works well with earlier models of chat GPT. It's worked with Gemini. You need to move from having conversations to writing specifications with this model to get the most out of it. And I realize that there are people who will throw up their hands and say that is not for me. I don't want it. But that is the conclusion that OpenAI has come to when it comes to actually getting these models to do more useful work. You have to be higher grade in your intent. You have to write specs, not just conversations. It comes back to prompt engineering. So you can't treat chat GPT5 like you treat chat GPT4. can't iteratively refine. You must nail it on the first shot with clear deliverables, clear assumptions, clear constraints. So, for example, instead of give me help with my pricing strategy, say I'd like you to use a pricing framework for B2B SAS. I need three options with very clear trade-offs. It should be less than 400 words and I want it to be decision ready for a founding team. Please exclude the option for enterprise pricing. You'll get a much much better result with the second prompt. And that was always somewhat true, but in the past with other models because they weren't so eager to complete, you had the chance to refine it down the road. Third point from the system prompt, there are critical non-negotiable prompt elements in GPT5 that have not been perhaps quite as critical in the initial prompt before. The first critical element, specify the deliverable, specify the format, specify the length, specify the audience. Even if it's just you, if you don't do this, the model can overcomplete. And that feels really weird for me to say because this model still has a bullet-like tendency. Sort of like 03 liked bullets. This model likes bullets, too. But it likes to be complete with those bullets. And so you can get really big completions in the API. You can get big completions in the chat unless you specify this is what I want exactly. You also should explicitly state what the model needs to assume about context, scope, and timeline. So if you're writing a prompt and you want it to assume a particular thing about the context or the scope of what you're asking, bind it to that assumption at the top in the initial prompt. And then the third thing to call out is just name it. declare tools that it is allowed to use or forbidden to use upfront because otherwise it so agentic it's going to decide to go get a web search or go execute code whether you want it to or not like if you don't want it to solve with code and you want to answer with strategic thinking say don't build this in code just think strategically I've had to do that several times so one of the things that I want to call out is that this is a model that gives a compound advantage to early adopters I think about that as someone who's been a founder and I know the importance of speed. Chat GPT5 essentially rewards a bias to speed and a bias to build and if you can work in Chad GPT5 into your workflow and actually go faster as a result you are going to build a compound advantage. So, one of the things that I want to suggest there, if you're interested in becoming one of those early adopters, gaining that compound advantage, and maybe you're an individual and you're just gaining a compound advantage in the talent marketplace, still try to ship specs versus just a casual prompt. And even if they are imperfect specifications, you will get a better starting point versus just a very loose initial prompt. you would rather try to prompt in the way that GPT5 expects as I've been discussing with tools, with specifications, with constraints, with assumptions, and maybe not get it perfect, but still get really far down the road versus not trying at all. So, the key to the compound advantage is just start trying and recognize that this model's bias to speed gives an advantage to early adopters. I also want to call out that canvas plus memory is giving you some different options with GPT5. now that it has better front-end coding capabilities. Canvas is not just for long documents anymore. It's essentially it's like version control for AI work. You can create a product spec v1. You can update the same ID for revisions. You can start to engage in memory for persistent AI context. And so what you should be able to do is explicitly save preferences like users prefer three bullet executive summaries. And you start to build a personalized AI that knows your your style. And so effectively use those memories that you can save and explicitly save in the chat with Jet GPT so that you start to encode preferences over time and then combine the memories with how canvas works to start to get a more collaborative editing experience. And the reason why that's really interesting to me is that you can have markdown files where you're referring to memories in the canvas and also memories that you've encoded with chat GPT directly. So the memories can be in the chat in the conversation in the context window and also outside of it. You can also have the use of canvas as a coding artifact where you can code front end and then you can look through different versions and check out the different versions and give feedback based on memories. We're just at the beginning of what this means, but my hunch is that GPC5 is leaning more into canvas and memory and the system prompt is reinforcing that. So one of the things that I want to call out that no system prompt is perfect, right? Like there's always going to be issues. You need to be really careful about how you deploy this model because of the power I've discussed. And I'm going to give you three examples of failure modes that this prompt allows you to jump right into failing on if you're not careful. The first one you're probably not surprised by. Speculative execution. The model will dive straight into something completely comprehensive when you just wanted a quick check. The solution? Include a constraint section. include a non-goals section. Something that specifies very clearly what you don't want. Second failure mode, tool usage surprises. Again, I doubt you're surprised given what I've talked about with aggressive tool usage. I'm going to remind you, use tool policies in a prompt that matters. If you care about the prompt and how it's done, use a tool policy. Write it out. This is allowed. This is not allowed. Another one that's a little bit more obscure that I haven't seen people complain about, but it is explicitly in the system prompt. Lost commentary after image generation. The system prompt explicitly kills explanations after images. So, you will have to split that into multiple turns. Generate the image and then analyze the image second. Let's step back. What does it mean if you read the tea leaves from the system prompt? Where is open AI going? I want to suggest that this is the clearest roadmap, much more clear than we get from sort of public statements from Sam Alman or others. Open AI is leaning aggressively into an agent operating system. This is not intended to be just a better chatbot. It is the architecture for an operating system. Open AAI is building towards chat GPT as your primary workspace. something that competes directly with Microsoft that can I know it's ironic right given their agreements with Microsoft but they want it to be your workspace that consolidates documents that consolidates code that consolidates scheduling and memory into one unitary interface your day your workday goes in chat GPT that is the dream and there are also implications for how this will handle at the enterprise level I would expect expect compliance features audit trails governance controls, things that help you build your prompt signal into a production pipeline. You see a little bit of this as OpenAI has started to roll out lots of education around AI for corporate customers and not just paid education like free like you can send your employees to get free OpenAI education. People don't always know that. They're also building and launching with Chad GPT5 special prompt improvers and helpers for folks using the API. I would expect a lot more of that because what they want is for you to actually bake chat GPT into your production pipelines with the kind of supportive infrastructure uh that enterprises need and that's why the compliance features come out and the audit trails and all of that and so to be clear these are things that I am seeing coming down the road. It's not like there is a secret chat GPT mode that immediately triggers a compliance feature right now. I'm not saying that. What I am saying is that if you look at the way they have configured the system prompt to be agentic and you look at the way they launched it with features that are aimed at company support on day one, you can read the tea leaves. Okay. I want to suggest to you as we start to close out a master template that I think is designed specifically for GPT5 that should work pretty well. It has a few separate labels and I'll just go through them one at a time. The first one is task. Define the task as clearly as you can. The second line, deliverable. Define the format, the length, and the audience. Third line, assumptions. Specify the assumptions in bullets as clearly as you can. Fourth line, non-goals. Be very, very clear about the non- goals or constraints or things that are not to be done. Fifth line, tools. What's allowed and what's forbidden. Sixth line, acceptance. Specify the success criteria. If this sounds extremely dry, well, it is a little dry, but it's going to get you better results. So why? Let's step back. Why does this change everything? Why does this change the way we work with our AI? In the end, what we're looking at doing is moving from a world of prompts to a world of procedures and programs. Success with chat GPT5 is not really about writing a higher quality sentence with more adjectives. It's about thinking like a manager who can delegate to a very capable but also somewhat literally minded employee. We need to start to move to that mindset. And I think that there are going to be a lot of mixed feelings about that. I know a lot of people who are used to and prefer to converse and iterate on value versus defining specifically upfront what's needed, something more programmatic to close that gap. I think there are going to be a lot of opportunities for builders who want to help people with tools that get them from vague ideas to something that is more buildable. There's there's a missing help me get to the prompt layer here. Teams that can master specification first delegation essentially write the spec out clearly and then delegate to chat GPT5 are going to go faster because this is such an agentic tool and it's also a very fast tool. Even the prothinking mode does not take that long. This is not a 30 minute deep research like pro response. And so if you want to get started with this, if you want to get started basically applying the system prompt, being one of those early adopters, my suggestion to you is you look at your highest volume AI workflow right now. Maybe it's a personal workflow, maybe it's a professional workflow. Rewrite it with a spec approach using Chad GPT5. So frontload your assumptions, set your tool policies, define your acceptance criteria, etc. Uh, and then I would also encourage you, I I've said this before, build your personal prompt library. This is this is a model that rewards that. Double down on it because at the end of the day, the bottom line, chat GPT5 system prompt is not just it's not just documentation to read. When I looked through it, it's basically a product roadmap. They've articulated and built an agent that ships first and asks questions later. And that requires different behavior from us. So, you need to master the spec mindset now because if you look at where they're going as a company, this is only going to get more agentic. And so, I would encourage you if this feels overwhelming, as I said in the middle of this video, start practicing now. Be okay being imperfect. That's fine. You'll still be way ahead of a lot of people who are going to be trying to use chat GPT5 the way they tried to use other models. This is not just about the difference between an inference or reasoning model and non-reasoning. This is beyond that. This is a truly agentic model that takes different kinds of prompt engineering. I hope that this breakdown of the system prompt was helpful.

---

## Timestamped Transcript

[0:00:00] I've spent the last few hours just
[0:00:01] digging super deeply into chat GPT5
[0:00:04] system prompt. System prompts are super
[0:00:07] useful to understand once they leak,
[0:00:09] which they seem to really reliably just
[0:00:11] a few days after the product launches,
[0:00:13] thanks to Elder Plyus, who is an
[0:00:16] internet personality with a habit of
[0:00:17] leaking prompts. So, I studied the
[0:00:19] prompt leak that Elder Plyus posted on
[0:00:21] GitHub. I can sort of stick it in the
[0:00:23] comments here so you can see it. The key
[0:00:25] is understanding not just the prompt
[0:00:28] itself, but how the prompt shapes GPT5's
[0:00:32] interaction and what that means for your
[0:00:34] prompting behavior versus other models
[0:00:36] versus Claude versus Gemini versus Chad
[0:00:40] GPT40. The number one thing I want to
[0:00:42] call out is that the system prompt
[0:00:44] suggests to us that GPT5 has an
[0:00:47] extraordinary bias to ship. So instead
[0:00:50] of asking should I proceed, it just
[0:00:52] proceeds as much as it possibly can. It
[0:00:55] may ask one clarifying question max and
[0:00:58] that's straight from the prompt and then
[0:00:59] it just goes into execution mode. This
[0:01:02] is a deliberate paradigm shift from
[0:01:05] positioning the chatbot as a helpful
[0:01:07] employee or helpful assistant to you
[0:01:10] personally to moving it toward a full
[0:01:13] agentic colleague. And this matters
[0:01:15] because tasks that take five back and
[0:01:17] forths are now going to happen in one.
[0:01:20] And it means that wrong assumptions that
[0:01:22] you may inadvertently have placed in the
[0:01:24] prompt, they compound into very nicel
[0:01:27] looking disasters instead of helpful
[0:01:30] clarifications. So you have to keep in
[0:01:32] mind when you work with chat GPT5, the
[0:01:35] thing wants to ship. I've called it a PM
[0:01:38] on crack uh to its face because that's
[0:01:40] how like wildly excited it is about
[0:01:44] shipping fast. The specification piece
[0:01:47] is also something we need to talk about.
[0:01:48] That's the second big thing I want to
[0:01:50] call out. We have been used to writing
[0:01:52] sort of iterative conversations where we
[0:01:54] converse back and forth and gradually
[0:01:56] arrive at meaning. This worked well with
[0:01:57] Claude. It still does. It works well
[0:01:59] with earlier models of chat GPT. It's
[0:02:01] worked with Gemini. You need to move
[0:02:04] from having conversations to writing
[0:02:06] specifications with this model to get
[0:02:08] the most out of it. And I realize that
[0:02:10] there are people who will throw up their
[0:02:12] hands and say that is not for me. I
[0:02:14] don't want it. But that is the
[0:02:16] conclusion that OpenAI has come to when
[0:02:18] it comes to actually getting these
[0:02:19] models to do more useful work. You have
[0:02:21] to be higher grade in your intent. You
[0:02:23] have to write specs, not just
[0:02:25] conversations. It comes back to prompt
[0:02:27] engineering. So you can't treat chat
[0:02:28] GPT5 like you treat chat GPT4. can't
[0:02:31] iteratively refine. You must nail it on
[0:02:35] the first shot with clear deliverables,
[0:02:37] clear assumptions, clear constraints.
[0:02:40] So, for example, instead of give me help
[0:02:42] with my pricing strategy, say I'd like
[0:02:44] you to use a pricing framework for B2B
[0:02:47] SAS. I need three options with very
[0:02:49] clear trade-offs. It should be less than
[0:02:51] 400 words and I want it to be decision
[0:02:53] ready for a founding team. Please
[0:02:55] exclude the option for enterprise
[0:02:57] pricing. You'll get a much much better
[0:02:59] result with the second prompt. And that
[0:03:00] was always somewhat true, but in the
[0:03:03] past with other models because they
[0:03:06] weren't so eager to complete, you had
[0:03:08] the chance to refine it down the road.
[0:03:10] Third point from the system prompt,
[0:03:12] there are critical non-negotiable prompt
[0:03:15] elements in GPT5 that have not been
[0:03:18] perhaps quite as critical in the initial
[0:03:21] prompt before. The first critical
[0:03:23] element, specify the deliverable,
[0:03:25] specify the format, specify the length,
[0:03:27] specify the audience. Even if it's just
[0:03:29] you, if you don't do this, the model can
[0:03:33] overcomplete. And that feels really
[0:03:35] weird for me to say because this model
[0:03:37] still has a bullet-like tendency. Sort
[0:03:40] of like 03 liked bullets. This model
[0:03:42] likes bullets, too. But it likes to be
[0:03:45] complete with those bullets. And so you
[0:03:47] can get really big completions in the
[0:03:49] API. You can get big completions in the
[0:03:51] chat unless you specify this is what I
[0:03:54] want exactly. You also should explicitly
[0:03:59] state what the model needs to assume
[0:04:02] about context, scope, and timeline. So
[0:04:04] if you're writing a prompt and you want
[0:04:06] it to assume a particular thing about
[0:04:08] the context or the scope of what you're
[0:04:09] asking, bind it to that assumption at
[0:04:12] the top in the initial prompt. And then
[0:04:14] the third thing to call out is just name
[0:04:17] it. declare tools that it is allowed to
[0:04:20] use or forbidden to use upfront because
[0:04:23] otherwise it so agentic it's going to
[0:04:25] decide to go get a web search or go
[0:04:27] execute code whether you want it to or
[0:04:30] not like if you don't want it to solve
[0:04:32] with code and you want to answer with
[0:04:33] strategic thinking say don't build this
[0:04:36] in code just think strategically I've
[0:04:38] had to do that several times so one of
[0:04:40] the things that I want to call out is
[0:04:41] that this is a model that gives a
[0:04:44] compound advantage to early adopters I
[0:04:47] think about that as someone who's been a
[0:04:49] founder and I know the importance of
[0:04:51] speed. Chat GPT5 essentially rewards a
[0:04:54] bias to speed and a bias to build and if
[0:04:56] you can work in Chad GPT5 into your
[0:04:58] workflow and actually go faster as a
[0:05:00] result you are going to build a compound
[0:05:02] advantage. So, one of the things that I
[0:05:04] want to suggest there, if you're
[0:05:05] interested in becoming one of those
[0:05:07] early adopters, gaining that compound
[0:05:09] advantage, and maybe you're an
[0:05:11] individual and you're just gaining a
[0:05:12] compound advantage in the talent
[0:05:13] marketplace, still try to ship specs
[0:05:18] versus just a casual prompt. And even if
[0:05:20] they are imperfect specifications, you
[0:05:23] will get a better starting point versus
[0:05:25] just a very loose initial prompt. you
[0:05:28] would rather try to prompt in the way
[0:05:32] that GPT5 expects as I've been
[0:05:34] discussing with tools, with
[0:05:35] specifications, with constraints, with
[0:05:37] assumptions, and maybe not get it
[0:05:39] perfect, but still get really far down
[0:05:41] the road versus not trying at all. So,
[0:05:43] the key to the compound advantage is
[0:05:45] just start trying and recognize that
[0:05:47] this model's bias to speed gives an
[0:05:49] advantage to early adopters. I also want
[0:05:52] to call out that canvas plus memory is
[0:05:55] giving you some different options with
[0:05:56] GPT5. now that it has better front-end
[0:05:59] coding capabilities. Canvas is not just
[0:06:01] for long documents anymore. It's
[0:06:03] essentially it's like version control
[0:06:05] for AI work. You can create a product
[0:06:07] spec v1. You can update the same ID for
[0:06:10] revisions. You can start to engage in
[0:06:12] memory for persistent AI context. And so
[0:06:15] what you should be able to do is
[0:06:17] explicitly save preferences like users
[0:06:20] prefer three bullet executive summaries.
[0:06:23] And you start to build a personalized AI
[0:06:25] that knows your your style. And so
[0:06:27] effectively use those memories that you
[0:06:30] can save and explicitly save in the chat
[0:06:32] with Jet GPT so that you start to encode
[0:06:34] preferences over time and then combine
[0:06:37] the memories with how canvas works to
[0:06:40] start to get a more collaborative
[0:06:43] editing experience. And the reason why
[0:06:45] that's really interesting to me is that
[0:06:47] you can have markdown files where you're
[0:06:50] referring to memories in the canvas and
[0:06:52] also memories that you've encoded with
[0:06:54] chat GPT directly. So the memories can
[0:06:56] be in the chat in the conversation in
[0:06:58] the context window and also outside of
[0:06:59] it. You can also have the use of canvas
[0:07:02] as a coding artifact where you can code
[0:07:05] front end and then you can look through
[0:07:06] different versions and check out the
[0:07:08] different versions and give feedback
[0:07:09] based on memories. We're just at the
[0:07:12] beginning of what this means, but my
[0:07:13] hunch is that GPC5 is leaning more into
[0:07:15] canvas and memory and the system prompt
[0:07:18] is reinforcing that. So one of the
[0:07:19] things that I want to call out that no
[0:07:21] system prompt is perfect, right? Like
[0:07:23] there's always going to be issues. You
[0:07:24] need to be really careful about how you
[0:07:28] deploy this model because of the power
[0:07:30] I've discussed. And I'm going to give
[0:07:32] you three examples of failure modes that
[0:07:34] this prompt allows you to jump right
[0:07:37] into failing on if you're not careful.
[0:07:39] The first one you're probably not
[0:07:41] surprised by. Speculative execution. The
[0:07:43] model will dive straight into something
[0:07:45] completely comprehensive when you just
[0:07:47] wanted a quick check. The solution?
[0:07:50] Include a constraint section. include a
[0:07:52] non-goals section. Something that
[0:07:55] specifies very clearly what you don't
[0:07:57] want. Second failure mode, tool usage
[0:07:59] surprises. Again, I doubt you're
[0:08:01] surprised given what I've talked about
[0:08:02] with aggressive tool usage. I'm going to
[0:08:04] remind you, use tool policies in a
[0:08:07] prompt that matters. If you care about
[0:08:08] the prompt and how it's done, use a tool
[0:08:10] policy. Write it out. This is allowed.
[0:08:12] This is not allowed. Another one that's
[0:08:14] a little bit more obscure that I haven't
[0:08:16] seen people complain about, but it is
[0:08:17] explicitly in the system prompt. Lost
[0:08:20] commentary after image generation. The
[0:08:22] system prompt explicitly kills
[0:08:25] explanations after images. So, you will
[0:08:27] have to split that into multiple turns.
[0:08:29] Generate the image and then analyze the
[0:08:31] image second. Let's step back. What does
[0:08:33] it mean if you read the tea leaves from
[0:08:35] the system prompt? Where is open AI
[0:08:38] going? I want to suggest that this is
[0:08:39] the clearest roadmap, much more clear
[0:08:42] than we get from sort of public
[0:08:43] statements from Sam Alman or others.
[0:08:46] Open AI is leaning aggressively into an
[0:08:48] agent operating system. This is not
[0:08:50] intended to be just a better chatbot. It
[0:08:53] is the architecture for an operating
[0:08:55] system. Open AAI is building towards
[0:08:57] chat GPT as your primary workspace.
[0:09:00] something that competes directly with
[0:09:02] Microsoft that can I know it's ironic
[0:09:04] right given their agreements with
[0:09:05] Microsoft but they want it to be your
[0:09:07] workspace that consolidates documents
[0:09:09] that consolidates code that consolidates
[0:09:11] scheduling and memory into one unitary
[0:09:14] interface your day your workday goes in
[0:09:17] chat GPT that is the dream and there are
[0:09:19] also implications for how this will
[0:09:22] handle at the enterprise level I would
[0:09:24] expect expect compliance features audit
[0:09:28] trails governance controls, things that
[0:09:31] help you build your prompt signal into a
[0:09:34] production pipeline. You see a little
[0:09:37] bit of this as OpenAI has started to
[0:09:39] roll out lots of education around AI for
[0:09:43] corporate customers and not just paid
[0:09:45] education like free like you can send
[0:09:46] your employees to get free OpenAI
[0:09:48] education. People don't always know
[0:09:49] that. They're also building and
[0:09:50] launching with Chad GPT5 special prompt
[0:09:53] improvers and helpers for folks using
[0:09:55] the API. I would expect a lot more of
[0:09:58] that because what they want is for you
[0:10:00] to actually bake chat GPT into your
[0:10:03] production pipelines with the kind of
[0:10:04] supportive infrastructure uh that
[0:10:06] enterprises need and that's why the
[0:10:08] compliance features come out and the
[0:10:09] audit trails and all of that and so to
[0:10:11] be clear these are things that I am
[0:10:13] seeing coming down the road. It's not
[0:10:15] like there is a secret chat GPT mode
[0:10:18] that immediately triggers a compliance
[0:10:20] feature right now. I'm not saying that.
[0:10:22] What I am saying is that if you look at
[0:10:24] the way they have configured the system
[0:10:26] prompt to be agentic and you look at the
[0:10:29] way they launched it with features that
[0:10:31] are aimed at company support on day one,
[0:10:33] you can read the tea leaves. Okay. I
[0:10:35] want to suggest to you as we start to
[0:10:37] close out a master template that I think
[0:10:39] is designed specifically for GPT5 that
[0:10:43] should work pretty well. It has a few
[0:10:45] separate labels and I'll just go through
[0:10:46] them one at a time. The first one is
[0:10:48] task. Define the task as clearly as you
[0:10:51] can. The second line, deliverable.
[0:10:53] Define the format, the length, and the
[0:10:55] audience. Third line, assumptions.
[0:10:57] Specify the assumptions in bullets as
[0:11:00] clearly as you can. Fourth line,
[0:11:02] non-goals. Be very, very clear about the
[0:11:05] non- goals or constraints or things that
[0:11:07] are not to be done. Fifth line, tools.
[0:11:10] What's allowed and what's forbidden.
[0:11:12] Sixth line, acceptance. Specify the
[0:11:14] success criteria. If this sounds
[0:11:16] extremely dry, well, it is a little dry,
[0:11:19] but it's going to get you better
[0:11:20] results. So why? Let's step back. Why
[0:11:22] does this change everything? Why does
[0:11:24] this change the way we work with our AI?
[0:11:26] In the end, what we're looking at doing
[0:11:28] is moving from a world of prompts to a
[0:11:32] world of procedures and programs.
[0:11:34] Success with chat GPT5 is not really
[0:11:36] about writing a higher quality sentence
[0:11:38] with more adjectives. It's about
[0:11:40] thinking like a manager who can delegate
[0:11:42] to a very capable but also somewhat
[0:11:45] literally minded employee. We need to
[0:11:47] start to move to that mindset. And I
[0:11:49] think that there are going to be a lot
[0:11:51] of mixed feelings about that. I know a
[0:11:53] lot of people who are used to and prefer
[0:11:55] to converse and iterate on value versus
[0:11:58] defining specifically upfront what's
[0:12:01] needed, something more programmatic to
[0:12:03] close that gap. I think there are going
[0:12:05] to be a lot of opportunities for
[0:12:07] builders who want to help people with
[0:12:10] tools that get them from vague ideas to
[0:12:13] something that is more buildable.
[0:12:15] There's there's a missing help me get to
[0:12:18] the prompt layer here. Teams that can
[0:12:20] master specification first delegation
[0:12:23] essentially write the spec out clearly
[0:12:25] and then delegate to chat GPT5
[0:12:28] are going to go faster because this is
[0:12:30] such an agentic tool and it's also a
[0:12:31] very fast tool. Even the prothinking
[0:12:34] mode does not take that long. This is
[0:12:36] not a 30 minute deep research like pro
[0:12:38] response. And so if you want to get
[0:12:40] started with this, if you want to get
[0:12:41] started basically applying the system
[0:12:43] prompt, being one of those early
[0:12:45] adopters, my suggestion to you is you
[0:12:47] look at your highest volume AI workflow
[0:12:51] right now. Maybe it's a personal
[0:12:52] workflow, maybe it's a professional
[0:12:54] workflow. Rewrite it with a spec
[0:12:56] approach using Chad GPT5. So frontload
[0:12:59] your assumptions, set your tool
[0:13:01] policies, define your acceptance
[0:13:03] criteria, etc. Uh, and then I would also
[0:13:06] encourage you, I I've said this before,
[0:13:08] build your personal prompt library. This
[0:13:10] is this is a model that rewards that.
[0:13:12] Double down on it because at the end of
[0:13:14] the day, the bottom line, chat GPT5
[0:13:16] system prompt is not just it's not just
[0:13:19] documentation to read. When I looked
[0:13:22] through it, it's basically a product
[0:13:23] roadmap. They've articulated and built
[0:13:26] an agent that ships first and asks
[0:13:28] questions later. And that requires
[0:13:30] different behavior from us. So, you need
[0:13:32] to master the spec mindset now because
[0:13:34] if you look at where they're going as a
[0:13:36] company, this is only going to get more
[0:13:38] agentic. And so, I would encourage you
[0:13:40] if this feels overwhelming, as I said in
[0:13:43] the middle of this video, start
[0:13:44] practicing now. Be okay being imperfect.
[0:13:46] That's fine. You'll still be way ahead
[0:13:48] of a lot of people who are going to be
[0:13:50] trying to use chat GPT5 the way they
[0:13:53] tried to use other models. This is not
[0:13:55] just about the difference between an
[0:13:57] inference or reasoning model and
[0:13:59] non-reasoning. This is beyond that. This
[0:14:01] is a truly agentic model that takes
[0:14:03] different kinds of prompt engineering. I
[0:14:05] hope that this breakdown of the system
[0:14:06] prompt was helpful.

---

*Extracted from YouTube Auto-generated captions*