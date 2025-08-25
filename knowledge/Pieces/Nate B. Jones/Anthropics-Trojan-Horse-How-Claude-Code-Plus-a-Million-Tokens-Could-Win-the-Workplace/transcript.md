# Anthropic's Trojan Horse: How Claude Code Plus a Million Tokens Could Win the Workplace

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-18  
**URL**: https://youtube.com/watch?v=2qHxfwvIx-I  
**Duration**: 0:12:34  
**Views**: 17,366  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

Anthropic is showing us their strategy for Claude in broad daylight and everyone's obsessed with the Chad GPT launch. But look at what they've released in the last few weeks. They released Claude Opus 4.1. It's a 0.1 release. No one's going to pay attention, right? But it delivered meaningful improvements that I can feel every day in Agentic Tasks. It gets better at realworld coding. And keep in mind, and this will be a through line throughout this, anthropic is really good at code. And we'll get into why and why they picked that later on here. Now, it tests well, right? It gets 74 and a half% on Sweetbench, which is the bench for software engineering tasks. And it's especially good at large codebase navigation, finding the right corrections, not making unnecessary changes, the things that are making agents more useful. Essentially, they roll it out. Unlike with the GPT5 rollout, which was very rocky, Anthropic's roll out is pretty chill. But we're not done yet. August 12th, just a few days later, they roll out a million token context window for Sonnet. Huge. And Opus 4.1 will support it now, too. It's more than double the previous sort of flagship AI token window. Now, I grant you there are some token windows that are even bigger than that that have kind of fallen by the wayside. So we've heard mentions of 2 million token windows for example out of llama hasn't gone very far. This is a and this is what I emphasize. This is a usable 1 million token window. Now is it perfect? Is the recall perfect? No. There is no AI system that has perfect recall in a million token window. But it is usable and it enables you to put more of the codebase into consideration for sonnet and opus which matters with complex code bases. So it's like, you know, a 75,000line codebase. It can fit inside the context window for a conversation now. And so you can put all of that in front of Opus 4.1 and ask it to think through and solve the problem. You see how these are starting to build. They release an Aentic agent. They immediately upgrade the context window to make that agent more useful. But we're not done yet. Now they're going to keep building the capability. Also, August 12th, they release an ondemand memory system because you may want Claude to selectively remember from past conversations. So, you can search through past conversations. I've talked about this before. And you can generate a piece of context from those past conversations. That's like a wedge of context to add to your current conversation. It's not like chat GPT. It doesn't keep static memory. You have to use your prompt to angle the context in the memory. Again, it underlines how important prompt engineering is. I never expected prompt engineering to be such a durable skill set two years ago, but it keeps getting more and more and more important. But we keep going. We're not done yet. You know what else has been happening in the background? Claude code has been getting better. Claude code can now run servers and manage longunning tasks in the background. It can start a dev server. It can run persistent test suites. It can perform builds on its own. And you can just check in with it. Now claude code also has learning modes. It basically is going to give you different output options depending on what you want from cla code. You can have explanatory mode where claude narrates its choices, explains what and why as it edits, it commits, it runs tools. This makes debugging and code review easier. It also helps you to learn if you're new to development. Claude also has learning mode. It's a more active educational style where Claude prompts you to code pieces yourself and guides you by asking questions rather than prescribing. So, it builds human skills alongside automation. These are now rolled out to claude code users and we're still not done. I know quietly. While GPT5 rolled out, Enthropic has released all of this stuff. We're going to find the through line. They've released hooks and event system management. So you can be cloud can be configured with custom hooks like shell commands or scripts that run before or after a tooling event. They released sub aent systems which was a big deal at least in my corner of the world where you can add support for model personalities or roles inside claude and mentions so you can have multi- aent collaborative workflows in the same project. And they've even released a micro compact mode which didn't get a lot of attention but it's super interesting. It lets users clear old tool calls to manage an extended session life so that you don't have to sort of clear the entire work surface. It's like you can organize your tools as you go. Users can also now connect Claude code to live services like Apollo's MCP servers. Claude is aware of persistent context from these servers. So that can handle stuff like registration, health checks, using them with encoding workflows, things that you need for persistent state. and updated API capabilities mean Claude can persist, cache, and resume complex workflows. In other words, all of this stuff put together makes Claude a much more dependable agentic partner in development. And in addition, and this is the piece that a lot of people aren't really quite seeing, this this is the thin end of the wedge for Claude code and Claude itself to become your work surface of choice because that's of course the holy grail. That is actually what chat GPT5 was aiming to do was to become a work surface of choice and to lay the foundations for that with office workers everywhere. They want to replace Windows and the Windows suite. Very simply, very Claude is actually making arguably a smarter play for that exact same prize by obsessively focusing on code first. Now, you might wonder why code? What is it about code that makes this really, really interesting? Code works because it's verifiable and it's a high leverage environment. So, code provides immediate feedback loops, tests, errors, builds. It provides objective validation of the agent output. Anthropic can push the boundaries of agentic autonomy knowing that mistakes are detectable and correctable. And code is also extremely high leverage from a work perspective. The companies that adopt claude code and the clawed coding agents are companies that you want to have as logos when you are driving broader adoption of claude. These are forward-thinking early adoption companies with big logos that people are going to find sexy and attractive. These are tech companies, right? Tech companies have a lot of engineers. Focusing on coding gives them a lot of leverage with these tech companies and they in turn get a lot of feedback from looking at loops that are run by code bases other than their own. And so one of the really interesting things is even if it's anonymized, even if nobody's stealing anybody's code, Claude is still getting feedback from thousands of tech companies across Silicon Valley and using that to make their coding agent even better. This is a case where winners keep winning. Software development is also extremely iterative and requires nuanced reasoning and persistence to work well. If they can tackle those challenges early, anthropics agents are going to be more robust, more contextaware, and have workflow orchestration skills that will be applicable beyond a programming. Again, this is part of the deliberate play on Enthropic's part. Finally, once agents excel at code, they can quickly run to adjacent tasks that go with code like documentation, parsing, project management, automating workflows, even non-technical problem solving like ad optimization. And what's interesting is that internally that is exactly what is happening at Enthropic. Enthropic talks about this. Their marketing team uses claude code. Their legal department uses cla code. They named it Claude code. It was just a Trojan horse for Claude agent. This is a general purpose agent and each of the releases over the last few weeks have been building up that Agentic approach. Look at the way they focused on Agentic capabilities with Opus 4.1. You need that for everything else. Look at the way they focused on a usable 1 million token context window. You need that for everything else. Look at the way they did memory on demand. that enables you to cultivate more accurate tool calls without loading up the context window with a bunch of extraneous information. Look at the way they focused heavily on the ability of clawed code to manage persistent states and take independent action. If you want to ladder up all the technical stuff like running servers, being able to explain what you're doing, being able to teach you, expanding hooks and event system management for tool calls. This is not just stuff that you need to know how to do for development. Although that is true, it is a quality of stateful work that you need to do any kind of agentic assistance for humans. If humans want a useful assistant, it would look a lot like this. It just might not do coding. And that is the secret of Claude code. You might want a useful assistant that explains things, that teaches you things, that helps you to learn. You may want a useful assistant that helps you to take action autonomously on your ad network. You may want a useful assistant that can process an entire piece of long context about a contract you're reviewing and can give you really useful feedback. You may want a stateful assistant that remembers the last conversation you had or that remembers a live feed to an MCP server for something you want to keep track of like add updates and can process that in real time and take action. All of these things are on the horizon thanks to today's updates. Even though today's updates, the last few weeks updates are framed in terms of code. Code is the Trojan horse. Code is what Anthropic is choosing to use as the wedge into the workplace. And what's beautiful about that flywheel is because they're attracting tech companies with code. They are attracting early adopters who will also be willing to try clawed code elsewhere more quickly. Early adopters by nature are more fluid. They are more willing to try new things. They're more willing to try clawed code with marketer seats, with product management seats, with customer success seats, and see if that general purpose agent is useful. And all of that feeds the virtuous flywheel for Anthropic. And so, while Chad GPT5 was having a rocky week, Anthropic had frankly a power week. They were able to release a bunch of pinpoint updates that underline that provide dotted line connects to their longterm strategy of capturing the workplace. And if you were to handicap the race for the workplace right now, I would say Anthropic is clearly in the lead. Anthropic is more likely to be in the workplace of the future than OpenAI. Despite OpenAI's ubiquity, despite the fact that OpenAI has an edge in raw user count, we already know that Anthropic punches above its weight on enterprise contracts. There are already anecdotes postGPT5 of companies letting go of their GPT5 contracts because they like what they get with Cloud Code. None of this suggests that Chat GPT will not remain the most iconic global brand for AI out there. I think they have handily won the consumer race, but that doesn't mean they automatically get the enterprise race and Anthropic has figured that out. Keep looking at future releases with clawed code. Keep watching how Anthropic ships. They ship frequently. They don't necessarily do a big fanfare about it, but every single ship lines up strategically toward that larger goal of capturing the workplace. And Claude Code is the agent they're using to get that job done. I'm very impressed with what Anthropic has been shipping lately and I am enjoying what I'm enjoying the polish. I'm enjoying the fact that they launch and there's not a big blowback. It's quiet. It's consistent. They just launch it and it works. It's great. I can see why companies are saying we're just going to pick Claude. There's less drama. It's just easier. It codes. And hey, by the way, we can also let our other teams use it. That's a really good play for the workplace. So, hats off to the anthropic team. Well done, guys. Looking forward to what you ship

