# Andrej Karpathy: Software Is Changing (Again)

**Channel**: Y Combinator  
**Date**: 2025-06-19  
**URL**: https://youtu.be/LCEmiRjPEtQ?si=HT7MTbE4n0wVUcy9  
**Transcribed**: 2025-07-10

---

## Transcript

Please welcome former director of AI Tesla, Andre Carpathi.
Wow, a lot of people here. Hello.
Okay, yeah, so I'm excited to be here today to talk to you about software in the era of AI.
And I'm told that many of you are students, like bachelor's, master's, PhD and so on,
and you're about to enter the industry.
And I think it's actually like an extremely unique and very interesting time to enter the industry right now.
And I think fundamentally the reason for that is that software is changing again.
And I say again because I actually gave this talk already.
But the problem is that software keeps changing, so I actually have a lot of material to create new talks.
And I think it's changing quite fundamentally, I think roughly speaking, software has not changed much on such a fundamental level for 70 years.
And then it's changed, I think, about twice quite rapidly in the last few years.
And so there's just a huge amount of work to do, a huge amount of software to write and rewrite.
So let's take a look at maybe the realm of software.
So if we kind of think of this as like the map of software, this is a really cool tool called Map of GitHub.
This is kind of like all the software that's written, these are instructions to the computer for carrying out tasks in the digital space.
So if you zoom in here, these are all different kinds of repositories and this is all the code that has been written.
And a few years ago, I kind of observed that software was kind of changing and there was kind of like a new type of software around.
And I call this software 2.0 at the time.
And the idea here was that software 1.0 is the code you write for the computer.
Software 2.0 are basically neural networks and in particular the weights of a neural network.
And you're not writing this code directly.
You are more kind of like tuning the data sets and then you're running an optimizer to create the parameters of this neural network.
And I think like at the time neural networks were kind of seen as like just a different kind of classifier, like a decision tree or something like that.
And so I think it was kind of like, I think this framing was a lot more appropriate.
And now actually what we have is kind of like an equivalent of GitHub in the realm of software 2.0.
And I think the hugging phase is basically equivalent of GitHub in software 2.0.
And there's also model Atlas and you can visualize all the code written there.
In case you're curious by the way, the giant circle, the point in the middle, these are the parameters of flux, the image generator.
And so anytime someone tunes a Laura on top of a flux model, you basically create a git commit in this space and you create a different kind of image generator.
So basically what we have is software 1.0 is the computer code that programs a computer software 2.0 are the weights which program neural networks.
And here's an example of Alex net image recognizer neural network.
Now so far all of the neural networks that we've been familiar with until recently were kind of like fixed function computers.
Image two categories or something like that.
And I think what's changed and I think as a quite fundamental change is that neural networks became programmable with large language models.
And so I see this as quite new unique.
It's new kind of a computer.
And so in my mind it's worth giving it a new designation of software 3.0.
And basically your prompts are now programs that program the LLM.
And remarkably these prompts are written in English.
So it's kind of a very interesting programming language.
So maybe to summarize the difference if you're doing sentiment classification.
For example, you can imagine writing some amount of Python to basically do sentiment classification or you can train in neural net or you can prompt a large language model.
So here this is a few shot prompt and you can imagine changing it and programming the computer in a slightly different way.
So basically we have software 1.0, software 2.0.
And I think we're seeing, maybe you've seen a lot of GitHub code is not just like code anymore.
There's a bunch of like English interspersed with code.
And so I think kind of there's a growing category of new kind of code.
So not only is it a new programming paradigm, it's also remarkable to me that it's in our native language of English.
And so when this blew my mind a few, I guess years ago now, I tweeted this and I think it captured the attention of a lot of people.
And this is my currently pinned tweet is that remarkably we're now programming computers in English.
Now when I was at Tesla, we were working on the autopilot and we were trying to get the car to drive.
And I sort of showed this slide at the time where you can imagine that the inputs to the car are on the bottom and they're going through a software stack to produce the steering and acceleration.
And I made the observation at the time that there was a ton of C++ code around in the autopilot, which was the software 1.0 code.
And then there was some neural nets and they're doing image recognition.
And I kind of observed that over time as we made the autopilot better, basically the neural network grew in capability and size.
And in addition to that, all the C++ code was being deleted and kind of like was,
and a lot of the kind of capabilities and functionality that was originally written 1.0 was migrated to 2.0.
So as an example, a lot of the stitching up of information across images from the different cameras and across time was done by a neural network and we were able to delete a lot of code.
And so the software 2.0 stack would quite literally eight through the software stack of the autopilot.
So I thought this was really remarkable at the time.
And I think we're seeing the same thing again, where basically we have a new kind of software and it's eating through the stack.
We have three completely different programming paradigms.
And I think if you're entering the industry, it's a very good idea to be fluent in all of them because they all have slight pros and cons.
And you may want to program some functionality in 1.0 or 2.0 or 3.0.
Are you going to train a neural net? Are you going to just prompt an LLM?
I should be a piece of code that's explicit, et cetera.
So we'll have to make these decisions and actually potentially fluidly transition between these paradigms.
So what I want to get into now is, first I want to, in the first part, talk about LLMs and how to kind of think of this new paradigm and the ecosystem and what that looks like.
What is this new computer? What does it look like? And what does the ecosystem look like?
I was struck by this quote from Enduring actually many years ago now, I think.
And I think Endure is going to be speaking right after me.
But he said at the time, AI is the new electricity.
And I do think that it kind of captures something very interesting in that LLMs certainly feel like they have properties of utilities right now.
So LLM labs, like OpenAI, Gemini, and Tropi, et cetera, they spend capex to train the LLMs.
And this is kind of equivalent to building out a grid.
And then there's OPEX to serve that intelligence over APIs to all of us.
And this is done through metered access where we pay per million tokens or something like that.
And we have a lot of demands that are very utility-like demands out of this API.
We demand low latency, high uptime, consistent quality, et cetera.
In electricity, you would have a transfer switch so you can transfer your electricity source from like grid and solar or battery or generator.
In LLMs, we have maybe open router and easily switch between the different types of LLMs that exist.
Because the LLMs are software, they don't compete for physical space.
So it's okay to have basically like six electricity providers and you can switch between them, right?
Because they don't compete in such a direct way.
And I think what's also really fascinating, and we saw this in the last few days actually, a lot of the LLMs went down and people were kind of like stuck and unable to work.
And I think it's kind of fascinating to me that when the state of the art LLMs go down, it's actually kind of like an intelligence brown out in the world.
It's kind of like when the voltage is unreliable in the grid and the planet just gets dumber.
The more reliance we have on these models, which already is like really dramatic and I think we'll continue to grow.
But LLMs don't only have properties of utilities.
I think it's also fair to say that they have some properties of fabs.
And the reason for this is that the CAPEX required for building LLMs is actually quite large.
It's not just like building some power station or something like that, right?
You're investing in huge amount of money and I think the tech tree and for the technology is growing quite rapidly.
So we're in a world where we have sort of deep tech trees, research and development secrets that are centralizing inside the LLMs labs.
But I think the analogy muddies a little bit also because as I mentioned, this is software.
And software is a bit less defensible because it is so malleable.
And so I think it's just an interesting kind of thing to think about potentially.
There's many analogic analogies you can make like a 4 nanometer process node, maybe it's something like a cluster with certain max plots.
You can think about when you're using a video GPUs and you're only doing the software and you're not doing the hardware, that's kind of like the fabless model.
But if you're actually also building your own hardware and you're training on TPUs, if you're Google, that's kind of like the Intel model where you own your fab.
So I think there's some analogies here that make sense.
But actually I think the analogy that makes the most sense perhaps is that in my mind, LLMs have very strong kind of analogies to operating systems.
In that this is not just electricity or water, it's not something that comes out of the tap as a commodity.
These are now increasingly complex software ecosystems.
So they're not just like simple commodities like electricity.
And it's kind of interesting to me that the ecosystem is shaping in a very similar kind of way where you have a few close source providers like Windows or Mac OS.
And then you have an open source alternative like Linux.
And I think for LLMs as well, we have a few competing close source providers.
And then maybe the Lama ecosystem is currently like maybe a close approximation to something that may grow into something like Linux.
Again, I think it's still very early because these are just simple LLMs, but we're starting to see that these are going to get a lot more complicated.
It's not just about the LLM itself, it's about all the tool use and the multi-modalities and how all of that works.
And so when I sort of had this realization a while back, I tried to sketch it out.
And it kind of seems to me like LLMs are kind of like a new operating system, right?
So the LLM is a new kind of a computer.
It's kind of like the CPU equivalent.
The context windows are kind of like the memory.
And then the LLM is orchestrating memory and compute for problem solving using all of these capabilities here.
And so definitely if you look at it, it looks very much like an operating system from that perspective.
A few more analogies, for example, if you want to download an app, say I go to VS Code and I go to Download,
you can download VS Code and you can run it on Windows, Linux, or Mac.
In the same way as you can take an LLM app like cursor, and you can run it on GPT or Cloud or Gemini series, right?
It's just a drop down.
So it's kind of like similar in that way as well.
More analogies that I think strike me is that we're kind of like in this 1960s-ish era where LLM compute is still very expensive for this new kind of a computer.
And that forces the LLM to be centralized in the Cloud, and we're all just sort of thin clients that interact with it over the network.
And none of us have full utilization of these computers, and therefore it makes sense to use time sharing where we're all just, you know, a dimension of the batch when they're running the computer in the Cloud.
And this is very much what computers used to look like during this time.
The operating systems were in the Cloud, everything was streamed around, and there was batching.
And so the personal computing revolution hasn't happened yet, because it's just not economical, it doesn't make sense.
But I think some people are trying, and it turns out that Mac Minis, for example, are a very good fit for some of the LLMs, because it's all, if you're doing batch one inference, this is all super memory-bound, so this actually works.
And I think these are some early indications, maybe, of personal computing, but this hasn't really happened yet.
And it's not clear what this looks like, maybe some of you get to invent what this is, or how it works, or what this should be.
Maybe one more analogy that I'll mention is whenever I talk to Chatchipity, or some LLM directly in text, I feel like I'm talking to an operating system through the terminal, like it's text, it's direct access to the operating system.
I think a GUI hasn't yet really been invented in a general way, like Chatchipity have a GUI, different than just the text bubbles.
Certainly some of the apps that we're going to go into in a bit have GUI, but there's no GUI across all the tasks, if that makes sense.
There are some ways in which LLMs are different from operating systems in some fairly unique way, and from early computing.
And I wrote about this one particular property that strikes me as very different this time around.
It's that LLMs like flip, they flip the direction of technology diffusion that is usually present in technology.
So for example, with electricity, cryptography, computing, flight, internet, GPS, lots of new transformative technologies that have not been around.
Typically, it is the government and corporations that are the first users, because it's new and expensive, et cetera, and it only later diffuses to consumer.
But I feel like LLMs are kind of like flipped around. So maybe with early computers, it was all about ballistics and military use, but with LLMs, it's all about how do you boil an egg or something like that.
This is certainly like a lot of my use.
And so it's really fascinating to me that we have a new magical computer, and it's like helping me boil an egg.
It's not helping the government to do something really crazy like some military ballistics or some special technology.
Indeed, corporations or governments are lagging behind the adoption of all of us, of all of these technologies.
So it's just backwards, and I think it informs maybe some of the uses of how we want to use this technology or like what are some of the first apps and so on.
So in summary, so far, LLMs labs, lab, LLMs, I think it's accurate language to use, but LLMs are complicated operating systems.
There are circa 1960s in computing, and we're redoing computing all over again, and they're currently available via time sharing and distributed lucky utility.
What is new and unprecedented is that they're not in the hands of a few governments and corporations.
They're in the hands of all of us, because we all have a computer, and it's all just software, and ChashiPT was being down to our computers like to billions of people like instantly and overnight, and this is insane.
And it's kind of insane to me that this is the case, and now it is our time to enter the industry and program these computers.
It's crazy, so I think this is quite remarkable.
Before we program LLMs, we have to kind of like spend some time to think about what these things are, and I especially like to kind of talk about their psychology.
So the way I like to think about LLMs is that they're kind of like people spirits. They are stochastic simulations of people, and the simulator in this case happens to be an other aggressive transformer.
So transformer is a neural net, and it just kind of like goes on the level of tokens, it goes chunk, chunk, chunk, chunk.
And there's an almost equal amount of compute for every single chunk, and this simulator, of course, is basically there's some weights involved, and we fit it to all of the texts that we have on the internet, and so on.
And you end up with this kind of a simulator, and because it is trained on humans, it's got this emergent psychology that is human-like.
So the first thing you'll notice is, of course, LLMs have encyclopedic knowledge and memory, and they can remember lots of things, a lot more than any single individual human can because they read so many things.
It actually kind of reminds me of this movie, Rainman, which I actually really recommend people watch, it's an amazing movie, I love this movie.
And Dustin Hoffman here is an autistic savant, who has almost perfect memory, so he can read like a phone book, and remember all of the names and phone numbers.
And I kind of feel like LLMs are kind of like very similar, they can remember Shah Hash's and lots of different kinds of things very, very easily.
So they certainly have superpowers in some respects, but they also have a bunch of, I would say, cognitive deficits.
So they hallucinate quite a bit, and they kind of make up stuff, and don't have a very good sort of internal model of self-knowledge, not sufficient at least.
And this has gotten better, but not perfect. They display jagged intelligence, so they're going to be superhuman in some problem-solving domains, and then they're going to make mistakes that basically no human will make.
Like, you know, they will insist that 9.11 is greater than 9.9, or that there are two hours in strawberry, these are some famous examples, but basically there are rough edges that you can trip on.
So that's kind of, I think, also kind of unique.
They also kind of suffer from enterograde amnesia, so, and I think I'm alluding to the fact that if you have a coworker who joins your organization, this coworker will over time learn your organization, and they will understand and gain like a huge amount of context on the organization, and they go home, and they sleep, and they consolidate knowledge, and they develop expertise over time.
LLMs don't natively do this, and this is not something that has really been solved in the R&D of LLMs, I think.
And so, context windows are really kind of like working memory, and you have to sort of program the working memory quite directly, because they don't just kind of like get smarter by default, and I think a lot of people get tripped up by the analogies in this way.
In popular culture, I recommend people watch these two movies, Memento and 51states, in both of these movies, the protagonists, their weights are fixed, and their context windows gets wiped every single morning, and it's really problematic to go to work or have relationships when this happens, and this happens to all of us all the time.
I guess one more thing I would point to is security kind of related limitations of the use of LLMs. So for example, LLMs are quite gullible, they are susceptible to prompt injection risks, they might leak your data, et cetera, and so, and there's many other considerations security related.
So basically long story short, you have to load your, you have to simultaneously think through this superhuman thing that has a bunch of cognitive deficits and issues.
How do we, and yet, they are extremely like useful, and so how do we program them, and how do we work around their deficits, and enjoy their superhuman powers.
So what I want to switch to now is talk about the opportunities of how do we use these models, and what are some of the biggest opportunities.
This is not a comprehensive list, just some of the things that I thought were interesting for this talk.
The first thing I'm kind of excited about is what I would call partial autonomy apps.
So for example, let's work with the example of coding. You can certainly go to chat GPT directly, and you can start copy-pasting code around, and copy-pasting bug reports and stuff around, and getting code and copy-pasting everything around.
Why would you, why would you do that? Why would you go directly to the operating system? It makes a lot more sense to have an app dedicated for this.
And so I think many of you use cursor, I do as well, and cursor is kind of like the thing you want instead, you don't want to just directly go to the chat GPT.
And I think cursor is a very good example of an early LLM app that has a bunch of properties that I think are useful across all the LLM apps.
So in particular, you will notice that we have a traditional interface that allows a human to go in and do all the work manually, just as before.
But in addition to that, we now have this LLM integration that allows us to go in bigger chunks.
And so some of the properties of LLM apps that I think are shared and useful to point out.
Number one, the LLM basically do a ton of the context management. Number two, they orchestrate multiple calls to LLM's.
So in the case of cursor, there's under the hood embedding models for all your files, the actual chat models, models that apply diffs to the code, and this is all orchestrated for you.
A really big one that I think also may be not fully appreciated always is application specific GUI and the importance of it.
Because you don't just want to talk to the operating system directly in text.
Text is very hard to read, interpret, understand, and also like you don't want to take some of these actions natively in text.
So it's much better to just see a diff as like red and green change.
And you can see what's being added is subtracted.
It's much easier to just do command why to accept or command and to reject. I shouldn't have to type it in text, right?
So GUI allows a human to audit the work of these fallible systems and to go faster.
I'm going to come back to this point a little bit later as well.
And the last kind of feature I want to point out is that there's what I call the autonomy slider.
So for example, in cursor, you can just do top completion, you're mostly in charge.
You can select a chunk of code and command K to change just that chunk of code.
You can do command L to change the entire file.
Or you can do command I, which just, you know, let her do whatever you want in the entire repo.
And that's the sort of full autonomy agent, the genetic version.
And so you are in charge of the autonomy slider.
And depending on the complexity of the task at hand, you can tune the amount of autonomy that you're willing to give up for that task.
Maybe to show one more example of a fairly successful LLM app perplexity.
It also has very similar features to what I've just pointed out in cursor.
It packages up a lot of the information.
It orchestrates multiple alarms.
It's got a GUI that allows you to audit some of its work.
So for example, it will cite sources and you can imagine inspecting them.
And it's got an autonomy slider.
You can either just do a quick search or you can do research or we can do deep research and come back ten minutes later.
So this is all just varying levels of autonomy that you give up to the tool.
So I guess my question is, I feel like a lot of software will become partially autonomous.
And I'm trying to think through like, what does that look like?
And for many of you who maintain products and services, how are you going to make your products and services partially autonomous?
Can an LLM see everything that a human can see?
Can an LLM act in all the ways that a human could act?
And can humans supervise and stay in the loop of this activity?
Because again, these are thalable systems that aren't yet perfect.
And what does a diff look like in Photoshop or something like that?
And also a lot of the traditional software right now, it has all these switches and all this kind of stuff that's all designed for human.
All of this has to change and become accessible to LLMs.
So one thing I want to stress with a lot of these LLM apps that I'm not sure gets as much attention as it should is,
we're now kind of like cooperating with AI's.
And usually they are doing the generation and we as humans are doing the verification.
It is in our interest to make this loop go as fast as possible so we're getting a lot of work done.
There are two major ways that I think this can be done.
Number one, you can speed up verification a lot.
And I think GUI's, for example, are extremely important to this because GUI utilizes your computer vision GPU in all of our head.
Reading text is effortful and it's not fun, but looking at stuff is fun.
And it's just kind of like a highway to your brain.
So I think GUI's are very useful for auditing systems and visual representations in general.
And number two I would say is we have to keep the AI on the leash.
I think a lot of people are getting way over excited with AI agents.
And it's not useful to me to get a dip of 1000 lines of code to my repo.
Like I have to, I'm still the bottleneck, right?
Even though that 1000 lines come out instantly, I have to make sure that this thing is not introducing bugs.
It's just like, and that is doing the correct thing, right?
And that there's no security issues and so on.
So I think that, yeah, basically, we have to sort of like, it's in our interest to make the flow of these two go very, very fast.
And we have to somehow keep the AI on the leash because it gets way too overreactive.
It's kind of like this.
This is how I feel when I do AI assist coding.
If I'm just vibe coding, everything is nice and great.
But if I'm actually trying to get work done, it's not so great to have an overreactive agents doing all this kind of stuff.
So this slide is not very good, I'm sorry.
But I guess I'm trying to develop like many of you some ways of utilizing these agents in my coding workflow.
And to do AI assist coding.
And in my own work, I'm always scared to get way too big dips.
I always go in small incremental chunks.
I want to make sure that everything is good.
I want to spin this loop very, very fast.
And I sort of work on small chunks of single concrete thing.
And so I think many of you probably are developing similar ways of working with LLMs.
I also saw a number of blog posts that try to develop these best practices for working with LLMs.
And here's one that I read recently and I thought was quite good.
And it kind of discussed some techniques.
And some of them have to do with how you keep the AI on the leash.
And so as an example, if you are prompting, if your prompt is big, then the AI might not do exactly what you want.
And in that case, verification will fail.
You're going to ask for something else.
If a verification fails, then you're going to start spinning.
So it makes a lot more sense to spend a bit more time to be more concrete in your prompts,
which increases the probability of successful verification and you can move forward.
And so I think a lot of us are going to end up finding kind of techniques like this.
I think in my own work as well, I'm currently interested in what education looks like together with kind of like now that we have AI and LLMs.
What does education look like?
And I think a large amount of thought for me goes into how we keep AI on the leash.
I don't think it just works to go to ChashiPTM and be like, hey, teach me physics.
I don't think this works because the AI gets lost in the woods.
And so for me, this is actually two separate apps, for example.
There's an app for a teacher that creates courses and then there's an app that takes courses and serves them to students.
And in both cases, we now have this intermediate artifact of a course that is auditable and we can make sure it's good.
We can make sure it's consistent.
And the AI is kept on the leash with respect to a certain syllabus, a certain progression of projects, and so on.
And so this is one way of keeping the AI on the leash and I think has a much higher likelihood of working.
And the AI is not getting lost in the woods.
One more kind of analogy I wanted to sort of allude to is I'm not a no stranger to partial autonomy.
And I kind of worked on this, I think, for five years at Tesla.
And this is also a partial autonomy product and shares a lot of the features.
But for example, right there in the instrument panel is the GUI of the autopilot.
So it's showing me what the neural network sees and so on.
And we have the autonomy slider where over the course of my tenure there, we did more and more autonomous tasks for the user.
And maybe the story that I wanted to tell very briefly is actually the first time I drove a self-driving vehicle was in 2013.
And I had a friend who worked at Waymo and he offered to give me a drive around Palo Alto.
I took this picture using Google Glass at the time.
And many of you are so young that you might not even know what that is.
But yeah, this was like all the rage at the time.
And we got into this car and we went for about a 30-minute drive around Palo Alto, highways, streets, and so on.
And this drive was perfect. There was zero interventions.
And this was 2013, which is now 12 years ago.
And it's kind of struck me because at the time when I had this perfect drive, this perfect demo, I felt like, wow, self-driving is imminent because this just worked.
This is incredible.
But here we are 12 years later and we are still working on autonomy.
We are still working on driving agents.
And even now we haven't actually like fully solved the problem.
Like you may see Waymo is going around and they look driverless, but there's still a lot of teleoperation and a lot of human in the loop of a lot of this driving.
So we still haven't even like declared success, but I think it's definitely like going to succeed at this point, but it just took a long time.
And so I think like this software is really tricky, I think in the same way that driving is tricky.
And so when I see things like, oh, 22, 25 is the year of agents, I get very concerned.
And I kind of feel like, you know, this is the decade of agents and this is going to be quite some time.
We need humans in the loop, we need to do this carefully.
This is software, well, it's be serious here.
One more kind of analogy that I always think through is the Iron Man suit.
I think this is, I always love Iron Man.
I think it's like so correct in a bunch of ways with respect to technology and how it will play out.
And what I love about the Iron Man suit is that it's both an augmentation and Tony Stark can drive it.
And it's also an agent.
And in some of the movies, the Iron Man suit is quite autonomous and can fly around and find Tony and all this kind of stuff.
And so this is the autonomy slider is we can be, we can build augmentations or we can build agents.
And we kind of want to do a bit of both.
But at this stage, I would say working with fallible Al Alems and so on.
I would say, you know, it's less Iron Man robots and more Iron Man suits that you want to build.
And that's like building flashy demos of autonomous agents and more building partial autonomy products.
And these products have custom GUIs and UI UX and we're trying to, and this is done so that the generation verification group of the human is very, very fast.
But we are not losing the sight of the fact that it is in principle possible to automate this work.
And there should be an autonomy slider in your product.
And you should be thinking about how you can slide that autonomy slider and make your product sort of more autonomous over time.
But this is kind of how I think there's lots of opportunities in these kinds of products.
I want to now switch gears a little bit and talk about one other dimension that I think is very unique.
Not only is there a new type of programming language that allows for autonomy and software, but also as I mentioned, it's programmed in English, which is this natural interface.
And suddenly everyone is a programmer because everyone speaks natural language like English.
So this is extremely bullish and very interesting to me.
And also completely unprecedented, I would say it used to be the case that you need to spend five to 10 years studying something to be able to do something in software.
This is not the case anymore.
So I didn't mind just anyone has heard of live coding.
This is the tweet that kind of like introduced this, but I'm told that this is now like a major meme.
Fun story about this is that I've been on Twitter for like 15 years or something like that at this point.
And I still have no clue which tweet will become viral and which tweet like fizzles and no one cares.
And I thought that this tweet was going to be the latter.
I don't know if it's just like a shower of thoughts, but this became like a total meme.
And I really just can't tell, but I guess I'll get struck a chord and gave a name to something that everyone was feeling, but couldn't quite say in words.
So now there's a Wikipedia page and everything.
This is like.
Yeah, this is like a major contribution or something like that.
So Tom Wolf from Hugging Face shared this beautiful video that I really love.
There are kids vibe coding.
And I find that this is such a wholesome video like I love this video.
Like how can you look at this video and feel bad about the future.
The future is great.
I think this will end up being like a gateway drug to software development.
I'm not a doomer about the future of the generation.
And I think yeah, I love this video.
I'm excited by coding a little bit as well because it's so fun.
So by coding is so great when you want to build something super duper custom that doesn't appear to exist.
And you just want to wing it because it's a Saturday or something like that.
So I built this iOS app and I don't I can't actually program in Swift.
But I was really shocked that I was able to build like a super basic app.
And I'm not going to explain it that's really dumb.
But I kind of like this was just like a day of work.
And this was running on my phone like later that day.
I was like, wow, this is amazing.
I didn't have to like read through Swift or like a five days or something like that to like get started.
I also have uploaded this app called menu gen.
And this is a lot you can try it in the menu gen.app.
And I basically have this problem where I show up at a restaurant.
I read through the menu and I have no idea what any of the things are.
And I need pictures.
So this doesn't exist.
So I was like, hey, I'm going to buy code it.
So this is what it looks like.
You go to the menu gen.app.
And you take a picture of a menu and then menu gen generates the images.
And everyone gets five dollars in credits for free when you sign up.
And therefore, this is a major cost center in my life.
So this is a negative negative revenue app for me right now.
I've lost a huge amount of money on menu gen.
Okay.
But the fascinating thing about menu gen for me is that.
The code of the vipe coding part, the code was actually the easy part of vipe coding menu gen.
And most of it actually was when I tried to make it real,
so that you can actually have authentication and payments in the domain name and the versatile deployment.
This was really hard.
And all of this was not code.
All of this DevOps stuff was in me in the browser clicking stuff.
And this was extreme slot and took another week.
So it was really fascinating that I had the menu gen.
Basically demo working on my laptop in a few hours.
And then it took me a week because I was trying to make it real.
And the reason for this is this was just really annoying.
So for example, if you try to add Google log into your web page,
I know this is very small, but just a huge amount of instructions of this.
A clerk library telling me how to integrate this.
And this is crazy.
Like it's telling me go to this URL.
Click on this drop down, choose this, go to this and click on that.
And it's like telling me what to do.
The computer is telling me the actions I should be taking.
Like you do it.
Why am I doing this?
What the hell?
I had to follow all these instructions.
This was crazy.
So I think the last part of my talk,
therefore, focuses on, can we just build for agents?
I don't want to do this work.
Can agents do this?
Thank you.
Okay.
So roughly speaking, I think there's a new category of consumer and manipulator
of digital information.
It used to be just humans through GUIs or computers through APIs.
And now we have a completely new thing.
And agents are their computers, but they are human-like,
kind of, right?
They're people spirits.
There's people spirits on the internet,
and they need to interact with their software infrastructure.
Like, can we build for them?
It's a new thing.
So as an example, you can have robots.txt on your domain,
and you can instruct, or like, advise, I suppose,
web crawlers on how to behave on your website.
In the same way, you can have maybe Ellen's.txt file,
which is just a simple markdown,
that's telling LLMs what this domain is about.
And this is very readable to an LLM.
If it had to instead get the HTML of your web page and try to parse it,
this is very error-prone and difficult,
and it will screw it up, and it's not going to work.
So we can just directly speak to the LLM. It's worth it.
A huge amount of documentation is currently written for people.
So you will see things like lists, and bold, and pictures.
And this is not directly accessible by an LLM.
So I see some of the services now are transitioning a lot of their docs
to be specifically for LLMs.
So Versel and Stripe, as an example, are early movers here,
but there are a few more that I've seen already.
And they offer their documentation in markdown.
Markdown is super easy for LLMs to understand.
This is great.
Maybe one simple example from my experience as well.
Maybe some of you know three blue, one brown.
He makes beautiful animation videos on the editor.
Yeah, I love this library, so that he wrote the Manin.
And I wanted to make my own.
And there's extensive documentation on how to use Manin.
And so I didn't want to actually read through it.
So I copy-pasted the whole thing to an LLM,
and I described what I wanted, and it just worked out of the box.
Like LLM just by coded me an animation, exactly what I wanted.
And I was like, wow, this is amazing.
So if we can make docs legible to LLMs,
it's going to unlock a huge amount of kind of use.
And I think this is wonderful and should happen more.
The other thing I wanted to point out is that you do unfortunately have to.
It's not just about taking your docs and making them appear in markdown.
That's the easy part.
We actually have to change the docs.
Because anytime your docs stay click, this is bad.
And LLM will not be able to natively take this action right now.
So Bersel, for example, is replacing every occurrence of click
with the equivalent curl command that your LLM agent could take on your behalf.
And so I think this is very interesting.
And then, of course, there's a model context protocol from Enfropic.
And this is also another way it's a protocol speaking directly to agents
as this new consumer and manipulator of digital information.
So I'm very bullish on these ideas.
The other thing I really like is a number of little tools here and there
that are helping ingest data in like very LLM-friendly formats.
So for example, when I go to a GitHub repo, like my NanagyPity repo,
I can't feed this to an LLM and ask questions about it.
Because it's, you know, this is a human interface of GitHub.
So when you just change the URL from GitHub to GitHub ingest,
then this will actually concatenate all the files into a single giant text
and it will create a directory structure, et cetera.
And this is ready to be copy-based it into your favorite LLM
and you can do stuff.
Maybe even more dramatic example of this is deep wiki,
where it's not just the raw content of these files.
This is from Devon, but also like they have Devon basically
do analysis of the GitHub repo and Devon basically builds up
a whole docs pages just for your repo.
And you can imagine that this is even more helpful to copy-based into your LLM.
So I love all the little tools that basically where you just change the URL
and it makes something accessible to an LLM.
So this is all well and great.
And I think there should be a lot more of it.
One more note I wanted to make is that it is absolutely possible that in the future,
LLMs will be able to, this is not even future, this is today.
They'll be able to go around and they'll be able to click stuff and so on.
But I still think it's very worth basically meeting LLM halfway,
LLMs halfway and making it easier for them to access all this information.
Because this is still fairly expensive, I would say, to use and a lot more difficult.
And so I do think that lots of software, there will be a long tail where it won't adapt
because these are not like live players or repositories or digital infrastructure.
And we will need these tools.
But I think for everyone else, I think it's very worth meeting in some middle point.
So I'm bullish on both if that makes sense.
So in summary, what an amazing time to get into the industry.
We need to rewrite a ton of code.
A ton of code will be written by professionals and by coders.
These LLMs are kind of like utilities, kind of like fabs,
but they're kind of especially like operating systems.
But it's so early, it's like 1960s of operating systems.
And I think a lot of the analogies crossover.
And these LLMs are kind of like these fallible people spirits that we have to learn to work with.
And in order to do that properly, we need to adjust our infrastructure towards it.
So when you're building these LLM apps, I describe some of the ways of working effectively
with these LLMs and some of the tools that make that kind of possible.
And how you can spin this loop very, very quickly.
And basically create partial telling products.
And then, yeah, a lot of code has to also be written for the agents or directly.
But in any case, going back to the Ironman suit analogy,
I think what we will see over the next decade, roughly,
is we're going to take the slider from left to right.
And I'm very interesting.
It's going to be very interesting to see what that looks like.
And I can't wait to build it with all of you.
Thank you.
Thank you.

---

*Transcribed using OpenAI Whisper (base model)*
