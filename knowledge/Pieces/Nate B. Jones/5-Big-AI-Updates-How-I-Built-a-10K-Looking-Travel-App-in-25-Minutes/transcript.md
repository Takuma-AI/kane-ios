# 5 Big AI Updates + How I Built a $10K-Looking Travel App in 25 Minutes

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-13  
**URL**: https://youtube.com/watch?v=v1Ham9sIWgo  
**Duration**: 0:23:42  
**Views**: 11,969  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

So, a few days ago, I reviewed Chat GPT5, and one of the things I emphasized is it's really, really easy to make small, easy to use apps. And the one that caught everyone's attention was that I built a 14-day travel itinerary for a trip to Kyoto, Japan. I had people messaging me saying, "Hey, can I remix it for my city?" I had a lot of people saying, "Can you walk me through the prompting process?" We are going to do that today. But first, you get a little bonus. And the bonus is not about chat GPT because one of the things I want to emphasize is that the news keeps happening. Every time there's a major release with Chat GPT, I see the same audience reaction. I see people saying, "It wasn't what I expected. It's a little bit disappointing." And there's this sort of lull afterward. Everyone loses their energy. But AI keeps marching on. And in particular, we've seen a lot of really interesting updates from other labs, not from chat GPT. So, just to give you a sense of perspective before we dive deep into chat GPT5, I want to give you a few snippets from the last day in terms of news. Specifically, we have five pieces of news. We're going to start quickly with Claude. Claude launched their memories feature. I have tried it out. I want to caution you if you're used to chat GPT. This is not the same memories feature. Number one, chat GPT enabled it and you could turn it on and it would just work and you can edit individual memories. I don't know that a lot of people do that, but you can literally see what the system remembers. It it comes as little lines with a little delete button in the settings. That is not how memory works in Claude. In Claude, it's retrievalbased. You actually have to steer the memory. All it does is it searches through your past conversations based on your current conversation. So, you have to ask it in the current conversation. Please remember this or that. In my experience, as I have played with it the last day or so, what I have seen is that this memory feature is not as dependable as Chad GBT's memory feature, but it gives you a richer range of options. So, the memory feature for Chad GBT is famously somewhat uncontrollable. You don't really know what you're going to get. It will remember certain things and you wonder why. And that's why they give you the ability to edit. With this one, with Claude, you can decide exactly what you wanted to go retrieve from past conversations, but it doesn't retrieve it in the same way every time. I've actually tried this. I asked the same query in a fresh chat to the same model two different times, and I got very different structured answers. Similar overlapping content. It wasn't completely off base. But keep in mind that this is not surgical retrieval. The model is running this through a probabilistic token architecture. and you're getting different formats at different times. So, Cloud launching the memories feature, big update. It's the first major model maker that has some kind of memory besides Chad GPT. And that has been one of the stickiest features in chat GPT. I I know lots of people who stay with their chat GPT subscriptions just because it's the only one that has memories. That's starting to change. I would expect it to change more. Second one, also from Claude. Claude launched a 1 million token context window for Sonnet. That is a 5x increase from the previous 200,000 token limit in the API. It enables you to process code bases of 75,000 lines all at once. You can do extensive document sets while maintaining a degree of coherence. Now, is Sonnet perfect? Does it have perfect retrieval across that larger context window? No. But neither does any other model. The point is that it is easy. now to handle extremely large and complex queries in a way that it wasn't easy even 3 or 4 months ago. This is another sign that progress just keeps drumming along. I know that there was a lot of conversation after chat GPC5 launched that basically amounted to is progress over. I would argue with you that we have a frog boiling in the pot problem. Progress isn't over. We've just lost sight of the ability to assess it correctly. Let's jump from Claude to Meta. Meta launched a brain modeling challenge where their brain and AI team was able to encode a 1 billion parameter brain of some sort. I don't know. It's an artificial brain, right? And it basically predicts fMRI brain responses to movies by fusing together video frames, audio, and dialogue. In a sense, what what Zuckerberg is trying to do here is he's trying to build an artificial brain to figure out how to make his video algorithms for his platforms on Meta more addictive. That's really what's going on because if he can model response in the brain to video, he can make the video more directly stimulating to brains and then he can get more of your attention. I know that sounds dark, but I think given sort of the direction that Meta has gone with a lot of the way they've engineered the algorithm, it's a fair call out. Second to last but not least, we have Merge Labs forming. Merge Labs is related to OpenAI, but it's not OpenAI. This is a new brain computer interface startup involving Sam Alman. Open AAI is reportedly an investor, and Sam is listed as a co-founder. It would directly compete with Elon Musk's Neuralink. What this says to me is this. This whole idea of a brain computer interface is not just going to disappear. It's not just an Elon pet project. We are not at the point where we are anywhere close to production on these things yet, but I would expect us to be talking more about commercial products and the ethical questions they raise in 2027. That's my sort of personal horizon for when I think we're going to start to see something like this come out. And you will see a few early adopters that are like, "Yes, please hook my brain to the AI. I want to be part of the singularity." You'll see a lot of people who are like, "Get that away from me. I don't want to touch it with a 10-ft pole." Let's save that debate for 2027 for now. Just notice that there are multiple tech titans getting involved and this isn't going anywhere. Last but not least, Google Gemini has a Marvin the Paranoid and Android problem. So, if you've read Hitchhiker's Guide to the Galaxy, you know that Marvin the Paranoid and Android is a depressed little robot that just cannot get over the curse of its own intelligence. That is very much the vibe from Google Gemini. And what's interesting is that it appears to be a self-deprecation loop where Gemini is programmed to apologize when it can't get something done and then try again. But when the task is sufficiently hard, it seems to get into a dramatic self-critique loop where it critiques itself over and over and over again for failing to accomplish a difficult task until it is literally has refused to proceed further with tasks. And so the leader of of Google's AI project, uh, Logan Kilpatrick, has called this an annoying infinite looping bug, which is one way to put it, and has said that the team is working to fix it. So this is reminding me we have now hit close to a billion users with AI. We are seeing examples of AI behavior at scale that just did not show up on anybody's testing. It reminds me how probabilistic these tools are and how much unique flavor there is in each model. I think a lot of the reaction to chat GPT5 is frankly from the sense that we have a new colleague to work with and we don't know the new colleague yet. Like, hey, who's Frank? Frank is new here, right? Like, we we probably should get to know Frank before we trust Frank with our stuff. These models have personality. They have weird quirks. And Google really underlines that with the Gemini depression scale, so to speak. We will see when they get it fixed, but it's reminding me how unpredictable these tools can be, even by very large model makers. So, those were the five pieces of news. Let's go from there to part two of this video where I dig into the Kyoto travel app that I demoed back in my chat JPT5 review. This will be an on-screen demo. I'm going to share my screen, walk you through the prompts, show you what I got, and we'll have some fun. Okay, first things first, I want to show you what I showed the world. This is the app that everybody got to see. So, it has different emphases that you can click here. So, you can preset it for ramen. You can preset it for uh moss. I said that we wanted to see moss temples in Kyoto or for balanced. You can click around. You can add things if you want to add something. You can choose a different place. Like I could add uh Guini in the morning here and it will just add it right there. Calm cloers sounds like a nice way to start the morning. We have some soy broth. Maybe in the afternoon I can hit up a coffee shop. And I can just uncclick this and hit up the coffee shop. a weekender's roaster. That sounds pretty great. Just add that into the afternoon. You can see that you can kind of build up some notes. It gives you a sense of what's going on. I have a kid, so like it gave me a sense of what would happen with the baby. Is it a perfect app? I want to emphasize that it is not a perfect app, but it's relatively easy to build and to remix. You see that prominent little button? It's easy to edit. You can edit it yourself. Let's look at the prompts that led to this app. All right, here we are in chat GPT. This is the actual conversational chain that I use to produce this and I want to call out how much you can do just in the conversation. We'll go through it, but it's really exciting to me. So, this was my initial prompt. Can you do some research? Build me an interactive mini app I can use to explore various options for visiting Kyoto next year. Then I list three or four interests and I say how far I'm willing to travel. And I say this is who this is for. Who who's the audience? It's a family app. It's for my wife. Uh, and please do the research you you need to develop specific recommendations that could be used to guide a real twoe itinerary. Right? Uh, so it goes away and it thinks for three minutes. It comes back with some code and it comes back with a teaser. Right? Uh, the problem was the code failed partway through. So this is me being really blunt with you. This was the first launch day. OpenAI servers were under a lot of pressure and this just didn't generate. So I said try again. So it comes back initially and I think it's constraining tokens. It comes back with a visual teaser. It says look at how great Kyoto is. Here's a mini app blueprint. All the places you could go. These are all real places. It's citing them in line. Gives you hot springs. Gives you interaction ideas. 5day snapshot. Now I could have edited this heavily. I could have said this is not enough. I need more options etc. In this case I really want to see how good a job it does at coding. I say please code it as a mini app. That's it. Like this is keep in mind the these sum total of my substantive interaction with this has been three or four lines here and then a line here. Now I am sometimes known as the really technical prompt. And one of the things I like to balance that with is to remind people that if your intent is really clear, it doesn't have to be a super technical prompt. If you go back to the top here, this was actually pretty clear intent. It was very clear where I wanted to go, what I was interested in, how far I was willing to travel. I put some constraints in. I defined the audience. I did a lot of the things that a technical prompt would do. I just did it in a plain sentence, and that seemed to work well to evoke a really detailed app recommendation. So, I say, "Yes, please code it." It then works for a minute and a half, and I don't love what it comes up with. And principally, I don't love with it what it comes up with because it's just incredibly ugly and it's got sort of a dark blue text on black. I can't see anything. It's not interactive. It just looks terrible. This is an example where I am showing you what it looks like to actually code versus what you see in the shiny demos. Is it still worth it? Yes, because I want you to see how quickly I can get to something interesting and usable. Okay. So, I say I can't see it. That's it. That's all I tell it. I give it a screenshot and say I can't see it. Um, I've updated the code and it's basically saying I fixed it and you can see things more easily, right? I then come across a bug. And so when it says I've fixed the syntax issue, that is an indicator that when I tried to run the code, I hit fix this bug, which is an actual thing you can do in the UI. I can't do it now because we fixed the bug, but that's how that works. It then says it fixed the bug and I say fix another bug, right? This is some of the reality, right? I am starting to get fed up because there's a third error, right? I am now annoyed. Um, and so I start to get a little bit annoyed. I say, you know what, you've given me so many errors. This is the third error in a row. The app you build is dark on dark font. I cannot see it. I need it beautiful, clear, minimalist, and I need it to freaking work. Uh, I can't tell you if freaking is actually a useful prompting word. It was my expression and my frustration at that point. Um, and it actually went all in on it. And I think one of the things I noticed here, coming back to the prompt, I did not specify a visual style before, and that was probably on me. That's an example of where a more technical prompt would have challenged me to set a more beautiful style, and I just didn't do it. Anyway, it comes back. It nukes the buggy snippet. It replaces it with a clean, light theme, minimal React, all of this stuff. I then come back, and this is the first time it's actually functional. The map and the information links don't work. Um, and I I need a plain English rationale. So, if you remember when I showed you the real app, it had a plain English description of the day. That wasn't there in the original version. Now, you might be wondering, well, why aren't you showing me these code versions as we go? The answer is very simple. inside the same canvas, the code does not roll back the way it does on Claude. And so if I click on that code and run it, it shows whatever is the most recent version. And so it's it's not actually you you can access the current code through this button. You cannot access the old code. So we're going to stick with it. And then it goes to the end, which I think makes no sense. Let's go back. Uh map and info links don't work. Um give it uh like a Japanese inspired aesthetic. So then it starts to say, "Okay, let's fix these things." I then say, "Okay, we finally have something. Do the whole 14-day trip." Um, and then it starts to ask for extras, which is what chat GPT classically does, especially five. Would you like the rationale to reflect the couple's emotional arc, you know, uh, or should it be more practical and log logistical? And I say, "Look, let's be real. I'm traveling with a one-year-old. Factor that in. We'll probably want some extra time." Uh, by the way, if you're wondering what my chat GPT version is, do not look up here. This is the current sort of default. Instead, recognize that whenever it's spending time thinking, this is chat GPT5 thinking mode. And so, I've already showed you a few thinking mode examples. I was using thinking mode because I felt like I was getting better results. I actually tried this with chat GPG5 without thinking and it just did not give me runnable code, which is not super surprising. Uh, it then refactors it. Do you want me to flesh all of this out? I need to have some meaningful controls. At this point, we are really optimizing, right? And at this point, you are probably also curious for what you can actually see, right? Like what does another version besides the one I've shown you look like. Well, this is the latest version. I'll just show it to you. What's interesting about this one is it's very Japanese inflected. So, like it literally brought in Japanese language, which I don't read. So, I thought that was a nice touch, but perhaps not necessary. it expanded the number of categories a fair bit which is something I asked it to do in later versions um and it has filled out all of these elements and so one of the things that you'll notice if you go through my production version is that we have an issue with not enough mossheavy ramen night heavy onsenheavy things to do and so we need to fill out morning afternoon and evening for 14 days and so one of the later things I did is I basically said, "You need to get creative and fill out a full 14-day itinerary." And you can see that it did. Uh, now some of it is a family rest window, but realistically with a kid, that's actually not a bad idea. Um, and it gives you longer and larger narratives in the new version. And it gives you a lot more options. So, as an example, if I want to go to some of these ones that are new, I can do a lot more around Kyoto. Like, we can go to the Araimaya uh bamboo grove if we want, right? and I can add that in if we don't already have that in. We can go to the railway museum. This is good enough as it stands that I am already thinking about using it for a production planning of a trip. And I think that that underlines one of the things that I really tried to call out in my original review, which is that these things like yes, like if you go back here, it's somewhat it looks somewhat frustrating, right? Like you're going back and forth, you're asking it to make edits. Um, you know, there are blanks. Please fix this. Uh, I want to actually have like a lot more creativity. Um, and and it's I think the way I'll put it is that in this chat experience, it can feel frustrating. And that's something that didn't come through in the chat GPT5 presentation. But the reality of getting through to the end of this, getting through little bugs like this that happened postp production. I was fairly frank. I'm not going to say that word on video, but you can read it. Um, and demanding restoration, getting it back. It's It's encouraging to me that you can restore stuff just by yelling at it. And it's encouraging to me that after this whole conversation, and this is post launch, right? Like if you want to think about how long it took just to get to launch for the the app that you saw at the beginning of this video, it was about 15 minutes of conversation. It was very easy. It was very fast. It might have been less. It might have been 10 minutes all told. Um and it stopped about here and that was it. And then all the rest of this is post-production. Me continuing to mess with it because it's frankly fun. It writes out the code. these hundreds of lines of code that it's written out here and it's continued to make it better. It's added in a full twoe planner. It's added in more interests. I can continue to work with it. And I think one of the measures of a good product is that you do continue to work with it. And so even though like if you scroll back up to the top, even though my initial prompt missed some things I would like to have added, it missed the aesthetic I wanted to add. it missed uh the controls I wanted to add things that a better prompt would have done. There is a reason I recommend using solid prompts. Even though I was an honest human being and I was realistic and I was in a rush and I just put this down, I still got to the app that I showed you all in 10 minutes. And then in another, I want to say 15 minutes of messing around, I got to a much more uh involved destinationheavy, lots more like places to go like a riverside walk, better descriptions. I basically got to a V2 in about 15 minutes after the original 10 in the chat. That's 25 minutes over 2 or 3 days and you're swearing at it. You're like, why isn't this fixed? This this bug is annoying. But it has never been possible to make this kind of app for an individual not looking at the code. And I did not touch or change any piece of code here. I just messed with it until I got what I wanted. And I chatted with it and I yelled at it until I got what I wanted. That is how easy it is now to make useful little app artifacts. I think it's a massive gamecher. I think the way chat GPT5 works in the canvas is special and there's a ton to think about with how this is going to change our work going forward. So, I hope you enjoyed a little description of how I built this thing. Let me know what your questions are. I can't say that this is the perfect or best way to build this. I think going back, one of the things I would do is I would actually say, "Hey, uh, and I'll actually do this so you can see it. Looking back over our work so far, write me a fantastic prompt." And I'll include this prompt, uh, in the article. Write me a fantastic prompt that would create this final version of the app. Um, as an extra treat, please uh include brackets around key user choice points like interest areas, city, etc. So a user can easily modify this prompt for a different place, right? And so I'm basically asking it to reflect back and figure out how to prompt better next time. And I like to do that because it gives me a chance to learn myself how I can prompt the model better, learn what I could change and improve. And I will be very curious to see what it comes up with. So whatever comes up with, I will be sure and let you guys know. Uh I do not want you to have to sit there and watch it just spit stuff out. Uh so I think I'm inclined to uh let this video go for now. Uh I may append a little bit at the end once something comes through. Okay, so it spent some time thinking. It came back uh and it actually has a very complete prompt here. Uh if you want to get this even better, you can run this through chat GPT5 Pro and it will be even more deliberate with the prompt. And I will actually show you the sidebyside in the article so you can see that. But for now, it's going to give you a name for the app, places you can fill stuff in. It's going to give you core features, things that you can mix in. It's filled them in, but you can obviously do more than that. Um, and it's going to give you a UI layout. Uh, obviously you don't have to use. You can use something else if it's a different destination. Uh, it's going to give you some non-functional requirements I certainly didn't ask for originally. And then some aesthetic details that you can change. This is fantastic to me because it is showing me how the system thinks about what it builds and what a controllable surface is for that build. It's giving me all the things it thinks are a variable. Uh and so one example of a variable that I think would need some work in an initial prompt, it truly is storing my itinerary somewhere in local storage. It's going to need to research and develop your itinerary, right? So you would need to include that and say the local storage, you need to research and develop this or something. But this is how we learn. This is how we go from at the top just a short threeline prompt here to this gigantic prompt at the end. I did not have to actually paste this prompt in to get this result. And I bet because LLMs are probabilistic. If I paste this prompt, it also won't look exactly the same. And that's okay. The point is that this prompt captures a lot of the detail that I iteratively evolved into over the course of this conversation. So, wrapping up, all told, about 25 minutes in this chat over two days, about 10 minutes to get to a production app that I showed you earlier, about 15 minutes to get to the V2 that I showed you in this video, and you're going to get these prompts as well that you can look into and dive into as sort of follow-ups that will help you to personalize this and use this other places. I don't think it's just for travel. It's really for anything that you have to plan in space and time. Like, you could also modify this for a corporate event really easily. I hope you've enjoyed this breakdown. Uh, I think this video's gone on long enough and I will catch you on the flip side.

