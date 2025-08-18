# 37signals: Live design review for "Basecamp project stacks"

**Channel**: 37signals  
**Date**: 2023-09-18  
**URL**: https://www.youtube.com/watch?v=ecctvU_9I0c&pp=ygUZMzdzaWduYWxzIGRlc2lnbiB0ZWFyZG93bg%3D%3D  
**Transcribed**: 2025-08-15

---

## Transcript

All right, Doran, let's take a look at what you're working on.
Yeah, and I'm just sharing my screen.
Okay.
Yeah, so this is an update based on your last round of feedback on stacks on homepage.
And just a quick refresher stacks on a whole page would allow you to stack multiple projects in what we call stacks.
And there's three ways in which you can do that.
Like a folder basically, right, like putting things together that are related.
Exactly, exactly.
Yeah, you can think of it as a folder, essentially.
So there are three ways in which you can do it.
You can either drag a project and recently visited on top of another project.
And you'll see that the context changes into a create stack.
Once you release that, you'll move to the top to the pinned areas.
So over here, you can see that you have a new stack here.
You can click inside.
You can give it a new name.
Let's call it cycle five.
Save it.
And the projects they just drop on top of each other, of course, will form that stack.
You can as well just drag the project from recently visited on top of let's say,
a house remodel in this case.
And a new stack is going to be created exactly the same as previously was.
So again, you can rename it, etc.
You can as well drag a project from, let's say, getting started to any corner.
Within the pinned area at the top and same, you get a new stack.
Let's call it a little world.
And that's done.
You can move the stacks.
You can still move them around in the top section.
So let's say I'm working on cycle five.
I want to have it on the top left.
I'm going to move it there.
Maybe, you know, this is companies stack where I have all my base camp.
So I can rename it base camp.
And I can, it's just so much easier to organize your pinned areas.
And I know many people have many projects in the pin areas.
It is very hard to keep track of, you know, where things are.
And you know, when we stack so it's just much easier to control that.
And I can ask a couple of questions.
I'm.
This is great.
Really like the transition.
When you rename the stack to, it's really smooth and direct.
What.
I'm wondering, did you guys explored all.
So, so every time you create a stack, it says new stack.
And we don't ask you to rename it there.
Had you explored or do you want to explore like concatenating the two projects that you if you create a new stack.
So, you know, only on creation, if there's just two, which of course is how it might work to start.
I wonder if I could say like, can you open that one, for example?
Yeah, so it's house remodel on project name three. I almost wonder if it could be like.
House remodel plus project name three, but then again, like as you add more, we wouldn't want to keep concatenating.
I just wonder if, if it would, if it's going to be something people are going to have a bunch of stacks called new stack.
But then again, maybe they'll just figure out how to rename it. I don't know any thoughts on that.
Do you play with that at all?
Yeah, I mean, one of the things that I've considered when we when we first started this was to have the stack name being the name of the project that you first drop.
So in this case, if I'm dropping, for instance, project name four on top of the little laptop, the project is going to be called project name four because that's the one that I'm dropping.
But again, you know, to your points, like it might not make sense for a lot of people.
And you know, it's a good example for our case.
You know, if we have cycle five, if I'm dropping a project in cycle five, it's not going to be reflecting the actual thing that I want.
So do you have the previous design we looked at before this because that that's sort of in a sense, solved it because it showed the miniature versions of the projects inside the stack.
Yeah. So, so this is the this is the previous version where the stack would not be actually, you know, a wide project like box.
Something like that you see the projects within the stack.
And that was the nice side about this is that you would just like in a glimpse, see what's inside.
And when you click, it will open, sorry to go back, it will open and you see the exact projects that you see in smaller version.
So that's one advantage, perhaps, to the previous design, but I think that as we looked at it.
It in this one situation, it kind of looks alright, but when you have a bunch of them, it starts to feel pretty overwhelming pretty quickly. So, okay, one of the thought I had, can you go back to the to the, yeah, in chrome.
Close that out and drag a project on top of another project, but don't drop, don't create a stack yet.
See what says create a stack. I wonder if we should say stack these projects or something like that, instead of create a stack, it's not, it's a little bit like.
It's a bit more about the end goal, which is stacking them up versus creating something.
I don't know, just a thought, I'm just kind of riffing out loud, but that was something I was thinking about.
The other thing I want to bring up real quick, can you open a actual stack?
The link at the bottom empty stack, I assume that just removes the projects, can you try that?
Yeah, so when you click this, the projects go back in the pinned areas, then you get a message, no projects in this stack.
And then that bottom link changes to delete stack.
At this point, you can just remove the stack completely, which will get rid of it.
Yeah, I like that.
The whole thing I would think about is, instead of saying empty stack.
Since it's worth, since we have room, it's not a button, it's like, I wonder if it could say like.
Remove projects from the stack, remove all projects from the stack, or maybe, yeah, maybe empty this stack.
Just empty stack is a little bit brutal in a sense.
It's like, it's pretty short, and I'm not totally sure.
I think I know what it does, but it feels a little stark.
Yeah, one thing we can do to kind of combine, so I was also wondering about, potentially, you know, do we need to explain it more or just tell them what's going to happen at all.
So like, you could combine it to like, move projects back to pinned.
Yeah, but they're not all pinned.
They are.
Okay, we need to talk about that then.
Yeah, that doesn't make any sense to me, but okay, we'll get, we'll get into that in a second.
Yeah, so we could, we could explain that.
Related to the empty stack, and you know, we've kind of gone back and forth on whether or not.
You know, I mean, just basically like, is, do we consider this destructive?
During QA came up, like, should we do need to be warned what's going to happen?
Do we need to, you know, really be explicit about what's happening?
Generally, I think it's like, it's a stack.
You're not losing anything when you empty it.
Like, I don't think you, you know, so like, I think we could be better on the worry about.
I don't personally think we have to, like, warn on it.
No.
The only thing is though, just to play this out is it's not destructive, obviously, because you're not deleting any projects, but.
It's something you can, you can hit it by accident.
And if you did have a dozen projects in here, it would be really frustrating.
To hit that and not get.
I think that was the main QA thing is that you could just like, you accidentally click or whatever.
Oh, yeah.
Yeah.
I wonder if there's a place to put it where it's less accidental.
Or I mean, we could of course have a confirmation, but it feels, it feels heavy.
I mean, we could say empty stack, you click it and it says, are you sure?
And you have to click it again or something like that.
There are some things we could do, but let's.
I'll just leave that on the table.
Yeah, one of the, one of the things that we, we've done in one of the initial versions was to have, have the delete stack or empty stack.
Once you click on the edit.
So you would have it here, essentially.
Yeah.
I like that too, actually, Doran, can you actually do that again?
So we don't currently have a delete unless you write empty it out first, which is a nice, also a nice.
Safety mechanism, safety valve there.
Yeah, we could have when you're in that mode.
We could actually reveal the empty stack link at the bottom, even.
I don't even know if I put it right next to that, but like maybe that, just that whole thing.
It presents all the options that you would have.
Yeah, I mean, we went back up to that.
My main hesitant, I was just like.
It feels like you're not entering an edit stack mode as much as you're like entering an edit title load, you know, so like it's hard to know if.
Is that where you think you would find that find that, but like.
Yeah.
You know, how often do you need to empty a stack?
How often do you need to delete them?
This is kind of one of those like.
The obvious easy, the possible situation is like.
I agree that it's not an edit state necessarily, but like it's, if you ever need to do it, and you don't know how and you wish there was a way and we show you how and now you know it's like great, you can do it.
Versus trading that off against the frustration of like hitting that back center.
And you're not entering out a dozen things that you carefully put in there, like that would be pretty frustrating.
So I would almost prefer to like have that as part of the.
Quote edit state, even though it's not an edit mode, whatever, whatever it is, settings mode, essentially.
Just so you don't do it by accident, you know.
Yeah, probably, you know, you're going to have to figure out how to name them.
However, I guess there's also an empty thing. I mean, it's pretty soon you'll notice that there's this other option.
Right.
Cool.
Yeah, I think it's a good idea to show the empty stack, maybe at the bottom where it is now, but only when you click the edit title, this one shows up.
In which case, you would not click it by accident, because this would not, you will not see it.
Yeah, I think we should do that. I actually think we should probably do that.
Yeah.
Okay.
And then how do you get a project out of here?
Normally, just drag it out.
Yes, we can just drag it out and it just goes away.
Cool.
And then when you drag, if you drag the other one out, is that essentially the same as.
Yeah, we can just condition there.
Yeah, you should show a message. You should show this message.
Yeah.
Catch.
Cool.
So close that door and one very minor thing, but they said we were talking about the empty stack text there, like.
We talked about a few different options, like it was a little bit confusing to many activities, but like, because we have that like empty stack language currently, you know, like that that's an action you can take to empty this tack, you know, so if I was strange to use that word those words there.
Yeah.
Yeah.
Yeah.
It felt like we had like zero projects before instead of like empty stack and it felt like it was generated by the computer rather than, you know, put some thought into it and make it more human.
Yeah.
So yeah, I wonder what's your.
The first thing that comes to mind, even though I don't think I love it is like nothing inside or no projects.
Yeah, it's me it's like it's inside, even though it's a stack is not really an inside thing.
No projects was one that I thought of too.
What was that, what was that project?
No projects.
I thought that too.
Like that scene.
Yeah, no projects seems better than zero projects.
You could all say this, I mean, this stack is empty, but, but, but, but empty of what?
So I do like the directness of just getting to the point like no projects or, yeah, no projects, perhaps could be fun.
You know, I also say I'm not, I'm not a fan of the italics simply because I love the talics, but I don't think our italics are, I don't like this typeface really lends itself well.
Yeah, at this size, especially so I would probably just go.
Just lose it.
I mean, I like the style.
I really do like there's an elegance to italics, but I don't think they add anything here.
I was, I was, I was waiting for the session to ask you about Alex because like a few people suggested it's moving back to San Serif.
But then I thought it's just as Jason about this.
I go all caps, I go, so like see the little brand header over there on the right hand side.
Yeah, I think we use all caps in a few spots like small all caps, I think would be, could be nice.
Yeah, I'll try that.
Yeah, play with that.
You're good at type. So that's what that.
Yeah.
Cool.
Okay.
Yeah, so that's that.
And then of course you can drag all the projects within the stack.
If it's open, can you open a stack?
Can I drag something in now?
No, so this whole area is locked.
And it's because the this panel is taking so much space.
Yeah, it would be quite fiddly to try to drag stuff inside.
Yeah, right.
So we decided to kind of like blank out all the space.
And if you click it, of course, you will close it.
It exists to like a model, except that it doesn't have a dark background like as we, as we have it in other places.
What do you think about that?
What do you think about sort of blurring or dimming the background?
Given the fact that you can't drag things in when it's open.
Do you think it would make sense to almost stylistically double down on that?
Like if it's blurred out, you wouldn't expect you can do anything with the background.
Right now, I kind of expect I can.
Yeah, so the initial idea behind not having a background was that this is supposed to be like a quick action.
This is not, this is not like a model where you go in and you have to focus on something else like a form or a button or like whatever or read something.
This is more like click, click, die.
And it's almost like memory muscle rather than you're actually having to consume the content that it inside.
And this is why I see it slightly different from what a model usually is.
And this is why I removed the background essentially, but you know, that said, it's so easy to edit back that.
No, I can see, I can see how it does.
I think I buy that.
By the way, the transition sometimes over zoom. It's hard to see.
Does this sort of zoom up or is it just like materializing because it'd be nice.
If it grew, it fades, it fades in.
Okay. Can we grow it?
Can we?
I'll try and expand from there.
Yeah, I just would, if we can get that to look nice, I think it'd be, it feel.
More like what you expect.
Yeah, yeah, more, more control.
Yeah, yeah.
Cool.
Yeah.
Nice.
Okay.
Yeah.
Does escape.
If you hit escape, will it, will it X out?
Yeah.
Cool.
All right.
So let's get to this.
Contention, contentious point.
If you, if you clear a stack, all those projects become pinned.
I don't, I assume there's some reason for this, but I don't like it because they didn't,
like you can pull one from recently visited.
To me, putting it up there is just putting it in a stack.
It's not saying pin it also.
So it's, it's doing two things when it shouldn't do two things.
It should do one thing.
Can we not have it to that or were we out here with that?
Why, why was that decision made?
I mean, this is truly contentious, of course.
The idea is that the, the, the stuff that you have at the top, they're all pinned.
And people are used to that.
I'm used to that.
And it's, it's kind of implicit that once you have a project at the top in the pinned area,
like this pinned itself, regardless if it's in a stack or outside the stack,
I do understand and agree with the argument that, you know, project in the stack,
you don't see pinned here.
So surely they are not pinned in this case.
There's, of course, a technical aspect on this as well to mix, to mix the,
if you hear something screaming, that's my cat.
It's not a baby.
You're something screaming.
It's, it's my kids.
So,
the cat doesn't scream.
Yes, going back to this, there's, there's also like a technical aspect to it.
In, in the way these cards are modeled.
So the idea is that once you drag a project, let's say, 100 designed newsroom here into the new stack.
It becomes pinned automatically.
And even though it doesn't show here, but because the stack is in the pinned area.
Surely the projects within the stacks or pinned as well.
It's almost like it's hierarchically the top section, it's everything is pinned.
What's underneath the section is, is recently visited.
Yeah, we embrace that more when we added the ability to, you know, to just drag a recently visited project up to pin it.
Because that's new as part of this as well.
Like before you could never do that.
And, you know, really it is.
You know, without majorly remunning this in this page.
Like it is a pinned section is how it just functions, you know, code wise, etc.
And so I think letting people drag recently visited projects up there.
I think it's really cool.
We've talked about how we've always wanted to just like, oh, that's how you pin it.
You just drag it up there and now it's pinned.
So like dragging a recently visited project up onto a stack.
To me, makes just as much sense that like it's pin now.
This is the pin section that doesn't have to always be that way.
But I think based on where we've come from, it would be really hard to change that assumption.
Okay, so this is a primarily technical.
I mean, I would say.
And as far as like for this specific project, I'd say 70% technical.
But personally, I mean, to me, it makes more sense this way.
That this is a pinned section.
I think if we wanted to rethink like, no, things up here, they can be anything.
They're not pinned.
They're just, this is just another group of projects pinned or not project.
I think we'd have to like rethink this page more of like what is this section?
If it's not the pinned section.
This section is a part of your desk where you put the stuff that's important to you.
That's how I would think about this.
So let me, let me make my case, at least share my point of view on this.
I think once we introduce stacks, it's not just pinned.
So it was just pinned.
So we're coming from a place of just pinned.
But now it's not.
Now it's, it's like things that are to pinned or, or, or together, these are,
this is just like one separate place to put the stuff that's in play.
Like currently kind of in play.
Now, if you think about.
When, so let's say you open that new stack.
It says four projects, don't.
So if you're done, let's say the cycle is over.
Let's say you had a 12 cycle projects in here.
And you had all your 12 cycle projects in here.
Brian, you're managing these projects.
You put them all in here.
Cycle is over.
You hit empty.
Think about what, what's going on in that moment at that time.
You're saying like, I don't want these together anymore.
There's a pretty good chance you probably don't want them at the top anymore either
because they're like done.
It's sort of like they're kind of like over.
But now you've got 12 pinned projects that have just shown up in this pin section.
You had three or four pinned things before because you pinned these four things.
Now you've got 12 things that are pinned, which is overwhelmed the four things that you had.
And now you probably have to go through and unpin the things that you don't want up there anymore.
So the way I'm thinking about it is when you, when you take stuff out of a stack.
It's probably because it's over, in a sense, the way this is currently designed.
So I don't think pinning it by default at that point.
Would line up with the scenario I'm, you know, we're assuming here.
The scenario that I think would be most likely, which is I'm done with this stuff.
Don't need it up here anymore.
So, so my, my, just my preference.
And this is not a veto or anything like that.
But my preference would be if it's possible to remember the state of the project.
If it was pinned great and you take it out, it stays pinned.
If it was before in previously, previously seen or previously, what's it called?
Recently visited recently visited.
I'm thinking, hey, and basically recently visited you take it out.
And it was came from there to go back to there is, is my, my thinking to me this, this new section is a, is an, is an, is a expansion of the concept of up top.
I think of the section now is up top.
What goes up top pin stuff and stuff and stacks.
But it doesn't change the nature of the projects within the stack itself.
The projects are the same.
It's not a conversion.
It's a new pin.
It's just their together and all the things that are together live up here.
So that's, that's my thing.
I don't know what's, what's possible.
What's reasonable.
No, I think, I think I think that makes a lot of sense.
And I think the scenario that you painted is, is, is, is, is more common than not.
And I, I totally agree with that.
I think one of the technical challenges we had around that was without getting it too much detail here.
The challenge was like, how do you drag a project from here there without actually pinning it?
Right.
But I think we should flip that on its head and say, actually, we can pin it.
But only look at unpining it when you hit empty stack.
Rather than, because these are pinned here now, essentially in the, in the back end.
So that, that though, don't know that.
So if, if empty stack unpinned everything, there might have been things that you had pinned that you did want to stay up there.
But I, I would just wonder if you could ask who you're working on this with.
But Nicholas, Nicholas, if you could ask Nicholas, if it'd be possible.
To, I, and I can see, like, I can see through why maybe it wouldn't be right now.
That, that this is sort of an adaptation of pins.
And so therefore, that's how it works.
But if we could remember the state of a project and putting it up there, if it goes into, if it goes into a stack, it just in a stack.
And stacks are essentially themselves pinned.
But what's inside of them is the things that are inside of them are what they were.
If it was pinned, it was pinned. If it wasn't pinned, it wasn't pinned.
I don't think it should change the state.
It's not intuitive to me that it's changing the state.
And in fact, it's doing something to a project without me seeing it, without me understanding what that means.
And I know we don't want pins here either because they have no meaning inside of the stack as you can't unpinned in a stack.
So understanding though that like, we're probably, there's some leverage here because just the way things currently work.
And I know this might be changing. So I would just inquire and just see, like, is this a day?
And it is worth the work. Is it, is it like this actually would change a whole bunch of stuff would be really complicated.
Because I think that's worth just understanding.
Yeah, we're looking to it.
We'll go to it.
All right.
But just one additional thing like on that, like, to see how far we would need to take it, which is, you know, what happens when you drag a recently visited project just up to that section.
Like, if you just grab, I want to call it the pinback section.
Let's call it up top.
Let's call it up top.
If you drag it up top.
So like I was saying, so like right now, and then the latest thing, I say, what's live, you can't drag it at all.
This is what we're about to ship.
You can drag a project from recently visited up top.
In a pin.
Empty space.
Right.
So I think that project three, drag it up into the empty space somewhere.
Yep.
It makes sense because you're placing it up there individually by itself, individual things by themselves up top are pinned.
But stacks, which also exist up top, are not pinned. They're just, they just live up top.
So I think if you drag a project into a stack, it just retains a state that it had.
If you drag a project from recently visited up into pinned and drop it alone on its own, it does get pinned.
So logically, I think that all adds up whether or not it's doable.
I mean, anything's doable, but doable within, you know, where we're at in this project.
I mean, like for me, it feels.
Just like from my, the way my mind works, I guess I said, like it feels, as it feels logical that.
It feels strange that dragging a card off reduces two different.
Like sometimes you drag a card up and it's pinned, sometimes you drag a card up and it's not pinned.
Like that to me seems to reach.
Okay, well.
If the session wasn't called pinned in your head, right?
Because it's been called pinned for the past, however many years now at this point.
If it was always called up top.
I know where there's like the counterfactual here like, can you, can you forget what it was called before?
And can you imagine if it wasn't called pinned, but like pinning things put stuff up top.
And now there's not new things that can go up top, which are stacks.
And this whole section was never called pinned.
Or another way to think about it would be this, let's say anything up top turned green.
And dragging projects into folder into stacks would just turn them green also.
You're like, why is it green?
Like it's in a stack.
What does that do with changing the color of the object?
Normally the behavior was if I drag a project up on its own up top, it turns green.
But putting it in a stack, why would it also turn a green?
What I'm trying to do is just groups and things and group stuff lives up top as well.
Maybe that's kind of a weak argument.
I don't know.
I'm just wondering trying to like break.
Whatever I find myself in those in those patterns, I try to break away from.
Like the title of the section.
Injecting too much meaning.
Just because the history momentum of it, right?
And I might be, I might not be making good argument by the way, it's just.
I would try to think of this as up top now has two kinds of things.
Things to sing on their own or pin so they stay there.
Stacks also stay there.
I mean, you can think about it in terms of like weight almost a stack is heavier.
It stays up there because it's heavier.
Can.
You know, you pin something.
Actually, this is backwards.
That doesn't even make sense.
Forget that even said that part.
But I'm just thinking there's two kinds of things that are up top.
And putting something in a stack does not also do two things to it.
It doesn't pin it first and then put it in a stack.
It just puts it into a stack.
Yeah.
Yeah.
Only I wonder though is that if we do that, which.
I can't.
Definitely can see.
Houses.
Some places to it.
But like, if we do that, it kind of seems like in the stack, we would need to show whether something's pinned or not.
Like.
I don't think it matters here because.
Think about what you're doing here.
I don't need to know the state of something.
I can't move things around in here, right?
You can you can shuffle them around.
Right.
But, but what I'm saying is you can move anything around.
So.
The fact that two of them were pinned.
Then you couldn't move.
It actually would add more complexity.
Here's.
Here's what I'm referring to.
It's just that like.
You could take two actions here to get first up.
You can drag it out.
And you can.
Empty stack.
Yeah.
So you can.
And then those cards go somewhere.
And my point is that like, if you don't, you know, because you don't remember where you drag the stuff from.
So like, if we don't show what's pinned or not.
And you like drag a card up.
Like some of the cards are going to land and pin to some of the cards going to drop back.
And they say,
and you wouldn't know which one it's going to which way it's going to happen, you know.
Yes.
That's true.
So that makes it feel like, oh, now we need to show like, which is pinned and which isn't pinned.
But then can you unpin from here?
And you know, they could just, it seems like more complication than it helps.
So that's, that's fair.
Um, I would argue it doesn't matter what it was to you right now.
Like, I would just argue that if you take it out, it, it was what it was.
So if it was pinned, it goes back into pinned.
If it wasn't pinned, it goes back down below.
Like, I don't, because I can't change the behavior of the item.
I, I, because I can't, let's say something was pinned.
And I wanted it to be unpinned.
I couldn't unpin it and then drop it down below.
It just is going to retain, it's going to, it's going to revert back to what it was.
Regardless.
And there's, there's nothing I can do about that.
So I would, I would just, um, let it do what it was or let it be what it was.
But anyway, that, that's just, you know, I, I think it's worth mulling it over.
But the bigger, the bigger question is, before you even mull it over, technically,
what would be possible to do that?
And if, if it turns out that that's like a major rework, it's not worth it at all.
I think so, this is a matter of like.
I think both arguments are, are fair.
One argument, my argument would not be even worth entertaining at all.
If it turns out that's technically quite difficult at this point.
So it'd be nice to find out.
And then maybe we can discuss it again.
Yeah.
Yeah.
Okay, let's do that.
Yeah.
I mean, overall, I think both both arguments are great.
And I'm, I'm for both among the fans on, on both those.
Um, I also say that like.
If we go with the way it is, it's not the end of the world.
It's, it's still fine.
You know, I just, uh, I think that.
Well, anyway, let's see.
Okay.
If it ships the way it is, I'm, I'm not going to like really argue beyond that.
It just feels more intuitive.
Um, that these things don't pick up additional variables.
I really like the wording that you used like up top.
And I wonder in that case, if you reframe it like that,
that would make a lot more sense.
Um, not to have, you know, the confusion between pinned on pin, etc.
In which case, like, do we actually need pins, you know, because you can just drag it up.
Right.
The pins are not really needed.
Um,
and you know, in which case we, we, we remove that, that confusion.
Yeah, I think that's an interesting point to you.
I would say there's something about the pins that, um, visually.
Um, help to distinguish.
Things in a different way.
I like up top versus like up top as a conceptually up top.
I don't know what that really means on its own.
Um, until I pin something or I, I, I make a stack or something like.
The section doesn't describe itself very well when it's one or the other.
When it's both kind of does.
Um, but if they were just like six pin things, I would prefer that section was actually called pinned.
Um, but, um, it also doesn't even need a name.
I mean, as it doesn't have one.
Like, it doesn't have a name.
Yeah, in part.
I mean, part of the research.
Didn't it?
When we did before stacks or no.
What's that?
Did it.
I'm like blanking.
Did it actually used to, it didn't say pin before, right?
Yeah.
It used to, I think in a previous iteration, a few iterations ago.
But right.
So the pins, the pins do the own, their own job here to say, like, this is the pins stuff.
But now that there's stacks, it's, it's just like it's up top.
We can, we can just call it that.
Yeah.
And part of the reason that your pins exist or have value is like, you know, first of all,
you need a way to like move it, pin it, move it up top whatever.
You need a way to do it, you know, without dragging the dropping.
That is one thing.
And then also, like, at least in the current design, there's not a empty section waiting for stuff to be dragged into it.
Like, if you have a pin to anything, there's no section there.
It doesn't, it doesn't exist until you pin your first thing.
So, right.
We would need to like, adding section that's always empty, saying, drag your first project up top.
Exactly.
Exactly.
Can you remind me, if you drag house remodeled down into recently visited, does it unpin it?
No, can't.
Okay.
So, in that case, I don't think I'm okay with the way it works.
But I don't think it's necessary that you can drag a project from recently visited up and dependent to pin it.
I think you can drag it up to make a stack.
But to, to drag it up and pin it, not be the drag it down and unpin it seems a little bit odd to me.
Anyway, mind, these are minor edge case outlier things that don't really matter.
We're, you know, we're in the weeds, right?
Because this is really good.
So we're in the weeds, like, you know, how to, how to finish the last one or two percent of this.
But this feels like this feels a lot better than, than, than the version we looked at last week.
And I appreciate how quickly you guys made these changes.
Yeah, happy with how we turned out.
One quick question.
The mobile side of things.
So like, mobile is working on supporting this.
And it's just going to be, you know, read only on mobile.
So you're going to create stacks and stuff like that.
We're not doing that right now.
But like, you know, you'd be able to see your stacks, obviously, on mobile.
So that's probably going to be, you know, two wish weeks, maybe a little bit more.
And before it's ready on mobile.
And so there was the question of, you know, are we okay shipping this.
You make a bunch of stacks.
You go to mobile and the stacks aren't there.
And you know, all the projects are there because, well, they're all, they're all pin print.
Anyway, all the projects are there.
Yeah.
But they're not in stacks.
You know, my general take was it like, you know, like, two weeks we can announce, you know, available soon on mobile.
You're not really losing anything.
It's probably good enough.
But I just want to double check it.
You saw much reason.
Like, how do you think it'd be like, I mean, all these stacks.
So I went to mobile.
And I don't see my snacks.
My, my gut on that is that.
And I never say this, but I think we shouldn't wait.
And the main reason why is because.
If you put a dozen projects, you start to really organize things.
You put a dozen here and a dozen there.
Before you had three pin things because like those are your top three things.
And you always want them at the top.
And now all of a sudden, you're going to have, you know, 27 things at the top.
You know, a dozen on this and a dozen on that.
And then the three pinned that you had.
And now, now your pins are less valuable.
Then, then before.
And then I imagine if you start to unpin projects because you're like, wait a second.
I just want these three pin.
Then it's going to start to mess with your stacks on desktop.
But you won't be able to see that until you get back to desktop.
And now your folder or your stack has eight things instead of 12.
There's just like these mixed behaviors that.
I feel like in the grand scheme of things, we should, we should wait until that works.
We don't need to wait.
It's not like it's breaking anything.
But it just feels disconnected.
In a way where it might be.
I would say it probably would be frustrating.
To have a few pin things.
And then a few stacks.
And then on, on mobile.
It's just like this long list of pin things.
You know, normally we, we just ship stuff.
And mobile would catch up or mobile would be ahead of us or whatever.
But given the fact that this is the home screen and mobile screens are small to begin with.
I think people.
That might find, you know, a few dozen surprise projects up there and pin to be quite frustrating.
That's my general gut sense.
I don't know.
Yeah.
Do you, do you buy that or do you think it's not important enough or.
Yeah.
It's totally reasonable.
Yeah.
Certainly going on sort of our, you know, normal approach of like, well, don't we don't want to be waiting on stuff.
So, you know, just like didn't want this branch to sit out there for too long.
And now we got to rebase it.
You know, just.
Yep.
That's a tradeoff for sure.
And, you know, just like the fact is like, OK, so people would have, you know, how many people were going to be involved.
Like people would have to know about the feature.
They'd have to try the feature.
They'd have to probably create a bunch of stacks or a lot of projects in the stacks.
And then they'd have to be using mobile and use it a lot.
So by general thought was like, you know, the risk was fairly low.
Let's keep things moving.
I'd say, you know, I think the best part of what you were saying there was about the, you know, just as like, you know, the screen size of mobile, like just kind of like thinking about it, like.
You could almost take advantage of these stacks because it's going to make your life on mobile a lot easier.
And like, you know, like, oh my gosh, if I could put all my cycle projects in my stack and on my phone, it'd be so much easier to manage and then you do it and like it doesn't work.
Yeah, so I think that the fact that it stacks are actually very beneficial on a small screen on mobile is another plus and in waiting.
And I don't, I don't think if we have major implications to wait.
Here's another way to do it.
We could just ship it as is don't tell anybody it exists.
Yeah.
Or people are going to find an idea, you know, just like just put it out there.
We can start using it anyway.
Some people will find it somehow by accident.
And then we don't have to keep branches synced up like this.
It's in production.
We're good to go.
Yeah.
I would actually vote for that.
You know, thinking it through because we don't have the tradeoffs of keeping branches in sync and rebasing and the whole thing.
So just ship it as is once we've tightened up a couple of these little details and you don't play with them.
We've changed the edit state and a couple of things like that.
Ship it quietly.
We can start to play with ourselves.
Someone will discover it. Don't tell the community yet. Don't tell anybody.
Although maybe we could tell the community.
We could tell the community and just say, hey, look, here's how it works.
Just so you know, for the next few weeks, it's not going to be available on mobile.
Therefore, if you do this, this is going to happen.
So you might want to hold off on that.
But we can get some more people involved that way.
That'd be a nice thing to actually to involve them.
Now they think about it.
Just letting them know up front.
We wouldn't announce it publicly in that way.
Where hey, just by so you know, like this is going to be kind of weird on mobile.
This is like more of an insider thing.
And then we can move on.
I'd be up for that.
Yeah.
Yeah, it's like a soft soft lunch.
Yeah, soft lunch.
Yeah. Yeah.
You had a very good point about this experience.
You know, creating stacks and organizing your stuff is such a personal thing to do.
Right.
Like I can definitely see myself organizing all my stacks and then going on mobile.
I'm not seeing them.
I'll be like, where's my stuff?
Yeah.
Yeah.
Well, as long as we again, tell the community that this is sort of hey,
you guys have an early preview essentially.
This is live in your account, but it's a bit of a, you know, early preview.
We're not going to announce this formally for everybody until.
Uh, this is working on mobile, but here's what will happen if you do it.
So, you know, proceed at your own risk, essentially.
Not like there's any risk, but, you know what I mean?
Yeah.
Yeah.
Yeah.
Okay.
That'd be, that'd be good.
I would solve all of our problems too, but branches won't know.
Okay.
Cool.
Cool.
I think that's everything that we have so far.
So, Dorn, do you want to just check it with Nicholas about?
Like, what would be, it would it be possible to maintain?
The status or the, yeah, the status of a recently visited project or a pin project in the stack.
Even though stacks are always going to be displayed up top.
Yeah.
Yeah.
Oh, let's find out.
Let's just find out that we can discuss asynchronously, wherever.
Yeah.
Yeah.
Okay.
Cool.
This is great.
Cool.
People are going to like this.
You can see where this goes.
Like, click into a stack for a second, Dorn.
I can imagine and then click on the name of the stack to go into like whatever edit mode.
I can imagine like adding a background image.
You know, I can imagine changing the color of the stack.
Like, there's a lot of things that a lot of levers off of this week and pull.
To make these stacks stand out even more.
I mean, you can imagine creating a stack for a client and uploading the client logo.
You know, and so now you got Nike got the swoosh.
And it could replace the name just like, you know,
hit never mind or close out of here.
Close out completely.
Yeah.
And scroll, scroll down to the top again or up to the top.
Sorry.
So we have hauncher design.
But of course, if you, if you hover over that.
And you replace with your logo, it could replace with the logo.
So the new stack could be called Nike or it could have the swoosh, right?
And then you're like, oh, this is pretty great.
All my Nike client projects are in here, got the Nike logo.
So there's a lot of opportunities here to expand this simple idea,
which is what we get when we simplify this compared to the other version,
where we had like a window into all the little projects,
you kind of lose the ability to do more.
Yeah.
I mean, there's not much room here for that if we went there, right?
So I think I think this.
This is going to be a really nice improvement.
It also it's within the within the within the be the spirit of just.
Fisher price, which is, you know, simplifying these things,
making them very straightforward.
And we're trying to reduce some clutter here.
So I like it.
Yeah.
Yeah. Cool.
Good work.
All right.
Thanks guys.
Thanks.
See you.
Bye.
Bye.

---

*Transcribed using OpenAI Whisper (base model)*
