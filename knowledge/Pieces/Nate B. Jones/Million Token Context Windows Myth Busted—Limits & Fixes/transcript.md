# Million Token Context Windows? Myth Busted—Limits & Fixes

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-07-07  
**URL**: https://youtu.be/R-CASOusCJo?si=TB8VtzY5nT2WE04O  
**Transcribed**: 2025-07-07

---

## Transcript

Every single AI company is not telling the truth
about what its context window really does.
And this video talks about context windows memory
and what that means for AGI, artificial general intelligence.
First, let's dive into the claims that are being made.
These are big claims.
Million token context windows,
there's talk of two million, five million,
even 10 million token context windows coming soon.
We already have context windows routinely
in the several hundred thousand tokens all the time.
What this means in practice is that companies are telling us
that if you want to put a prompt in,
that is a full book, you can do that.
It's not true.
It doesn't actually work that way.
And anyone who works with LLM's extensively will tell you that.
You might get a tenth of the usual context window.
Running understanding, for example, of Gemini right now
with a million token context window on paper
is you get really solid performance out of about 128,000 tokens.
Or just over a tenth.
And after that, it's a little bit more questionable.
It's not clear.
And there are absolutely developer forums complaining about the fact
that Gemini does not have effective performance
especially past the half million mark.
Why you might think would someone want to put in a context
that large?
No one writes a half a million token prompt.
Not even I write a half a million token prompt.
I will tell you why.
If you are analyzing documents,
if you're analyzing code bases,
fundamentally anything with very large sequences of tokens
that make semantic meaning across large structures together,
you need the option to use a larger context window.
The problem is this.
Fundamentally, when the transformer reads that context,
it does not read it as a structure.
It reads it as a string of tokens.
And so larger structures within the document,
within the code base can get lost.
And that is why agentic search is picking up
versus just semantic rag for context windows for code bases.
And by context window, in this case,
like rag is obviously not the context window.
It's like part of the context engineering
that you're doing for the code base.
The point is having a search function
can be just semantic meaning for code bases
because there's so much structure in code bases.
And that is just one example of where we can go wrong
when we assume the context windows
just as vanilla fill the prompt
and add the doc context windows work.
They don't necessarily work well.
And I know that model makers will push a like 99%,
or 98% performance on needle in the haystack tests.
And a needle in the haystack tests
kind of what it sounds like.
You stick like one random fact
in the middle of a gigantic block of text
and you test to see if the model can find it.
The problem is this is all done
under a very controlled environment
and it does not measure the ability of an allola
to synthesize between multiple pieces of specific context,
which by the way is exactly what you need it to do
to do higher level thinking.
It is what humans are able to do when they read a book,
grant it.
We don't memorize every part of the book we read,
but we don't have the problem of saying,
you know what, the book I'm reading right now,
I remember it less well than the book
that I read four years ago.
We have the opposite problem,
but with LLMs, it's the other way.
At the end of the day, if it's in pre-training data,
I can actually get kind of decent literary analysis.
If the book is something that I'm reading now
in the sense that it's a new prompt or new text
it hasn't seen before, I don't really give it books,
but like I can give it docs that it hasn't seen before,
it's not in the pre-training data.
Even with state of the art models like O3 Pro,
it can still be very hit or miss
whether it actually examines the full context
and test back this up.
Test are often showing an edge awareness with LLMs
where they are paying attention to the end
and they're paying attention to the beginning
and the middle is a big U-shade.
So one, I'm gonna tell you a few strategies
for how this is handled,
because I don't think that's often sort of laid out
just very clearly, like these are your options.
We all know this is a problem.
So play out the options, right?
And then number two, I wanna talk about AGI
and I wanna talk about what this means
for artificial general intelligence,
but we'll save that fun stuff for the end.
So let's just run through a few strategies quickly.
We'll do five.
So number one, I've talked about this one before,
we're not gonna belabor it, rag.
Retrieve a logmented generation fundamentally
if you feel like you need to have an index
that sort of gives you a sense of semantic meaning,
you need the model to go and retrieve something
with a particular utterance or prompt
and then go fetch something out of a very large context
that you've put into the rag
so it doesn't just live in the context window,
fantastic, rag can work well.
It, like the classic example is the wiki, the HR manual,
that's kind of what rag is good for.
Second strategy, summary change, summary change,
real example, 200 page financial report.
The old approach would be to feed all 200 pages
and you're paying, I don't know,
50 bucks or something to the API,
depending on how big a prompt you run,
depending on how complex and multi-step it is,
how many tokens you're burning,
depending on the model, new approach,
split it into sections, summarize each of them
and then combine each of the summaries together.
So you're laddering up the semantic meaning,
it's ext cheaper at least.
Whatever your model is, it's gonna run a lot cheaper.
And the accuracy is higher because by splitting it into sections,
you're making sure nothing gets stuck in the middle
and it's just lost.
I have Claude all the time, admit to me
that Claude does not read the documents I give it fully.
It reads the first few thousand tokens
and just kind of pattern matches
is literally what Claude said, but I call it vibes.
It just vibes its way through.
Okay, third strategy deal with a strategic chunking.
So similarly, you split the 80 page document into sections.
This is similar to summary chains.
And then you ask each chunk, you interrogate each chunk,
do you contain information about X topic?
Let's say you're trying to explore a particular product area
inside a financial report for the stock market.
You wanna interrogate each of the 10 page chunks
in a very large company report
and you wanna say does it contain information
about the products?
Only positive chunks would then move forward
after you do that interrogation across splits.
This results in vastly fewer tokens being used
and much better accuracy, even versus like a vector search.
Because you're basically saying you must pay attention.
This is a small context window, just look at it, it's not rag.
All I'm asking you to do is just look at the context window
and tell me if this is in here
and I'm giving you so little, just a few thousand tokens
like you can't mess it up.
Fourth strategy is context budgeting,
which is a big part of context engineering.
You sort of treat the tokens the way we treated
random access memory or RAM in the nice, you can serve it.
You treat it like it's precious.
So you would say, for example, here, this 500,
we're always gonna have system instructions.
We're just gonna have 500 lines of system instructions
or 50 lines of system instructions
and that's what we're gonna have.
Okay, and this next piece,
this is, I'll call it a thousand tokens
we'll say for conversation history
and that's summarizing older parts of the conversation
again, we're not gonna touch it.
2000 tokens for retrieved documents
and then 500 for working memory, whatever it is.
You can do more of this in the API
where you're sort of hacking the context.
If you are in a chatbot, you have limited options.
The system instructions you can't touch
of the conversation history is summarized for you.
Retrieved documents is kind of up to you.
You'll notice if you're in the chatbot
that older retrieved documents are dropped out.
I routinely have a conversation with O3
where I'm like, remember that document
and it's literally there
and I remember uploading it
and there's a little marker in the UI that shows
I did it and of course O3 is like, it's out of memory.
I don't know, didn't happen.
I can't remember.
And so if you're in the chatbot,
you have to do all of this manually.
You have to kind of track how long your conversation
is going for, what you're asking for
and then budget your asks
and budget the documents you give very carefully.
So the last strategy is position hacking.
So research shows attention
is at least three x greater at the edges of the prompt.
So, and I've talked about this before,
put critical instructions at the beginning,
put like key facts at the end.
The relevant document is where it needs to be
to be paid attention to like first
or the second most is last.
And then insert checkpoints every few thousand tokens
as you chat to make sure that you confirm
that the prompt is working.
And so in a sense in that,
you're not trying to escape the fact
that you have limited context.
You're actually trying to position hack.
Now, if I were to look at this and say,
now what can you do with APIs versus a chat window?
All five of these are very viable
with an API first approach.
Only some of these work with a chat window.
So the chat window,
you can do summary chains that would work
because you can actually like split
into sections and have different chats.
You can do strategic chunking
where you ask it if it contains information that works.
You can do position hacking
where you time your instructions
and kind of what you put where.
It is a little bit more difficult
if you're in the chat window to do context budgeting
and to do retrieval augmented generation
although arguably a custom GPT
is effectively a cheap form
of retrieval augmented generation
or a project area in chat GPT
is a cheap form of retrieval augmented generation.
So there's ways to kind of get there
but certainly a summary chain,
strategic chunking and position hacking are very viable
even if you're not an API person.
Okay, let's get slightly philosophical here
for a minute toward the end of this video.
I want to get real honest about the fact
that we've been talking for a few minutes
about the fact that fundamentally,
these models cannot reliably track information
across a single structured piece of text that's book length.
How do we expect them to maintain understanding
across a lifetime of experience?
Particularly when they're not getting better at this.
This is not a new issue.
I am not telling you about something
that did not exist when chat GPT launched
and now it does.
I'm telling you about something that hasn't gotten solved.
This is a limitation of our architectures
that is partly a function of physics.
One of the things that Google engineers have observed
is that it is incredibly computationally intensive
to use the full 1 million token context window.
I don't know if you know this,
but context scales quadratically.
In other words, as you burn more tokens,
if you send more tokens through,
it's a quadratic equation that scales to the power of four
in order to process those tokens.
And so if you go from 50 to 100,000,
and you forex the amount of energy you have to use
to process that context window,
which is why some of these longer prompts take so long.
Like you're burning multiple minutes during an Opus 4
and it's just going,
you're burning multiple minutes during an O3 Pro,
some of that is that they're inference models
and they're thinking,
but some of it maybe you gave it a lot of context.
This is a fundamental limitation.
It's not an artifact of your prompt design,
although your prompt design can help address the issue.
This is a robust effect across every model architecture
that's been tested so far.
And here's the thing,
the entire bet on LLM's achieving artificial general
intelligence rests on this assumption if you really reduce it.
Humans are lossy compression functions too.
Say it again, humans are lossy compression functions too.
Our forgetting and compression is fundamentally similar
to what these models do.
That is the bet.
I don't know that I agree with it.
The context window problem suggests
this bet might be incorrect.
Yes, we forget details,
but we maintain coherent mental models.
Sure, I can't recite page 50's
of the legal document verbatim,
but I understand how chapter 20 relates to chapter one
and I can tell you pretty clearly.
LLM, it's not the same, right?
Research shows they're doing pattern matching
and if they're doing pattern matching,
that's not the same as understanding the structure.
And if this concept of quadratic complexity really applies,
it's not just inconvenient.
At AGI scales,
you're hitting thermodynamic limits.
You're hitting energy limits.
We need perhaps a fundamentally different breakthrough
in the way that we handle attention
across long context windows
in order to truly get to a point
where these LLMs can deeply understand context
across very large spaces.
So either we're right,
an intelligence really is lossy compression.
Maybe I'm just fooling myself,
I'm a very lossy human,
and I just need to be honest, right?
And maybe you need to be honest.
And we need to be a little more humble
and recognize the limitations of the AI
or our limitations too.
And it's going to get to AGI effectively
because humans are not that much better.
Or we're kind of wrong.
And we're building very sophisticated,
stochastic parrots, people spirits,
pick your description of choice.
And those machines will never really understand
the large context windows that we throw at them.
And that is a fundamental computational limit
that we would have to have a new breakthrough
to get to sort of AGI from.
For now, I would settle for honesty
from vendors who are talking about context windows.
I think we have traded,
this is a million context windows and it's simple
for the honesty that we need
to actually do appropriate planning.
I would like to propose that we start to use
real tests of actual synthesis work across documents
as a way to describe capabilities.
Like this model can effectively synthesize insights
across a 10 page document,
gets it right 90% of the time.
Or this one can do it for 20 page or 100 page, whatever it is.
I have yet to see, by the way,
a reliable synthesis across a 100 page document
by any model if it's a complex document.
So that's a theoretical.
OK, so I've left you with a few strategies.
We've talked about how you address this.
Don't walk away thinking that just because I'm skeptical
about the implications for AGI,
I don't think that this is a transformative opportunity
for us building.
If we apply any of these five strategies,
or maybe a combination of them,
it is totally possible to use the LLMs we have today
to accomplish transformative business results.
I've seen it.
Now that doesn't mean a lot of people aren't screwing it up.
They are.
But the AI we have today,
even if it never gets better, is still good enough
that with the weaknesses in the context windows we have today,
we can still build business solutions
and frankly personal solutions that offer a ton of value.
I know people who are within the context windows
we have today building really effective second brains.
It's, it's just possible.
Some of them are hacking obsidian,
some are using other tools,
some of them are rolling their own.
There are remarkable things that we're able to do personally
and professionally within the context window
limitations we have today.
Use the five strategies I laid out,
the position hacking, the context budgeting,
the strategic chunking, the summary chains,
the rag retrieval log manager generation,
and have fun with what we've got.
And be aware of the claims that model makers
and vendors make about context windows.
They're not all they're cracked up to be cheers.

---

*Transcribed using OpenAI Whisper (base model)*
