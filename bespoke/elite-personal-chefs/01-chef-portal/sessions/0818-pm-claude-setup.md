Meeting Title: Claude code and terminal fundamentals for EPC booking app development
Date: Aug 18

Transcript:
 
Them: Which we are a lot of times in epc. A lot of times we are in reaction modes. Something happened. Or some new opportunity presented itself immediately, and we need something right then to capitalize on it. Or to fix the problem, and we rarely have time to strategically approach designing a solution. We just have to plow through. And so it's nice to actually be a little bit more aligned with traditional design process, where I'm able to take my time and think about things before I do them so that I don't get into the point where I'm in a lot. Where I have to make a very fast solution and make a lot of decisions. That as soon as I publish, I'm like, damn. I just locked myself into a whole bunch of things. That I'm not going to want to be locked into two weeks down the line because of all these decisions that I had to make. You know what I mean? And so having the time. To actually do true design process. Is wonderful. I don't want to say it's a luxury because it's what we should be doing all of the time. But most of the time things are just moving too fast and solutions are needed too quickly for me to really.  
Me: Well, I'm going to text. Jeff.  
Them: Look at things with a longer term view.  
Me: Because I know that I did shift to time yesterday. So maybe he thinks this is an hour.  
Them: Oh, yeah.  
Me: Okay? Okay?  
Them: When I talked to him earlier, he said 3:00. Which would be the correct time for him. Unless he thought he was talking in Chicago time. But usually he doesn't. Usually he talks. South Carolina time.  
Me: Cool.  
Them: Usually.  
Me: Well, to respond to what you were just saying, I had a conversation with Chef the other day, so I don't mind repeating myself because this helps crystallize. What we're about here. I think while we are at the dawn of. And I don't care a lot of people talking about this from this lens. Because a lot of people are talking about AI as leverage for automation and all that stuff. But I think what 's also happening is that we're hitting the point in time where speed and capability is no longer the primary bottleneck. In that. I mean, this was always the case for a certain subset of things that you want to make happen in the world.  
Them: Oh, yeah.  
Me: Right? Like if you are talking about coding as very specific information flow, it's always a case to speed and capability was not the bottleneck because a Python script can parse data much faster than a human could, right? AI. What this means is that a much larger subset of things are now on bottlenecked with speed.  
Them: Right? Yeah.  
Me: A lot of, like, cognitive tasks that used to require a human is no longer bottlenecked by speed. And it's almost like we're shifting our role as humans.  
Them: Right. Yeah.  
Me: From being in the seat of execution. To being in a senior programming. And programming. I mean, in broader sense.  
Them: Right.  
Me: In waiting room.  
Them: This is austin. ciera  
Me: Oh, okay. I understand why.  
Them: Oh, you're in the way. Oh, he says he's in the waiting room.  
Me: I understand why. ciera about that.  
Them: Do you see him?  
Me: I understand.  
Them: Okay? Yeah, I think she's taking care of it now. ciera Man, okay?  
Me: ciera about that. I forgot that users. I'm going to switch.  
Them: There we go.  
Me: ciera about that.  
Them: There we go. I thought you guys are running (Kate) I was just sitting in the damn waiting room. I know, right? She's like, do you think that. I think that Chef may have thought it was still at the old time? And I was like, no, he just said 3:00 when I talked to him, like 20 minutes ago. He just said 3:00.  
Me: ciera about that. It's my fault. I basically created the link from an old account ogmail account. So I thought I was smart by joining and then unjoining and then switch out to the account that I want to join this from. But then I only see the waiting room requests from the host. Which I'm here. I don't see someone popping in.  
Them: From the old account. Yeah, that makes sense.  
Me: But anyway, I was telling Lee that we were having a conversation about the speed versus getting to take a breather and actually design and think strategically through something.  
Them: That makes sense.  
Me: And I was telling him about how with AI we're basically shifting the role of humans from being in the seat of the Executor.  
Them: Yeah.  
Me: The seat of the programmer, not just in the sense of writing code, but also in a sense of defining what is the task that needs to get done. That in itself. Being the work, because once you've designed that, Actually getting it done is faster than ever. Whereas if you just go get something done, you'll end up being a lot slower. In the longer term because you're not making the right strategic bets. So it becomes a very heavy impetus for us to spend time on the strategic decisions upfront. Not because it's not important to go fast, but because in order to go fast, because the machines can just take those strategic decisions and run with it, we can now afford the time to think. Or not to think clearly, because otherwise AI is just going to generate a bunch of garbage.  
Them: Yeah. Right? Yeah, it's a shift. It does cut down the time, obviously. But we need to do more of a shifting of time. So we shift that time we spend into the strategy and planning.  
Me: Yeah. Exactly. You'll see the reason why. I saw our progress, and I was like, okay, I can see a world where we can ship this minimal first version by the end of the week is because I'm like, you'll be shocking to you.  
Them: And then the execution happens like that.  
Me: How much of the work? This pen and paper stuff really is, because once we've decided what it is, It's so easy. For Claw to just go and run with it. Okay? So I just went on a little walk and I did some little thinking, rethinking, based on the vibes this morning, of how we're going to run this session.  
Them: Yeah. Awesome. All right.  
Me: I think instead of starting off from installing Claude code, We're going to have chefs share his screen. And we're going to start from the absolute fundamentals.  
Them: Okay?  
Me: By literally opening a file called index HTML. Typing in. Typing in. Hi, I'm chefy. Deploying it on render, and then we can go back and open Claude and all of that to make it fancy.  
Them: Okay, beautiful.  
Me: Sounds good. Okay, Chef, raise your shirt.  
Them: Okay?  
Me: Yes.  
Them: That sounds awesome. Yeah. Ready.  
Me: Okay?  
Them: What do you mean? Okay?  
Me: Perfect. We're going to come back to this.  
Them: What do you create in? I just did this.  
Me: Open terminal. No, this is correct. This was the right one. And then when you type wsl. Windows. Service for Linus Linux, Something like that.  
Them: And what does that mean again? Wsl.  
Me: Yeah. So it's Linux within your computer.  
Them: Yeah.  
Me: Yep. The formatting, it looks like a Mac, right? It looks similar to the Mac formatting.  
Them: Windows service, Linux. Going to move me into Linux, and we know that right here. Okay? Yeah. Is there anything that you want me to be mirroring on this side? I'm on Mac.  
Me: Yes. It depends on how familiar you already are with the basics of deploying something.  
Them: I have designed and I've designed and deployed websites since the beginning of the web.  
Me: Exactly. It might be helpful. Actually hold. Let's go through this ones first. I think it'll be helpful to follow along when we get to Claude. Okay, so now we are going to type. Remember, how do we get to the root of the Linux directory?  
Them: Okay? Cool.  
Me: Cd something.  
Them: How do we get to the root of the Linux directory?  
Me: Yes.  
Them: Hold on. I've been taking notes. I might have that somewhere. Cd is directory.  
Me: Directory.  
Them: Is it? Call directory.  
Me: Yes.  
Them: It's change directory.  
Me: But right now, if you look at the path, it says MNT C, which means we're still in the Windows file system.  
Them: CD blank sister. Here, go into folder.  
Me: Right.  
Them: Okay?  
Me: So we need to type something after CD to get to the Linux root. The little squiggly line.  
Them: Okay? Oh, yeah. Hold on.  
Me: So the squiggly line basically gets you to the root of the Linux file system.  
Them: Now tell me what this little thing does. Okay. Root of Linux file system.  
Me: Y es. And now we're at the root now.  
Them: Okay, never mind. All right. Cd swiggle.  
Me: So what do we need to do to figure out to list out everything that exists inside this directory?  
Them: Now we're at the. Make folder cd. It's that last command you got there. Get checkout Main ls.  
Me: I'm just going through the. I'm just drilling it through again, just so we have the basic understanding this is less stuff that we're going to need to manually type in the future. But the computer, the cloud, is going to type this a lot.  
Them: Look into the folder and see what's in it.  
Me: So it's good to be familiar. Okay, so we see projects, right?  
Them: Hold on. Let me put this then to the wrong spot. I don't have all this shit memorized, people. I got to take notes. Right.  
Me: Yeah. And again, this is more about. We don't need to be fully fluent in this. We just need to know what the machine is doing. Like when Claude tells you that it's running a bash command and it says like CD ls, whatever, it's good to know what it's doing.  
Them: And entirely other career, so it's fine. You have to take notes. All right. Yeah.  
Me: Because you're about to see this a lot.  
Them: Know what that means.  
Me: Okay, so now we're going to change Directory into Project S. So we're going to basically imagine we're like a little avatar, like a little pixelated avatar, and we're, like, walking down different paths in a maze.  
Them: We're going to change the directory. We're going to change the directory into projects.  
Me: And we're going to change directory into projects, which was just listed. So what do we type? Yes. You got it. Okay, so now within projects. We're going to make a new folder.  
Them: So these projects.  
Me: Y.  
Them: That's mkdir. Projects.  
Me: Eah.  
Them: What that gets me into. Project. Okay. And then we're going to make a folder.  
Me: We need to name it. So make directory. What's the name of the directory? Let's make it.  
Them: Make directory is really what that means. CD it? Well, you have to name it.  
Me: No space.  
Them: Make directory.  
Me: Unless you put, like, quotation around it.  
Them: Tell o sheffy.  
Me: No hyphen works.  
Them: No space. Or if you do a hyphen's account of the space.  
Me: Okay, so now if you type LS again, you can see what's in there. So now, you see, within projects, there's EPC booking and there's. Hello, Chefy.  
Them: Name it something. And now what's inside of that? First thing, what's inside of?  
Me: Right. So now you go into. Hello, Shafi.  
Them: Inside a project. There's epc bookings.  
Me: Y.  
Them: Yeah. So go into a cd. No space.  
Me: Now we have a new command called touch.  
Them: Oh, my God.  
Me: This basically creates a new file inside a directory.  
Them: All right.  
Me: So you say touch index HTML.  
Them: Such index HTML. And that means make a HTML.  
Me: Specifically? Well, no, it's not about the index of the HTML index. It's just a naming convention for basically the homepage.  
Them: Index. Yeah. So touch. Index.  
Me: Y.  
Them: HTML, no space.  
Me: EP inside. Hello, Jaffe. So now if you LS within. Hello, Chefy. You can see what file exists in there.  
Them: Index HTML. Okay, so I'm making an HTML file.  
Me: Exists, right?  
Them: Correct. Called index.  
Me: Congrats. You just created your first file. Let's go into this file. Let's do. Let's see. What's the best way to open this? I'm going to give you the most simple, like, the most already friendly way for you to understand this. So you go to File Explorer and you find this file. There's a plan for you to open this. Find index HTML on your computer.  
Them: Go to.  
Me: You could also just open it from the command line.  
Them: Go find. Hello, sheffield, my computer.  
Me: So if you type in notepad, exe space index HTML, that's like opening index HTML with notepad, which is the text editor. On your computer. So. Yep. And then index HTML.  
Them: Say that again. Notepad exe. Space index HTML.  
Me: The text editor.  
Them: Okay, so hold on. Notepad is basically. Open notepad. Editor.  
Me: It's crazy how little has changed.  
Them: This is amazing. I feel like I'm in 1990. Amazing.  
Me: All right, so now this is your index HTML.  
Them: I know.  
Me: You can see that it's currently blank.  
Them: Wild.  
Me: And it's like. Lee, it's so funny how you're mentioning that. It feels like you're in the times before I was even born. But it's interesting because it's the exact same stuff. That AI Is now doing, except it's doing it in, like, advanced ways. It's just good to walk through it at least once, right?  
Them: Yeah.  
Me: So you just open index HTML in your notepad. Okay?  
Them: I'm going to grab some water. ciera Boring for you, Lee. No, this is not boring at all. I just need some water because it's freaking humid and gross.  
Me: Open notepad. Yeah. All right, so now type in here. Have. You know, the HTML tag, like the sharp little parentheses. No.  
Them: Yeah.  
Me: X1. Act one.  
Them: This one.  
Me: Tag heading on. Yes. Close tag.  
Them: Again.  
Me: Close it. No.  
Them: H1. So heading one. Then close it.  
Me: Just after. So, like every HTML is enclosed by the h1 tag. And then just type, hello, Jeffy.  
Them: Bad.  
Me: In front.  
Them: And then you would do this.  
Me: This is the only time you're going to type this manually, okay?  
Them: Right. Are you writing? HTML? Tag front. Oh, my God.  
Me: And then, just for fun, we're going to add a paragraph tag, too.  
Them: Wild. Just for the hell of it.  
Me: That's fucking great.  
Them: This is fucking great.  
Me: All right, wait. I'm going to take the screenshot. This is awesome.  
Them: Amazing. I love this. This is hilarious.  
Me: Okay?  
Them: This is a wild. I love it. I love it. I remember when Dreamweaver came out and I didn't have to do this anymore.  
Me: I am young enough. Where my computer class? We were already working with Dreamweaver.  
Them: That was amazing.  
Me: Which still feels like ancient history right now.  
Them: I know, right? I remember working at my first graphic design job. On Photoshop version one, where there was no undo, no undo's.  
Me: Work on something. Yeah. Great. So command s or whatever on Windows that helps you save the file.  
Them: For hours. Make a stray line and it's done. Over.  
Me: Like file save. I don't know how you save a file here. But file. Control. S okay. Great. Now. Go back to the terminal.  
Them: I think it's your file. Say Control scene.  
Me: So this file exists.  
Them: Control. Okay?  
Me: Give me a second. Okay? So now you can control C to exit. That means close. Everything in a command line, including later on with Claude code. The reason why I'm emphasizing on the terminal is that cloud code is a terminal based AI agent.  
Them: That means close, right?  
Me: Yeah. Imagine. Okay?  
Them: Okay?  
Me: So do. And then now, just for fun, type start, index HTML. Oh. Jim. Give me a second. What's the command for a wsl? For starting index HTML. Inside wsl. It's okay. That's fun.  
Them: All kinds of stuff happening. What are you doing? Working at another project in the background. What are you doing?  
Me: Do explorer exe index HTML. So that's just using Internet explorer. Whatever. Explorer exe. So that's using that to open index HTML index.  
Them: Yeah. Isn't I exploring? Explore and then hide in here after that.  
Me: Yeah.  
Them: Okay? So exe means execute, right? Correct executable.  
Me: This is your web page. It's great. Okay, go back to the terminal.  
Them: Look at that. Beautiful.  
Me: All right, now git init. So that's initializing git. So you're making this folder called hello, Jeffy. You're now making this a git repository.  
Them: I want to buy one.  
Me: So go back to terminal. Get.  
Them: Right. There, so get in it.  
Me: The folder specifically, it's for directory, so it's for folders.  
Them: Make the thing just created.  
Me: To become tracked by git. Okay? So because we're going to use render.  
Them: Okay?  
Me: With space.  
Them: Get in it. With a.  
Me: Great. So now we've initialized a git project inside this.  
Them: Get face. In it.  
Me: We're going to do. Git. Add. Index HTML, so that adds index HTML. To the git tracking. And then we're going to say, git. Now, this is going to look familiar. Git space commit. And then a hyphen, a space, a hyphen. M. That's where the message. And then M for message.  
Them: Wait. ciera Git. Commit space.  
Me: Space. And then open quotation mark, close quotation mark, inside the quotation mark, you're typing in your commit message. So just say, hello, Chefy, or something like that. Close quotation mark. Enter. Okay?  
Them: I'm going to be showing. I'll throw the unknown.  
Me: Type in copy the git config global username, your name thing. Paste that in. Yep. Sure. But change it to Chef A or something.  
Them: I (Kate) the copy pasting.  
Me: This is good. We're building up from scratch. Sure. It helps with.  
Them: This frill the only real stuff in here.  
Me: The GitHub integration. Yes. Okay. I don't think sure.  
Them: I might as well put what's in there. Isn't it like Chef Austin Yandzi?  
Me: I'm not sure how. I'm not 100% on how much disasterly impacted. But it doesn't hurt, okay? Let's go.  
Them: Hold on. Let me just check and make sure, just in case. How we spell it. Oh, yeah. I don't remember what it was. I think it was all one word. It might be all lowercase. It is. I don't remember.  
Me: Okay, now up arrow.  
Them: Trying to get in worm fucking hole later. I have to figure it out.  
Me: Or the commit. To where the commit is. Great. Okay? So now that we're on GitHub, we're going to have you create a new empty repository.  
Them: Oh, there it was. Oh, yay. It did it. It worked.  
Me: On GitHub. Yeah. You're creating the Google Drive folder. So you see the green new button on the left?  
Them: We're creating an empty repository on GitHub.  
Me: And then you can name it. Hello?  
Them: Okay?  
Me: Jeffy. Okay? You don't need to describe it necessarily. We're just testing something. Go down, create repository. And make it private. Just. Public. Doesn't it? You can change it. No, you go to Settings and you may change it because you already made one.  
Them: Okay? You're back.  
Me: So go the right arrow to where you were.  
Them: Okay, fine.  
Me: Yes. You go to settings.  
Them: Now.  
Me: Just so you know where to change it. I think you go scroll to the very bottom. ciera if this feels like it's starting slow, but we'll ramp up to it.  
Them: Yeah.  
Me: The very bottom. That's great. Change repository.  
Them: I'd never have known any of this until right now in my life, so it's great.  
Me: Change to private.  
Them: What am I looking for? Yeah, that first one under danger zone. Chef.  
Me: I mean, you'll be grateful for it when you need it.  
Them: Heat, sex, all of the security.  
Me: Okay?  
Them: Awesome.  
Me: Go to code.  
Them: Yeah.  
Me: This is what you're more familiar with. So you see that line that says get remote, add origin, blah, blah, blah, blah, blah down there? So copy that.  
Them: Do you see it? Copy? I don't know. It says. Didn't say. It's copied. Let's try it this way.  
Me: Then go back to the terminal.  
Them: Coffee.  
Me: There we go again.  
Them: Okay?  
Me: All right. Your personal access token. That you emailed me.  
Them: The username.  
Me: Remember this?  
Them: Oh, yeah.  
Me: We'll mostly not have to do this in the future. This is just useful to have.  
Them: When the hell did I do that? Let me just go look in the Synth, I guess.  
Me: There you go. The first one. Okay, so now if you go. If you go to GitHub.  
Them: Let me look at this real quick. Control. Close everything. Command line.  
Me: We get in it? We did the get. I can send you these nodes afterwards.  
Them: What do we do after that? I lost my place. Taking notes. Damn it.  
Me: But I know that even writing it in itself is helpful. So you went to GitHub and you created the remote repository. And what we just tried to do is we pushed the low co repository up to the remote repository, so now those two things are related.  
Them: Okay? And made a new repo.  
Me: And then we pushed the local stuff up.  
Them: And then make it private.  
Me: So if you go refresh the GitHub page. There might be an issue. There just.  
Them: Ly GitHub.  
Me: Yeah, there might be an issue there just now. Where? Yep, there we go. So you see index HTML right there. Yep. So now repository exists on GitHub. So now open render. Where like five minutes away from being done with this first step.  
Them: Yes.  
Me: So go to render. Yep. Log in.  
Them: Know why I'm logged out.  
Me: Did you connect to GitHub or something?  
Them: But bullshit.  
Me: Okay? So now you go to your workspace, like go to your home. I should have just clicked the top left corner, I think. Add new so on render. Adding a static site I think is free. So you click on static site. Which is what your HTML file is. And then you can find. Can you look for chef? Hello? Shafi.  
Them: Really? Render. It would have been right there underneath it.  
Me: I think it only connected to the organization account instead of your personal. King for a second. Yeah. Look at it right now. But an alternative is that you could literally just carbon. You can literally just upload the index HTML file and I'll do the same thing. The benefit of linking it to GitHub is to auto deployment thing when you make adjustments. So I think there's supposed to be. Let's see. A section here for GitHub. So if you go to GitHub, Go to slide. I think personal settings. Is there something called applications? Authorized GitHub apps.  
Them: Yeah.  
Me: Render. Yeah, click on it. Scroll down. Permissions. Okay? So. See, it says that it's been installed only on two accounts. So it hasn't been installed here yet. Go up. Go back to where we were. Just a back button. Try to go to installed GitHub apps. Up there. Visit or like my GitHub apps.  
Them: Install GitHub apps.  
Me: Or something. No. Go back. Yeah. Try to loaf a render.  
Them: Visit Marketplace and try to grab.  
Me: Okay? No. Give me a second. Okay, let's try going to. Go into render. Account settings. There's nowhere where it says. Is there nothing here that says GitHub? There you go. No. Okay? Yeah. But you already have that. So click. If you click on that, see what's there.  
Them: Git deployment credentials.  
Me: Scroll down. If you go on workspace settings down there. The last option on the menu.  
Them: Works.  
Me: Doesn't matter.  
Them: Hobby.  
Me: If you go back to the new service flow. Can we try something? Yeah, Go back to service. So click top left. So this is render home. If you just click add new. Static site again. There's no other option here. Is there? Click. You're looking for. Hello, Chefy. But that's under a chef Austin Yancey, and that's not under Elite Personal Chefs, which is the account that your gender.  
Them: What am I looking for?  
Me: Is related to. So we're just trying to find. This is a navigation thing. We're just trying to find. Where on vendor do you change the setting? To add additional. Like we're trying to get render to register or to be connected to your personal repositories. Right now it's only connected to your organization repositories.  
Them: Rendering at what.  
Me: So it's just. A navigation thing, like somewhere on this dashboard. You can edit that. Let's see. Okay? I found a link. Try this. I'm going to link it in the chat here. Continue. The first one. The first one. Repositories? Yes. We have hope.  
Them: This one.  
Me: Yay. Okay at neo. Static site. There we go. Hello, chefy. Okay? Scroll down. You basically don't need to set any of this. Deploy static site. All right, now click on that link up there. Scroll up. No. Scroll up.  
Them: All right.  
Me: Hello, chefy. Unrender. Com. That is live on the Internet. So from end to end, he went from creating index HTML to deploying it on the Internet.  
Them: Oh, this?  
Me: And what we're doing with deploying a much more complicated app is just this, except with much more bells and whistles and more like, integrations and wiring and all of that.  
Them: Yeah. Yeah, right. Old school away. Yeah, but like, Lee and I will get because I don't want to waste time being like, what is ls? Why does that say ls?  
Me: That's it. You understand what it is? It's just listing out all the things exist inside a folder.  
Them: I don't want you to think that it's a waste of my time at all. Chef. Not at all a good level set for me because I haven't done that level. Of interaction with web directories. Since the (Kate) 90s, right? Because for so long. We've had pieces of software that do all of that back end stuff for us, so it's a good level set refresher to understand what all these pieces of software that I use are actually doing in the background. So don't think that this is.  
Me: Great. So now we're going to get a little fancier. We're going to ask. We're going to act as cloud code for the first time. So now imagine that it's the same deal where you're in the terminal, you're giving instructions to the computer. Except it's 2025, and instead of saying make mkdir, you're putting in an AI prompt. And there's an AI agent that basically lives in your computer and has access to all of these files. And it can go CD infinitely to, like, all kinds of complex stuff.  
Them: Yeah. Okay?  
Me: The AI agent can do that for you, and therefore it can understand, read and write files for you. That's what cloud code is. Like it's an agent that lives in your computer. That can access and read and write your files.  
Them: Hold on. Right this.  
Me: So that's why it's so powerful as a coding agent.  
Them: Yeah.  
Me: Because that primitive of, like, you're in or, like, the foundational, like, the reason why I'm, like, taking us back to the 1990s.  
Them: Okay? Yes.  
Me: Because by understanding the first principles of what it really is, what does it really mean to create a file on your computer connected to the Internet and deploy it such that it's live on the Internet, on a Web server? Right. That primitive. And then you realize how with all the bells and whistles and all the complexities, it's the same.  
Them: Right.  
Me: It's just that there's levels of abstraction on your computer such that when you say, when you put in a giant AI prompt,  
Them: It's the same thing. Yeah, it's just able to handle. Okay.  
Me: The AI is then doing a cd and mkdr and all of that for you. Yeah.  
Them: It's doing all of that background. Yeah.  
Me: Yes.  
Them: So when we were dicking around with this last time, (Kate) and took you a minute to figure out this should have been this.  
Me: Yes. So the MNT upfront means that you're in your Windows file system. The bash little curly thing is indicating that we're inside your Linux system. Okay?  
Them: Look inside. Looking this and that doesn't list.  
Me: So I think that on Google Meet.  
Them: Open this.  
Me: So I think on Google Meet, it's allowed for multiple people to share their screen at the same time.  
Them: Project folder.  
Me: Right. I don't know. Okay. So, Lee, do you want to also share your screen?  
Them: I'll show up at once. But whoever is active will take over the presenting.  
Me: Because now we're on to cloud code.  
Them: Sure. Beautiful.  
Me: And by the way, do you guys. Are you guys busy or need to run off to anywhere?  
Them: Let me move this over here so that.  
Me: Okay, great.  
Them: No, this is it. 'll be here all night. I don't care how long it takes.  
Me: This is great. Basically, I thought about it. Originally, we were going to start from Claude code, and then I was like, no, I think we need the fundamentals.  
Them: So if you didn't have anything you had to do.  
Me: Okay? Let's. Ok, so let's actually do it on Mac first, then. Did you explicitly stop sharing your screen or did you just. Yes, but it's okay right now. Let's have Lee do it first. So we're installing clause. I did that on my computer and paid for it and everything already. I guess I went. Link that you provided what you provided in this feed. Initially. Yeah. So you installed it from the terminal? Okay?  
Them: Provided instructions.  
Me: You just paid for it. Okay, so cloud code is not what we're accessing on the computer. We need to install the software.  
Them: Now. Whatever.  
Me: But you need for the fee in order for you to have the token limit that you would want. But to install it. It's like a package that we download from the terminal. So there are packet dependencies. Lee is going to be able to download it, and I think.  
Them: Since I already paid for it, he's signing in as me. Or.  
Me: Sure Lee can sign in as you, but actually, you can sign in as you, too. I'm not sure if it allows multiple computers. But I think there's a $20. A month version, too, actually. Do you want to just have. Let's actually just do it with Chef. First. So that we're signed into the right account. And then we'll see if Lee needs to sign in on the same account. Or maybe it's available even for the $20 a month account. Too. Yeah.  
Them: Okay? Yeah.  
Me: Okay, so let's level set a little bit. Anthropic is the model company that creates Claude. Claude is an AI model.  
Them: Okay? Went. I clicked on your link. And I went in and I tried claude.  
Me: When you click try clot. And when most people talk about cloth, they're talking about the ChatGPT like interface which you saw just now. Like the good act in Austin. Whatever. This page. Claude code is a different application that they built with cloud, the AI model. The AI model being the brain. And you can see on the right they kind of have a terminal open and cloud code shown inside the terminal. Here. So this is a terminal based application where literally in the command line. Instead of writing cd, you're typing Claude, and that launches Claude. Inside your terminal. That's. So what we're going to do is we're going to go to open your terminal.  
Them: Close, okay?  
Me: And then. Let's see. Paste in this command. That's for downloading node JS.  
Them: That's a lot of cat.  
Me: Which is a package dependency. Yes.  
Them: Okay? There you go.  
Me: So this is the package dependency for cloud code in order for it to be able to run on your computer.  
Them: Okay, this is blue 1, 8, 2.  
Me: Then you're going to paste in this last line. Once this is done. So npm install anthropic AI cloud code. That last line. Yes.  
Them: There you go. It looks like it's ready for you.  
Me: So now it's installing cloud code. Operating system.  
Them: Rejected.  
Me: Tri Pseudo and then the same thing. All right.  
Them: Is it going?  
Me: Okay, we're going to try something different.  
Them: To do instructive.  
Me: Oh, wait, no. I thought that was an error.  
Them: Spinning wheel of death.  
Me: Excited. Like control. C, we're going to try something different. Okay?  
Them: Pro c. All right.  
Me: So you're going to first.  
Them: Let's control a little upward arrow thing. That's cool.  
Me: Go back to the root of the Linux system.  
Them: Interesting.  
Me: So remember the dot dot that go back up one level. No, as in the full star, full stop, like cd.  
Them: Project.  
Me: Remember that. And then double. Yep. And then cd dot that again. So now you're back to the roots, right? Now.  
Them: Space.  
Me: Enter this. Basically, we're going to fix the NPM settings such that it always has permissions to do stuff. And then we're going to do this.  
Them: There you go.  
Me: I paste it in a command. For two more. Two commands away. From having Claude be sentient on your computer. You did something right.  
Them: And then, without getting something wrong, by signing up where I signed up, I paid for the monthly.  
Me: Because you're going to sign in later. Like once you launch Claude on your computer. It's going to make you sign in. It's not going to let you go forward without paying. Don't worry.  
Them: Okay, great.  
Me: And then one final command before we run that NPM install again.  
Them: Okay?  
Me: All right, now up arrow back to the NPM install line.  
Them: Environment.  
Me: No need. The whole reason why we did it is such that we don't need to use pseudo. Further up. This one. This is us installing Claude code.  
Them: Okay?  
Me: For? Let's see.  
Them: Can you say?  
Me: Or lean. Do you know if you've had no JS on your computer? Have you homebrew. Let's see.  
Them: Most likely. Nah.  
Me: Yep, it is downloading.  
Them: Okay, I got spinning wheel.  
Me: If it's not, it's either going to bounce you an error, or it's going to exit. I'm giving passing the instructions to length.  
Them: Passing the instructions for ability. Okay?  
Me: Terminal.  
Them: And I am bringing that into. My terminal over here. Okay? Yeah. That jazz going. Okay? What am I going here? Maybe let's switch to need. Over from austin. Okay?  
Me: Yes. You can just paste it in.  
Them: Just paste it in.  
Me: Yeah. It says it could take two to five minutes, chef.  
Them: Good idea. Because I just got up, that's why.  
Me: It's the whole thing.  
Them: All right. Susan charles. Got it. Understand? Got it. The whole thing got. Understand? Got it, Got it. Now. I am there. Warning. Second PC password. Need to go access.  
Me: Click Enter and see what happens.  
Them: I am administrator.  
Me: Okay, you don't have home brew yet, so you need to go back up.  
Them: Admin. Boy.  
Me: Let's see.  
Them: See what happens.  
Me: We're going to have you install it anyway. And then you'll decide. What do you want to do the $20 a month to at least have access to. Playing with it. Shaft. Do you want to check on a status? Whenever you have 10.  
Them: Understood?  
Me: No, not errors. It ran. Down there, see? That's from before. So I ran out of three packages. Okay, so now I'm going to show you something cool, so.  
Them: Oh, it is. Yeah, you're right. Cool.  
Me: Look, I have both of your screens up on my screen. This is great.  
Them: Two packages are looking for funding. Yeah, you and me.  
Me: So for chef. Now type claude.  
Them: Oh, my God.  
Me: Enter. Welcome to cloud code. Okay, so basic navigation. Basic navigation. No, it's. It's good. It's good. You hit enter, right? Oh, yeah, it doesn't matter. So you can hit the number or you can, like, hit. So basically, you see that little arrow on the left? That tells you which? No, when, whenever. It's showing a menu of options to you. You see that little arrow?  
Them: No saka. Go back. Two. Whatever.  
Me: So that shows you what is currently selected. So if you go up, down, arrow. You can select a different thing and you hit Enter to select it. So that's like the basic terminal, like, selection.  
Them: Okay?  
Me: No. Let's see. Oh, perfect. It didn't open automatically, so use the URL. There. Click on it. So this is where the account that you just made. Is going to be registered. So copy that code. Go to the terminal. Yes. Sure.  
Them: Copy that code. Back to here. Wait. Here.  
Me: Can you not paste it in there? Enter.  
Them: Can't do anything. What am I doing here?  
Me: Okay, did you choose use your subscription or did you choose user API key? You set user subscription, right?  
Them: Okay?  
Me: Yeah. So it was using your subscription. Okay, perfect. So every time it's showing you stuff, you can just hit enter to continue. That's just like the interaction pattern. This is like learning how to use a game controller.  
Them: The first one, Number one.  
Me: Yep. You trust cloud code, so execute files in this folder. Great. Now, you see that box in the bottom? That's your prompt box. The best way, because typing in a terminal is annoying. So the best way to do it is whisper flow, where you just hit your shortcut and just talk. For example, let's just say that you want it to add a bunch of cool styling to that landing page you just made. Let's see what it does.  
Them: I want to add a bunch of cool styling to the landing page I just made Claude.  
Me: Elucidating. What? Let's see. This is something. Where? Why is this opening in Powershell? Is this? Okay, Go back to the right terminal.  
Them: That's what I said earlier, is the wrong terminal.  
Me: Yeah. Yes.  
Them: Well, it was.  
Me: Wsl.  
Them: Two terminal. Yes. Open.  
Me: To now launch Claude.  
Them: And then it goes to Windows, PowerShell.  
Me: Just type.  
Them: And then we made it Linux or whatever.  
Me: And then just say that again.  
Them: And don't go, okay? Make a bunch of cool formatting to hello, Chefy that I made.  
Me: They'll figure it out. Worrying.  
Them: It felt around.  
Me: Lee, you'd want to look at this. Anthropic is just quirky. It just likes to.  
Them: What? Worrying.  
Me: Enjoy. So you see that little bracket? So, Lee, you might be familiar with this. So this is like a pattern for calling a function.  
Them: It's coming along.  
Me: So the AI agent just used a function called search. So search for files in this folder that has index HTML. But what's cool is now you can start a second terminal. Wait. It's in a wrong directory. Why is it in the wrong directory? Oh, okay. I understand now.  
Them: Worrying.  
Me: ciera We forgot the thing again. The cd, curly. Okay? So, yeah, we can go back.  
Them: I didn't say it right.  
Me: So the way to escape out of this.  
Them: Not bad. I was trying to say we're in this thingy.  
Me: Guess.  
Them: Too.  
Me: And he has a Hit it again. You see the little tip? Yes.  
Them: Control c.  
Me: And then claude.  
Them: Yeah. Serial. I really want some awesome formatting. And the landing page. Hello. Happy that I created.  
Me: All right. So what's cool is now you can actually launch a second tab.  
Them: Finagling. Hilarious.  
Me: Oh, actually, look at the first tab. Look at the first tab. It just made some to dos for itself. Add modern styling with animation ingredients.  
Them: Here. Oh, look at that.  
Me: Improves.  
Them: Adding.  
Me: Yes. Now go to the second half. Go to the second tab.  
Them: Oh, my God. With animation and gradients. Oh, God.  
Me: Go to. So now wsl again and cd the thing.  
Them: Hilarious. Oh, it's just going to do whatever.  
Me: Now. Cd project epcbooking. Which is where your other stuff, where the code generator is. Yeah. Now launch claude. So this is like. You're, like, instantiating a different Claude.  
Them: Isn't it like this?  
Me: All right. So now you can say. You can ask a simple question that. Claude, what does this app do? You don't even need to tell it. Go to the readme. Like it would just do that.  
Them: I'd go to the readme and tell me what this app does.  
Me: Now you can see it. Working on like this is. I wanted us to start simple by looking at the terminal.  
Them: Okay?  
Me: Yep. So what you could do is you could launch, like, infinite terminals and just run all this stuff at the same time. And just as a little teaser,  
Them: Yeah.  
Me: Because it has access to your file system, and it could just, like, make and write and read files. You can use it on things that aren't coding an app at all. Like, you could do stuff like create a folder just on your computer. Create a folder of all your sample menus. Launch cloud. And then be like, make me a CSV file containing all the dishes that are featured on these sample menus. And in a coding agent will just go read all the files, create a to do list for itself, and it would just create that. So basically, anything that involves a manipulation of files. You can just ask Cloud Code to do.  
Them: Wow. Yeah. So if I said I want to connect to my Google Drive and pull every sample menu ever written out and make a CSV file.  
Me: So going on the drive is a little more complicated. We will need to set up the integration for it to specifically have access to your Google Drive. What we can do is that there's something called the Google Drive for desktop.  
Them: With them. It will do that. It'll go in the drive.  
Me: Where you're syncing. Basically, you're letting your Google Drive exist on your computer. And then Claude can go access those folders. You could launch Claude in that folder.  
Them: Oh.  
Me: So basically, anything that's local on your computer, you could get Claude to just crawl around and just work on.  
Them: Yeah.  
Me: Yeah.  
Them: Yeah, okay, but do not do that. There's way too much on the Google Drive. You do not want it sync locally.  
Me: You don't want to save specific things, like download a specific folder on Google Drive. Like just download it onto your computer, put it in somewhere that you can revisit somewhere nice, like your Documents folder or something. And then now you know how to navigate to that folder in your terminal, rightly you can find it.  
Them: That would immediately take all of the available space on your computer so much tutor down.  
Me: You wouldn't go to Linux because that's in your Windows file system. So you would allow for the mnt, C, whatever, and then you would find that file and you would just launch Claude. And then you could just do anything you want with AI on those files. This is just a little, like, teaser. There's, like, infinitely more things. Cloud codcoat. Looks deceptively simple. It's just a terminal where you can talk to AI. But there are so many custom configurations you can do. Like, you could, like, prompt specific sub agents that are trained to do a specific thing for you. And then this main agent will just like, go, hey, sub agent that you could have a sample menu generator agent. And then this. Exactly. So what I want for us is that, like, in our process of learning how to use Claude code, we're not just learning it in the coding context.  
Them: That's what I want. Yeah, I want all those things. I want a bunch of little agents that you're talking about.  
Me: We're learning the fundamentals of, like, what this is, and therefore be able to apply to basically anything you want. Because CLAUDE code is really not just a coding agent. It's called a cloud code, but it's a general purpose agent that can read and write files in your, in your, in your computer. There's a lot of things that you could do and configure with these agents that require no code and just plain language. Basically different structures of prompt. So you would have at different levels of your file system that would instruct Claw to do this versus that versus whatever. And I want us to be able to think about that. But that's just like a teaser. Right now. I'll just tell you that for the code generator. Claude, code can do a lot of the things, or basically all of the things that you've been doing with Cursor. Even if you'd never open cursor, you never open the files. You just ask cloud code, hey, I want to do this. And then just ask it to help you test it or whatever, but you could just do it literally through this terminal and take it all the way to production. But let's actually do a little bit check on the landing page and see what's going on there. Right now. On the first tab. Does this make sense? Okay, so. It's going to ask you for permission sometimes.  
Them: Yeah.  
Me: All right. So lower arrow.  
Them: Loading elements. Oh, my God. It's wild. Do I want to make this edit?  
Me: Sure you can. You can ask it what it is and it'll tell you.  
Them: Let's see. Oh, man, you're scrolling fast. Okay.  
Me: It's just like this is just making an edit.  
Them: I'll just hear is going to tell me what it did.  
Me: And then now you can type in, you can say, can you tell me what you just did?  
Them: Whatever.  
Me: Actually just told you.  
Them: Yeah, for sure. Well, there it is, right there. There's a whole bunch of floatings.  
Me: Glass morphism effect on Attack of that.  
Them: Oh, my God. Purple. The blue.  
Me: All right.  
Them: It's crazy.  
Me: You can say open it. Say open it for me.  
Them: What? Oh, my God. You asked it to make up some shit.  
Me: Don't ask again so that you don't have her eventually.  
Them: That's hilarious. Sketching.  
Me: I'll figure.  
Them: Enchanting.  
Me: Does it work? If you just type it, yeah.  
Them: Yes. Coach.  
Me: No. Because it's in wso. Okay? I mean, try to find it in your file system.  
Them: It should if you just put that in there. Oh, no.  
Me: It's in your next thing. It is in Ubuntu thing with everything else.  
Them: It is in chef projects.  
Me: Oh, go to go. Copy the path as in a second. One. See if that works in a browser. There's a prefix to this, right? Like file, colon, whatever. Oh, there you go. All right, so now ask it to push it to main.  
Them: Yes, I think it is file calling. Oh, my God. That's ridiculous.  
Me: Yeah, push it to basically push it to GitHub so it's on render.  
Them: That's funny. Push it to main.  
Me: Yeah.  
Them: Get push, (Kate) Okay, because we're going to go to render and put it. We're going to put it on the Internet. This is running local. Yeah, that's loco. Yeah, that's funny. So it's just interesting that it just made choices because she said, hey, I want to do some fun stuff.  
Me: Yeah, but you see why we're doing the disciplined approach to having a breadboard and everything. Yeah. All right? Yes. And don't ask again. You never click the arrow key. To get to the second option.  
Them: Yeah, because it'll just do stuff.  
Me: Do you? Okay? It's committed locally, but it's not pushed.  
Them: I just hit number two on the keyboard. That works.  
Me: All right. I'm going to teach you two things at the same time. Control C. Control C to exit cloud code.  
Them: Commit with success of what the push fail due to authentic.  
Me: CD to wherever that folder is, wherever the chefy thing is.  
Them: Yeah.  
Me: Cd projects. Hello.  
Them: I don't remember.  
Me: I think so.  
Them: Oh, yeah. Hello?  
Me: Yes. And then git. Push origin main.  
Them: Shafi. I forgot what it was. I don't know.  
Me: We're going to solve this at some point. Yes.  
Them: Fat, isn't it?  
Me: I'm going to have an answer for you on that in terms of how to actually do it.  
Them: Okay? Matter is?  
Me: Personal access token. The first one.  
Them: Oh, yeah, that's what it was. Pete's sake.  
Me: Yeah. I understand.  
Them: You can't see it. That was a trip. Can you imagine someone not knowing that and going out of your mind? (Kate)  
Me: All right. Go to render.  
Them: It's not working. No, it is working. You just can't see it.  
Me: Go to events. To see if was auto deploy on. Yes, it was on. So now that is. And then you see the commit message at awesome modern styling to hello, Chef.  
Them: Go to render. Rendering.  
Me: That's a commit message that Claude wrote. It's (Kate)  
Them: Oh, my God, that's hilarious.  
Me: All right. Now, I'm going to teach you one more thing. Okay? You already had a cloud session, so go back to your terminal.  
Them: My t shirt list.  
Me: All right, so now.  
Them: En.  
Me: Okay. Just now I think we launched Claude at the root level. Right? So let's do CD So this is important to understand. If you launch Claude here.  
Them: That's my t shirt.  
Me: It's not going to be the same instance or this has to have access to the same history as if you launch it where it was. So when you first launch cloud, we launch it at the root instead of launch it within this folder. That changes it. So you go to CD and then dot, dot. And then now I'm also going to teach you to do chain multiple of those so you can add. Oh, never mind. You could have done cd, dot, dot, slash, dot, dot, dot, which would have went two layers. But now you need a space. Don't say ciera All right, so now, Claude. Space. Don't. Don't hit Enter space.  
Them: Okay? Yeah. ciera  
Me: Double hyphen. Yes, continue. Enter.  
Them: Double hyphen.  
Me: Yes. So now you're back to the session. That you just had. The other option is Claude resume. So Claude space. So I'm going to send you the link to the documentation where all the things are listed.  
Them: Continue.  
Me: But basically, Claude space or hyphen resume gives you the fullest of the past histories. And then you can choose which one to resume.  
Them: Okay?  
Me: The other thing that's important to understand. Ashley, I'm going to make that tomorrow thing because I feel like I'm dumping a lot on you.  
Them: Okay?  
Me: So you see the power of this, the simplicity of this. You're not looking at things. Same thing. What we're going to do here is one last thing that I'm going to show you is that because this is a terminal app,  
Them: Whatever. Just finish your thought.  
Me: And you remember there's a terminal inside. Cursor. So you can launch cloud code inside cursor. Which is kind of trippy in that, like, you know, you're using cursor. Cursor has its own agent. But you can basically choose to not use Cursor's agent and instead launch terminals inside of Cursor. The benefit of that is that Cursor is a development environment. A code editor where you can literally see the files. So you have a lot more transparency to what's going on, or, like, a lot better of an understanding of what's going on than if you just ask as cloud code to determine to do whatever. Yeah, so the same way. How? You know how when you want to go through layers deep, you type project slash upc, booking, whatever.  
Them: What is you just said when you go dot, dot and one, then two dots again.  
Me: So it's the same way, but backwards, like dot, dot. All right, so now you're going to go to cursor.  
Them: Yeah. Same way with backward. Go backward. Oh, yeah, great.  
Me: Y. No. We're basically going to not use this chat at all. So you're going to close the TAD panel?  
Them: Now I'm going to go to cursor.  
Me: Y.  
Them: I'm in the middle of this. Do me chat.  
Me: Now. Sure.  
Them: This one.  
Me: Open a new terminal. Sure.  
Them: Smooth these out of the way. Okay?  
Me: All right.  
Them: Should I close all these?  
Me: Toggle the panel. Yes. No panel. We're not using. Basically, we're not using Cursor's Agent.  
Them: Trash, trash rash. Trash, trash, trash.  
Me: Yep. So now here.  
Them: Terminal and the panel.  
Me: Type. Claud, continue.  
Them: No pen. Cursor is copilot. We're going to use clock.  
Me: Go. Remember what you just did earlier. It's now here. All right.  
Them: Welcome to. So now I can go and turn the. What are you doing?  
Me: Click enter.  
Them: Jules.  
Me: Click Enter to continue. It's just telling you that Claude can read what's in your cursor window. So before we get something done, let's set up the proper window configuration. So it's not very, like, reader friendly, it's not very developer friendly right now to have the terminal at the bottom and that be where your agent is. Right. So we want to pull the terminal up.  
Them: Go away, quick. What?  
Me: To where it is. Not by doing this. This is one way. The other way. So you add another terminal. It's crazy that this is the only way to do this right now, but you add a second terminal. So now, you see that there's a sidebar on the right. The first one out of it. So you drag this one up. Yes. Drop it. So now this is taking up the main space. And now you can close the bottom panel.  
Them: You can pull that one up.  
Me: So now you're looking at Claude and you're looking at the file navigator on the left, so when it says it changed something, you can open up and see what the change was.  
Them: Interesting.  
Me: And you can navigate files. You can keep all of that. You have access to all the things that you had access to with cursor, but instead of the chat, you have a terminal where you're using it.  
Them: For us.  
Me: Makes sense.  
Them: I put the copilot into the terminal and it's Claude. It's no longer the co pilot of Cursor. So now I'm not going to be using cursor's copilot, and now I can easily go back in there and just go back to the next setting. I went to the big boy setting in Cursor.  
Me: Yeah. Yeah. So you can basically cancel the cursor.  
Them: Because I ran out of shit. And so I had to go ahead and pay. Now it's set up to go. I don't know if I paid for a year, but I can always just go back, right?  
Me: Subscription, unless you want to be able to use both. As of right now, I don't think it's necessary, because. Cursor. Honestly, after playing with it.  
Them: I don't know. Do I want to be able to use both?  
Me: My opinion and a lot of people's opinion is that right now cloud code is the frontier. For you look at news headlines of like GPT5 is like, you know, the number one programmer in the world in like one shotting these coding exams. But like we're not here to do coding exams and then we're very practical sense of, you know, the developer experience. Cloud code is why they regarded estabust. So as of right now, it's not necessary. If things change and, like, Google comes out with a model that is, like, by far, by far the best coding model on the planet, you might want to have access to cursor to be able to play with it. Yes. So don't use cursor as of right now. When that changes and bump it up. And this is the why.  
Them: Yeah. I'm just trying not to get the ETC credit card bombarded with payments that we're not going to use. That's all I'm trying.  
Me: I would advise not to sign up for annual subscriptions on any of these things because the industry just changes so fast. Yeah. Like any of these companies could be obsolete in a year. Something crazy would have to happen for anthropic to be obsolete, but it could happen.  
Them: To changing so fast.  
Me: Okay? So the other thing is, like, you see that split icon on the top, right? So if it ever comes to shove, where you want to work on two terminals at the same time, you would want to put them on two separate panels. So if you. If you click on the left thing. The left. Up. Up there. You see how there's a plus icon? On the web panel. Yep. And there's also a Claude icon, right? The logo. So if you click on that, Yeah, that's a cloud. Logo, it's gonna open. Yes. So now you have two clouds in front of you, and you can ask them both to do things for you.  
Them: Logo.  
Me: Yeah.  
Them: Oh, it automatically opens up another cloud.  
Me: Okay?  
Them: Well, that's cool. Hold on. Okay, what you're saying is split the terminal panel for visual. And then if I want to open up another.  
Me: Yes. Yes. You can split up like four windows for all you know, like there are people with a crazy wide monitors and they have like 10 instances of cloud running at the same time and they're like cross managing all of it.  
Them: Terminal. It's here. And if I wanted to automatically be a (Kate) terminal, it's dis. I can split this one too.  
Me: Yeah. All right, so.  
Them: Yeah.  
Me: We've been here for a while. I think we've. We've gotten cloud code running on your computer.  
Them: That makes sense. All right.  
Me: What's gonna happen tomorrow is I'm gonna pull from a new repository. That I created. That. Yes, you can. With Claude right here.  
Them: I'm going to be able to edit my current live app. I can do that right now.  
Me: Yes. It's the exact same thing. These are AIs that are working on your code. For you.  
Them: Right here, right now, because all the folders and everything are right here on my list.  
Me: This is Jess, Claude. And you don't have to worry about the models.  
Them: Okay, I got it. So it's just like doing the drop down between Chat GB key and Claude Sonnet and all that, but this is blast.  
Me: This is just tuned and prompted Claude Model to precisely work in this context in this cloud code, so you don't have to worry about any of that.  
Them: Okay? Okay, I don't think that Lee needs to worry about this right now. Of building the code because he's still trying to run the whole company that's running. So if he does, we know how to get him into cursor, logged in and then going as me. And we don't know if two computers can do it, but we're going to try. And we probably should confirm with each other before we ever push anything or deploy any one.  
Me: Yep. Yep. Well, so Lee wouldn't even need to download Cursor to use Claude code. He would just need to use it from the terminal. And what I thought could be helpful for Lee to understand is what I mentioned as a non coding use cases of cloud code. Like, there are a lot of operational things.  
Them: Yeah.  
Me: That, like, if you use Carco to Automate, like, your KPIs. I don't know. Like, data projects are very good for cloud code writing projects are very good for cloud code Chef. You know when you were talking about your whole curriculum thing, Like, cloud code is so good at that because it's not just, you know, you with a chat, in a meeting with an AI, right? Like, it's like, literally, you have a very intelligent AI sitting in your computer writing text files with you. Right, so, like, all of those use cases could be good, so sure. Lee doesn't have.  
Them: We are going to get to Lee where he's doing everything that I'm doing on the marketing side of agent, and I'm going to be Palestine.  
Me: Exactly. Yep. Yep. So all of it. You can start to see all of it.  
Them: And it wasn't Amy. Since I train Amy on all sales stuff, then I can go into curriculum and school stuff.  
Me: I want, because I've actually worked with Claude code on this code base too. So you can see at the top left, there's always been a dot clot folder in your directory. Right. Yep. So there are two, like. Okay. Actually, one last thing. I'm going to cover, and I'm going to take less of your time. So one last thing I'm going to cover before we, like, are dismissed for today and we come back tomorrow to get set up on, like, turning our prototypes into interface mocks.  
Them: Yeah, there has. Yeah, you're right.  
Me: And sketches. Is that, Claude? The way it works. So at every. You know how we launched it at different levels of the file system, we launch it at the roots. We launch it. In. Hello, chefy. We launch it at epc bocain, right? At every level, there are a set of instructions that you have very good transparency into. So if you scroll, scroll all the way down on the file system.  
Them: Yeah.  
Me: I think there's a Claw MD file somewhere. Claude nd yep. Click on it. Okay? So this actually doesn't have anything substantial yet, because this was before I set up the power booking app to use anything substantial.  
Them: Right here.  
Me: But this is essentially is the system prompt. For when you launch Claude. So this is what the agent is prompted with. If that makes sense. So if you put in here a new bullet that says I am a chef, explain everything to me as dumb as possible. Claude is going to start doing that. Yeah. You can do it.  
Them: So I tell it to do stuff right here. So I tell it who I like. I would say here.  
Me: Exactly. You can say stuff like that. You could say, this is an infinitely editable. So my own personal Claude MD files are like 200 lines long. Like you can make renewal.  
Them: Never will we ever test something on Main. We will always switch to a new branch.  
Me: Exactly so. And it's getting to know you. It's also that eventually you could get a lot more deliberate about this prompt.  
Them: I love that. It's like your diary, like they're getting to know you.  
Me: Where it's not just a bullet list. It's like the contextual understanding of what is this app? What do you need to understand about my business? How I want you to talk to me. My technical preferences. And this is the kind of thing that I'm going to have you download from a repository that I'm making tomorrow or that I prepare tomorrow. Or I'm going to have some of those decisions encoded in the Cloud instructions, such that your Claude agents follow those instructions when working with you. Exactly. So, like, for example, we follow a very specific philosophy in software development. That's interface first.  
Them: That's the rails that you're putting on.  
Me: We're going to really prototype and mock up the whole interface experience and finalize that before we wire up the database and all that stuff.  
Them: Us.  
Me: And that is for agility. That's for us to not be like, making assumptions that are premature. Right. So that is a very specific philosophy that we need to basically make sure that Claude follows. And there's, like, a specific set of instructions for that. And this is where that lives. Cloud md. The other place where some instructions live is if you scroll up to the very top, there's a dot cloud folder. So this is kind of like the configurations of Claude. So right now all it has is settings, JSON. So these are the permissions that you've allowed for cloud. To do stuff on your computer. Not right now. It'll come up when we want. But there's more that can eventually go into doclod folder.  
Them: Is there anyone more that you would want to add?  
Me: Including sub agents. So including like, you'll eventually see folders under Dock that says Agents is the folder, and then under Agents it'll basically define a list of EPC specific sub agents that you want to do. Or like, there's a folder called Commands, and that is like basically the prompt library of like, specific things that you keep asking Cloud to do again and again, and those will live there. So basically Doc, Claude and Claw md, that's where all the system instructions for Claude is. And it's incredible how much transparency you have within cloud code versus for cursor is a lot less configurable in cloud code. You could have cloud MD basically at every level of the file directory like you could have a cloud nd that says just within the views because it contains very specific instructions on how to write the views of this app. Like you could get very specific at every level. And soon you'll start to see why that's so powerful. And that's why we're on cloud code instead of using cursor stagent. Does that make sense? Yes.  
Them: Okay?  
Me: Okay. I think it's a success.  
Them: Making more sense as we go, right? Like you probably told me something 20 times that now makes sense because I got to see it work.  
Me: No. Yeah.  
Them: So yes.  
Me: You know anything. This is just a prompt.  
Them: Did you have to put this in there? Does it have to have that little hash?  
Me: Like, imagine every time you're on ChatGPT and, like, this is just appended in front of whatever you type in.  
Them: I could just do this. Okay, I'm just curious.  
Me: Okay? All right. We've had a good run. I hope you guys found this fruitful. Tried to take us back to basics. And work up towards all the way from CD to Claude.  
Them: Okay? Yeah.  
Me: So.  
Them: Right. Amazing. Yeah, I love it. Awesome. Okay. Tomorrow morning session is about finishing up our fat marker sketches and getting into building, if we have time. Is that tomorrow's session?  
Me: Yep. Tomorrow session. So tomorrow morning is just like, bring your sketches. I mean, we're going to have to sketches on Basecam. We're going to go through the sketches. We're going to discuss the sketches. We're going to complete the sketches. Like, as in think through that entire breadboard. What are the screens going to squiggly look like? And then once we have those and we've aligned them, those. I'm going to get you guys set up or I'm going to get Chef set up on Claude code. With the custom instructions that I've prepared. That is going to help Claude turn those sketches into interface mocks.  
Them: Yeah.  
Me: And then we're going to chisel out the interface mocks. And trust me when I say that it would be good if we spend the rest of tomorrow on chiseling out the interface mock such that by Wednesday morning when we meet.  
Them: Okay?  
Me: We look at the interface mocks. The goal is that we can click through the whole thing and we feel like, yes. If I can make this thing work and have real data in it. This is good to go. And then we're going to work on wiring everything up.  
Them: Okay?  
Me: Great.  
Them: All right, so tomorrow's morning session, we have a hard stop at 11 o'clock because that is our full EPC team meeting. Just so that we have know that going in.  
Me: Yes. Perfect. Thank you. And great. Great.  
Them: Awesome. Okay? Yeah. This is super exciting. Thank you, chef, for doing the heavy lifting. At this point, I am tracking right along with it, so no worries about running ahead of me. I'm tracking a lot. But thank you for doing the heavy lifting.  
Me: Yeah.  
Them: We're not ready for you to come be doing this with me full time. But we're going to get there. We're going to get you ready to come here. Going crazy, and it's going to be rich culinary in Chicago, Right? Who's in charge of sales? And then as we grow, we'll find a new Rick in whatever city. We'll have a kitchen or whatever city and Amy gets saturated, and she'll bring on teammate.  
Me: Look, we're all becoming programmers because, again, the reason why I want to show you guys the cloud configuration, like the cloud md, whatever, is like that.  
Them: On the right side, you're the left side. Go.  
Me: That is that file. Claw MD is basically a piece of software.  
Them: Hell, yeah.  
Me: It's a piece of code. That instructs the machine on how to behave. And so no matter what your function is, even if you're not writing code, as in you're not building a product for chefs to use, you're not building this traditional software application.  
Them: Yeah.  
Me: You're still programming and that you're designing and defining how a system works in a machine so that you can scale up your work such that you're thinking you don't repeat yourself. Like you say something. Once it's encoded, that thing gets done. So that's great. That's how the Ferrari gets built.  
Them: Yeah, okay.  
Me: All right. I've taken enough of your time.  
Them: Nice. And you don't end up with a Prius in the middle.  
Me: Yes.  
Them: Perfect. How are we doing? Awesome, if you have five minutes. (Kate) Working on or no. Hey, check it out. Here's the thing. We started the admin setup. Oh, boy. Wrong thing.  
Me: Oh.  
Them: At least that's. Hold on. Amy moved them all around. Look at amy.  
Me: That's so dope.  
Them: So new lean comes in, boom. Look, (Kate) got a little drop down, right?  
Me: That's so dope.  
Them: If it's connected. Look at this. Look. Connected. Okay, man. Where's my warm, cold leaf? That's gone. Well, I got to bring that back. Deposit sent. Deposit paid.  
Me: That's so dope.  
Them: Archive. Look, I can change doing things multiple categories. If I do this, I can change multiple statuses at once.  
Me: Good job. Yeah.  
Them: That's fun, right? That's fine.  
Me: Oh, wow.  
Them: Still playing with stuff. Oh, let me show you another one. Here you go. Find any of them? Watch this.  
Me: Yes. Yeah.  
Them: Edit. Look at all this pretty formatting.  
Me: This is so cool.  
Them: Isn't that (Kate) Look at this. Custom pricing override.  
Me: Yeah. Good job.  
Them: I made that.  
Me: Did you add anfo fields to the proposal itself? Did you add actual, like, more fields to the proposal itself? Like, as in collect more information?  
Them: Here. Let me go to the actual app.  
Me: Cool.  
Them: Say that again. Yeah, it did. Look, (Kate) going to throw a family style party. She got 10 people going. She going to have one server? And look at this. I put an override. You can't book more than 10 days within 10 days. Yeah, but Admin can override that. You're occasion. What are you doing? Just because you deserve it, right? You don't want to clean up. You don't want any cooking stress.  
Me: Are people actually filling this out?  
Them: I want lots of seafood.  
Me: That's great.  
Them: Shrimp.  
Me: Some people.  
Them: Fish. Yes. Gluten free. Not everybody. But sometimes. How about, like, fights? Who do you prefer?  
Me: That's great.  
Them: Yeah, all the things. Cilantro I (Kate) And a meal. And I hate olive. Picture is ugly. I don't know why I decided to pull that photo. But there's our just because dinner. Look at this. When you read through this. It should talk about. Avoid the stretch of cooking and cleanup. Yes, I clicked on that.  
Me: Lee, I told Chef yesterday that all of the proposals that has been generated, including all of the tests so far across the entire cloud generator from it's dawn.  
Them: You can relax. Oh, your Seafood Focus menu brimming with shrimp and fish. Get it. Yeah.  
Me: Guess how much it's costed? AI wise on the gemini API.  
Them: Yeah.  
Me: Less. Like a sense.  
Them: I'm guessing that it's, like, a couple bucks. Less. Oh, my God. Yeah, it's wild. Looking at what the token costs were, I was like, oh, they for enterprise. Our little piddly stuff isn't like anything.  
Me: Okay, well. Well, because we're working towards agents, right? Like Claude code, for example. It's typing some. It's showing you some text, but behind the scenes, it's thinking and reasoning with so much more text. So there are a lot more tokens that it's using behind the scenes in order to reason and do things for you. But as far as pure interface level text transformation tasks,  
Them: Yeah.  
Me: Nothing. Create a few cents. Or less a tenth of a cent. Nothing.  
Them: Yeah, it's wild, it's wild. It's wild. It's wild. I mean, I'm a little afraid. Of what the monetization models are going to start to look like later. But you know what I mean, because when it was only Netflix, it wasn't a problem. But then when everybody got on board, then it was three times more expensive than table.  
Me: Here's the thing. It's in everyone's interest at the level of tokens and at the level of basic transformations done with AI. Nobody's interest to raise that cost. Because at that level, that's basically infrastructure. That's not like a nap. Like ChatGPT is going to stop being perceived as an app at some point. Like an as a basic text exchange goes.  
Them: Yeah.  
Me: But more and more people are building applications on top of the tokens, and as the token cost goes down, it just means that the applications themselves are going to use more and more of the tokens. So the cost of what's actually going to increase is the apps are going to get more expensive. But that's because behind the scenes. The apps are also using more and more token more. But at the layer of a builder that's using raw tokens and you're literally just doing basic transformations like the proposal, which is just like bunch of text through and output a proposal.  
Them: You think we're token? Yeah.  
Me: That cost is just going down.  
Them: That's awesome. It's wild. And it's moving so fast. It's just the total Next.  
Me: It's cheap enough where it's conceivable for us to do like Generative UI at the level of the button is instantly generated based on the user's preferences. Like, the pay invoice button doesn't say pay invoice for everyone, like, depending on what they said. And it was so disgust. A few cents.  
Them: Right. It's wild, it's wild, it's wild. Yeah. One thing that I want us to. And maybe you can give us some tips as far as being able to instruct Claude on doing this. We need to, especially because Amy is visually impaired. We need to be making sure that everything works in dark mode across all applicable platforms, and Cursor seem to be having some trouble with being able to nail that.  
Me: Let's make that a next week project. I think the goal right now is that we can ship the very absolute minimal version. The taking out of the checkout flow from square. And just purely doing send invoice is relieving a lot of the nervousness that we will be able to ship something minimal this week and then next week we can work on. Nice to have things such as the money screen for chefs and such as the dark mode compatibility, but what you can imagine us using Cloud4 is essentially we could spin agent in a terminal and just say, hey, go study the requirements for safari Dark Reader.  
Them: Yeah.  
Me: Go study that or create basically a knowledge document that all future clauds can use. And you can put that cloud. And then every time, you could set it up such that every time before a commit is made, There is a special agent, a sub agent that goes into the code.  
Them: Yes.  
Me: Like a dark reader. Or you could have fun and name that agent Amy.  
Them: Beautiful.  
Me: And every time before you make a commit. Amy, stop. Agent on Cloud is gonna go check.  
Them: I just wanted to highlight that because it's core to our team and one of our team members, and we don't always want to be blowing our eyeballs out.  
Me: Yes. Understood? Yes. ciera These sessions are, like, running on but.  
Them: With light screen all the time. Yeah. Awesome.  
Me: Yeah, because honestly, I feel like at this rate, there's a world where two weeks from now, you guys are building the KPI dashboard off of the nuclear build.  
Them: No, this is good. This is good. Thank you. I do need to do my payroll and my KPIs, but hopefully I'll only be doing that for another week or so.  
Me: Yeah.  
Them: Right. Yeah, I feel that discussion today.  
Me: Remember discipline. Just remember, for each of those things, don't add anything without at least some basic version of a breadboard to understand how it fits into the system.  
Them: Where all the little sections that we work in, we're just going to build and evolve piecemeal, merge them together. Yeah. I have a question for you, and I think I know the answer, but maybe I don't. Oftentimes I'll have something pushed live, and it'll be working just fine. And then I will be admittedly working on the main branch but not deploying anything, and changes will be made on the actual app. Is that a thing? What am I doing wrong? I had something working for the last two days. It worked great live on the app. Everything was money.  
Me: You will need to investigate the history of the commits.  
Them: And now it's changed. And I didn't change that at all. I don't know how that got changed.  
Me: There's a chance that Cursor is actually making the pushes without you instructing it, too. Yeah. Which is why what you could do right now is you go to Cloud MD and you type in all caps.  
Them: That's what it seems like it's happening. That's what I think is half out, so to say I think of happening.  
Me: Never push anything too main without my never push anything to remote without my explicit consent.  
Them: Is actually pushing you.  
Me: The main branch. Has auto deployment turned on. So anything live on the remote Main branch? It's deployed on production with real customer consequences. You can say that. Literally just type that out on your Cloud MD in all caps or whatever. You can clean it up later. Exactly. Yeah. I like the idea of having an Ames UP agent that just checks for safari dark mode.  
Them: Yeah, nice. Just telling it, yo. Don't mess with me.  
Me: Imagine every time before committ is made, there's like a little tag. You know the function call.  
Them: Right. I know. For real, though, because.  
Me: It, Amy, open parentheses. Checking.  
Them: It's like. Amy checking. Yeah. Yeah. I love it. I love it. I love it. Awesome. Okay, well, I am geeked for tomorrow as well.  
Me: All right.  
Them: I do need to. Run my little ops. Crap here.  
Me: Good talk.  
Them: For the moment, but I'm super geeked.  
Me: I'm going to get to refining our little Claude set up for Tomorrow's Interface agents.  
Them: No, we're good. Awesome. Okay?  
Me: Thank you so much.  
Them: Beautiful, beautiful.  
Me: For all the patience and for going through the basics with me.  
Them: All right. Thank you again, Shafi. I know that driving sometimes is not the easiest part.  
Me: It was fun to take us through index HTML and witness typing out HTML tags.  
Them: Yeah. Know. Right. That's awesome. I love it. I love it. Familiar. He gets in there and looks at the back end of squarespace as much as it allows us to anyway.  
Me: All right. Bye. Bye.  
Them: All right. Awesome. 