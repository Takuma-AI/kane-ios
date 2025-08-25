# 23 Ways ChatGPT Still Sucks After 3 years (And How to Fix Them)

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-20  
**URL**: https://youtube.com/watch?v=z7LZlpr3PNQ  
**Duration**: 0:15:26  
**Views**: 5,739  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

I have spent a ton of time talking about chat bots, chat GPT, Claude, Gemini. I've also spent a lot of time giving advice to builders who are trying to work on embedding AI in their products. But there's one thing I haven't done yet, and that's what we're going to do today. I have not talked about how I would improve the chatbot experience. If you are going to do a chatbot, how does it suck less? because to be honest, there's a lot of really big pain points that are showing up now that we have like a billion people on this app. So, we are going to spend some time together going through my wish list for how to make this better. And why are we doing this, right? Like typically what I do is really actionable stuff that you can take and apply right away. We are doing this because you are not limited. We are at a point with open- source models where if you want to go and build this, if you want to go and get a group together and build this, if you want to go hunt for a company building this, if you want to found a company that does this, it's open season. You can do that. And it doesn't take that long. I saw the first meaningful spin-offs from Chad GPT's new open- source open weights models in 6 hours. Now, not everybody's going to be smart enough as a developer to do it in 6 hours. I know I'm certainly not. But the point is, if you put out things into the universe, you are more likely to get them back. And I want to start talking honestly about what I think sucks and what I would like to see back, and I want you to talk back to me. I want you to come back in the comments and want you to say, "Yeah, Nate, you were wrong here." Or, "Yeah, Nate, that was great. Add that one." Or, "Hey, did you think about this? This is another one." So, I group these into a couple of big categories. And the overall theme is that chat is great for ideas. Chat, GPT, Claude, others, they're great for ideas, but they're bad at turning those ideas into work you can ship. Are they getting better at it? Are they working hard at it? Around code, yes. Around everything else, maybe not. Let's talk about the pain points and the fixes. So, the the first big categories is sharing and working together. Right now, it really sucks that I cannot share just a relevant slice of the chat with a friend and branch off of that and talk together and come back into the chat. There's no idea of threading. There's no idea of collaboration. It's like the chat is you and the AI locked in together forever, right? That is not how conversation and collaboration actually works. Let me select messages. Let me share a link to that part for view, comment, or edit. I should be able to start a new thread with that person viewing, commenting, and editing that I can tie back into the main thread. That is not impossible to do. We have invented editable tweets. It is possible to do this right now. It sucks that collaboration is just copy paste ping pong. It's one of my biggest pains. I I have joked with other leaders that I feel like my entire day is arguing with AI or arguing with people and copying pasting back and forth between them. You want to be in a place where you can live co-edit and you can comment on answers, see another person typing, get into suggest mode. You want to get out of this copy paste pingpong that puts you into other things. I think we are seeing an early hint of that in the way the canvas is handled in chat GPT5. It does not go nearly far enough. Neither does clawed artifacts. Neither does the way Gemini handles code. It's just not enough. Part of why it's not enough is that not everybody's a coder. And I think right now, as much as I love my development brothers and sisters, they are getting the lion's share of the attention. And people who do not code need some attention, too. Right now, it sucks that trying a new angle just wrecks the original. There's no idea of branching. If I want to start a new artifact, the canvas just can't handle that right now. The React component has difficulty with that right now. It certainly can't compare it side by side. You can't merge stuff back easily. It should not be that difficult to try a new angle. That's how human innovation happens. Right now, it sucks that I cannot point someone to one exact answer. I want to build a permal link to one message that was a banger that really got it right where like for whatever reason chat GPT got it correct. I want to be able to point to that one answer and it's really easy and it's really intuitive and then I can just link to it and it's there for for like a text message, right? And it's easy to say what about this and I can give attribution to whatever LLM I used. That's fine. But I can't do that right now. I have to share the whole darn conversation with all the back and forth that led to it and it's very hard to find anything. Another big area besides collaboration is how we get to intent. Right now, I have to give you extensive input on prompting, like pages and pages and tens of pages and hundreds of pages on prompting because intent is not something LLM are good at understanding. It sucks that you have to prompt write for best results. I would prefer to type the gist, get a clean request, and right now, nobody really does this. Well, I know there are prompt expanding tools. I've tried them. They don't have dynamically generated checkboxes that I can confirm that walk me through the variables. As a simple example, we are at a point where LLMs can generate dynamic interfaces like that. Comet shows the way. Comet generates a dynamic interface for sending an email. Great. We don't have that today and we should in the chat experience. I don't want to have to prompt perfectly. I want to have to prompt approximately and get a nice clean request with little check boxes that I can use. Right now, it sucks that sometimes I want to be coached and sometimes I want to take action and sometimes I want the LLM to take action and I can't convey any of that because there's only one personality and the personality seems to come pre-built with the LLM and the personality adjustments tend to be around temperament, not productivity. And so I know that like Chad GPT launched learn mode. I have heard anecdotally that Chad GPT5 kind of broke it cuz the personality is so freaking eager. Please give me the ability to adjust the degree of agenticness for a particular project for a particular request. If I want a particular LLM to just go and work for hours, let me turn the dial to 11 like Spinal Tap. If I want to just have little short loops and quick conversations back and forth, let me turn the dial down. It should not be that hard. Right now, it sucks that reshaping outputs takes forever. It is so hard when I have something that's about the right draft and I want to make it more strategic or make it for the seauite. How about you make it more crisp? How about you use real examples? Again, dynamically generate the interface. Give me some one-tap options and let me work through it. Don't make me scream at the LLM and use my swear words. I sometimes have to do that. All right. Second. So, third big group. So, we have sharing and working together. We went through like five pain points for that. We went through three pain points for how you can convey intent. I want to go through three pain points for turning answers into real work. It sucks right now that exports break formatting. Right now, clean exports to Docs, to Notion. They don't keep code blocks intact all the time. They don't keep headings clear. There's all kinds of weirdness that happens with copy paste exports. I will say Grock is absolutely horrific about this. But Grock is not the only one. Other LLMs also struggle with clean exports across this. We need something like MCP or a middleware layer for exports. It just it sucks so bad right now because you end up spending more time fixing the formatting than you spent getting the LLM to say it. Right now, it sucks that action items just disappear into the chat scroll. Like, if it's if it's a task due on Friday and you remind me, don't just make it another chat. Like, put it in yellow, highlight it, give me a little calendar view of upcoming tasks. Have some fun with it. The chatbot is not the only thing right now. It sucks that stakeholders stakeholders don't want the messy thread, but they have to get the messy thread if they want to see how you work. Find a way to give me a publish page. I want a readonly summary of the best messages in the conversation. It should not be that hard. I'm really hoping someone from the model makers is watching this. That would be kind of nice. Another section. So, we talked about turning answers into real work. There were some sort of three pieces there. I want to talk about the idea of keeping it updated without babysitting it. There's there's two big pieces there, right? Number one, right now it sucks that I have to remember to rerun things. So, the scheduled tasks feature in chat GPT is not enough here. I want something that I can schedule that will update dynamically as sources change. Basically, if you're going to promise me agents, give me smart agents. If I'm going to let an agent do a thing, give me more controllability over what that looks like. Wow, the agent discovered that the news source has changed because the news itself is shifting into a different vertical. Well, then freaking update it and let me know proactively. right now. It also sucks that updates to code force me to reread everything. It should not be that hard to just refresh with differences. Show me what changed since last time. And that is true for chat and that is true for artifacts and that is true for code and a lot of other things we do. We want to see the difference or the delta and it just dumps everything. Another section is trust and control. Right now it sucks that I cannot easily see where claims come from. there are these little chips and I know that this is quote unquote better than it was before and sometimes it makes it up and doesn't list chips. Give me something like I have the receipts and it's a list with sources and I should be able to copy the markdown and frankly I should be able to run a separate job on those sources to validate that they're real URLs. This is not that hard. This is literally what I use Perplexity for all the time is to check sources. Just build it in right now. It sucks that the app remembers the wrong stuff across chats. Yes, there's a memory panel in chat GPT. There's not in Claude. I want to see which memories are being pulled into this chat and have the option to edit them. I want to say, "No, not that memory. Oh, add this other memory. Make this a memory." Don't have that right now. It sucks how sensitive work feels risky. I know the New York Times lawsuit and chat GPT is particularly affected here because they're being obligated to retain chats they wouldn't otherwise. But even leaving that aside, you want to be in a position where you can have threads that autodee. You can have threads that you cannot share. You can have threads that are locked to access in a particular region. We want to have more options for sensitive work and we just don't right now. It sucks that I don't know the cost or the time until it's too late. Just if I'm in the API, continue to invest in making those costs really clear. If I am in the chat and I have a certain number of messages on my plan, show me the number of messages left. Make the usage more clear and obvious. Another big group is finding and retrieval and reuse. Right now, it sucks how much finished work gets buried. I would love to be able to autogroup threads into a project. Chat GPT, for goodness sake, is able to know what related threads are. Just auto group them together, pin the best answers at the top, and highlight them. Like I should be able to click a dynamic little button saying this is great, pin it or something like that and it should just be really easy to find finished work. Right now it sucks that I have to reinvent paragraphs that that that I've already written. I want to pull a paragraph from an old chat that I can link back and just dynamically pull it in and say this is great more like this. And it's just it's so much pain right now. I have to dig through, copy and paste it, put it. It's just it's painful right now. It sucks that search cannot find any kind of dynamic hiring scorecard. So if you are using global search, truly global search, you should be able to dig into a lot of related terms for your search. And so stay with me here. You should be able to dig into JD, job description, and scorecard all at the same time. You should be able to filter by person, by file, by time, and come back. In other words, I am talking about how we search within our chats, not how we search on the broader internet. If you have, in this instance, you're in HR, you have a hiring scorecard you built and you're digging hiring scorecard thing. I want more dynamic searches. I want it to know I was talking about the hiring scorecard, even if I didn't use those exact words till late in the chat. Even if the name is completely different and says something like new strategy because I happen to write those words in the first prompt. I want global search that's smarter within chat. We need that because the number of chats we have. Okay, thank you for sticking with me through what is amounting to a lengthy rant. The last section, quality of life. Right now, it sucks that it asks 20 questions instead of just taking inputs. It should generate forms for me more often if it sees that I'm working through something structured. This gets back to intent clarity, but frankly, it gets back to docs. What if I upload a PDF and it's a government form? Can't it dynamically generate the form and let me like fill in little pieces and give me advice as I fill it in and then I can finish it up in like one click much much easier than asking me 20 questions in line. Right now it sucks how much tone whiplash wastes edits. The tone presets are really clunky and they overindex way too fast and it's so painful to edit back and forth. Give me better dials. Give me more nuance in my tone presets. which may come back to the idea that we just need a better LLM for writing and we don't have great options right now. And I know that people are raving about Kimmy K2 and writing and all of the vocabulary that it uses. It's not about vocabulary. It's about these kinds of breadandbut features that enable you to actually make the writing work for you. And speaking of whiplash edits, you should be able to find a fingerprint tone that you like in your LLM and preserve it and save it. It should not be that hard. Right now, the best options we have are these system instructions, which feels like beating a screw with a hammer. Like, you can kind of make progress, but it's still more painful than it should be. Last thing, right now, it sucks that I cannot roll back to the good one from this morning. Version history and quick restore on chats, like we just don't have it. If I go into the canvas, I can't roll back to the good one. If I go into claw, the best thing I can do is click on a previous version. There's no sense of roll back or checkpoint. That's really frustrating. If you want to look at the overall theme of what I've talked about, what I'm asking for. I want to make chat sharable. I want to make it shippable. I want to make it more self-maintaining. I want to be able to share slices and expand intent more easily. I want to reshape and export. I want to auto refresh diffs, show receipts, control memory. Really, what I want is to jump from a clever chat to an actual workbench. And I don't see nearly enough motion on this 3 years in to the LLM revolution. Like we're still in the chatbot and people are saying builders need to build apps that aren't just chat bots. Well, we do and I talk about that a ton. I'm all in on that. But we also just need to use better chat bots and it shouldn't suck this much. Thank you for staying for my rant. Let me know what I missed. Let me know what you disagree with. What would you like to see changed about Chuck?