---

## Timestamped Transcript

[0:00:00] Anthropic is showing us their strategy
[0:00:02] for Claude in broad daylight and
[0:00:04] everyone's obsessed with the Chad GPT
[0:00:06] launch. But look at what they've
[0:00:08] released in the last few weeks. They
[0:00:09] released Claude Opus 4.1. It's a 0.1
[0:00:12] release. No one's going to pay
[0:00:14] attention, right? But it delivered
[0:00:15] meaningful improvements that I can feel
[0:00:17] every day in Agentic Tasks. It gets
[0:00:20] better at realworld coding. And keep in
[0:00:22] mind, and this will be a through line
[0:00:24] throughout this, anthropic is really
[0:00:26] good at code. And we'll get into why and
[0:00:29] why they picked that later on here. Now,
[0:00:31] it tests well, right? It gets 74 and a
[0:00:33] half% on Sweetbench, which is the bench
[0:00:35] for software engineering tasks. And it's
[0:00:37] especially good at large codebase
[0:00:39] navigation, finding the right
[0:00:40] corrections, not making unnecessary
[0:00:42] changes, the things that are making
[0:00:44] agents more useful. Essentially, they
[0:00:46] roll it out. Unlike with the GPT5
[0:00:48] rollout, which was very rocky,
[0:00:50] Anthropic's roll out is pretty chill.
[0:00:52] But we're not done yet. August 12th,
[0:00:55] just a few days later, they roll out a
[0:00:57] million token context window for Sonnet.
[0:01:00] Huge. And Opus 4.1 will support it now,
[0:01:03] too. It's more than double the previous
[0:01:06] sort of flagship AI token window. Now, I
[0:01:08] grant you there are some token windows
[0:01:10] that are even bigger than that that have
[0:01:12] kind of fallen by the wayside. So we've
[0:01:15] heard mentions of 2 million token
[0:01:17] windows for example out of llama hasn't
[0:01:19] gone very far. This is a and this is
[0:01:22] what I emphasize. This is a usable 1
[0:01:25] million token window. Now is it perfect?
[0:01:27] Is the recall perfect? No. There is no
[0:01:30] AI system that has perfect recall in a
[0:01:32] million token window. But it is usable
[0:01:36] and it enables you to put more of the
[0:01:38] codebase into consideration for sonnet
[0:01:40] and opus which matters with complex code
[0:01:43] bases. So it's like, you know, a
[0:01:44] 75,000line codebase. It can fit inside
[0:01:47] the context window for a conversation
[0:01:49] now. And so you can put all of that in
[0:01:52] front of Opus 4.1 and ask it to think
[0:01:56] through and solve the problem. You see
[0:01:58] how these are starting to build. They
[0:02:00] release an Aentic agent. They
[0:02:02] immediately upgrade the context window
[0:02:04] to make that agent more useful. But
[0:02:06] we're not done yet. Now they're going to
[0:02:08] keep building the capability. Also,
[0:02:10] August 12th, they release an ondemand
[0:02:12] memory system because you may want
[0:02:15] Claude to selectively remember from past
[0:02:17] conversations. So, you can search
[0:02:19] through past conversations. I've talked
[0:02:20] about this before. And you can generate
[0:02:22] a piece of context from those past
[0:02:25] conversations. That's like a wedge of
[0:02:27] context to add to your current
[0:02:28] conversation. It's not like chat GPT. It
[0:02:30] doesn't keep static memory. You have to
[0:02:32] use your prompt to angle the context in
[0:02:35] the memory. Again, it underlines how
[0:02:37] important prompt engineering is. I never
[0:02:40] expected prompt engineering to be such a
[0:02:42] durable skill set two years ago, but it
[0:02:44] keeps getting more and more and more
[0:02:46] important. But we keep going. We're not
[0:02:48] done yet. You know what else has been
[0:02:50] happening in the background? Claude code
[0:02:52] has been getting better. Claude code can
[0:02:54] now run servers and manage longunning
[0:02:57] tasks in the background. It can start a
[0:02:59] dev server. It can run persistent test
[0:03:01] suites. It can perform builds on its
[0:03:04] own. And you can just check in with it.
[0:03:05] Now claude code also has learning modes.
[0:03:09] It basically is going to give you
[0:03:11] different output options depending on
[0:03:14] what you want from cla code. You can
[0:03:15] have explanatory mode where claude
[0:03:17] narrates its choices, explains what and
[0:03:20] why as it edits, it commits, it runs
[0:03:22] tools. This makes debugging and code
[0:03:24] review easier. It also helps you to
[0:03:25] learn if you're new to development.
[0:03:26] Claude also has learning mode. It's a
[0:03:28] more active educational style where
[0:03:30] Claude prompts you to code pieces
[0:03:32] yourself and guides you by asking
[0:03:35] questions rather than prescribing. So,
[0:03:37] it builds human skills alongside
[0:03:39] automation. These are now rolled out to
[0:03:40] claude code users and we're still not
[0:03:43] done. I know quietly. While GPT5 rolled
[0:03:46] out, Enthropic has released all of this
[0:03:48] stuff. We're going to find the through
[0:03:50] line. They've released hooks and event
[0:03:52] system management. So you can be cloud
[0:03:53] can be configured with custom hooks like
[0:03:55] shell commands or scripts that run
[0:03:57] before or after a tooling event. They
[0:03:59] released sub aent systems which was a
[0:04:01] big deal at least in my corner of the
[0:04:03] world where you can add support for
[0:04:05] model personalities or roles inside
[0:04:07] claude and mentions so you can have
[0:04:09] multi- aent collaborative workflows in
[0:04:11] the same project. And they've even
[0:04:14] released a micro compact mode which
[0:04:18] didn't get a lot of attention but it's
[0:04:19] super interesting. It lets users clear
[0:04:21] old tool calls to manage an extended
[0:04:24] session life so that you don't have to
[0:04:26] sort of clear the entire work surface.
[0:04:28] It's like you can organize your tools as
[0:04:29] you go. Users can also now connect
[0:04:32] Claude code to live services like
[0:04:34] Apollo's MCP servers. Claude is aware of
[0:04:37] persistent context from these servers.
[0:04:39] So that can handle stuff like
[0:04:40] registration, health checks, using them
[0:04:43] with encoding workflows, things that you
[0:04:44] need for persistent state. and updated
[0:04:47] API capabilities mean Claude can
[0:04:49] persist, cache, and resume complex
[0:04:51] workflows. In other words, all of this
[0:04:54] stuff put together makes Claude a much
[0:04:57] more dependable agentic partner in
[0:05:00] development. And in addition, and this
[0:05:02] is the piece that a lot of people aren't
[0:05:04] really quite seeing, this this is the
[0:05:06] thin end of the wedge for Claude code
[0:05:09] and Claude itself to become your work
[0:05:13] surface of choice because that's of
[0:05:15] course the holy grail. That is actually
[0:05:17] what chat GPT5 was aiming to do was to
[0:05:20] become a work surface of choice and to
[0:05:23] lay the foundations for that with office
[0:05:26] workers everywhere. They want to replace
[0:05:29] Windows and the Windows suite. Very
[0:05:30] simply, very Claude is actually making
[0:05:33] arguably a smarter play for that exact
[0:05:36] same prize by obsessively focusing on
[0:05:39] code first. Now, you might wonder why
[0:05:42] code? What is it about code that makes
[0:05:45] this really, really interesting? Code
[0:05:47] works because it's verifiable and it's a
[0:05:51] high leverage environment. So, code
[0:05:53] provides immediate feedback loops,
[0:05:55] tests, errors, builds. It provides
[0:05:57] objective validation of the agent
[0:05:59] output. Anthropic can push the
[0:06:01] boundaries of agentic autonomy knowing
[0:06:03] that mistakes are detectable and
[0:06:05] correctable. And code is also extremely
[0:06:08] high leverage from a work perspective.
[0:06:12] The companies that adopt claude code and
[0:06:15] the clawed coding agents are companies
[0:06:18] that you want to have as logos when you
[0:06:22] are driving broader adoption of claude.
[0:06:24] These are forward-thinking early
[0:06:25] adoption companies with big logos that
[0:06:28] people are going to find sexy and
[0:06:29] attractive. These are tech companies,
[0:06:32] right? Tech companies have a lot of
[0:06:34] engineers. Focusing on coding gives them
[0:06:37] a lot of leverage with these tech
[0:06:39] companies and they in turn get a lot of
[0:06:41] feedback from looking at loops that are
[0:06:45] run by code bases other than their own.
[0:06:47] And so one of the really interesting
[0:06:49] things is even if it's anonymized, even
[0:06:51] if nobody's stealing anybody's code,
[0:06:54] Claude is still getting feedback from
[0:06:57] thousands of tech companies across
[0:06:59] Silicon Valley and using that to make
[0:07:02] their coding agent even better. This is
[0:07:04] a case where winners keep winning.
[0:07:05] Software development is also extremely
[0:07:07] iterative and requires nuanced reasoning
[0:07:09] and persistence to work well. If they
[0:07:12] can tackle those challenges early,
[0:07:14] anthropics agents are going to be more
[0:07:16] robust, more contextaware, and have
[0:07:19] workflow orchestration skills that will
[0:07:22] be applicable beyond a programming.
[0:07:24] Again, this is part of the deliberate
[0:07:25] play on Enthropic's part. Finally, once
[0:07:28] agents excel at code, they can quickly
[0:07:31] run to adjacent tasks that go with code
[0:07:34] like documentation, parsing, project
[0:07:36] management, automating workflows, even
[0:07:39] non-technical problem solving like ad
[0:07:42] optimization. And what's interesting is
[0:07:44] that internally that is exactly what is
[0:07:47] happening at Enthropic. Enthropic talks
[0:07:49] about this. Their marketing team uses
[0:07:51] claude code. Their legal department uses
[0:07:54] cla code. They named it Claude code. It
[0:07:57] was just a Trojan horse for Claude
[0:08:00] agent. This is a general purpose agent
[0:08:02] and each of the releases over the last
[0:08:05] few weeks have been building up that
[0:08:08] Agentic approach. Look at the way they
[0:08:11] focused on Agentic capabilities with
[0:08:13] Opus 4.1. You need that for everything
[0:08:15] else. Look at the way they focused on a
[0:08:17] usable 1 million token context window.
[0:08:20] You need that for everything else. Look
[0:08:21] at the way they did memory on demand.
[0:08:23] that enables you to cultivate more
[0:08:25] accurate tool calls without loading up
[0:08:28] the context window with a bunch of
[0:08:29] extraneous information. Look at the way
[0:08:31] they focused heavily on the ability of
[0:08:34] clawed code to manage persistent states
[0:08:38] and take independent action. If you want
[0:08:41] to ladder up all the technical stuff
[0:08:42] like running servers, being able to
[0:08:45] explain what you're doing, being able to
[0:08:47] teach you, expanding hooks and event
[0:08:50] system management for tool calls. This
[0:08:52] is not just stuff that you need to know
[0:08:54] how to do for development. Although that
[0:08:57] is true, it is a quality of stateful
[0:09:01] work that you need to do any kind of
[0:09:03] agentic assistance for humans. If humans
[0:09:06] want a useful assistant, it would look a
[0:09:09] lot like this. It just might not do
[0:09:11] coding. And that is the secret of Claude
[0:09:13] code. You might want a useful assistant
[0:09:16] that explains things, that teaches you
[0:09:18] things, that helps you to learn. You may
[0:09:20] want a useful assistant that helps you
[0:09:23] to take action autonomously on your ad
[0:09:25] network. You may want a useful assistant
[0:09:28] that can process an entire piece of long
[0:09:31] context about a contract you're
[0:09:33] reviewing and can give you really useful
[0:09:36] feedback. You may want a stateful
[0:09:38] assistant that remembers the last
[0:09:39] conversation you had or that remembers a
[0:09:42] live feed to an MCP server for something
[0:09:44] you want to keep track of like add
[0:09:46] updates and can process that in real
[0:09:48] time and take action. All of these
[0:09:51] things are on the horizon thanks to
[0:09:53] today's updates. Even though today's
[0:09:56] updates, the last few weeks updates are
[0:09:58] framed in terms of code. Code is the
[0:10:02] Trojan horse. Code is what Anthropic is
[0:10:04] choosing to use as the wedge into the
[0:10:07] workplace. And what's beautiful about
[0:10:09] that flywheel is because they're
[0:10:11] attracting tech companies with code.
[0:10:13] They are attracting early adopters who
[0:10:15] will also be willing to try clawed code
[0:10:19] elsewhere more quickly. Early adopters
[0:10:21] by nature are more fluid. They are more
[0:10:23] willing to try new things. They're more
[0:10:25] willing to try clawed code with marketer
[0:10:28] seats, with product management seats,
[0:10:30] with customer success seats, and see if
[0:10:32] that general purpose agent is useful.
[0:10:34] And all of that feeds the virtuous
[0:10:35] flywheel for Anthropic. And so, while
[0:10:38] Chad GPT5 was having a rocky week,
[0:10:41] Anthropic had frankly a power week. They
[0:10:44] were able to release a bunch of pinpoint
[0:10:47] updates that underline that provide
[0:10:49] dotted line connects to their longterm
[0:10:53] strategy of capturing the workplace. And
[0:10:55] if you were to handicap the race for the
[0:10:58] workplace right now, I would say
[0:11:01] Anthropic is clearly in the lead.
[0:11:03] Anthropic is more likely to be in the
[0:11:06] workplace of the future than OpenAI.
[0:11:08] Despite OpenAI's ubiquity, despite the
[0:11:11] fact that OpenAI has an edge in raw user
[0:11:15] count, we already know that Anthropic
[0:11:17] punches above its weight on enterprise
[0:11:19] contracts. There are already anecdotes
[0:11:22] postGPT5
[0:11:23] of companies letting go of their GPT5
[0:11:26] contracts because they like what they
[0:11:28] get with Cloud Code. None of this
[0:11:29] suggests that Chat GPT will not remain
[0:11:32] the most iconic global brand for AI out
[0:11:35] there. I think they have handily won the
[0:11:38] consumer race, but that doesn't mean
[0:11:40] they automatically get the enterprise
[0:11:41] race and Anthropic has figured that out.
[0:11:44] Keep looking at future releases with
[0:11:46] clawed code. Keep watching how Anthropic
[0:11:49] ships. They ship frequently. They don't
[0:11:51] necessarily do a big fanfare about it,
[0:11:54] but every single ship lines up
[0:11:56] strategically toward that larger goal of
[0:11:59] capturing the workplace. And Claude Code
[0:12:01] is the agent they're using to get that
[0:12:04] job done. I'm very impressed with what
[0:12:05] Anthropic has been shipping lately and I
[0:12:08] am enjoying what I'm enjoying the
[0:12:10] polish. I'm enjoying the fact that they
[0:12:12] launch and there's not a big blowback.
[0:12:14] It's quiet. It's consistent. They just
[0:12:17] launch it and it works. It's great. I
[0:12:19] can see why companies are saying we're
[0:12:21] just going to pick Claude. There's less
[0:12:23] drama. It's just easier. It codes. And
[0:12:25] hey, by the way, we can also let our
[0:12:26] other teams use it. That's a really good
[0:12:29] play for the workplace. So, hats off to
[0:12:31] the anthropic team. Well done, guys.
[0:12:32] Looking forward to what you ship

---

*Extracted from YouTube Auto-generated captions*