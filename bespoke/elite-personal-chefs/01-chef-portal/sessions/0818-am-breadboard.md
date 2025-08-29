Meeting Title: Breadboarding session for chef payment portal project
Date: Aug 18

Transcript:
 
Them: You're lagging a little bit. It might be me, though.  
Me: Okay? You hear me now? Okay, okay, okay. That's great. We're ready to dive straight in. The goal of today. So the agenda of this session specifically. Actually, let me zoom that out a little bit.  
Them: Yes.  
Me: The architecture that it thought about for this project in general is that in a morning sessions, it'll feel a little bit more structured, like almost like a workshop that we're doing. And then the afternoon will be more of like a working session where we troubleshoot, where we progress, check and do, like, whatever is necessary. To get things going. So the goal of this morning specifically is breadboarding. Which is a very low fidelity way for us to get a lot more concrete about what it is that we're building and throw in the caveat right now or the expectation right now. That part of the goal here is to slow down in order to speed up. Meaning? We're living in the age of AI where these agents are kind of just spitting out code like it's free. You see all these people on the Internet being able to be like, hey, ChatGPT5, build me this. And it'll just immediately built the whole thing for you. Theoretically, we can go on ChatGPT right now, or, like, go on Cursor or go on Cloud code right now. And just be like, Just describe in five minutes what we want to get built.  
Them: Yeah.  
Me: Right, like, for the chefs and for the payment, whatever. And some version of what we're describing, we'll just get built. And we don't know how. But it'll just get built. Within, like, five minutes. And then maybe it works. But I think the level of in order for us to actually be able to take advantage of AI at that speed, We need to first gain the mental discipline and clarity ourselves and our own ability. To refine and chisel out why we're building what we're building and how. Not how in terms of every line of code. But there are design choices that we want to make ourselves in order for things to actually be durable and scalable. Meaning we could spend up 10 apps in the next 10 days. And they will all kind of work. When they break, we won't know why. They won't work together in a super system that is like, this is a lead person of chefs, and this is the chef experience that you want to create, and the client experience that you want to create. It won't be opinionated from your point of view. It'll just be. Oh, it's an app. It's like your average payment portal. That works, right? So that's why for the first two mornings, We're going to touch a little bit of code this afternoon just to get onboarded onto cloud code. And just to Chef asks for the end to end tutorial for how do you get a piece of code file from your computer up on the Internet. Let's do that end to end process. Just almost like a mini exercises. It's almost like the AI native version of a hello world. We'll do that in the afternoon, but for these first two mornings, we'll almost go back to pen and paper to do some of the thinking ourselves first before we go to an AI and be like, hey, build this. So the goal of this session specifically is the breadboard, which is the most. We're drawing heavily from shape up from 3007 signals. Bless you.  
Them: Yeah.  
Me: And the whole idea of, okay, can we map out the system and experience? In a screen at the level of fidelity, where all we're doing is we're defining three things. One, places, which is the term to refer to screens. Basically, what are all the screens that need to exist? And then what are all the things that need to happen on these screens? The affordances, it's a design term for this is something that a user can do on the screen. Right, so map all of those things out, and then connection lines is the third thing. So how do these affordances lead to other places? And all of that. So on the initial skeleton that I posted on Basecamp, it doesn't have the connection lines yet. I meant to just lay it out as a starting point and inspiration for this is the kind of thing that we would build out today. So obviously, as I said, it's going to be missing a lot of things. But one way to think about this is before you design a whole house and you worry about what furniture to put where, you got to first decide what the rooms are. And what you want to be able to do in each room. So that's kind of the goal here. And so what we're not doing today is to this button be blue or green, like where precise ordering of data goes where what is on this form? What is on this? Whatever. It's more of like a functional as well as the design thinking is more around what goes where.  
Them: Yeah.  
Me: And if you've read if you saw that chapter in Shape up, it's like things like, oh, what happens if you put this button here on this screen instead of dark screen? What problems might that give rise might that lead to? And what if a chef gets stuck on this green? What happens there? That kind of stuff. We could do together. And so the agenda for this session. I rambled enough. The agenda for this session. For the next 10 to 15 minutes. Let's turn to pen and paper. And I would like to invite both of you to just give it a shot. In terms of on a piece of pen and just on pen and paper. Try to map out. With that snippet that I provided as a potential point of reference, but also from scratch, if you want. Map out. What are the different screens? Just literally write out this screen is what I'm going to call it, and then what are the things that you want to do on that screen? The reason why I'm inviting you guys to do this individually. Before we converge in 10 to 15 minutes is because I think just going through that mental exercise is going to make you realize how something as simple as you think about a feature and say, oh, it's a feature. Whatever when you're forced to write it out on paper. There are micro decisions that you realize that a lot of times you might be letting the AI make for you, that you'd want a taste of yourself. So throughout the sense of 15 minutes, if you have questions about what, where you should put what, feel free to unmute and ask me. But I want to invite you guys to have that thinking space yourself first.  
Them: Yeah.  
Me: Does that make sense?  
Them: Okay? Yeah, it does. So can you give me a frame of reference? As to what it is.  
Me: Yes.  
Them: What it is that we're mapping out. What are just the goals.  
Me: Okay, so the. If you look at the breadboard skeleton that I also posted on Basecamp, that was my initial scope. Of what the goal of the screens would be. But the goal of the screens would essentially be the project that we talked about, which is the portal where chefs get to look at their job and then be able to basically put in how much their client is supposed to pay. And then their client is going to be able to pay directly, and then it doesn't include the part where you're calculating payroll, but it includes the part where the chef gets the client to pay, basically.  
Them: Okay? Just wanted to confirm that that was the experience that we are looking at and talking about, okay?  
Me: Yeah, it's a plumber app. Like how the plumber gets paid when they get to your house. And for a reference and a level of fidelity, we're looking for something along these lines. Of a payment flow having the different steps along the process from looking at invoice to setting up autopay to confirm. This is just the example that's in the book. But this is the kind of level of fidelity that this is what you're looking for on your piece of paper.  
Them: Okay? And the other, I guess, framing question, and I don't know if this is something that is in my breadboarding or not, but the other framing question is, are we working under the assumption that each chef or chef team is logging in under an account where they are only seeing the things that are pertinent to them. Is that an assumption that we're making?  
Me: It's a reasonable assumption to make. That being said, if there's a reason for that assumption to not hold up, it's not out of the picture like where before we're basically pre the stage of all the features are defined. So something like that could very much be up in the air if there's a reason for you to design it otherwise.  
Them: Okay?  
Me: Stuff. Do you have any questions? Does this make sense?  
Them: Okay?  
Me: Okay?  
Them: Yeah, I'm just putting out fires.  
Me: Do you need us to hit pause for, like, a few minutes?  
Them: Are you? Good. Do you need me on anything?  
Me: Okay?  
Them: No. Keep going. Keep going. Okay.  
Me: But it would be best, chef, if you also have the mental space to participate yourself.  
Them: So this functionality that Lee works in every day. He's just as much as I do. Yeah. Okay?  
Me: So let me know if you need more time. That's okay. We have a lot of time.  
Them: Yeah. I don't know. What? You don't know? Right. Okay? What do you mean to draw out? If we're looking at the breadboard draft. And we're talking about this framework. Where the chef is looking at their clients and being able to add a new instance of a service for a client. Kind of discounting what is currently in this draft and thinking about the screens again from a fresh perspective just to see if we're aligned with our thinking or if any new insights pop up as we think through how we would click through it if we were a chef, right? And what that experience looks like.  
Me: We would add to that and see it's about rethinking it from a fresh perspective. It's also that the initial skeleton laid out is like a very, extremely preliminary skeleton. Roughly what needs to exist. And what we're looking for is literally, you should be able to look at this breadboard and have zero. Like, basically by the end of these 90 minutes, our goal is to have a red board that is crystallized, that we can look at it and be like, we know exactly where people are going to do what. And how this thing is going to work. I would actually start from even more first principles and be like, okay. Let's start from, like, the screen that I would suggest starting from is like, the screen where clients pay, because that's at epicenter, right?  
Them: Yeah.  
Me: And then you look and then you list out, okay, what would need to exist on that screen other than the pay now button? What information would need to exist there? What are the things that people need to be able to do? For example, like tip pain. That's something that the client needs to be able to do. Right? And then what happens after that? What screen happens before that? Like, what do chefs need to do? In this ecosystem of screens. And all we're using to. To define that is just these words and lines. So at that level, can we define what needs to happen in this app? This is like a very atomic level of what is the functionality of this app. Does that make sense?  
Them: It's exactly where square up is right now. They go and they log in to square up, and they see that there's an invoice, a client, and they create an invoice. Right? That was your.  
Me: Sure. Yes. But writing that out is going to have more micro decisions than you might imagine right now.  
Them: Acting. We're replacing Share up with our own app, right? Okay?  
Me: So let's spend the next 10 to 15 minutes. Let's call it at like, 55. We can check in then. So, like, nine minutes. To see how we're doing.  
Them: Login.  
Me: And I'm going to leave what I'm leaving up on the screen here just for reference at, like, the level, the frame of reference for, like, a level of fidelity that we're looking for.  
Them: That's an open contract, and it's going to have.  
Me: Things like, what is the success screen, right? And by the way, some of these we're going to end up outsourcing to Square because Square has their own sort of payment confirmation screens and whatever.  
Them: Okay?  
Me: Right, but what happens after that? Does the chef see sort of like, okay, success, they're ready to be paid amount of money next week, that kind of thing?  
Them: Button. And then, let's see. Pre populated.  
Me: Steph, I'm going to mute. Stuff. I'm going to mute you real quick.  
Them: Custom.  
Me: You can unmute when you want.  
Them: Send. ciera  
Me: Alexa. Can you set an alarm for 9:55, so in roughly six minutes. Okay, Alexa, just disable the alarm. Okay? Once we're ready, can we take a picture of whatever you came up with? Do you need more time? It's okay. It's okay.  
Them: Oh, my God. Okay. No, it's a freaking mess, okay?  
Me: Exactly. So take a picture. And I don't know if you guys have basecamp on your phones, but whatever. The easiest way is for you to paste it.  
Them: Oh, yeah, I know. I'm a designer by trade. I know it's always a mess before. It's pretty.  
Me: Into the chat in our basecamp project. That would be best.  
Them: Okay?  
Me: So if you want to and for reference, pasted in the project.  
Them: You are still needed.  
Me: Chat instead of the pings.  
Them: Chef.  
Me: Just so. Does that make sense?  
Them: Paste it in the project shop, okay?  
Me: Just because the pains are less permanent.  
Them: It only ain't going to be a really good shaking.  
Me: In documentation.  
Them: Scratch.  
Me: This is the chat that is kind of persistent in the project.  
Them: You started first, okay? I got it. Thank you.  
Me: So whoever gets added to the project will be able to scroll up and see. Like, say you added Brick tomorrow, and he scrolls up and he'll still see it.  
Them: Okay, cool.  
Me: So it's better for Astral Project. Updates as opposed to pings which are exclusive to that instance, meaning it's only between it's one time, one off.  
Them: Okay?  
Me: This is more like a Slack channel. Things is like the private dm.  
Them: Yeah. More like a slack channel. Okay, understood. Got it.  
Me: Perfect. I see chefs. It's okay. It's okay. Because you're going to be able to. Because you're going to explain it so we don't need to be able to. It's okay. This is exciting. Handwriting as a lost art. Let's see. Let's see the results. Yeah, you talked about that. I would love to chat more about that sometime. What did it mean?  
Them: I was a product designer when meant to completely different thing. When it meant actual physical products. It meant actual physical injection, molded plastic, physical handheld products. Now product design is more about experiences and.  
Me: Wait. I see one image in the chat.  
Them: I think that chef may have pasted it in the other part of the project.  
Me: Okay, I see it.  
Them: (Kate) just sent a message.  
Me: Okay, I see. It. That's actually good. That's actually good. Let's do it.  
Them: In that chat. ciera The ten day game plan.  
Me: Okay? Okay? I meant the chat chat. But this is actually a good idea. So I. Okay, let's see. I'm going to shame. Actually, from now on, I'm going to have daily messages. Like, you see how I had a Monday morning message? So for now on, let's make it the daily message as the place where we put in. Updates and work in progress. Content.  
Them: Yeah.  
Me: Do you see the daily message? Like I posted something this morning. Yeah. So there. Let's make updates there from now on.  
Them: The daily message.  
Me: Okay?  
Them: Yes, I saw it this morning.  
Me: All those things were. My computer is juggling, like, 10 things, same time. Okay, why don't we start with chefs? Tell me what you thought through.  
Them: Start with me. Device or your computer and you go to a thing, right? And so you're either going to be already logged in from a previous session or you log in. And then it goes to your home screen. Your home screen is your current contract. S. Your this week, this year money. And your what am I worth? You see all three of those at once. And then you click on your current open contract list. And you see name, date, client, amount of money. Deposit paid. Yes or no? Probably would be a yes. And then send final button. So that opens up, it's pre populated with just double the deposit. But you could also override that with a custom. And then the grocery button. And sends. So let's do that. So send and then confirmation. Are you sure this is right?  
Me: What is the message? What is the message?  
Them: To send a message. Okay. Are you sure this is right? Confirm.  
Me: Okay?  
Them: The message is the same messages we have now in square route. It's like our clients often ask about gratuity. It's never mandatory, but always appreciated. Tip message.  
Me: Perfect.  
Them: And then that goes. Yay. Congrats. Real quick. On the screen and then right back to the home page. Where you see your open contracts. Your money this week, this year. And what are my worth, teacher? And now that particular status.  
Me: Okay?  
Them: Of that particular open contract is invoice sentence.  
Me: Let's go to lease first and then we can unpack.  
Them: That's what I got. I was thinking not (Kate) as granular. So I'll just walk through what my thought process. And so first it is the chef and client status. So same general idea. You log in as a chef or a chef team, and then you view today and your history. So what you currently have pending and then all of your historical whatevers just the same way they have today. You can on the screen add a new service instance, which is including the client name and the amount and all of the normal information that we would add, and then be able to view the status of all current and new services. I'm using the word service as opposed to job, just because I think it fits a little bit better what we do. And then my other screen. So that's your status screen that you open with. The new service entry is another screen. So you are going to a new service entry and you are entering that client. Whether it be a new client or an existing client, you're entering a new service for them. Until you would enter all of the charges that are associated with that, including any reimbursements that are coming to you. Under that particular new client service. And then you can there signify if a deposit was paid and how much. If the chef needs to do that. And I'll explain that caveat in a moment. And then on the back end, it would calculate the totals, meaning the remaining balance if the deposit was paid and the potential payout, which would be calculated with the EPC commission coming out and adding your reimbursements that have already been added. So you would actually see that, and that would be part of then the ongoing status in the status screen after you entered that news service entry. Then, as I was there, I was thinking, why are we not including the chef assignment in this whole back end system? Right? Because it's all kind of feeding from the same thing. That's where I jumped over to the left hand of the page and was thinking about a service assignment. View, for lack of a better term, that would be managed by Amy, Chef and or Rick. Where somebody from the sales management side of the house can enter a brand new client or a brand new service. Enter any deposit that goes along with that. Be able to assign to a specific chef. So that would mean that we would need some type of way to assign it to the show. Whether that's a listing or a drop down list or you type in their name. Kind of like my mind went there thinking that, okay, so maybe in front of where the chefs are looking at their current client statuses there. Is something for the management side to be able to enter brand new, unassigned things and assign them so that they show up. So that they would then show up in the individual chef or the shop team's status. All right. So that was my side quest, and then I moved back to the flow right after the. Into client payments. And I thought that here it would be important for us to. At the top level of this client payment experience, we determined whether it's a pay now or it's a send invoice. And after that, determination. We go through each of those experiences as needed. So under the pay now, I was kind of making assumptions that we would be pulling in other systems that already have built out, well articulated experiences that we don't necessarily need to rebuild. Right. So whether it's square or stripe or whatever, if it's pay now, we move into their integrated POS experience. That includes tipping. The client pays, and then back to our integrated system. The service gets marked as paid. And so that it shows up with that status in the client status screen for that particular shop. And then on the send invoice side again, I was assuming that we are going to be integrating systems that have already proven flows for this of creating a new invoice, editing the details as needed. So if there's anything that needs to be edited on the fly, as far as reimbursements, charges, headcounts, whatever, that those can be edited. Then we send that invoice to the clients, and then eventually, through some lag of time, the client would pay, and that would trigger our system to mark that particular services page so that it is again updated in the client status.  
Me: That's great. Okay? This is a very solid start.  
Them: And that's where I got in those few minutes.  
Me: The overall feedback that I have is that right now we're thinking in terms of higher level, sort of like a workflow. Type. Level of abstraction where we're just drawing a flowchart through what generally needs to happen. I would say for Lee's version, you have it a little bit more organized under what would be screen. For chef. You didn't organize it under screens, but you had some sort of, like, level of detail sprinkled here and there, like buttons and things of that nature. And before we jump into consolidating and crystallizing a unified version. I think we would benefit from one more pass, like one more iteration, like another 10 minutes. Where I think the main goal is to. It's okay if you're writing a little slower. It's okay if it's even incomplete. But I want us to bring us one level down. I think we need that exercise where we are mapping things out to. Okay. In order to facilitate the workflow that you guys laid out. What are the screens that need to exist? And what do people need to do on each screen? Because part of the exercise isn't basically almost allocating different functionalities across different screens. Does this thing need its own screen, or is it just another field? On the same screen. Right. For example, the client payment screen. Right. Now you're saying, calculate totals. We'll just calculate totals. Mean does that mean that they're entering the information about the service on that screen, or is that a separate screen where they've already entered it, and then they need to check that? The total is correct. The four day before they hit the send payment. Right. Those are. That's like one level deeper into. Maybe we don't want to overly visualize in our head. Sort of like literally where the button is, because that becomes overly detailed and we're getting ahead of ourselves. But we do need to bring it down one level into thinking about, well, literally, if you were to code it today, what are the different screens that you would want to see, right?  
Them: Yeah.  
Me: So does that make sense? Like, it's okay for us to go slower and not cover the full thing? But I think we need that exercise in bringing it one level down. And I also think that the formatting that was suggested in a book is elegant. For that reason. Like the format where there's a name of the screen and underline and then a list of things that need to be done on that screen. So try that. And also add the connection lines between them. So just give it a pass. Give it a pass. I would start from the screen that you think is the most important, which might be the checkout screen. And then another thing for Lee is that I think it's good that you had the side quest for the service assignment.  
Them: Okay?  
Me: But one of the reasons. One of the. One of the reasons why we might not want to think about that right now. Is that immediately? Just having that next to the new service entry already starts to call into question. Then, should chefs even be the ones to enter new services themselves? Right. Who is the one entering new services. So then.  
Them: Yeah. There's an answer to that question. Is, then I don't know if you bought the answer to that question right now, but there is a brand new client and then there is a new service for an existing client. So a new service for an existing client, a check would enter a brand new service for a brand new client.  
Me: Okay? Okay? So make that. Make that more explicit and make that.  
Them: Somebody from the management site would enter.  
Me: Because that type of information that you would enter for those two things are different, right? Like, enter client information. Okay, so let's get this another attentive. Let's give it some time. Let's check in at 25.  
Them: Yeah.  
Me: But slow as fast, slow as smooth and smooth as fast.  
Them: Okay?  
Me: Let's get this foundation right. So if by 25, you still feel like you need more time, it's okay.  
Them: Okay? All right. Stop texting me.  
Me: Maybe some acidic is good.  
Them: Feel like I'm failing this exercise because I'm done. And mine's really simple.  
Me: Maybe. Simplicity is good, right? I think there's a mixture of, from what I'm seeing so far,  
Them: You are just right. You're just fast at everything.  
Me: There is a balance of simplicity and complexity between you guys. And that's good. And part of this exercise is in training our muscle and thinking at that level of detail. And I hope you're starting to see how if we don't know how to think like DOES ourselves, then when we work with AI we don't know how to steer it because it's just generating. AI will create things out of nowhere. And sometimes you want that. But sometimes it's making buttons that you don't need. Sometimes. So if you don't go in with at least a mental frame of this kind of an opinion on what's needed and what's not, then you don't know how to steer it, you don't know what's needed and what's not, and you end up with an app that has 10,000 features that you may or may not need, that you feel like it's a nice to have, but it wasn't sort of like from first principles, thought of as things that solve problems.  
Them: Certainly does. That's absolutely correct. All of a sudden.  
Me: Does that make sense?  
Them: You got to stop calling me.  
Me: In the meantime. We're going to give it a couple more minutes. In the meantime. Can you pull up an example of a current the current square up template. Just for potential reference. Just pull up like the latest invoice, like the real one, with real data.  
Them: Looks like the leads are starting to flow back. Yeah, there was a lot. Okay, good. I know. Over the week. Okay, (Kate) no longer freaking out. No.  
Me: And.  
Them: Okay, where are we at with this?  
Me: Also working on mine. We're making simultaneous progress. I'm starting to consolidate, but I'm going to go. I'm going to have us go through yours before we go into mine. Let's see. Simple, but with detail.  
Them: Maybe I feel the exercise. I don't know. I thought you were telling us simpler. So that's what I did.  
Me: Simple as in the scope of things because of the level. It's actually because of the level of attention of detail that is needed. That we can't add as simple as. And we shouldn't add a bunch of screens that aren't needed.  
Them: Okay?  
Me: But that being said, there is a minimum viable number of screens or detail that is needed in order for us to actually thoughtfully think through the design of this thing. Let's talk through that. Let's talk through that. This is why we're not going to look at mine yet.  
Them: Yeah. I have three screens. And then I wrote what each screen needs to do.  
Me: Because I could be wrong. Maybe I'm overcomplicating things.  
Them: Oh, God.  
Me: Is everything all good?  
Them: There's always a bunch of everything going on.  
Me: Like they paid.  
Them: Okay?  
Me: That's awesome.  
Them: Two people booked over the weekend on the quote generator.  
Me: What did I do?  
Them: They paid, they booked and it's a weekly. And it's a weekly.  
Me: Again. You guys aren't giving yourselves enough credit for having the insight that this would work.  
Them: $500 in a weekly recurring build out.  
Me: The thing that's actually working here is not the tech. The thing that's working here is the insight that clients need to see the price earlier. So.  
Them: We didn't know. Word. Okay, I accept that.  
Me: Okay? Let's give it one more minute max and try to send it to basecamp. I know. I already have yours on my screen. It's not about. It's okay for it to be incomplete. This is more about having a fidelity and thinking.  
Them: Fine.  
Me: If that makes sense.  
Them: Well, fine. ciera  
Me: No.  
Them: Yeah. All right. I must have gotten the wrong message.  
Me: Tech is slowing you down.  
Them: Tech is slowing me down.  
Me: Actually, there is actually a valid case for you to think about getting a new laptop.  
Them: There we go. Back. Your computer is slowing you down. Too much stuff going on.  
Me: For reasons of not necessarily that rails won't run, but. You deserve better.  
Them: Yeah, I know I will.  
Me: And that.  
Them: Worry.  
Me: Okay. What is that?  
Them: Okay? All right. So I do have a caveat. Gene Lanz in 28 minutes. So I have to go to the air with 10 minutes to go and switch over to the car. I just can't draw anything while I'm driving it. Yeah, I feel you.  
Me: It's okay. It's okay. What we can do is we can very quickly. So what time. When do you need to leave? Right now. In 20 minutes. Your eight minutes away from the airport. Oh, no, no, you don't need to be there. Okay, perfect. Okay, so, I mean, that's. That's totally fine because we're going to be done.  
Them: I'm going to leave in 20 minutes.  
Me: We're gonna basically spend the next, like, no more than five minutes talking through, or if, like, let's try it. Let's shoot for five minutes.  
Them: Yeah.  
Me: Talking through what you guys sketched. And then. Great. So we have. We have constraint breeds. Constraints are great. We love constraints. So we're gonna have you.  
Them: 15 minutes to the airport. (Kate) just so you know.  
Me: We're gonna spend the next five minutes talking through what you guys came up with. And then we're gonna go over and look at mine. And then we're gonna. Like the rest of the call, we're basically gonna figure out, okay, where are the divergences? Where are things that you guys added on yours that isn't online? Or where are things that isn't on yours that is on mine, it actually isn't necessary and stuff? Like that.  
Them: Did I not do this right? Yeah.  
Me: And so we're making good progress towards having a crystallized consolidated. Flow of this. But do you see how. Do you see how having. I'm tasting your right now? Do you see how having a map like this creates a much clearer picture of what it is that we're even trying to build and design?  
Them: Because I didn't post it, that's why. Okay?  
Me: Great. Great. It's like. I don't know, what's the culinary equivalent of this? It's like building a menu.  
Them: Yeah. For sure. We could totally get it. Yeah.  
Me: Yeah, exactly. We got to map out what the courses are before we get cooking and figure out what the ingredients are and all that, right?  
Them: Each green is a course and within the course s are the items that are in that course. Sure.  
Me: Okay? Yeah, exactly. And then people are usually. AI is very good at plating.  
Them: Yeah.  
Me: But that's not the first thing you want to think about, right? Okay? So let's start with chefs again. Start simple.  
Them: Okay? So here's what I did visually, Lee. Yes. I said, why don't we just take our spreadsheet? And square and that's it. So what are our spreadsheet. Those are two things that I need, right? As a chef in the company. And of course, I need square up. I mean, I need the drive to go build a menu. Maybe. But for now, for the portal. I need to see the status of my clients. That's obviously when they log in and look at it for the first time, like the spreadsheet. It shows them. I also want to see my money. Which is at the bottom of the spreadsheet for us now. And I want to see that my company, which is the chef Austin's like, fantasy. What am I worth? The motivator, right? And then. So if I status looking at clients. And I see that they are waiting for invoice. That statuses need to send invoice. A custom message and I need to send it. If I'm going to add a new one.  
Me: Makes sense.  
Them: Then I add a new one, and I put in the client's information. Name, email, phone number, address. I add money, I add a custom message, and I send it. Okay? So that's all I need to do.  
Me: So what is your thinking? Cure around the pay now versus Xintong an invoice offline?  
Them: Right now, Google Drive is where I go and I make a menu and I send it to a client. Eventually we'd like it to be here as well. Understood? This doesn't take into account the pay now. Right. Because just for (Kate) perspective, pay now isn't necessarily in our current culture, workflow.  
Me: Understood. So in this world, we simplify, which I love. Basically pay now just means we check with a client. Hey, I just sent you to invoice. You see it?  
Them: That's like a brand new send invoice.  
Me: Pay now. Yeah. Because.  
Them: Yeah. Basically, yeah.  
Me: Yeah.  
Them: For me. This is chef facing view, not customer facing view.  
Me: Well, sure. This worked.  
Them: The customer gets. The customer gets the square form of pay the invoice, right? Okay, so they get the square and they put in their credit card information. They pay now, and then the message.  
Me: Where do my clients come from? Do they add everything? Do they add every new client themselves?  
Them: Gets sent back to Lee. Hey, this person paid. Yeah.  
Me: Okay? So for right now, for the sake of the current implementation,  
Them: Now they mostly get the client from us. We would add new.  
Me: Let's not have it integrate with the code generator.  
Them: So either it's not we, it's the quote generator that adds the new.  
Me: So we're going to assume that. Let's just say that there's some admin workflow that isn't included here.  
Them: Right.  
Me: Yeah, there's some admin workflow that isn't included here. And that's okay. Like for this to be a partial breadboard.  
Them: Okay?  
Me: For the purely chef facing stuff. They all just see their clients.  
Them: Yeah, I will. I'll add it.  
Me: They can add new and earlier. Lee made the distinction between client and service. So is this unifying that as in I can just add new and select from an existing client or they would just always have to enter a new client or whatsoever. Like what happens when it's a new service, a new contract with the same client? Do they have to reenter the name and email and all that?  
Them: No, you would assume that it's. Oh, so you need, like, a copy or something you duplicate?  
Me: Not. It's not complicated to have it. Have a drop down there to cess or, you know, how my billing. It's like a billing address, the same as mailing address type of thing, where it's.  
Them: That's what they do now. They copy and paste it now. So let's duplicate.  
Me: Okay?  
Them: No, you're right.  
Me: Okay. This is actually, like, the minimal I see.  
Them: Yeah, I should have put the word duplicate up here. So underneath add new, there's a hashtag duplicate.  
Me: This is work. This is great. What does my money mean?  
Them: Understand. Okay. I got you. My money.  
Me: Okay?  
Them: Is how much in sales which is booked and how much is sent out which is quoted is my money.  
Me: Yes.  
Them: So the status of deposit paid. If they were on this portal, you would assume they paid their deposit because we put them there. However, if maybe they went out in the wild and they got their own client and they put them here and they sent the deposit. They're waiting to see if they pay that deposit. All that's added up and anything that is deposit paid is my money booked money. That I have booked from is broken down. Right now by week and quarter and year.  
Me: Understood? Okay? This is great.  
Them: My company is my little, like, ooh, that's my other page where it shows how much of the company that you own as a chef.  
Me: And what is ad money? Ad money is like the line item stuff.  
Them: Get that sprite. These are both spreadsheets right now. And then.  
Me: Yeah.  
Them: Yeah. Ad money is. Type in how much money it needs to be. Because you talk to the client, they either went up, down, or sideways. And you bought the groceries. And we have no. The company has no idea.  
Me: Are you saying here? That this is why I wanted to see the existing sample. You don't need the line items, it's just a total.  
Them: Chefs know that. It depends. It depends on the event, yeah. ciera If it's a weekly, yeah, generally speaking. Generally speaking, there will be like 1 to 2. Actually, it just depends.  
Me: Okay? So you would want some notion of line items inside this interface that gets passed to square as an invoice generation.  
Them: So, yes, there is definitely a need for line items in a number of cases.  
Me: Okay? So add money involves line items. You could either predefine line items, have them select from a drop down of line items, or be able to do a custom line item as like a simple thing.  
Them: Correct. Because there are lots of cases where there are line items. Yes.  
Me: And we wouldn't. So having the flexibility for custom means that we don't have to hard code too much complexity, as in, like there can be custom line items and all that stuff.  
Them: Yeah, that could. Yep, that could definitely work. Yeah.  
Me: Okay, perfect. Great. Let's move on to lease. Don't say that. Don't say that.  
Them: Holy shit. Yeah. So let's start from the side quest, because I think that it's just important for me to get those thoughts out, and the side quest is purely around. The workflow and the screens that I was thinking about after that. So for a new client assignment. This is amy. Chef. Shrek. Me, whatever. Not the chef. And so, from that perspective, we would need to enter the new client's name. Like brand new client has never done service with EPC before. Enter the contract amount or the service amount, because that's, I think, the last time I say contract, so we can say service amount. We enter the deposit amount. Because if it's generating from us, we will always get a deposit from the client first. So we will enter the full contract amount, then we'll enter the deposit amount. And I guess we need a way to send that deposit invoice to the client, which I guess I didn't put on here. But when that deposit does get paid, We would want that status to be updated in this new client that we have created. I guess that is also a side note, but we have the option to assign this client to a chef and whether that is from an existing drop down list of our existing chefs. Or if we are bringing on a new shop for this particular client, we need to be able to enter that new chef. And if we are entering a new chef, we need to be able to assign whatever EPC split is appropriate for that pitch. And then that moves into the chef side of things. So that was like, kind of the administrative side of things, and now moving into the chef side of things. They would log in either an individual chef or a chef team. That's green would show their year to date earnings and their year to date value. But the difference I am discerning there is that there's how much money they've actually been paid and then there is how much value they have generated. And added to the company and their potential options and whatnot. So there's a distinction of the different things that they would be seeing. One is just how much money have they actually been paid? And then one is, how does that relate to my value? In the ecosystem of epc. It would show the listing of their current pending services. And the status of each of those services. And that is like deposit paid, invoice sent, fully paid or pending is what my version thinking of. A deposit needs to be sent or an invoice needs to be sent to this client. It's just like fully pending. And so those would be the different statuses. Saying beneath that, it would show a listing of the historical services that have already been completed and paid. And then, of course, we need a button. To enter a new service, and this is for an existing client. Lee, your three boxes right there are these three boxes. We're like lockstep. Exactly the same. And then you just went ahead and got deeper on all of what needs. Yeah, right. That's when I was listening to you. I was like, okay, Yep. I sent that a little bit differently. I said that, too. Number one. You're level two. And then I thought that. So the button to enter a new service would move us over to the next screen for the new service entry. But then I thought about this again. That we actually need a button next to each of the current pending services. That is a payment. Button. Right to initiate client payment or Xintong an invoice from those pending services. All right, so the. First click through if we were entering, clicking on the button to enter a new service that would go to our new service entry screen. Where we would be able to enter the client information. Perhaps it's from a pulldown list. If it is an existing client, that would probably be easiest. We enter the charges and that would be the contract amount. And any reimbursements. And that speaks to it needing line items. Because, Jen, normally speaking, if there are reimbursables, they are a different line item on the invoice than the overall contract amount. But sometimes there aren't reimbursables. So that goes to that point of There may be a need for line items. The chef would enter the deposit amount if this was something that was initiated, a brand new client, brand new service initiated by the chef as opposed to being initiated by the management team. Giving them an option. Like Chef said, if they are out there in the wild creating their own business, they need to have an option to be able to send a deposit for that first service. And following through that flow. They would send the deposit using the client info as enter. Oh, you have to leave our. She just landed. No. Yeah, I know. And then once that deposit is paid, By the client. Our back end system would update the status to deposit paid. For that client listing. That was again another side quest. But upon the new service entry completion, The screen would refresh to the client status listing.  
Me: Great.  
Them: With that new service added appropriately to the current pending services. With whatever proper status is associated with it. And then it moves into the client payment. This would be first faced with buttons or option for whether it's a pay now or whether it's assigned the invoice. And that would lead to either the Pay now screen, which shows the client name, the contract, remaining amount. Gives an option for gratuity, and there's a big old pay now button. And once that is completed, the client status would be updated to paid upon that payment. And then the interface would, I guess, would be a confirmation, but then it would move back to the client's status screen showing that updated status in the client listing and if it was a send invoice screen. Then we would enter the client information, likely from an existing drop down list. That would probably be easiest. Enter the money details meaning the contract amount and the reimbursables. There would be ascend button to send that invoice to the client, pulling in that client information for Xintong Then when the client pays the status of this client line item would be updated accordingly and refresh the client status listing.  
Me: Perfect. Okay? I'll see. You guys have already mentioned. And chef. I'm just going to talk, assuming that you don't see visually what's going on, but I'm going to send what's going on separately. Oh, okay. So as you guys did already identified, there are a lot of commonalities, more than it seems at first, between what you guys have laid out individually.  
Them: Screen. I can see it.  
Me: I would say that for future reference. It made me so happy looking at this. Because, Chef, your version. Is actually, in so many ways. The perfect version in terms of simplicity, in terms of really being able to boil things down to its essence. Great job on that. Lee, you applied a lot of detailed attention to detail on, like. Okay, wait. What actually needs to happen in order to make these screens make sense, and that's great. And the reason why this makes me so happy is because this collaboration between you guys. There's a sweet spot in between. Where? We're starting from the epicenter. Of what? Stuff Identified. The simplicity like ways in which things can be simplified. But applying the attention to detail on what actually needs to happen on these screens. And there is a healthy amount of debate that can happen between you guys on each of these bullets that you listed. What are their necessary or not? And a question that is always worth asking is what happens if we don't build it? Right. That's the ultimate litmus test of if we don't build it and this thing breaks. Then we should build it. Or that value to effort ratio of if we don't build this thing, it's still kind of okay, and the value that it has is kind of actually more incremental than we thought. The maybe we shouldn't build it this time and add it on later as like a final polish. Optionally. All right.  
Them: Yeah.  
Me: So there's a trade off there. What we're looking for is probably somewhere in the middle between these two levels of consideration. And I did actually draft a version. Some of this, I think after listening to you guys, I think we should scope out or not consider right now. And some of this, I think, is good to incorporate. So I'm just going to very quickly run through what I did here. The admin side I made did with less amount of detail, but basically the four jobs that needs to happen on admin. Even in Chef's version. Is you need to be able to create a new chef account so that a chef can log in. Do you need to be able to create a new client? Maybe on Chef's version, we don't need to create a new client, because every time a NYOK client has created a Chef is kind of just duplicating the client information. But I will recommend that it might make sense for us to create client accounts. For scalability. Create new service. This is for when the chef isn't creating the oral service. Maybe because it's their first time. And then assign a chef. To a client. This is potentially optional in that maybe you can allow chefs to create services for any of the clients and you can just have the client pull via shared thing among all chefs instead of having some set rule for this chef only has access to this client information. So these two are optional. So for the optional things, or actually like this, and this is optional. For the optional things, I'm going to say I'm going to color code them differently. These are the maybes, so these gray ones are the maybes. Chef login, obviously. Pretty much a non negotiable. All right, so we move on to my services, which is basically your client status screen. We can call it my clients or whatever. You can create a new service from there. You can view assigned services from there. And for each of the assigned services, you can click into them. For the View service history. I think a better way to think about this might potentially be. And we'll get into this tomorrow when we sketch out the fat market sketches. Is that on the client side of screen, you just see the clients grouped in the statuses. So it's less about service history. It's more that at the bottom of the screen, you see the full list of task clients. New service, you don't need to enter that much information because at the start of being assigned a new service, you don't know that much yet. So it's just which client is it for what service type, roughly estimated guessed or meal count and more like a notepad to self.  
Them: Okay?  
Me: And my thought around having an internal notepad is that over time, you can basically study the pattern of what chefs tend to enter in that notepad, and that will inform your next steps as far as feature development goes. Because eventually this could also be where they do menu generation or like, recipe generation. The way Chef talked about but having a free form field to start can help you study that behavior. Enter deposit amount paid. So at the time of being assigned a new service, the client should already have paid the deposit. Because as far as I understood last time, Amy doesn't assign a client to a chef before a deposit is paid. So when you create a new service, you can enter the deposit. Amanda has been paid already. In terms of edit service, you can treat this as the same screen as view service. So if you like, as I'm from the client side of screen, you click on one of the services. You get to edit more things now because you get to enter grocery costs to get to enter. You get to edit all of the things that you already entered before. You get to edit the guest count based on what actually happened. And my thinking was that this can actually double as the same screen because essentially this is where you can edit. And look at this is the service that has already been created, Right? So this is the same screen where you would use the finalize invoice. So the button at the bottom, other than like, close service and go back to client status is finalize invoice these information. This information is final. The system voice. So then you get to the confirm invoice screen where all these fields are not editable, and basically you see line items. This is where something can possibly be scoped out right now. Square API does come with an off the shelf check out flow that you could basically integrate where you click Pay now and it would go to Square and the client can pay on a spa with Apple pay whatever. So that is potentially an option, but it would be a welcome simplification. To make this scoped out.  
Them: Yeah.  
Me: Or actually scope, maybe for now, and we ignore it. And we worry about it later. So I'm going to also make this square. Check out. Flow. And part of this is like making the API integration simpler, because the square invoice is something that we know about already. The code generator has it. It's basically the exact same thing. Just generate the invoice and the chef will tell the client, hey, I just send the invoice to you. Can you pay it? And then once the invoice is generated, you will basically go back to the client status screen, where that client is now refreshed and moved to the pending status. So this is my simplification in more detail at the same time. I think that this is somewhat of a middle ground between what you guys came up with. Especially with the things scoped out, it's closer to what Chef came up with. With the addition of client accounts, because you do have, like, recurring clients that get recurring payments a lot.  
Them: Agree.  
Me: So that's the only recommendation I have, but I think this might be a good scope to start with.  
Them: Yeah. I definitely agree with that, Chef. Are you able to see it on your end? Yeah, for sure. And this is new because of the quote generator. We do know everything we need to know about the event. Once the client books.  
Me: Yeah. So a lot of that information can invent and eventually be integrated in. For now, if you do want a safe chef time, maybe on your end on you and Amy's and when you create a new service and assign it to the client, you can pre enter a lot of the information that you know about already, so they'll want to chef opens their dashboard or their like my clients screen. They already see. They already see the information.  
Them: Because we're taking the. Taking it out of the chef's hand of the sales process. So we know a lot of information which is going to help us with what we're doing. For sure.  
Me: Right. So that they're putting in that set the work. That would be some more manual upfront work. But it shouldn't be that bad. What is missing here that I think because the my client screen is already doing so much.  
Them: Yeah.  
Me: Is that my money? My company stuff? Which I think that would benefit from being its own screen.  
Them: Understood?  
Me: As opposed to being just the My client screen. Because my client screen is where. Yes. Yeah. Yeah. So, like, what I'm.  
Them: I'm going to have it. Great. Yeah.  
Me: Into a universe that has a source of truth, that passes data into each other, and it's distilled into its absolutely essential components.  
Them: I understand what we're that we work in separately. I get it. Yes. 100%. Yeah, I agree. Earlier, Lee, like right now, we're doing basically the sheets we're doing right now, right? Integrates footwear. And then eventually we'll do the KPIs and then we do the Menu Builder, and then we also have Josh Fields as the display.  
Me: Yeah. So this is why the foundation is so important. And this is why we shouldn't add a screen just because we can. Because if we add a screen just because we can, it's going to make it a lot harder for us to expand this universe.  
Them: The sales tracker that I just built this weekend and all that compliment. That mooc works smoothly.  
Me: Moving forward, it's going to be a lot more Ted depth, so let's do this properly. So my thinking.  
Them: Yeah. That's all you really need. To operate. It's not pretty and it's not cool. But as a shout. You're breaking up just a little bit, chubby. No.  
Me: Something that, like, without the blue stuff with just a white stuff.  
Them: Right out there in those mountains. Right. We can hear you again. Last minute or so of what you were saying. That's all right.  
Me: Yeah.  
Them: I understand what you're saying. The bare bones nucleus of what we need is. I'm operating as a chef working in the company.  
Me: I need to go pay. I need to go get paid, basically as a chef.  
Them: Information. And the money and the status.  
Me: In a company. I need to see what I'm getting paid to do. I need to enter how much I actually need to get paid.  
Them: That's all I really need. The rest of it is fluff that icing and cherry.  
Me: And I need to get the client to pay. And then there's all the bells and whistles around it of, like, seeing how much I've been paid in my lifetime and all of that stuff around it.  
Them: Right.  
Me: Right, but.  
Them: Yeah, exactly.  
Me: Yeah.  
Them: Yeah, that's all. Exactly. That's the sale manship from us.  
Me: So here's what I'm proposing. Given how much, we're able to boil it down.  
Them: To the B to B to the chef themselves, right?  
Me: I mean, it's always interesting, because when I try to plan out a schedule,  
Them: There are customers. We're selling to them. But the actual client. You only need a minimal amount of information.  
Me: It's like trying to come up with contingencies and make sure something like things will click and we won't form the high, and then we're not being overly ambitious. But given how much we're boiling this. And I'm not committing to this. This is more of, like, a possibility. And it all depends on our collective pace. There's a world where the Nucleus version of whatever this is can be fully wired up and deployed by the end of the week. So the next week we're working on polishing and the. Additional. Nice to have things that we can experiment with. Let's still work through all of the steps and processes. Like, you know how all the calendar invites I had had agendas. Slow and smooth. And smooth is fast. And we should still go through all of those processes and make sure that we're taking one foot in front of the other.  
Them: Yeah, that'd be great.  
Me: And we're not skipping things. But there's a world where there's. Nucleus can be shipped within this week. It will just require.  
Them: Yeah. So let me go on that comment. (Kate) you made the comment earlier about the house cleaner.  
Me: Yeah.  
Them: So the house cleaner that I work with, literally, in a text message, we agree on date. Price. And payment. And so they text me. Can I come today? I text them, can you come today? And they say yes. And on the first transaction, we decided on the price, which is going to be $200 per floor. And then the frequency happens via text. And then when we pay them, we then vote them. That's how simple it is. It doesn't matter if they're house cleaner or a chef.  
Me: Yes.  
Them: And then all of the blah, blah, blah happens with the chef and the client, and they're over the phone or in person or through email, right? And then it's like, okay, because this company, Venmo, took my money. And it needs to go to the contractor. We assume that that happened, so that's us in this scenario.  
Me: Exactly.  
Them: We are the money. We are taking the money and getting it to the contract that we're taking it from the client. Has efficiently as possible getting into the chef as officially as possible. And so this chef and client just need to agree on location, name. So actually, she has to even know the location, the client information, the money, and the date.  
Me: Understood? Okay? So there are a few things that we would need to add to this as well. For example, like the date date.  
Them: And that's it. And the money is not confirmed. And so client pays deposit.  
Me: So stuff about new service, entering service information, editing service information. Well, that includes state, that includes location. That includes all those things that are helpful to have. Right. Like as a central source of truth. And over time, you would also want this to be a clean database of. Here are all the contracts that happened. Over the past year or whatever. Right. So stuff like that needs to be in here. But other than that, I think the white part of this pretty much equivalent to what Chef's breadboard is with the addition of some of the details in lease. So let's work on that. This afternoon. So very quickly. I know we're already over, so let's very quickly. This afternoon is mostly like a technical set up session for getting set up on cloud code. I'll give you a little tour to Claude Code. And Lee, I would heavily encourage following along as well. Just because. (Kate) code. What computer do you use? Perfect. Easy.  
Them: Okay?  
Me: Great. Cloud should be straightforward to install for chef as well. But basically, we're going to get a little bit more familiar with Claude code. We'll start with the basics.  
Them: Yeah. I'm on a MacBook. I'm on an older MacBook, but I'm on a MacBook, yeah.  
Me: And we're going to do one, like the most simple exercise ever. Which is basically deploying a static page on Render, which is free. So you already have a renderer account. So this is the hello world of how do you go from stuff. Asked a question of literally what happens when you get started? Well, let's type out index HTML in our little cursor code space and deploy to render. And that's just the most simple starting point. For what's happening here. And then as a bonus, if you want to squeeze a little bit out of that experience, The thing that I suggested was that we would make this landing page, basically the mock announcement to your chefs of, you have this portal that you could use now. You don't need to enter the spreadsheet and go to square up anymore. And the reason why that is helpful is not because the dead landing page is exactly what you're going to use to announce it, but just that exercise of distilling it helps ground us on division of what it is that we're even doing and why. Started working backwards from the end. Jeff Bezos used to do this with press releases. Right at the start of implementing any new product, they sit down and they read like a six page press release. Of what this product is going to be when we release it to depress. As a way to work backwards from the vision to figure out what's actually needed to be built. So it's an exercise in working backwards. That being said, the core goal is for us to get comfortable with this environment. So even if we literally just type in, hello, world, my name is Jeffy. That's fine.  
Them: Yeah.  
Me: That still does the job of us getting set up. Finally, if we want to get ahead of progress so that we have a higher chance of being able to ship a V0 by the end of the week, The next step here. I'm going to share this breadboard on that day one message, which I'm also going to pin on Basecamp. I'm going to share this. Based on this. Do some fat marker sketching on what the screen would quote, unquote, look like. I would heavily reference. I'm going to link to this, but I would heavily reference the book Shaper.  
Them: Okay?  
Me: Which is free online on what fat market Scouts should look like. I'm not looking for colors. I'm not looking for shapes of buttons. I'm looking for like squiggly lines and boxes. Of all the information that is listed out here for entering the date and entering the whatever, what goes with.  
Them: Yeah.  
Me: And this is where we're starting to think about user experience from the standpoint of, okay, what happens if this button is at the top versus at the bottom? What kind of information or group together. How are we showing the different clients with different statuses? Are they going to be able to collapse it? Are they selecting the different statuses from tabs? Do they want to like, is it one single page where they're scrolling down and seeing like all their history is history is separate tab. Is it hidden like that's? The kind of thing that you'll start thinking about but like in the super low fidelity, like fat markers. Called fat marker for a reason. Like, you literally don't have to fine grain detail control to like, literally write out information. It's just squizzy lines, lines, boxes. So if you get a head start on thinking about that. Precisely. Some of the more important screens here, login is like pretty standard. You don't necessarily have to design that. But what I would heavily emphasize on is probably the My clients screen or the client status green.  
Them: Okay?  
Me: The edit. Like the edit screen. That's really important because that's where the chefs need to have clarity on basically confirming the finalized information that's needed for the payment. I would focus heavily on those two grades, because even the confirmed invoice. Yeah, it's an invoice. Like, we don't need to reinvent the wheel with how invoices look like. It's just a display of the line items and confirming that this is the thing that you're going to send. Right. But I would focus heavily on sketching out my clients. We're going to sketch out everything tomorrow, but if you were to get ahead of the progress a little bit to sketch, I would start with my clients and edit. The Edit or View service screen.  
Them: Yeah.  
Me: And maybe even admin. Admin is the screen that concerns you guys the most. Chefs aren't going to see this. With regards to admin, that's important. I would also try to be mobile first with the sketches for my clients. And a disservice imagine it on a phone.  
Them: Okay? Yeah.  
Me: Because it's always easier to expand the experience from a phone to a desktop than it is to distill an experience from a desktop to a phone.  
Them: Okay? Yeah.  
Me: I would start. So the danger with starting something online.  
Them: Yeah. Okay, and then when you're talking about sketching, just for clarity, are you talking about pen and paper, or can we cowork in something online?  
Me: Is that you can get two high fidelity too fast. So I'm saying yeah.  
Them: Yeah. My preference, the way that I work. My design process is I always do pen and paper before I get to the computer, just because the computer to me is too limiting.  
Me: Let's start a thread. Let's start a threat. So I'll make a basecamp post with this breadboard with the instructions I just said.  
Them: Just because I've been working with my hands for 51 years. I've only been working with a computer for 25.  
Me: And the beautiful thing about this day and age, just to be transparent, I can take literally the transcript of what I just said. I could put it into AI and I'll have that post.  
Them: So.  
Me: So I'll have a post I'll have a message post for this. And chef. I know that we want to co work on this. If you have sketches, just upload just like, pen and paper or use your iPad to squiggle. I don't know.  
Them: Right.  
Me: Whatever sketch that you have, just make sure it's low fidelity, because there's a world where someone else. By the way, not in this project. Would very easily be tempted right now. So take this breadboard to something like lovable or replit, and immediately, like, tries to have a fully functional app. And then you, like, take this to AI or, like, very quickly generate a lot of things for us. The whole part. The whole point of this is to think through the things ourselves. So pen and paper, sketch some screens. It's okay if it's shokuna scratch. You can have some narrative around it to be like, this is why I think maybe this is what this should feel like or look like. And what we'll do tomorrow and tomorrow morning session is basically talk through those screens. And ideally, if we got a little bit ahead of results or a little bit ahead of the progress with the sketches, we can basically confirm the sketches within, like, 30 minutes, and then the rest of the 90 minutes, we can basically start up. On cursor and start mocking up what they will look like in code. Yes.  
Them: Sick, okay? Yeah. Love it. All right. Another thing I need your help with, (Kate) Is like, okay, chatgpt we're paying for, and then Cursor just made me upgrade, and then you're talking about doing this other Claude thing. So, like, what can I get rid of? I don't need three AI systems that I'm paying for, so how do I get rid of them? Or consolidate them. I need your help on that.  
Me: I would pause on cursor for now, because right now we're looking at plot code. So a few things. One of the pause cursor. Because we're not using cursors. AI features. Right now, we're still using cursor as a container for us to be able to look at code. But you don't need to upgrade cursor. Don't upgrade cursor. Chatgpt. Yes, but you can actually work with the same code that you've been working with. You can use cloud code to work on the same code.  
Them: But I'm using cursor in our current technology, and I'm updating stuff all the time.  
Me: It's all interchangeable. So you need to use Cursor's agents. To work onto code. You'll see what I mean this afternoon. As in, like, even with the code that you already have. Flawed code can work on the same code using cloud codes tokens without using cursor's tokens.  
Them: Okay? But Cursor is telling me that I'm out of tokens. I had to pay more. Okay?  
Me: Yes, you can. Downgrade Cursor. Absolutely. Yes. Yes. Yeah. Yeah. You can (Kate) You can click cursor anytime.  
Them: So then we can downgrade cursor after we get all the setup today.  
Me: But this is why I told you to not do GitHub copilot. Animal plan. So download if you haven't already canceled. GitHub copilot.  
Them: Because it's a monthly thing. (Kate) at any time. Right.  
Me: Because you're literally already not using that. Yeah, you're literally already not using that. But I will say that long run, there's a case for keeping both cursor and Claude code, because ultimately clot code is from anthropic, so it's always only going to use cloud as the model.  
Them: That's another one. Yeah, exactly.  
Me: Which right now is still pretty state of the art with regards to coding. And also cloud code as an application is just so much better. Than all the other coding agents that like it. Makes it worth it. But there's a case to be made for keeping Cursor, because Cursor has access to all the other. Models that isn't from a topic. Yeah.  
Them: Right. And just to be clear, I didn't mean we need to do that today.  
Me: And by the way, one version of the answer might be to not cancel anything because you are using everything.  
Them: I just spent when we're done with this project. And this rollout helped me consolidate all these SAWs, AI platforms because I'm all over the fucking place. I don't need to do.  
Me: Exactly. Exactly. At the end of the day, remember again how much you would have to pay a human to be able to do all of this?  
Them: Yeah, right. Longest paying for itself. I don't care.  
Me: Of course. We're trying to be as effective and efficient as possible. But it's always if the answer is if there's a trade off to how much less you would do without it, then it's a no brainer.  
Them: I understand.  
Me: Yeah. I think you paid for copilot, not code spaces.  
Them: Yeah, no, for ciera just saying I'm not confident yet in what you just said about canceling code spaces on GitHub.  
Me: Like you paid for, copilot. Yeah, at some point, yeah. So on GitHub, there's the existing payment you have for the organization that is inevitable. Like, if you want any codes.  
Them: I didn't even know that was a thing. Am I paying for code basis?  
Me: Code repositories at all. You need to pay for that. But there's paying for copilot credits that you had a subscription for.  
Them: Code. Pilot. Okay?  
Me: Yep. Okay. So. Okay, so once again, we'll be coming this afternoon to set up Claude code.  
Them: Okay. Yeah. So I. Consolidating your tv. Like we don't need hulu and sling and hp90s. We'll do all that at the end.  
Me: And then tomorrow, whenever, in your own time, start thinking about sketches. I'm going to post that in 30 minutes. Posted instructions for that in 30 minutes. Post your sketches any time of the day. It's okay if it's trick and scratch. It's okay if you're crossing things out and iterating on stuff. Tomorrow will aim to get the interface down.  
Them: Okay?  
Me: Makes sense. Yes. Will do. Understood? I'll send you again. You made an. You made a brilliant breadboard today. I'm just saying, like, if Neil were in the room right now, that would be his favorite out of all of this.  
Them: And then remember, treat me like an idiot and say, post it right here. You're not going to offend me with stuff like that. Right.  
Me: Not because it's perfect, but because it's, like, the right level of fidelity. Like, it's, like the right level of thinking.  
Them: I am an idiot. I already know it. Oh, my God.  
Me: This is the essence. And then basically under the essence is where we would expand on all the things that you talked about. But the way you thought about you boil things down to its essence. That's absolutely necessary. And I would encourage you to do that for every new feature that you think about, even on a quote generator. Okay. So, see you this afternoon. All right. Have fun seeing your wife.  
Them: Beautiful. Awesome. Thanks. I know. Right. Tell dina said hey. Hi, guys. Oh, you're in the car. Oh, ciera What's up? Oh, my God. You got to let people know when you're going to put them on camera, Seth. Jeez. Austin also doesn't follow the rules of, like, when you're driving in the car. Everyone knows. You pick up the phone and you say, hey, I'm in the car with Jean. How are you? Oh, my gosh.  
Me: Exactly. Exactly.  
Them: And then all of a sudden, I'm like, hi. Everyone 's like, oh, God. Which would be if they're going to talk shit about you. About, exactly?  
Me: I'm going to end this call right now.  
Them: Oh, my God. Awesome. All right, well, you be safe, because now you're, like, video editing in the car, so get off of the phone, please. Jeez. Okay? See yourself again, (Kate) 