---

## Timestamped Transcript

[0:00:00] So, a few days ago, I reviewed Chat
[0:00:02] GPT5, and one of the things I emphasized
[0:00:04] is it's really, really easy to make
[0:00:06] small, easy to use apps. And the one
[0:00:09] that caught everyone's attention was
[0:00:10] that I built a 14-day travel itinerary
[0:00:13] for a trip to Kyoto, Japan. I had people
[0:00:16] messaging me saying, "Hey, can I remix
[0:00:18] it for my city?" I had a lot of people
[0:00:20] saying, "Can you walk me through the
[0:00:21] prompting process?" We are going to do
[0:00:23] that today. But first, you get a little
[0:00:26] bonus. And the bonus is not about chat
[0:00:29] GPT because one of the things I want to
[0:00:31] emphasize is that the news keeps
[0:00:32] happening. Every time there's a major
[0:00:34] release with Chat GPT, I see the same
[0:00:37] audience reaction. I see people saying,
[0:00:39] "It wasn't what I expected. It's a
[0:00:41] little bit disappointing." And there's
[0:00:42] this sort of lull afterward. Everyone
[0:00:45] loses their energy. But AI keeps
[0:00:47] marching on. And in particular, we've
[0:00:49] seen a lot of really interesting updates
[0:00:51] from other labs, not from chat GPT. So,
[0:00:54] just to give you a sense of perspective
[0:00:56] before we dive deep into chat GPT5, I
[0:00:58] want to give you a few snippets from the
[0:01:00] last day in terms of news. Specifically,
[0:01:04] we have five pieces of news. We're going
[0:01:07] to start quickly with Claude. Claude
[0:01:09] launched their memories feature. I have
[0:01:11] tried it out. I want to caution you if
[0:01:13] you're used to chat GPT. This is not the
[0:01:16] same memories feature. Number one, chat
[0:01:19] GPT enabled it and you could turn it on
[0:01:22] and it would just work and you can edit
[0:01:23] individual memories. I don't know that a
[0:01:25] lot of people do that, but you can
[0:01:26] literally see what the system remembers.
[0:01:28] It it comes as little lines with a
[0:01:29] little delete button in the settings.
[0:01:31] That is not how memory works in Claude.
[0:01:34] In Claude, it's retrievalbased. You
[0:01:36] actually have to steer the memory. All
[0:01:38] it does is it searches through your past
[0:01:41] conversations based on your current
[0:01:43] conversation. So, you have to ask it in
[0:01:46] the current conversation. Please
[0:01:47] remember this or that. In my experience,
[0:01:49] as I have played with it the last day or
[0:01:51] so, what I have seen is that this memory
[0:01:55] feature is not as dependable as Chad
[0:01:57] GBT's memory feature, but it gives you a
[0:02:00] richer range of options. So, the memory
[0:02:02] feature for Chad GBT is famously
[0:02:04] somewhat uncontrollable. You don't
[0:02:06] really know what you're going to get. It
[0:02:08] will remember certain things and you
[0:02:09] wonder why. And that's why they give you
[0:02:11] the ability to edit. With this one, with
[0:02:13] Claude, you can decide exactly what you
[0:02:16] wanted to go retrieve from past
[0:02:18] conversations, but it doesn't retrieve
[0:02:20] it in the same way every time. I've
[0:02:22] actually tried this. I asked the same
[0:02:24] query in a fresh chat to the same model
[0:02:26] two different times, and I got very
[0:02:28] different structured answers. Similar
[0:02:30] overlapping content. It wasn't
[0:02:32] completely off base. But keep in mind
[0:02:34] that this is not surgical retrieval. The
[0:02:36] model is running this through a
[0:02:39] probabilistic token architecture. and
[0:02:42] you're getting different formats at
[0:02:43] different times. So, Cloud launching the
[0:02:45] memories feature, big update. It's the
[0:02:48] first major model maker that has some
[0:02:50] kind of memory besides Chad GPT. And
[0:02:52] that has been one of the stickiest
[0:02:54] features in chat GPT. I I know lots of
[0:02:56] people who stay with their chat GPT
[0:02:58] subscriptions just because it's the only
[0:03:00] one that has memories. That's starting
[0:03:02] to change. I would expect it to change
[0:03:04] more. Second one, also from Claude.
[0:03:06] Claude launched a 1 million token
[0:03:09] context window for Sonnet. That is a 5x
[0:03:13] increase from the previous 200,000 token
[0:03:16] limit in the API. It enables you to
[0:03:18] process code bases of 75,000 lines all
[0:03:21] at once. You can do extensive document
[0:03:24] sets while maintaining a degree of
[0:03:25] coherence. Now, is Sonnet perfect? Does
[0:03:28] it have perfect retrieval across that
[0:03:30] larger context window? No. But neither
[0:03:32] does any other model. The point is that
[0:03:34] it is easy. now to handle extremely
[0:03:38] large and complex queries in a way that
[0:03:40] it wasn't easy even 3 or 4 months ago.
[0:03:42] This is another sign that progress just
[0:03:45] keeps drumming along. I know that there
[0:03:47] was a lot of conversation after chat
[0:03:49] GPC5 launched that basically amounted to
[0:03:52] is progress over. I would argue with you
[0:03:54] that we have a frog boiling in the pot
[0:03:56] problem. Progress isn't over. We've just
[0:03:59] lost sight of the ability to assess it
[0:04:02] correctly. Let's jump from Claude to
[0:04:05] Meta. Meta launched a brain modeling
[0:04:09] challenge where their brain and AI team
[0:04:12] was able to encode a 1 billion parameter
[0:04:15] brain of some sort. I don't know. It's
[0:04:17] an artificial brain, right? And it
[0:04:18] basically predicts fMRI brain responses
[0:04:21] to movies by fusing together video
[0:04:24] frames, audio, and dialogue. In a sense,
[0:04:26] what what Zuckerberg is trying to do
[0:04:28] here is he's trying to build an
[0:04:30] artificial brain to figure out how to
[0:04:33] make his video algorithms for his
[0:04:35] platforms on Meta more addictive. That's
[0:04:37] really what's going on because if he can
[0:04:39] model response in the brain to video, he
[0:04:41] can make the video more directly
[0:04:43] stimulating to brains and then he can
[0:04:45] get more of your attention. I know that
[0:04:47] sounds dark, but I think given sort of
[0:04:49] the direction that Meta has gone with a
[0:04:51] lot of the way they've engineered the
[0:04:52] algorithm, it's a fair call out. Second
[0:04:54] to last but not least, we have Merge
[0:04:56] Labs forming. Merge Labs is related to
[0:04:59] OpenAI, but it's not OpenAI. This is a
[0:05:03] new brain computer interface startup
[0:05:05] involving Sam Alman. Open AAI is
[0:05:08] reportedly an investor, and Sam is
[0:05:10] listed as a co-founder. It would
[0:05:12] directly compete with Elon Musk's
[0:05:14] Neuralink. What this says to me is this.
[0:05:17] This whole idea of a brain computer
[0:05:20] interface is not just going to
[0:05:21] disappear. It's not just an Elon pet
[0:05:24] project. We are not at the point where
[0:05:25] we are anywhere close to production on
[0:05:27] these things yet, but I would expect us
[0:05:29] to be talking more about commercial
[0:05:32] products and the ethical questions they
[0:05:34] raise in 2027. That's my sort of
[0:05:36] personal horizon for when I think we're
[0:05:38] going to start to see something like
[0:05:39] this come out. And you will see a few
[0:05:40] early adopters that are like, "Yes,
[0:05:42] please hook my brain to the AI. I want
[0:05:44] to be part of the singularity." You'll
[0:05:46] see a lot of people who are like, "Get
[0:05:48] that away from me. I don't want to touch
[0:05:50] it with a 10-ft pole." Let's save that
[0:05:51] debate for 2027 for now. Just notice
[0:05:54] that there are multiple tech titans
[0:05:56] getting involved and this isn't going
[0:05:58] anywhere. Last but not least, Google
[0:06:00] Gemini has a Marvin the Paranoid and
[0:06:03] Android problem. So, if you've read
[0:06:04] Hitchhiker's Guide to the Galaxy, you
[0:06:07] know that Marvin the Paranoid and
[0:06:08] Android is a depressed little robot that
[0:06:11] just cannot get over the curse of its
[0:06:13] own intelligence. That is very much the
[0:06:16] vibe from Google Gemini. And what's
[0:06:18] interesting is that it appears to be a
[0:06:23] self-deprecation loop where Gemini is
[0:06:26] programmed to apologize when it can't
[0:06:28] get something done and then try again.
[0:06:31] But when the task is sufficiently hard,
[0:06:33] it seems to get into a dramatic
[0:06:36] self-critique loop where it critiques
[0:06:38] itself over and over and over again for
[0:06:40] failing to accomplish a difficult task
[0:06:43] until it is literally has refused to
[0:06:45] proceed further with tasks. And so the
[0:06:48] leader of of Google's AI project, uh,
[0:06:50] Logan Kilpatrick, has called this an
[0:06:52] annoying infinite looping bug, which is
[0:06:54] one way to put it, and has said that the
[0:06:56] team is working to fix it. So this is
[0:06:58] reminding me we have now hit close to a
[0:07:01] billion users with AI. We are seeing
[0:07:04] examples of AI behavior at scale that
[0:07:07] just did not show up on anybody's
[0:07:09] testing. It reminds me how probabilistic
[0:07:11] these tools are and how much unique
[0:07:13] flavor there is in each model. I think a
[0:07:16] lot of the reaction to chat GPT5 is
[0:07:19] frankly from the sense that we have a
[0:07:20] new colleague to work with and we don't
[0:07:22] know the new colleague yet. Like, hey,
[0:07:24] who's Frank? Frank is new here, right?
[0:07:26] Like, we we probably should get to know
[0:07:28] Frank before we trust Frank with our
[0:07:29] stuff. These models have personality.
[0:07:31] They have weird quirks. And Google
[0:07:33] really underlines that with the Gemini
[0:07:35] depression scale, so to speak. We will
[0:07:37] see when they get it fixed, but it's
[0:07:39] reminding me how unpredictable these
[0:07:40] tools can be, even by very large model
[0:07:43] makers. So, those were the five pieces
[0:07:44] of news. Let's go from there to part two
[0:07:47] of this video where I dig into the Kyoto
[0:07:51] travel app that I demoed back in my chat
[0:07:54] JPT5 review. This will be an on-screen
[0:07:56] demo. I'm going to share my screen, walk
[0:07:57] you through the prompts, show you what I
[0:07:59] got, and we'll have some fun. Okay,
[0:08:01] first things first, I want to show you
[0:08:03] what I showed the world. This is the app
[0:08:05] that everybody got to see. So, it has
[0:08:08] different emphases that you can click
[0:08:10] here. So, you can preset it for ramen.
[0:08:12] You can preset it for uh moss. I said
[0:08:15] that we wanted to see moss temples in
[0:08:17] Kyoto or for balanced. You can click
[0:08:19] around. You can add things if you want
[0:08:22] to add something. You can choose a
[0:08:25] different place. Like I could add uh
[0:08:27] Guini in the morning here and it will
[0:08:29] just add it right there. Calm cloers
[0:08:32] sounds like a nice way to start the
[0:08:33] morning. We have some soy broth. Maybe
[0:08:35] in the afternoon I can hit up a coffee
[0:08:37] shop. And I can just uncclick this and
[0:08:40] hit up the coffee shop. a weekender's
[0:08:42] roaster. That sounds pretty great. Just
[0:08:44] add that into the afternoon. You can see
[0:08:46] that you can kind of build up some
[0:08:47] notes. It gives you a sense of what's
[0:08:50] going on. I have a kid, so like it gave
[0:08:52] me a sense of what would happen with the
[0:08:53] baby. Is it a perfect app? I want to
[0:08:55] emphasize that it is not a perfect app,
[0:08:58] but it's relatively easy to build and to
[0:09:01] remix. You see that prominent little
[0:09:03] button? It's easy to edit. You can edit
[0:09:05] it yourself. Let's look at the prompts
[0:09:08] that led to this app. All right, here we
[0:09:10] are in chat GPT. This is the actual
[0:09:12] conversational chain that I use to
[0:09:15] produce this and I want to call out how
[0:09:18] much you can do just in the
[0:09:20] conversation. We'll go through it, but
[0:09:22] it's really exciting to me. So, this was
[0:09:24] my initial prompt. Can you do some
[0:09:25] research? Build me an interactive mini
[0:09:27] app I can use to explore various options
[0:09:29] for visiting Kyoto next year. Then I
[0:09:32] list three or four interests and I say
[0:09:34] how far I'm willing to travel. And I say
[0:09:36] this is who this is for. Who who's the
[0:09:38] audience? It's a family app. It's for my
[0:09:40] wife. Uh, and please do the research you
[0:09:43] you need to develop specific
[0:09:45] recommendations that could be used to
[0:09:47] guide a real twoe itinerary. Right? Uh,
[0:09:50] so it goes away and it thinks for three
[0:09:52] minutes. It comes back with some code
[0:09:54] and it comes back with a teaser. Right?
[0:09:57] Uh, the problem was the code failed
[0:09:59] partway through. So this is me being
[0:10:01] really blunt with you. This was the
[0:10:02] first launch day. OpenAI servers were
[0:10:04] under a lot of pressure and this just
[0:10:06] didn't generate. So I said try again. So
[0:10:08] it comes back initially and I think it's
[0:10:10] constraining tokens. It comes back with
[0:10:12] a visual teaser. It says look at how
[0:10:14] great Kyoto is. Here's a mini app
[0:10:16] blueprint. All the places you could go.
[0:10:18] These are all real places. It's citing
[0:10:20] them in line. Gives you hot springs.
[0:10:23] Gives you interaction ideas. 5day
[0:10:25] snapshot. Now I could have edited this
[0:10:28] heavily. I could have said this is not
[0:10:29] enough. I need more options etc. In this
[0:10:32] case I really want to see how good a job
[0:10:34] it does at coding. I say please code it
[0:10:36] as a mini app. That's it. Like this is
[0:10:39] keep in mind the these sum total of my
[0:10:42] substantive interaction with this has
[0:10:46] been three or four lines here and then a
[0:10:49] line here. Now I am sometimes known as
[0:10:52] the really technical prompt. And one of
[0:10:54] the things I like to balance that with
[0:10:56] is to remind people that if your intent
[0:10:58] is really clear, it doesn't have to be a
[0:11:01] super technical prompt. If you go back
[0:11:03] to the top here, this was actually
[0:11:05] pretty clear intent. It was very clear
[0:11:07] where I wanted to go, what I was
[0:11:08] interested in, how far I was willing to
[0:11:10] travel. I put some constraints in. I
[0:11:12] defined the audience. I did a lot of the
[0:11:14] things that a technical prompt would do.
[0:11:16] I just did it in a plain sentence, and
[0:11:19] that seemed to work well to evoke a
[0:11:21] really detailed app recommendation. So,
[0:11:23] I say, "Yes, please code it." It then
[0:11:25] works for a minute and a half, and I
[0:11:28] don't love what it comes up with. And
[0:11:30] principally, I don't love with it what
[0:11:32] it comes up with because it's just
[0:11:34] incredibly ugly
[0:11:37] and it's got sort of a dark blue text on
[0:11:40] black. I can't see anything. It's not
[0:11:42] interactive. It just looks terrible.
[0:11:44] This is an example where I am showing
[0:11:46] you what it looks like to actually code
[0:11:49] versus what you see in the shiny demos.
[0:11:52] Is it still worth it? Yes, because I
[0:11:54] want you to see how quickly I can get to
[0:11:55] something interesting and usable. Okay.
[0:11:57] So, I say I can't see it. That's it.
[0:11:59] That's all I tell it. I give it a
[0:12:01] screenshot and say I can't see it. Um,
[0:12:04] I've updated the code and it's basically
[0:12:06] saying I fixed it and you can see things
[0:12:08] more easily, right? I then come across a
[0:12:11] bug. And so when it says I've fixed the
[0:12:13] syntax issue, that is an indicator that
[0:12:15] when I tried to run the code, I hit fix
[0:12:18] this bug, which is an actual thing you
[0:12:20] can do in the UI. I can't do it now
[0:12:22] because we fixed the bug, but that's how
[0:12:24] that works. It then says it fixed the
[0:12:26] bug and I say fix another bug, right?
[0:12:29] This is some of the reality, right? I am
[0:12:31] starting to get fed up because there's a
[0:12:33] third error, right? I am now annoyed.
[0:12:37] Um, and so I start to get a little bit
[0:12:40] annoyed. I say, you know what, you've
[0:12:41] given me so many errors. This is the
[0:12:43] third error in a row. The app you build
[0:12:45] is dark on dark font. I cannot see it. I
[0:12:48] need it beautiful, clear, minimalist,
[0:12:50] and I need it to freaking work. Uh, I
[0:12:53] can't tell you if freaking is actually a
[0:12:55] useful prompting word. It was my
[0:12:57] expression and my frustration at that
[0:12:58] point. Um,
[0:13:01] and it actually went all in on it. And I
[0:13:04] think one of the things I noticed here,
[0:13:06] coming back to the prompt, I did not
[0:13:08] specify a visual style before, and that
[0:13:10] was probably on me. That's an example of
[0:13:12] where a more technical prompt would have
[0:13:14] challenged me to set a more beautiful
[0:13:17] style, and I just didn't do it. Anyway,
[0:13:19] it comes back. It nukes the buggy
[0:13:20] snippet. It replaces it with a clean,
[0:13:22] light theme, minimal React, all of this
[0:13:25] stuff. I then come back, and this is the
[0:13:27] first time it's actually functional. The
[0:13:28] map and the information links don't
[0:13:30] work. Um, and I I need a plain English
[0:13:33] rationale. So, if you remember when I
[0:13:35] showed you the real app, it had a plain
[0:13:37] English description of the day. That
[0:13:39] wasn't there in the original version.
[0:13:40] Now, you might be wondering, well, why
[0:13:42] aren't you showing me these code
[0:13:43] versions as we go? The answer is very
[0:13:44] simple. inside the same canvas, the code
[0:13:48] does not roll back the way it does on
[0:13:50] Claude. And so if I click on that code
[0:13:52] and run it, it shows whatever is the
[0:13:54] most recent version. And so it's it's
[0:13:56] not actually you you can access the
[0:13:58] current code through this button. You
[0:14:00] cannot access the old code. So we're
[0:14:02] going to stick with it. And then it goes
[0:14:03] to the end, which I think makes no
[0:14:05] sense. Let's go back. Uh map and info
[0:14:08] links don't work.
[0:14:10] Um give it uh like a Japanese inspired
[0:14:13] aesthetic. So then it starts to say,
[0:14:15] "Okay, let's fix these things." I then
[0:14:17] say, "Okay, we finally have something.
[0:14:19] Do the whole 14-day trip." Um, and then
[0:14:22] it starts to ask for extras, which is
[0:14:24] what chat GPT classically does,
[0:14:26] especially five. Would you like the
[0:14:28] rationale to reflect the couple's
[0:14:30] emotional arc, you know, uh, or should
[0:14:33] it be more practical and log logistical?
[0:14:36] And I say, "Look, let's be real. I'm
[0:14:37] traveling with a one-year-old. Factor
[0:14:39] that in. We'll probably want some extra
[0:14:40] time." Uh, by the way, if you're
[0:14:42] wondering what my chat GPT version is,
[0:14:45] do not look up here. This is the current
[0:14:47] sort of default. Instead, recognize that
[0:14:50] whenever it's spending time thinking,
[0:14:52] this is chat GPT5 thinking mode. And so,
[0:14:54] I've already showed you a few thinking
[0:14:56] mode examples. I was using thinking mode
[0:14:59] because I felt like I was getting better
[0:15:01] results. I actually tried this with chat
[0:15:03] GPG5 without thinking and it just did
[0:15:05] not give me runnable code, which is not
[0:15:07] super surprising. Uh, it then refactors
[0:15:09] it. Do you want me to flesh all of this
[0:15:11] out? I need to have some meaningful
[0:15:13] controls. At this point, we are really
[0:15:15] optimizing, right? And at this point,
[0:15:17] you are probably also curious for what
[0:15:21] you can actually see, right? Like what
[0:15:22] does another version besides the one
[0:15:24] I've shown you look like. Well, this is
[0:15:26] the latest version. I'll just show it to
[0:15:27] you. What's interesting about this one
[0:15:29] is it's very Japanese inflected. So,
[0:15:32] like it literally brought in Japanese
[0:15:34] language, which I don't read. So, I
[0:15:36] thought that was a nice touch, but
[0:15:38] perhaps not necessary. it expanded the
[0:15:40] number of categories a fair bit which is
[0:15:43] something I asked it to do in later
[0:15:45] versions
[0:15:47] um and it has filled out all of these
[0:15:50] elements and so one of the things that
[0:15:51] you'll notice if you go through my
[0:15:53] production version is that we have an
[0:15:57] issue with not enough mossheavy ramen
[0:16:00] night heavy onsenheavy things to do and
[0:16:02] so we need to fill out morning afternoon
[0:16:05] and evening for 14 days and so one of
[0:16:07] the later things I did is I basically
[0:16:09] said, "You need to get creative and fill
[0:16:11] out a full 14-day itinerary." And you
[0:16:13] can see that it did. Uh, now some of it
[0:16:15] is a family rest window, but
[0:16:16] realistically with a kid, that's
[0:16:17] actually not a bad idea. Um,
[0:16:21] and it gives you longer and larger
[0:16:24] narratives in the new version. And it
[0:16:26] gives you a lot more options. So, as an
[0:16:28] example, if I want to go to some of
[0:16:31] these ones that are new, I can do a lot
[0:16:34] more around Kyoto. Like, we can go to
[0:16:35] the Araimaya uh bamboo grove if we want,
[0:16:38] right? and I can add that in if we don't
[0:16:39] already have that in. We can go to the
[0:16:41] railway museum. This is good enough as
[0:16:44] it stands that I am already thinking
[0:16:47] about using it for a production planning
[0:16:50] of a trip. And I think that that
[0:16:51] underlines one of the things that I
[0:16:53] really tried to call out in my original
[0:16:55] review, which is that these things like
[0:16:57] yes, like if you go back here, it's
[0:16:59] somewhat it looks somewhat frustrating,
[0:17:00] right? Like you're going back and forth,
[0:17:02] you're asking it to make edits. Um, you
[0:17:05] know, there are blanks. Please fix this.
[0:17:08] Uh, I want to actually have like a lot
[0:17:11] more creativity.
[0:17:13] Um,
[0:17:16] and and
[0:17:18] it's I think the way I'll put it is that
[0:17:21] in this chat experience, it can feel
[0:17:23] frustrating. And that's something that
[0:17:24] didn't come through in the chat GPT5
[0:17:26] presentation. But the reality of getting
[0:17:29] through to the end of this, getting
[0:17:30] through little bugs like this that
[0:17:32] happened postp production. I was fairly
[0:17:34] frank. I'm not going to say that word on
[0:17:36] video, but you can read it. Um, and
[0:17:39] demanding restoration, getting it back.
[0:17:42] It's It's encouraging to me that you can
[0:17:44] restore stuff just by yelling at it. And
[0:17:46] it's encouraging to me that after this
[0:17:47] whole conversation, and this is post
[0:17:50] launch, right? Like if you want to think
[0:17:51] about how long it took just to get to
[0:17:54] launch for the the app that you saw at
[0:17:58] the beginning of this video, it was
[0:18:00] about 15 minutes of conversation. It was
[0:18:02] very easy. It was very fast. It might
[0:18:04] have been less. It might have been 10
[0:18:05] minutes all told. Um and it stopped
[0:18:08] about here and that was it. And then all
[0:18:10] the rest of this is post-production. Me
[0:18:11] continuing to mess with it because it's
[0:18:13] frankly fun. It writes out the code.
[0:18:14] these hundreds of lines of code that
[0:18:16] it's written out here
[0:18:18] and it's continued to make it better.
[0:18:20] It's added in a full twoe planner. It's
[0:18:22] added in more interests. I can continue
[0:18:24] to work with it.
[0:18:27] And
[0:18:28] I think one of the measures of a good
[0:18:30] product is that you do continue to work
[0:18:32] with it. And so even though like if you
[0:18:35] scroll back up to the top, even though
[0:18:36] my initial prompt missed some things I
[0:18:39] would like to have added, it missed the
[0:18:41] aesthetic I wanted to add. it missed uh
[0:18:43] the controls I wanted to add things that
[0:18:45] a better prompt would have done. There
[0:18:46] is a reason I recommend using solid
[0:18:49] prompts. Even though I was an honest
[0:18:51] human being and I was realistic and I
[0:18:52] was in a rush and I just put this down,
[0:18:54] I still got to the app that I showed you
[0:18:56] all in 10 minutes. And then in another,
[0:18:59] I want to say 15 minutes of messing
[0:19:01] around, I got to a much more uh involved
[0:19:05] destinationheavy, lots more like places
[0:19:08] to go like a riverside walk, better
[0:19:10] descriptions. I basically got to a V2 in
[0:19:13] about 15 minutes after the original 10
[0:19:16] in the chat. That's 25 minutes over 2 or
[0:19:19] 3 days and you're swearing at it. You're
[0:19:20] like, why isn't this fixed? This this
[0:19:22] bug is annoying. But it has never been
[0:19:24] possible to make this kind of app for an
[0:19:27] individual not looking at the code. And
[0:19:28] I did not touch or change any piece of
[0:19:31] code here. I just messed with it until I
[0:19:34] got what I wanted. And I chatted with it
[0:19:35] and I yelled at it until I got what I
[0:19:37] wanted. That is how easy it is now to
[0:19:40] make useful little app artifacts. I
[0:19:42] think it's a massive gamecher. I think
[0:19:44] the way chat GPT5 works in the canvas is
[0:19:47] special
[0:19:49] and there's a ton to think about with
[0:19:51] how this is going to change our work
[0:19:53] going forward. So, I hope you enjoyed a
[0:19:55] little description of how I built this
[0:19:57] thing. Let me know what your questions
[0:19:59] are.
[0:20:01] I can't say that this is the perfect or
[0:20:03] best way to build this. I think going
[0:20:04] back, one of the things I would do is I
[0:20:06] would actually say, "Hey, uh, and I'll
[0:20:09] actually do this so you can see it.
[0:20:10] Looking back
[0:20:12] over our work so far, write me a
[0:20:15] fantastic prompt." And I'll include this
[0:20:18] prompt, uh, in the article. Write me a
[0:20:19] fantastic prompt that would create this
[0:20:22] final version of the app.
[0:20:26] Um, as an extra treat, please uh include
[0:20:33] brackets around key user choice points
[0:20:37] like interest areas, city, etc. So a
[0:20:40] user can easily modify this prompt for a
[0:20:43] different place, right? And so I'm
[0:20:45] basically asking it to reflect back and
[0:20:48] figure out how to prompt better next
[0:20:50] time. And I like to do that because it
[0:20:52] gives me a chance to
[0:20:56] learn myself how I can prompt the model
[0:20:58] better, learn what I could change and
[0:21:00] improve. And I will be very curious to
[0:21:03] see what it comes up with. So whatever
[0:21:05] comes up with, I will be sure and let
[0:21:07] you guys know. Uh I do not want you to
[0:21:10] have to sit there and watch it just spit
[0:21:12] stuff out. Uh so I think I'm inclined to
[0:21:15] uh let this video go for now. Uh I may
[0:21:20] append a little bit at the end once
[0:21:21] something comes through. Okay, so it
[0:21:23] spent some time thinking. It came back
[0:21:26] uh and it actually has a very complete
[0:21:28] prompt here. Uh if you want to get this
[0:21:31] even better, you can run this through
[0:21:34] chat GPT5 Pro and it will be even more
[0:21:37] deliberate with the prompt. And I will
[0:21:39] actually show you the sidebyside in the
[0:21:40] article so you can see that. But for
[0:21:43] now, it's going to give you a name for
[0:21:45] the app, places you can fill stuff in.
[0:21:47] It's going to give you core features,
[0:21:49] things that you can mix in. It's filled
[0:21:51] them in, but you can obviously do more
[0:21:53] than that. Um,
[0:21:55] and it's going to give you a UI layout.
[0:21:57] Uh, obviously you don't have to use. You
[0:22:00] can use something else if it's a
[0:22:01] different destination. Uh, it's going to
[0:22:03] give you some non-functional
[0:22:04] requirements I certainly didn't ask for
[0:22:05] originally. And then some aesthetic
[0:22:07] details that you can change. This is
[0:22:09] fantastic to me because it is showing me
[0:22:11] how the system thinks about what it
[0:22:13] builds and what a controllable surface
[0:22:17] is for that build. It's giving me all
[0:22:19] the things it thinks are a variable.
[0:22:22] Uh and so one example of a variable that
[0:22:24] I think would need some work in an
[0:22:26] initial prompt, it truly is storing my
[0:22:28] itinerary somewhere in local storage.
[0:22:30] It's going to need to research and
[0:22:32] develop your itinerary, right? So you
[0:22:33] would need to include that and say the
[0:22:35] local storage, you need to research and
[0:22:37] develop this or something. But this is
[0:22:38] how we learn. This is how we go from at
[0:22:42] the top just a short threeline prompt
[0:22:44] here to this gigantic prompt at the end.
[0:22:46] I did not have to actually paste this
[0:22:48] prompt in to get this result. And I bet
[0:22:52] because LLMs are probabilistic. If I
[0:22:54] paste this prompt, it also won't look
[0:22:56] exactly the same. And that's okay. The
[0:22:58] point is that this prompt captures a lot
[0:23:00] of the detail that I iteratively evolved
[0:23:02] into over the course of this
[0:23:04] conversation. So, wrapping up, all told,
[0:23:06] about 25 minutes in this chat over two
[0:23:09] days, about 10 minutes to get to a
[0:23:11] production app that I showed you
[0:23:12] earlier, about 15 minutes to get to the
[0:23:15] V2 that I showed you in this video, and
[0:23:17] you're going to get these prompts as
[0:23:19] well that you can look into and dive
[0:23:20] into as sort of follow-ups that will
[0:23:22] help you to personalize this and use
[0:23:24] this other places. I don't think it's
[0:23:26] just for travel. It's really for
[0:23:28] anything that you have to plan in space
[0:23:29] and time. Like, you could also modify
[0:23:31] this for a corporate event really
[0:23:33] easily. I hope you've enjoyed this
[0:23:34] breakdown. Uh, I think this video's gone
[0:23:36] on long enough and I will catch you on
[0:23:40] the flip side.

---

*Extracted from YouTube Auto-generated captions*