---

## Timestamped Transcript

[0:00:00] I have spent a ton of time talking about
[0:00:02] chat bots, chat GPT, Claude, Gemini.
[0:00:05] I've also spent a lot of time giving
[0:00:07] advice to builders who are trying to
[0:00:10] work on embedding AI in their products.
[0:00:12] But there's one thing I haven't done
[0:00:14] yet, and that's what we're going to do
[0:00:15] today. I have not talked about how I
[0:00:18] would improve the chatbot experience. If
[0:00:22] you are going to do a chatbot, how does
[0:00:24] it suck less? because to be honest,
[0:00:27] there's a lot of really big pain points
[0:00:29] that are showing up now that we have
[0:00:31] like a billion people on this app. So,
[0:00:33] we are going to spend some time together
[0:00:36] going through my wish list for how to
[0:00:38] make this better. And why are we doing
[0:00:39] this, right? Like typically what I do is
[0:00:42] really actionable stuff that you can
[0:00:44] take and apply right away. We are doing
[0:00:47] this because you are not limited. We are
[0:00:50] at a point with open- source models
[0:00:51] where if you want to go and build this,
[0:00:54] if you want to go and get a group
[0:00:55] together and build this, if you want to
[0:00:56] go hunt for a company building this, if
[0:00:58] you want to found a company that does
[0:00:59] this, it's open season. You can do that.
[0:01:02] And it doesn't take that long. I saw the
[0:01:04] first meaningful spin-offs from Chad
[0:01:06] GPT's new open- source open weights
[0:01:08] models in 6 hours. Now, not everybody's
[0:01:11] going to be smart enough as a developer
[0:01:12] to do it in 6 hours. I know I'm
[0:01:14] certainly not. But the point is, if you
[0:01:17] put out things into the universe, you
[0:01:19] are more likely to get them back. And I
[0:01:21] want to start talking honestly about
[0:01:22] what I think sucks and what I would like
[0:01:24] to see back, and I want you to talk back
[0:01:26] to me. I want you to come back in the
[0:01:28] comments and want you to say, "Yeah,
[0:01:29] Nate, you were wrong here." Or, "Yeah,
[0:01:31] Nate, that was great. Add that one." Or,
[0:01:33] "Hey, did you think about this? This is
[0:01:34] another one." So, I group these into a
[0:01:37] couple of big categories. And the
[0:01:38] overall theme is that chat is great for
[0:01:41] ideas. Chat, GPT, Claude, others,
[0:01:43] they're great for ideas, but they're bad
[0:01:44] at turning those ideas into work you can
[0:01:47] ship. Are they getting better at it? Are
[0:01:49] they working hard at it? Around code,
[0:01:51] yes. Around everything else, maybe not.
[0:01:53] Let's talk about the pain points and the
[0:01:55] fixes. So, the the first big categories
[0:01:57] is sharing and working together. Right
[0:02:00] now, it really sucks that I cannot share
[0:02:04] just a relevant slice of the chat with a
[0:02:07] friend and branch off of that and talk
[0:02:09] together and come back into the chat.
[0:02:11] There's no idea of threading. There's no
[0:02:13] idea of collaboration. It's like the
[0:02:15] chat is you and the AI locked in
[0:02:18] together forever, right? That is not how
[0:02:21] conversation and collaboration actually
[0:02:22] works. Let me select messages. Let me
[0:02:25] share a link to that part for view,
[0:02:27] comment, or edit. I should be able to
[0:02:30] start a new thread with that person
[0:02:31] viewing, commenting, and editing that I
[0:02:33] can tie back into the main thread. That
[0:02:36] is not impossible to do. We have
[0:02:38] invented editable tweets. It is possible
[0:02:41] to do this right now. It sucks that
[0:02:43] collaboration is just copy paste ping
[0:02:46] pong. It's one of my biggest pains. I I
[0:02:47] have joked with other leaders that I
[0:02:50] feel like my entire day is arguing with
[0:02:52] AI or arguing with people and copying
[0:02:54] pasting back and forth between them. You
[0:02:57] want to be in a place where you can live
[0:02:59] co-edit and you can comment on answers,
[0:03:01] see another person typing, get into
[0:03:03] suggest mode. You want to get out of
[0:03:06] this copy paste pingpong that puts you
[0:03:08] into other things. I think we are seeing
[0:03:10] an early hint of that in the way the
[0:03:12] canvas is handled in chat GPT5. It does
[0:03:15] not go nearly far enough. Neither does
[0:03:17] clawed artifacts. Neither does the way
[0:03:19] Gemini handles code. It's just not
[0:03:21] enough. Part of why it's not enough is
[0:03:23] that not everybody's a coder. And I
[0:03:25] think right now, as much as I love my
[0:03:26] development brothers and sisters, they
[0:03:28] are getting the lion's share of the
[0:03:31] attention. And people who do not code
[0:03:33] need some attention, too. Right now, it
[0:03:34] sucks that trying a new angle just
[0:03:37] wrecks the original. There's no idea of
[0:03:40] branching. If I want to start a new
[0:03:43] artifact, the canvas just can't handle
[0:03:45] that right now. The React component has
[0:03:48] difficulty with that right now. It
[0:03:49] certainly can't compare it side by side.
[0:03:52] You can't merge stuff back easily. It
[0:03:54] should not be that difficult to try a
[0:03:56] new angle. That's how human innovation
[0:03:58] happens. Right now, it sucks that I
[0:04:01] cannot point someone to one exact
[0:04:04] answer. I want to build a permal link to
[0:04:06] one message that was a banger that
[0:04:08] really got it right where like for
[0:04:10] whatever reason chat GPT got it correct.
[0:04:13] I want to be able to point to that one
[0:04:15] answer and it's really easy and it's
[0:04:17] really intuitive and then I can just
[0:04:19] link to it and it's there for for like a
[0:04:21] text message, right? And it's easy to
[0:04:23] say what about this and I can give
[0:04:25] attribution to whatever LLM I used.
[0:04:27] That's fine. But I can't do that right
[0:04:29] now. I have to share the whole darn
[0:04:30] conversation with all the back and forth
[0:04:31] that led to it and it's very hard to
[0:04:33] find anything. Another big area besides
[0:04:35] collaboration is how we get to intent.
[0:04:39] Right now, I have to give you extensive
[0:04:41] input on prompting, like pages and pages
[0:04:44] and tens of pages and hundreds of pages
[0:04:46] on prompting because intent is not
[0:04:49] something LLM are good at understanding.
[0:04:51] It sucks that you have to prompt write
[0:04:53] for best results. I would prefer to type
[0:04:57] the gist, get a clean request, and right
[0:04:59] now, nobody really does this. Well, I
[0:05:02] know there are prompt expanding tools.
[0:05:04] I've tried them. They don't have
[0:05:06] dynamically generated checkboxes that I
[0:05:09] can confirm that walk me through the
[0:05:10] variables. As a simple example, we are
[0:05:13] at a point where LLMs can generate
[0:05:15] dynamic interfaces like that. Comet
[0:05:17] shows the way. Comet generates a dynamic
[0:05:19] interface for sending an email. Great.
[0:05:22] We don't have that today and we should
[0:05:25] in the chat experience. I don't want to
[0:05:27] have to prompt perfectly. I want to have
[0:05:29] to prompt approximately and get a nice
[0:05:32] clean request with little check boxes
[0:05:34] that I can use. Right now, it sucks that
[0:05:37] sometimes I want to be coached and
[0:05:40] sometimes I want to take action and
[0:05:43] sometimes I want the LLM to take action
[0:05:46] and I can't convey any of that because
[0:05:48] there's only one personality and the
[0:05:49] personality seems to come pre-built with
[0:05:51] the LLM and the personality adjustments
[0:05:54] tend to be around temperament, not
[0:05:56] productivity. And so I know that like
[0:05:59] Chad GPT launched learn mode. I have
[0:06:01] heard anecdotally that Chad GPT5 kind of
[0:06:04] broke it cuz the personality is so
[0:06:06] freaking eager. Please give me the
[0:06:09] ability to adjust the degree of
[0:06:13] agenticness for a particular project for
[0:06:17] a particular request. If I want a
[0:06:20] particular LLM to just go and work for
[0:06:22] hours, let me turn the dial to 11 like
[0:06:25] Spinal Tap. If I want to just have
[0:06:28] little short loops and quick
[0:06:30] conversations back and forth, let me
[0:06:31] turn the dial down. It should not be
[0:06:33] that hard. Right now, it sucks that
[0:06:35] reshaping outputs takes forever. It is
[0:06:39] so hard when I have something that's
[0:06:40] about the right draft and I want to make
[0:06:42] it more strategic or make it for the
[0:06:44] seauite. How about you make it more
[0:06:46] crisp? How about you use real examples?
[0:06:49] Again, dynamically generate the
[0:06:51] interface. Give me some one-tap options
[0:06:53] and let me work through it. Don't make
[0:06:55] me scream at the LLM and use my swear
[0:06:57] words. I sometimes have to do that.
[0:07:01] All right. Second. So, third big group.
[0:07:02] So, we have sharing and working
[0:07:03] together. We went through like five pain
[0:07:05] points for that. We went through three
[0:07:07] pain points for how you can convey
[0:07:09] intent. I want to go through three pain
[0:07:11] points for turning answers into real
[0:07:14] work. It sucks right now that exports
[0:07:17] break formatting. Right now, clean
[0:07:20] exports to Docs, to Notion. They don't
[0:07:23] keep code blocks intact all the time.
[0:07:24] They don't keep headings clear. There's
[0:07:26] all kinds of weirdness that happens with
[0:07:28] copy paste exports. I will say Grock is
[0:07:31] absolutely horrific about this. But
[0:07:32] Grock is not the only one. Other LLMs
[0:07:35] also struggle with clean exports across
[0:07:37] this. We need something like MCP or a
[0:07:40] middleware layer for exports. It just it
[0:07:43] sucks so bad right now because you end
[0:07:45] up spending more time fixing the
[0:07:47] formatting than you spent getting the
[0:07:49] LLM to say it. Right now, it sucks that
[0:07:52] action items just disappear into the
[0:07:54] chat scroll. Like, if it's if it's a
[0:07:57] task due on Friday and you remind me,
[0:07:59] don't just make it another chat. Like,
[0:08:01] put it in yellow, highlight it, give me
[0:08:04] a little calendar view of upcoming
[0:08:05] tasks. Have some fun with it. The
[0:08:08] chatbot is not the only thing right now.
[0:08:10] It sucks that stakeholders stakeholders
[0:08:13] don't want the messy thread, but they
[0:08:15] have to get the messy thread if they
[0:08:16] want to see how you work. Find a way to
[0:08:18] give me a publish page. I want a
[0:08:20] readonly summary of the best messages in
[0:08:22] the conversation. It should not be that
[0:08:24] hard. I'm really hoping someone from the
[0:08:26] model makers is watching this. That
[0:08:28] would be kind of nice. Another section.
[0:08:30] So, we talked about turning answers into
[0:08:31] real work. There were some sort of three
[0:08:33] pieces there. I want to talk about the
[0:08:35] idea of keeping it updated without
[0:08:36] babysitting it. There's there's two big
[0:08:38] pieces there, right? Number one, right
[0:08:40] now it sucks that I have to remember to
[0:08:43] rerun things. So, the scheduled tasks
[0:08:46] feature in chat GPT is not enough here.
[0:08:48] I want something that I can schedule
[0:08:51] that will update dynamically as sources
[0:08:54] change. Basically, if you're going to
[0:08:56] promise me agents, give me smart agents.
[0:08:59] If I'm going to let an agent do a thing,
[0:09:01] give me more controllability over what
[0:09:02] that looks like. Wow, the agent
[0:09:04] discovered that the news source has
[0:09:06] changed because the news itself is
[0:09:08] shifting into a different vertical.
[0:09:10] Well, then freaking update it and let me
[0:09:12] know proactively. right now. It also
[0:09:14] sucks that updates to code force me to
[0:09:17] reread everything. It should not be that
[0:09:19] hard to just refresh with differences.
[0:09:22] Show me what changed since last time.
[0:09:24] And that is true for chat and that is
[0:09:25] true for artifacts and that is true for
[0:09:27] code and a lot of other things we do. We
[0:09:29] want to see the difference or the delta
[0:09:31] and it just dumps everything. Another
[0:09:33] section is trust and control. Right now
[0:09:36] it sucks that I cannot easily see where
[0:09:38] claims come from. there are these little
[0:09:40] chips and I know that this is quote
[0:09:42] unquote better than it was before and
[0:09:44] sometimes it makes it up and doesn't
[0:09:46] list chips. Give me something like I
[0:09:48] have the receipts and it's a list with
[0:09:51] sources and I should be able to copy the
[0:09:52] markdown and frankly I should be able to
[0:09:55] run a separate job on those sources to
[0:09:57] validate that they're real URLs. This is
[0:09:59] not that hard. This is literally what I
[0:10:01] use Perplexity for all the time is to
[0:10:03] check sources. Just build it in right
[0:10:05] now. It sucks that the app remembers the
[0:10:07] wrong stuff across chats. Yes, there's a
[0:10:09] memory panel in chat GPT. There's not in
[0:10:11] Claude. I want to see which memories are
[0:10:15] being pulled into this chat and have the
[0:10:18] option to edit them. I want to say, "No,
[0:10:20] not that memory. Oh, add this other
[0:10:21] memory. Make this a memory." Don't have
[0:10:23] that right now. It sucks how sensitive
[0:10:25] work feels risky. I know the New York
[0:10:27] Times lawsuit and chat GPT is
[0:10:29] particularly affected here because
[0:10:30] they're being obligated to retain chats
[0:10:32] they wouldn't otherwise. But even
[0:10:34] leaving that aside, you want to be in a
[0:10:36] position where you can have threads that
[0:10:38] autodee. You can have threads that you
[0:10:40] cannot share. You can have threads that
[0:10:43] are locked to access in a particular
[0:10:44] region. We want to have more options for
[0:10:47] sensitive work and we just don't right
[0:10:49] now. It sucks that I don't know the cost
[0:10:51] or the time until it's too late. Just if
[0:10:55] I'm in the API, continue to invest in
[0:10:57] making those costs really clear. If I am
[0:11:00] in the chat and I have a certain number
[0:11:01] of messages on my plan, show me the
[0:11:03] number of messages left. Make the usage
[0:11:06] more clear and obvious. Another big
[0:11:08] group is finding and retrieval and
[0:11:11] reuse. Right now, it sucks how much
[0:11:13] finished work gets buried. I would love
[0:11:15] to be able to autogroup threads into a
[0:11:18] project. Chat GPT, for goodness sake, is
[0:11:20] able to know what related threads are.
[0:11:23] Just auto group them together, pin the
[0:11:25] best answers at the top, and highlight
[0:11:27] them. Like I should be able to click a
[0:11:29] dynamic little button saying this is
[0:11:31] great, pin it or something like that and
[0:11:33] it should just be really easy to find
[0:11:34] finished work. Right now it sucks that I
[0:11:36] have to reinvent paragraphs that that
[0:11:38] that I've already written. I want to
[0:11:40] pull a paragraph from an old chat that I
[0:11:43] can link back and just dynamically pull
[0:11:44] it in and say this is great more like
[0:11:46] this. And it's just it's so much pain
[0:11:48] right now. I have to dig through, copy
[0:11:49] and paste it, put it. It's just it's
[0:11:51] painful right now. It sucks that search
[0:11:54] cannot find any kind of dynamic hiring
[0:11:59] scorecard. So if you are using global
[0:12:02] search, truly global search, you should
[0:12:05] be able to dig into a lot of related
[0:12:09] terms for your search. And so stay with
[0:12:11] me here. You should be able to dig into
[0:12:12] JD, job description, and scorecard all
[0:12:14] at the same time. You should be able to
[0:12:16] filter by person, by file, by time, and
[0:12:19] come back. In other words, I am talking
[0:12:21] about how we search within our chats,
[0:12:23] not how we search on the broader
[0:12:24] internet. If you have, in this instance,
[0:12:26] you're in HR, you have a hiring
[0:12:28] scorecard you built and you're digging
[0:12:29] hiring scorecard thing. I want more
[0:12:32] dynamic searches. I want it to know I
[0:12:34] was talking about the hiring scorecard,
[0:12:35] even if I didn't use those exact words
[0:12:37] till late in the chat. Even if the name
[0:12:39] is completely different and says
[0:12:40] something like new strategy because I
[0:12:42] happen to write those words in the first
[0:12:44] prompt. I want global search that's
[0:12:46] smarter within chat. We need that
[0:12:47] because the number of chats we have.
[0:12:50] Okay, thank you for sticking with me
[0:12:51] through what is amounting to a lengthy
[0:12:53] rant. The last section, quality of life.
[0:12:57] Right now, it sucks that it asks 20
[0:12:59] questions instead of just taking inputs.
[0:13:03] It should generate forms for me more
[0:13:05] often if it sees that I'm working
[0:13:08] through something structured. This gets
[0:13:10] back to intent clarity, but frankly, it
[0:13:12] gets back to docs. What if I upload a
[0:13:13] PDF and it's a government form? Can't it
[0:13:16] dynamically generate the form and let me
[0:13:18] like fill in little pieces and give me
[0:13:20] advice as I fill it in and then I can
[0:13:21] finish it up in like one click much much
[0:13:24] easier than asking me 20 questions in
[0:13:26] line. Right now it sucks how much tone
[0:13:29] whiplash wastes edits. The tone presets
[0:13:32] are really clunky and they overindex way
[0:13:35] too fast and it's so painful to edit
[0:13:37] back and forth. Give me better dials.
[0:13:39] Give me more nuance in my tone presets.
[0:13:42] which may come back to the idea that we
[0:13:44] just need a better LLM for writing and
[0:13:47] we don't have great options right now.
[0:13:48] And I know that people are raving about
[0:13:50] Kimmy K2 and writing and all of the
[0:13:52] vocabulary that it uses. It's not about
[0:13:54] vocabulary. It's about these kinds of
[0:13:57] breadandbut features that enable you to
[0:13:59] actually make the writing work for you.
[0:14:01] And speaking of whiplash edits, you
[0:14:03] should be able to find a fingerprint
[0:14:06] tone that you like in your LLM and
[0:14:08] preserve it and save it. It should not
[0:14:10] be that hard. Right now, the best
[0:14:12] options we have are these system
[0:14:13] instructions, which feels like beating a
[0:14:15] screw with a hammer. Like, you can kind
[0:14:17] of make progress, but it's still more
[0:14:18] painful than it should be. Last thing,
[0:14:20] right now, it sucks that I cannot roll
[0:14:22] back to the good one from this morning.
[0:14:24] Version history and quick restore on
[0:14:26] chats, like we just don't have it. If I
[0:14:28] go into the canvas, I can't roll back to
[0:14:29] the good one. If I go into claw, the
[0:14:32] best thing I can do is click on a
[0:14:33] previous version. There's no sense of
[0:14:34] roll back or checkpoint. That's really
[0:14:36] frustrating. If you want to look at the
[0:14:38] overall theme of what I've talked about,
[0:14:40] what I'm asking for. I want to make chat
[0:14:42] sharable. I want to make it shippable. I
[0:14:44] want to make it more self-maintaining. I
[0:14:46] want to be able to share slices and
[0:14:48] expand intent more easily. I want to
[0:14:50] reshape and export. I want to auto
[0:14:52] refresh diffs, show receipts, control
[0:14:54] memory. Really, what I want is to jump
[0:14:57] from a clever chat to an actual
[0:14:59] workbench. And I don't see nearly enough
[0:15:02] motion on this 3 years in to the LLM
[0:15:05] revolution. Like we're still in the
[0:15:07] chatbot and people are saying builders
[0:15:09] need to build apps that aren't just chat
[0:15:11] bots. Well, we do and I talk about that
[0:15:13] a ton. I'm all in on that. But we also
[0:15:15] just need to use better chat bots and it
[0:15:17] shouldn't suck this much. Thank you for
[0:15:19] staying for my rant. Let me know what I
[0:15:21] missed. Let me know what you disagree
[0:15:23] with. What would you like to see changed
[0:15:25] about Chuck?

---

*Extracted from YouTube Auto-generated captions*