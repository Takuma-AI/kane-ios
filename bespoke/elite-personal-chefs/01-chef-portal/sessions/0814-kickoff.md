Meeting Title: Payroll and chef portal workflow optimization with Lee
Date: Aug 14

Transcript:
 
Them: What's up?  
Me: Don't let my fireflies in. Kick it out.  
Them: You're muted.  
Me: Don't let my fireflies in. Click it. Go to kick it out.  
Them: Take firefly out.  
Me: Yeah. I'm very frustrated. I need to contact customers support. It keeps charging me every month. Even though my account says it's on free tier. And I literally just deleted my account and it still joined my meeting.  
Them: Look at this absolute mess that I've created.  
Me: That's awesome.  
Them: So let's say it all works, right? Everything works. But now migration, it's just completely up. I don't know how to fix it. The first thing it did was it erased all of them, put them all to blank. Like, just gone. And then I've been working through this stupid ass render terminal to try to get it all back with commands from this thing.  
Me: Yeah. So I want to make sure that we're not just bumping into this. Can we also just understand why this happened? Like I said that we made some database changes. That the old data just wasn't compatible with or what? Were you able to.  
Them: I don't know. When I ran this on localhost. It was perfect. However, it was dummy data.  
Me: Heard. Yeah.  
Them: Okay, so the dummy data was amazing. Every feature on here worked perfectly, exactly as I designed. It took me hours of work. That it erased all of our proposals, and I've been banging my head against it trying to get it back ever since.  
Me: So I think there's room for us to really understand what's going on. By asking the original agent that you worked with to make the changes in the first place. I think you should go back to that agent chat and be like this happened. Can you explain to me? Why? Because I'm pretty sure that that agent will know why.  
Them: I ran out of tokens. On that agent.  
Me: You ran out of tokens. As in you ran out of tokens? Or. (Kate) for that one model or. For the whole chat. Okay? So then someone else, like another agent, can look at the git history, the good differences. For those sets of commits, and it shouldn't be difficult for an AI to be able to tell you why. That database change happened Because I'm sure that basically, in a process of making all the feature upgrades and changes that you did, The interface changed how it worked. With a database data. So either the structure of the database changed, or in the migration process, it ran, or it put in a script that would reset or reload the database. Because changes were made.  
Them: Okay, so what I'm trying to tell Access thing is, I need to know why there's a problem so that I can fix it, correct?  
Me: Yeah, so that you know how to work with the AI to fix it. Otherwise, it's just going to throw a bunch of spaghetti at the wall. At you. To get you to try this.  
Them: Okay?  
Me: Try that. Try that. And in that process, You might bring more things. So like asking it to explain why something broke to you. Is not does not require technical expertise. To be helpful. Because by at least having a dummy mental model. Of what went wrong. You can have a gut check when it's proposing new solutions and new commands to you. You can have your own. You can build your own understanding of why that command would or wouldn't fix it. Does that make sense? Like, if it's telling you that the database changed and we used dummy data, then it's like, oh, duh, it's not that the data isn't there. Is that the interface isn't using the data. If it tells you that, oh, we run a script that reset the database, and then you're like, okay. Now we just need to load back the data in. Right now, you're kind of operating with just. Oh, the data is missing from the dashboard and needs to fix it. You understand what I say?  
Them: So spend time understanding the problem.  
Me: Y eah.  
Them: Okay?  
Me: It goes very far. In helping you actually solve the problem. As opposed to bang your head against a wall. Great.  
Them: I just didn't show anything. I'll send Neo money to the deposit.  
Me: Yes. Perfect. Thank you.  
Them: So let's go.  
Me: Yep. We're going to run with this. This is my new spaceship. I'm just kidding.  
Them: Give me.  
Me: Okay? So we have a tight agenda for today. It would be best if I could. If we could end this by 15 minutes. Because somewhere. And I think we can do it.  
Them: Okay?  
Me: So the first ask that I have. So here's a rundown. I want to spend the next five to ten minutes. Having Lee walk us through the last time he ran payroll. Are all the knickknacks. It's one thing to conceptually summarize what tends to happen. It's another to actually talk through what happened. This week. If that's appropriate.  
Them: Yeah. And then throughout the week, he's looking at sheets to make sure his payroll is going to be accurate.  
Me: Yeah. So maybe instead of running through the last time you ran payroll, It's like, what were all the knickknacks that happened this week?  
Them: Okay?  
Me: Or just pull out any remarkable incidents. There are like this week, as in this thing needed to be double checked so that we can actually get the substance. Of the problem. S. And then we're going to spend around 10 minutes. Talking about the problem. Epicenter Chef and I had a good roster exchange yesterday. I. I think I have a nerdy sense of what the epicenter of the problem is. And by epicenter, I mean, like, what's the one blocker? What's the one thing that if we solve everything else, just smooths out on its own? And then by the end of the meeting, what I'm hoping is that we could have a very, like, the very earliest sketch. Of what? The quote, unquote breadboard. This is what we call a breadboard. For the application we're trying to build would look like meaning. A breadboard is basically a list of the most core epicenter screens. Like, what are the screens that we need? And what do people need to do on each screen? Need to be able to do on each screen. And it will start with, like, five screens. Well, what are the five screens that if those five screens exist and they have the function like have the very simple human language functionality listed? It will solve the problem. So we're gonna take our shot at having a draft of that. By the end of the meeting. That would be the goal. It's okay. If we don't have, like, a version of that. That we have consensus on. It's more important that we have a stab at that. That makes sense. Okay? So, Lee, I know that I didn't give you a heads up before this meeting. So it's okay. If this isn't super organized. But do you want to share your screen? And just show us what happened this past week.  
Them: Sure I will do that now. What it is. Exactly that you want me to walk through?  
Me: Okay?  
Them: Okay? Go ahead.  
Me: Basically, it's one thing to look at the spreadsheet as artifacts is another thing to actually understand what it takes to go through it. And. And what getting you out of the spreadsheets mean.  
Them: Yes.  
Me: So I know that you kind of sprinkle throughout the week. You kind of just work on this? On and off, right? So what is. When is the last time you did something on a spreadsheet? Yesterday.  
Them: Yesterday.  
Me: Okay? So, from the top. Like, what triggered you to have to work on this spreadsheet?  
Them: Outside of. The state of the U.S. okay, so the things that trigger me. I get a shit ton of emails. Throughout every day that indicate invoices being created and whatnot. What triggers me to do something in the sheets which then moves me towards payroll is when I get an email that says that something has been paid.  
Me: Okay?  
Them: So I get this page, email. And I identify who the client is. I identify who the chef is. I identify.  
Me: And this would be a remaining balance. And that triggers me. And then I just happen to know that this one is Dan Castro. Because of clients. It's paula. Athlete. So this triggers me. Shut down castro.  
Them: Which is here. And I find the client. I verify the payment amount. This was a remaining balance. I know that our initial payment was 50%. The remaining balance was 250. So this is the correct contract number. I verify the amount of groceries and the amount of groceries is correct. At 192 94. I come in here, I green this out, yada. And this is set up for me and then I come back through here and just delete the seamless online. This signals to me client has paid their invoice. And these yellow fields signify to me that client has paid epc, but EPC has not yet paid Dan Castro. So I do that every time I get a paid email come in, and I do that for all of the different chefs and all of the different clients that have sent in paid invoices. And then on Monday.  
Me: Okay?  
Them: I go through and let me see if there's one that is easy to look at. Here. And every Monday. Yeah. Okay? So pretend it's this coming Monday. I come in here? And I see all of the yellow fields under Matt Cook, which tells me that these clients have all paid, but we have not paid him yet. And I go in here and just calculate all of this. Plus his gratuities. And I know that that is the amount that I need to go into square payroll and pay Matt Cook for that week. And that is the payroll end of it. The other end of it is that I come over here into this column. And add up. Well, first of all, I verify that these formulas are adding correctly and they are not. Because that is what happens. So I make sure that these are covering the correct fields. I take this number here? This one. 25.  
Me: Our KPI is.  
Them: Years that contributed through Matt Cook's contracts. And then I add up all of the KPI contributions. Or EPC commission contributions from all of the chefs. And that I produce our key performance indicator numbers for the week. But that's not related to payroll. That's for just our internal business performance tracking. But that is the other half of my Monday interaction with these sheets. So then after payroll gets run. And make everything here green so it looks like this stuff up here. And that tells me that EPC has been paid as far as boys goes, and then the chefs have been paid when they are owed.  
Me: Perfect. Give me, like, 10 seconds. I'm going to grab my AirPods because they're practicing for their air and water show outside. And it's like the plane. Yeah, no worries. I don't understand this. I don't understand this culture. Why?  
Them: Yeah. The amount of money spent on that is absolutely insane.  
Me: Yeah. And it's just creating noise.  
Them: Yeah. Noise, air pollution.  
Me: Crane. Okay?  
Them: It's wild. Contributing to the death of our planet through the insane use of fossil fuels. It's all crazy. But anyway, so that is my. Oh, I guess I could show you also. Do I have it open? I do. My weekly fuck. I have to pay Kennedy. God damn it. And this is my weekly tracker because I also need something where I can easily see these numbers. Square payroll system to pay everybody. And then also I need a place where I can calculate up all of the EPC contributions to get our KPI number for the week.  
Me: Okay?  
Them: So this is kind of like my little very quick and dirty working area so that I can get the numbers that I need to plug into square payroll and report out to the chefs for our key performance indicators.  
Me: So my question is, throughout this process, So there's two things here. Right. One is just the data pipeline. And operationally the man or dirty work of copy pasting this thing here. Copy pasting this thing there. And whatever. There's a second part of this, which I've heard you guys allude to, which is to identify and track down inaccuracies. Where human judgment is involved. Right. The first part is just about automating. The second part is about human judgment. And where are all the ways.  
Them: Yeah.  
Me: Where human judgment is there today. And it's important to identify those points. Because. It's very easy for us to over engineer. Automation solution. If we don't solve fundamentally the epicenters of the problem. Does that make sense?  
Them: Completely. So one of the major things that gives me heartburn every single week is that some of our clients may take weeks upon weeks to pay. And so every time I come into a different chef's sheet, I have to scroll up to see if there are any payments. From previous weeks that need to be included for this current week. Way far up. And I can miss them. That's very easy. It's a huge point. Of. It's a huge point of vulnerability and failure that can happen that I miss one of these. When I'm calculating payroll. In an upcoming week. The other thing is that I am not the one who is entering these numbers. So very often I will find as I am looking at the email that come through that came through, I either have to adjust the contract amount because it is entered incorrectly by the chef, I have to adjust the grocery cost amount because it was entered incorrectly. And I always use the actual email of the invoice that got sent and paid as the gospel, because that's the money that has come through. So oftentimes, I will have to make sure that those are correct. There's a point of failure on the part of the chef that may have inputted incorrectly, and then there's also a point of failure. On my side, whether or not I notice the error and correct the error.  
Me: I understand.  
Them: Correctly. Then the other point that is often confusing is after I have greened everything. And if a chef comes back and has a question for me, How did you calculate this payroll? Is it difficult for me to see afterwards how I actually calculated it? I just have to rely on the fact that I believe that these highlights are accurate. But everything can be affected because the chefs come in here and are in. Times per day. And if they move rows around or hide rose or whatever, it makes it difficult for me to go backwards and make a solid determination and feel 100% confident that I can tell a chef exactly what was calculated into the payroll that they got. Just because I'm not sure what may have happened between now and then.  
Me: What is the reason that they need to come into the spreadsheet? Other than they need to input what's on. They need to input the report.  
Them: That's the only reason that they come in here. But when they enter something new, they have to bear amount of manipulation because all of the templates are only set up with a little because each chef has a different amount of clients. So they come in here, they open up the space that they need. Hopefully, instead of just overriding manipulation that they have to do to put their client contracts.  
Me: Okay? Let me tell you what I'm thinking. Just without touching any code. Without building a new product experience. None of that. I believe that we can practically eliminate the manual labor that goes in here. And eliminate the need for chefs to come in here. To input the stuff. Just by refactoring a new spreadsheet structure. And building a very lean, zapier type automation with square. Because we can essentially have things. It's not even like the emails that come from Square, it's directly integrating with the square, with Square itself.  
Them: Okay?  
Me: Where all the records can just come in and automatically land in a spreadsheet.  
Them: Yeah.  
Me: With the chef name and everything. So. Initially, when I was thinking about this project, I was thinking about the epicenter of the problem being on the customer experience side, where if we make it easier for chefs to either get the client to pay or whatever on the spot, Staff's having the problem, especially with accuracy. I'm thinking that on the back end of you guys operating this.  
Them: Yeah.  
Me: It might. The trade off between we're at an introducing moment in history because the trade off between spreadsheets and building an app has always been at spreadsheets is a lot more lean. In that. Like, you can flexibly manipulate the rows. You can change anything, anytime. Even if we add some automation, it's all in plain English. The logic is on plain English. You can go into zapier and manipulate the logic and have the integration change, add a field minus appeal, whatever. We're kind of like at the frontier of the point in time. When it's becoming almost as easy. To change an app. As it is to change. Like a spreadsheet. I'm almost thinking that maybe for now, not because we can't build an app version. For the operations. But because we almost need the easy spreadsheet manipulation. In order to even learn. Or push our imagination of what that backend operation can look like. On an app and what is actually needed. Maybe there's actually fork in this project.  
Them: Yeah.  
Me: Where there's on one hand, the very lightweight interface for chefs to log in and get clients to pay. And we can also use the square POS interface. Out of the box. Where basically if they click a button, the clients will pay on a spa tip, whatever. Using the square POS that everybody uses. We can have that super lightweight front end application that just allows clients to pay. That's more of a client experience, innovation. On the back end. We still connect all of those invoices back to a spreadsheet. But a newly remodeled spreadsheet that wouldn't require any manual reentry. And it would just list out all the payments, all the whatever. In a way, that is, because right now this spreadsheet is designed for humans to read. The human readability. Is not the same as machine being able to manipulate it. We can optimize a spreadsheet.  
Them: Right? Yeah.  
Me: That is built for automation. And then have separate tabs that are that serve as dashboards that reference back to the sheetseta come from. The pivot table, then list out all the unique chefs and their payment or whatever.  
Them: Can I introduce one other use case scenario? I don't want to call it like an edge scenario because it happens every week, but it is a different scenario and that is we have a four man team. Maybe jesse wang. Yes. Okay, so this is a form in team. Eric, Riley, blah, blah, blah, blah, blah, blah. You don't need to know all of that. But they send a single invoice to this single client. And here themselves. Are ones who are inputting this. If we go down here to Jesse Wang, we see that the contract cost is split four ways. But each chef has input different amounts in the grocery cost, depending on what that particular shot actually contributed to. They went to the. Their grocery cost s. So this is the other main scenario that I deal with on a week over. From my perspective. I just have to trust that they have split these grocery costs.  
Me: Is it? So how does this influence things in a sense of. So one of them is responsible for creating the invoice.  
Them: Appropriately.  
Me: Right. That's how they have the aggregate amount.  
Them: One of them is irresponsible for creating the invoice. They all work together. To report back what their grocery cost for whatever they bought at the store, and then it is one of their responsibilities. To split out appropriately across all events and all other.  
Me: ciera How are, how do grocery costs in terms of calculation, how does that influence the payroll? Is that reimbursed separately, or is that just deducted from.  
Them: If included. It's included in their payroll, but it's added in. It's included in April. It's just included in their payroll. But we don't subtract an EPC commission out of the grocery cost. We only subtract the EPC commission out of the contract number. But that calculation is already done. In this formula that creates my number here, so I don't have to do any of that calculation on the fly. It's already factored in.  
Me: This is also one of the reasons why I think with the model that you guys work where it's not fully standard across the board, it's better for the back end operation to stick to spreadsheets. For now. Because it's more like. It's more easy to manipulate. However, we should redesign this spreadsheet. So I think if we make the spreadsheet manipulatable, as in, it's a spreadsheet, not an app that's hard coded. For something like this. The way it would come in, it's still that it would automatically land on a road that says that this invoice was paid. It would have those four names. There's a way for us to work around it. Where we have some kind of conditional logic and a pivot table. Where. Or something where. If it's these four names. It's split up this way. Or on that table. You just count the four chefs as a team, as a single chef, and then on the payroll, you separately calculate, but that's, like a isolated thing. Where you can have a dad like dedicated tab. Where it just tracks those four people, but it kind of, like, doesn't affect the workflow for the rest. And all you're looking at is a table that is just a list of all the invoices that have been paid that the chef has not been paid for yet. You understand? And then you check it off. You can click a checkbox to check it off. Kind of thing. We can optimize it for that workflow. Basically. Instead of optimizing it for visually, because data entry is not the same.  
Them: Yeah.  
Me: As visual interface. And right now, this is trying to be both, and that's why it's hard to automate on this spreadsheet. Press this.  
Them: Wherever we build allows for these grocery costs to be kind of fluid in this team. I think that it should be whatever. Yeah, we just have to accommodate that.  
Me: How much time? I was trying to save you. Like, how much time would it take?  
Them: One week air. Go ahead.  
Me: If you still have to manually run payroll. But when you run payroll, You're just looking at a list of here's how much you should pay each person, and you don't have to manually (Kate) or enter each of the payments. Throughout the week.  
Them: Yeah, well, I mean, that's part of my process, right? So when I go through getting. All of this information settled. Then entering it into service like a 10 minute process.  
Me: Great. So we'll make it just that. So that we can make that grocery split.  
Them: Right. So as long as.  
Me: That Notch Edge case that you're talking about. A part of this process. Like here, it just lists those four people as one unit. This is how much they're getting paid. And then you have a separate calculation for how much each version should have. And then eventually, we should smooth out that kink. Right. Operationalize something more standard, such that that kind of stuff. Doesn't come up again. In a future if you want to, like, truly scale and productize. Right. But we can do that one step at a time. Where, at the very least, operationally, like you're not manually creating new rows. And 10 chefs are not all at this on, especially at the same time. Manipulating rows. Does that make sense?  
Them: It does. The only other caveat that I would put in there is that what we should factor in the automation. Is that there will be occasions where somebody from that four man team might go on vacation. And so for a particular week, it might be a three man team or a two man team.  
Me: Yeah. You'll handle that. That's the point. And then you can do that judgment.  
Them: Yeah, but that's just the caveat.  
Me: There's still that element of human judgment. We're not automating that part of the process. Does that make sense? As for okay.  
Them: Okay? Yeah.  
Me: So right now, who creates a new client on the street, like the chef, right?  
Them: It depends. Yes, in theory. For all of our veteran chefs. They create new entries for new people, especially during. Because we have gone to a place where we are waiting a little bit to see if the chef is going to be successful with the client before we give them access to all of our internal systems. So it kind of depends, but generally speaking, it's the chefs that create the new entry.  
Me: Understood? Okay? So for now. So refactoring and building the automations around this spreadsheet is like a two hour task. That Leah and I, you can just. We can just sit down on a zoom call and just figure out. It doesn't take long. So we'll just bucket that on one side. Us? That's one component. To the project. And it's essential in that it saves you a ton of time. And that's all point of the project. But it is less of a sort of product experience or customer experience thing.  
Them: Yeah.  
Me: And more of the Operationally, how do we optimize the data structure in a way that allows for automation such that the spreadsheet is optimized for you to only apply human judgment where it's necessary? Now taking us back to the product experience side of the equation. In the context, from the perspective of the operations of the system. The main job of that experience, what I'm hearing, is that the invoice that comes in are accurate. So we talked about the spreadsheet automation side of things.  
Them: Yes. I'm ciera Can you rephrase?  
Me: When we then talk about the more chef and customer experience side of things. The main job of that, from your perspective, is to put in accurate invoices. Is that correct? And have people pay in time. Okay? So as far as a product experience goes, like the quote unquote Chef Portal,  
Them: Yes.  
Me: We need an app. That allows chef to one see their jobs. To make the clients pay asap. Three entered a variable that creates the invoice for decline to pay and see how much they can expect to be paid. Once that is done. So it's just a payment portal.  
Them: Yes.  
Me: Like the chef C or can create new jobs. Based on what they were assigned. They get the client to pay. And once the client pays, that invoice gets tracked on square and it lands on your spreadsheet. You see how that makes the app a lot simpler?  
Them: Okay, yeah, that makes total sense. In an initial state. Is just one additional nuance. It's not anything that changes anything significantly, but the nuance is that with a brand new client, There will be a deposit that gets sent centrally from sales team. That is, like, the first thing. And that happens before it even gets assigned to a chef. So a new client will have gotten a deposit invoice from the sales team, likely through the code generator, and they will have paid that deposit invoice. Before they get assigned to a chef.  
Me: This is why this is. What do you mean by first time?  
Them: But that's just the first time.  
Me: This is for the okay. What about private events? That's every time. Right.  
Them: Private events. That's private events. That's every time there is a deposit invoice that gets sent and paid before it gets assigned to a chef, unless it is an event that the chef has generated through their own network, then they will send their own deposit invoice.  
Me: Okay? For the sake of focus and discipline. I'm going to say that the worst case scenario for handling deposits. Is. That amount permit? Like, how is that amount currently factored in? Does the chef know how much deposit they paid?  
Them: Yes, we just recently made a slight. Previous it was 150%. So at the end calculated it was 50% contract wise. And so for sure, like the guest count goes up. Or additional cost get factored in. They know that it was 50% of the original contract cost. And so whatever the remaining balance is just is factored in. But more recently, we've been getting guests to pay a deposit based on a range. So it doesn't always calculate out. That deposit was 50%.  
Me: Yeah. Okay? So we need a way to let the chefs know how much deposit they paid.  
Them: Anymore.  
Me: So the worst case scenario. Worst case in terms of the first MVP of this app, the Chef, which is manually enter how much deposit the client has already paid. That's like, the worst case scenario.  
Them: The step up from that is.  
Me: Yeah. I'm just saying that as a layer of simplicity. In that, going back to that layer of process, we required a code generator having some kind of integration with this new app, and then having some kind of interface where when Amy assigns a chef to them,  
Them: Yeah.  
Me: It's kind of, like, marked as this invoice is related to that. Or that kind of thing. And there's ways to build towards that without making it fully that complex. It's not like we can't do that. With AI, it's very easy to build that feature. But adding that feature in this early on makes it makes the whole thing more of a tangled web.  
Them: Yeah.  
Me: And I want to make sure that there's a version of this we can ship that's super simple. That Chef can build end to end. That is just literally a payment portal. Where chefs can create jobs. Get paid. And that invoice gets to you and your new spreadsheet. Yeah.  
Them: Manual.  
Me: Like when they basically, when they create the job, they also enter how much?  
Them: In any way. A roadblock.  
Me: Deposit. How much it does was paid already. Like you have to tell them now anyway. So it's the same process.  
Them: The deposit was good.  
Me: So chefs get to log in. Or you can create an account for the chef.  
Them: Yeah. Exactly. Yeah.  
Me: For a new chef. They get to use the app, and we can make it like what they call a progressive web app, which means it's a website that they can add to their home screen. So it feels almost like a mobile app. You can always make it a mobile app in the future. But right now, that keeps things simple.  
Them: Yeah.  
Me: So chefs can just tap on their phone.  
Them: Right.  
Me: In their home screen and have access to this app. This portal where they can look at their jobs. Get paid on their jobs. Either get paid on a spot or be able to send the client invoice based on the same parameters. And a client pays offline. And I get to see their history of how much their cut is supposed to be. Based on that math. That's sort of like the delight feature, not the operational future. That's. How much. How much am I paid? How much have I made? That's that screen. That's like the cherry on top. That's a dessert. For us. But theoretically, that's, like, the easiest part. That's more of an interface design thing.  
Them: Yeah.  
Me: That's more of an interface design thing. Than anything. And then on the other end as, like, a separate module.  
Them: Right.  
Me: Will sit down for, like, two hours. To sometime next week. To basically build out a new spreadsheet, and we don't have to replace this spreadsheet with that spreadsheet. Until that works. Because we can always have data go into both. Does that make sense?  
Them: Understood? Yeah. Yes. That does make sense. Yeah, I think. Simplifying how the chefs enter their contract, and also in. To both enter the contract data. And kick off. Generating an invoice would be wonderful because right now they have to go to the spreadsheet, enter it, and then they have to go into square.  
Me: Yeah. Basically, right now, you don't have a centralized database of. These are all the contracts.  
Them: And retain that exact same information and send it out.  
Me: Right. The invoices sit on one hand. And then this spreadsheet is almost like an entirely, like a claimed process, like they're claiming how much the client paid. And then you're then verifying it versus literally when Amy assigns them a job. Well, eventually the code generator and all the other endpoints would allow Amy to directly assign the chef the job already. So. So that doesn't even need to create the job. But that's a future state. Right now. At the very least, the chef has a portal where they can type in, literally pull up their phone.  
Them: Right.  
Me: Not even their computer. Type in a customer name. Type in the parameters. For the contract and queue that up as a job report that make it super simple. So, Chef, you and I should leave. All of us. Next week. The first week, we're going to phone in on just an interface. Just the interface of this app, right? Like, what is that experience of the chef? Entering the contract. No data. No backend wiring. Nothing. We're not worried about functionality, just interface.  
Them: Yeah.  
Me: So the chef. So how does the chef enter the contract? How does it find the job?  
Them: Got you.  
Me: How does the chef get the client to pay based on that job? Week two will work to. We'll work together on wiring things up. That is the part that could come with a little bit more technical complexity and understanding. So for the first week, I want you guys to be entirely in the driver's seat in the sense of designing and making the interface mockups work. The interface being the actual code of the interface. The second week, we can co drive it. But the worst case scenario. Is that I can work on wiring things up while explaining how everything works. Does that make sense? So that that interface that you guys were in a driver's seat to create in week one is functional by the end of week two.  
Them: Yeah.  
Me: Okay? I've talked a lot. Did I miss anything? How are you feeling?  
Them: I am geeked. I don't know if I've given enough information for us to get started. I'm not sure.  
Me: Is there anything that you feel that I would need to know that I don't know?  
Them: I answered the questions that you wanted to get answered today or not. Think so. Describing our two use case scenarios, like a single chef. That's like the easy use case scenario. And then the chef teams are a little bit more complicated.  
Me: Shutting, are there?  
Them: And Nu. Currently, there are two chef teams. Where we just hired someone who might be taking on a success for jobs like plucking people out our chef pool and assisting him on jobs. And so he hasn't started doing that yet. That will be then a different scenario because those contracts won't necessarily split 50 50. There may be a different type of split.  
Me: So the question I'm going to keep pushing us to ask. Is what would happen if we don't build for that situation. And I think that for now, The shortcut answer to that. Is that we can basically treat Chef teams as one chef because one person still needs to be accountable. To reporting it. Right? You can't have four chefs each going into their portal. Each. Do that. And that doesn't mean that every time it has to be the same chef. It could be that they share an account. It could be that something like that, we could make things simple. We could allow do some simple way for people to be, for example, logged into both accounts. At the same time. So that they can so that they could both navigate their chef team. Account in their own account. For example. If it comes a case where somebody is both a part of a chef team and not a part of a chef team.  
Them: Yeah. And that is the case because some of the people on that four man team also have individual clients that they cook for on their own.  
Me: Okay? Basically, we need a layer. Where chefs can both be a part of a team and not be a part of the team. But we don't have to build that within a two weeks either. Because it's not. Easy enough addition. Yeah. So. Again. What would happen if we don't bill for it? Which we've done as one person.  
Them: Yeah. As long as there is a way for us. When it comes down to the point of calculating their payroll. Then, yeah, from the contract entry standpoint. And the invoice standpoint. The clients still only gets one invoice. The clients still only pays one invoice. The client doesn't necessarily care that it's split up in whatever way. That is just aberrations thing that happens at the very last step right before payroll.  
Me: Which we're going to keep at the spreadsheet level. Okay? Okay? I'm excited for a sprochy session. It's going to feel so productive. And mind blowing. That. I'm going to make that our treat that we put in the latter half of week two. Because I know that those are all solvable problems. Like automating a spreadsheet is not rocket science, and I'm excited for you guys. To get onto that. And think through that together. Because then there's probably, like, 10 more of your other documents and spreadsheets that you can re realize you can start automating.  
Them: Yeah, right. For sure. Okay, cool. Well, no, I think that I have communicated all of my process. And then also factored in some of my challenges and pain points. And really, it just comes down to.  
Me: Yeah.  
Them: I'm looking at hundreds of cells.  
Me: So let's remove that redundancy. Right.  
Them: And it's just human error, you know what I mean?  
Me: Like data doesn't come in twice. Doesn't come from two sources. Right. And you don't need to look at emails. So realize that an invoice has been set. You can just look at a spreadsheet and it's already populated with the invoices. That were created in a very well structured database on square. Like the clean data exists on square.  
Them: Yeah, right. Exactly. Right. It does. We're taking it into a giant garbage pile, which, I mean.  
Me: Yeah. It shouldn't require you to look at an email to verify that a transaction was recorded on a spreadsheet. So let's fix that. But then while we're at it. Let's also fix it. I was telling chef that this is equivalent to when the plumber comes to your house and they make you pay on a spot before they leave.  
Them: Yeah.  
Me: The pos that they have on their phone. We need something like that. Just, like, pay on your phones. Never been easier. Yeah.  
Them: Yeah. Absolutely. I love everything because I feel like it could really give me time back from every day. I could be used for more effective within the company.  
Me: So we're going to do that. I'll become programmers. Not just in a sense of programming apps. Like product interfaces. But also programming processes. Right. The principles in programming of don't repeat yourself. Like if you're saying something once. And code that into the system. So that you don't have to say it twice.  
Them: Yeah.  
Me: Let's make that happen. For all of our processes so that we're here to work on the business, not just in the business. Okay?  
Them: Yes, absolutely. I love it. I love it. If you need anything else for me, of course. Reach out and let me know.  
Me: I'm going to. Okay? The last thing I have to say is I'm going to send over based on this conversation. An early breadboard. Breadboard. Meaning like a rough sketch of what are the screens that would be needed and what people need to do on the screens. It's the only thing that I'll know about this draft is that it's going to miss something. Or it's going to miss something that is critical and actually non negotiable. So I'm going to send that over by the end of tomorrow. Or by the end of. Basically asap. Actually, by noon tomorrow. Let's put it up.  
Them: Okay?  
Me: And what will be really helpful ahead of Monday. Or when we reconvene to kick things off on Monday, is that we have our early opinion and edits to be made to that breadboard. And you'll see what I mean. So then. But Monday we can get started on setting up an environment where we can iterate on interface and really chisel that out. Okay? Perfect. Okay? I guess we're good.  
Them: No problem. I could definitely commit to that. Thank you. To get started, and this is absolutely going to be a priority focus for me. Feedback request will come back as fast as I can accurately give my feedback.  
Me: My recommendation for feedback, by the way, is also to put things up, put give the context to AI talk your feedback out loud. And have AI flesh out what you mean. So that you're being more precise. That goes for everything. But yes.  
Them: Yes.  
Me: Okay? Chef. Are you vibe pudding right now?  
Them: Got you.  
Me: My imagination of Chef's Day today, right now.  
Them: Excellent.  
Me: Is just like.  
Them: You're muted. Even though. Having me manually deploy everything. Now. What are you doing?  
Me: After yesterday. As then after I made some more product progress myself on other projects. I have more conviction than before that. I think next week. I should move you to cloud code. Hardcode, you would still use it inside cursor. But basically, you open up the terminal inside cursor, you type Claude, and an agent spins up within the terminal.  
Them: Oh, boy.  
Me: It's so much faster and so much more efficient. Not right now. But we'll get to it. Yeah. We'll get to it.  
Them: I can do that right now.  
Me: We'll do that on Monday. But I find it a lot faster. But there is some setup because you're not subscribed to Claude yet and whatever. So we need to set up the account and whatever, all of that.  
Them: Don't do it right now.  
Me: But I personally still prefer plot code. Even though cloud code is confined to just Anthropic's model and not chatgpt. A not GPT. It is operationally work so much better. For me. I need to go. I want to send me any screenshots.  
Them: Can I show you what I built?  
Me: Or send me, like, a video recording. Do you use loom or something? All right. Talk to you later. Exciting stuff. More coming. All right. Bye. Bye. Bye.  
Them: Right. Awesome. All right. Bye. 