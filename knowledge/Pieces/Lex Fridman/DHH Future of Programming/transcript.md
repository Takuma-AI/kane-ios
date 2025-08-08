# DHH: Future of Programming, AI, Ruby on Rails, Productivity & Parenting | Lex Fridman Podcast #474

**Channel**: Lex Fridman  
**Date**: 2025-07-12  
**URL**: https://youtu.be/vagyIcmIGOQ?si=ADEAg4mihdV5EPmp  
**Transcribed**: 2025-07-14

---

## Transcript

No one anywhere who's serious believes that cookie banners does anything good for anyone yet
We've been unable to get rid of it. This is the thing that really gets me about cookie banners, too
It's not just the EU. It's the entire world. You can't hide from cookie banners anywhere on this planet
If you go to got them Mars on one of Elon's rockets and you try to access a
Wepage who still see a cookie banner. No one in the universe is safe from this nonsense
It sometimes feels like we're barely better off like web pages aren't that different from what they were in the late 90s
Early 2000s. They're still just forms. They're still just right to databases a lot of people
I think are very uncomfortable with the fact that they are essentially crud monkeys
They just make systems that create read update or delete
Rose in a database and they have to compensate for that
Existential dread by over complicating things. That's a huge part of the satisfaction of driving a race car
It's driving in at the edge of adhesion as we call it where
You're essentially just a tiny movement away from spinning out doesn't take much then the car starts rotating once it starts
Rotating you lose grip and you're going for the wall
that
Balance of danger and skill is what's so intoxicating
The following is a conversation with David Heinemeyer Hansen also known as DHH
He is a legend in the programming and tech world brilliant and insightful
Sometimes controversial and always fun to talk to he's the creator of Ruby on rails
Which is an influential web development framework behind many websites used by millions of people including Shopify
GitHub and Air B&B
He is the co-owner and CTO of 37 signals that created base camp hey and once
He is a New York Times bestselling author together with his co-author Jason Fried of four books
rework
Remote getting real and it doesn't have to be crazy at work
And on top of that, he's also a race car driver
Including being a class winner at the legendary 24-hour limon race
This is a Lexington podcast to support it
Please check out our sponsors in the description and consider subscribing to this channel and
Now dear friends here's DHH
For someone who became a legendary programmer
You officially got into programming late in life and I guess that's because
You tried to learn how to program a few times and you failed so can you tell me the the full story the saga of
Your failures to learn programming was Commodore 64 involved
Commodore 64 was the inspiration. I really wanted a Commodore 64
That was the first computer I ever sat down in front and the way I sat down in front of it was I was five years old
And there was this one kid on my street who had a Commodore 64
No one else had a computer so we were all the kids just getting over there and we were all playing
Year Kung Fu. I don't know if you've ever seen that game
It was one of the original fighting games. It's really a great game
And I was playing that for the first time at five years old and we were like seven kids sitting up in this
One kid's bedroom all taking our turn to play the game
And I just found that unbelievably interesting and I begged and I begged and I begged my dad
Could I get a computer and he finally comes home?
It's like I got your computer. I was like yes my own Commodore 64 and he pulls out this black
Green and blue keyboard. That's an Armstrong 464. I was like
Dad, what's this
This is not a Commodore 64, but it was a computer
So I
Got my first computer at essentially six years old that Armstrong 464 and of course the first thing I wanted to do
I wanted to play video games and I think the computer which he by the way had traded for a TV and a sterile
Recorder or something like that came with like two games one was this frogger game
We had to escape from underground. It was actually kind of dark like this frog
You're trying to get it out from underground. I was just I was pretty bad at it and I only had those two games and then
I wanted more games and
One way to get more games when you're a kid who don't have a lot of money
I can't just buy a bunch of games is to type them in yourself back in
84 85
Magazines would literally print source code at the back of their magazines and you could just sit and type it in
So I tried to do that and they would take like two hours to print this
Game into the armrest rod and of course that makes some spelling mistake along the way and something wouldn't work and the whole thing
I was in that good of English. I was pointing Denmark
So I was really trying to get into it because I wanted all these games
I didn't have the money to buy him and I tried quite hard for quite a while to get into it
But it just never clicked and then I discovered the magic of piracy and after that
I kind of basically just took some time off from learning to program because
Well now suddenly I had access to all sorts of games
So that was the first attempt like around six seven years old
And what's funny is I remember these fragments. I remember not understanding the purpose of a variable
If if there's a thing and you sign something why would you assign another thing to it?
So for some reason I understand it constants a constants made sense to be but variables didn't
Then maybe I'm 11 to 12
I've gotten into the amiga at this point the amiga by the way
Still
Perhaps my favorite computer of all time. I mean, this is one of those things where you're like people get older and they're like all the music from the 80s
Was amazing to me even as someone who loves computers. I love new computers the amiga
Was this magical machine that was made by the same company that produced the Commodore 64 and I got the amiga
500 I think in 87 look at this sexy thing that is a sexy machine right there
This is from an age by the way
We're computing wasn't global in the same sense the different territories had different computers that were popular
The amiga was really popular in Europe
But it wasn't very popular at all in the US as far as I understand it wasn't popular in Japan
There were just different machines the apple two was a big thing in the US
I'd never even heard of apple in the 80s in Copenhagen
But the amiga 500 was the machine that brought me to want to try it again
And you know what's funny the reason I wanted to try it again was I remembered the first time to learn
And then there was this programming language that was literally called
easy amus
Like the easy version of amus I'm like if it's if it's easy amus how hard can it be I got to be able to figure this out
And this time I tried harder
I got into conditionals. I got into loops. I got into all these things and I still I couldn't do it
And on the second attempt I really got to the point like maybe this is maybe I'm not smart enough
Maybe programming she's not maybe it's too much math like I like math in this sort of superficial way
I don't like it in the deep way that some are my
Perhaps like your nerdy of friends did who are tremendous respect for my I'm not that person
I'm not the math math geek who's going to figure it all out
so after that
Attempt with easy amus and failing to even get I don't even think I completed one even very basic game
I thought the program is just not for me. I'm gonna have to do something else. I still love computers
I still love video games
I actually at that time had already begun making friends with people who knew how to program who weren't even program in easy amus
They were program and freaking assembler and I would sit down and just go
I'm how do you the moves and the memories and the copies? How do you even do this?
I don't even understand how you go from this to
Amiga demos for example that was the big thing with the Amiga it had this wonderful demo scene in Europe
It's this really interesting period of time
In the Amiga's history where you had all these programmers spread out mostly all over Europe who would compete on
Graphic competitions where you could probably bring one of these
This thing they would make these little
Almost like music videos
Combining some MIDI music combining some cool graphics and they would do all of it in like 4k
4 kilobytes that is not 4k is a revolution 4 kilobytes of of memory
And I just thought that was such a cool scene. This was obviously
Pre-Internat it was even pre-bbs
Bulletin board systems to some extent it was you swap your
Demo software with someone else by sending them a disc in the mail
Like the 3.5's and I just I was enamored with that whole scene
I was enamored with what they were able to create and I just wanted to be a part of it
Even though I kind of didn't have any skills to contribute
And that's how I got into running
BBSs. I didn't learn programming then and I wouldn't learn programming until much later until I was almost 20 years old
The Bulletin board systems existed in this funny space where they were part
Lee as servers to the demo scenes allowing all these demo groups to distribute their
Amazing demos and then it was also a place to trade piracy software pirated software
And I ended up starting one of those when I was 14 years old in my tiny little bedroom in Copenhagen
I had my at that point amiga 4000
I had three
Telephone lines coming into make tiny room nice
Which was funny because again, I'm 14 years old by the time I was in sterling my third line
You had to get someone from the telephone company to come do it
I get this guy and he's just looking around like what is this why the hell is a 14-year-old
Having three phone lines into their tiny little bedroom. What are what's going on here? Why are all these modems blinking red and
Black and making funny sounds. Did your parents know they
Did and they didn't they knew I had the phone lines then you had the computer
I don't think they really understood that I was trading pirated software that was both illegal and
Whatever else was going on. I wish to probably say that in Europe. Maybe you can comment on this in especially in Eastern Europe
But Europe in general piracy. I think was more acceptable than it was in the United States. I don't know there
Maybe maybe it's just my upbringing conversation. Yeah, it wasn't present
I never spoke to anyone growing up in Denmark has any moral qualms whatsoever about piracy
It was just completely accepted that
Your kid you want a lot of games you don't have a lot of money. What do you do?
You trade yeah some people would occasionally buy a game. I mean I once bought a second master system
And the I bought one game because that was what I could afford
I got afterburner to I don't know if you've ever played that game. It's pretty bad
implementation on the second master system
But it was like
600 crowners and I was making money at that time
Doing newspaper delivery. I had to do that for a month to afford one game
I like video games way too much to wait a month just to get one game
So piracy was just the way you did it
And that was how I got into running this bulletin board system
Being part of the demo scene
Being part of the piracy scene to some extent and then also at some point realizing oh
You can actually also make money on this and this can fund buying more phone lines and buying more modems and buying more megas
Oh, yeah, that was one of the demo parties. These were amazing things. What am I looking at?
Isn't that all those CRT monitors all these CRT monsters again when I was 14
I don't understand fully why my parents allowed this
But I traveled from Copenhagen
The capital of Denmark to all this tiny little town in juddling on the train with a bunch of dudes who were like
Late teens in their 20s. I'm 14 years old. I'm lugging my 14-inch CRT monitor
With my computer in the back to go to the party. That was what it was called
That was the biggest demo scene party at that time and it was exactly as you see in that picture
Thousands of people just lining up with the computers programming demos all day long and trading these things back and forth
That's kind of awesome. Not gonna lie. It's a little ridiculous
It's totally awesome and I I miss it in ways where the internet has connected people in some ways
But the connection you get from sitting right next to someone else
Who has their own CRT monitor who's lucked at halfway around the country to get there?
It's truly special because it was also just this burst of creativity
You constantly running around you constantly surrounded by people who are really good at what they could do
They're really good at programming computers. It's infectious. It was part of that
Pang I felt then going like oh man. Why can't I figure this out? I mean, why can't I even figure out easy? Amos
I was kind of frustrating but on your third attempt you'll be more successful
So third attempt is when I start getting it. This is when I start
Helping out let's say
Building things for the internet
So around 95 I think it is or 96. I
Discovered the internet actually in ninth grade. That was my first experience. I went to
some university in
Denmark and in ninth grade we had this excursion and they sat us down in front of a computer and the computer had a
Netscape navigator the first version or maybe it was even the precursor to that
And they had a text editor and us kids just got like hey built something on the internet
And we should say CML and the first thing you do is like oh, I can make the text text blink
By just putting in this tag and saving it
that was that
Moment that was actually when I re-awakened the urge to want to learn the program because I got a positive experience
All the other experiences I had with programming was I
Spend hours typing something in I click run and it wouldn't work
And I'd get an error message that made no sense to me as a kid either at six or seven or at 12
And here I am sitting in front of a computer connected to the internet and I'm making text blink
I'm making it larger. I'm turning it into an h1 or an h2
And these guys out here we just did it for like an hour and a half and suddenly I go oh, I can make things for the internet
That's someone in
Germany can be able to access and see and I don't have to ask anyone for permission
This is super cool. I got to do more of this
So I got into to the internet. I got into working with html
And I still had all these friends from these demo parties
And I started working with them on creating gaming websites
I'd rather buy the video games. I'd review them
This was another good way of getting new video games was to walk down to some store and say like hey
I'm a journalist
I'm like this 15-year-old kid and they're they're looking at you're journalist
Yeah, can I borrow some some games because this was when games moved on to the PlayStation and these other things
You couldn't just as easily pirate at least not at first. So I went down there did all that and
That started the journey of the internet for me. It started working on these gaming websites working with programmers
Figuring out that I could do something I could work on the h2ml party's not really programming
But it kind of smells like it. You're talking to a computer. You're making it put
Text on the screen and you're communicating with someone halfway around the world
so that became my
Pathway back into programming and then slowly I picked up more and more of it first
Website I did with someone one of these programmers from the demo scene that was dynamic was ASP.net
I wasn't even actually called that net that was what we started on and then we moved on to PHP
And PHP was when I finally got it when it finally clicked
When conditionals and loops and variables and all that stuff started to make sense enough to me
That I thought I can do this. So would it be fair to say that we wouldn't have dhh without PHP and therefore you oh all your success to PHP
A hundred percent that's true and it's even better than that because as PHP to me
Didn't just give me a start in terms of making my own web applications
It actually gave me a bar in many ways. I think the pinnacle of developer web developer ergonomics is late 90s PHP
You write this script you ftp it to a server and instantly it's deployed
Instantly it's available you change anything in that file and you reload boom. It's right there. There's no web servers
There's no setup. There's just an Apache that runs mod PHP
And it was essentially the easiest way to get a dynamic web page up and going
And this is one of the things I've been chasing that high for basically the rest of my career
That it was so easy to make things for the internet in the mid to late 90s
How did we lose the sensibilities that allowed us to not just work this way
But get new people into the industry to give them that was success experiences that I had
Adding a freaking blint tag to an HTML page ftp a PHP page to an Apache web server without knowing
Really anything about anything without knowing anything about frameworks without knowing anything about setup
All of that stuff have really taken us to a place where it sometimes feels like we're barely better off
Like web pages aren't that different from what they were in the late 90s early 2000s
They're still just forms they're still just right to databases a lot of people
I think are very uncomfortable with the fact that they are essentially crud monkeys
They just make systems that create read update or delete
Rose in a database and they have to compensate for that
Existential dread by over complicating things now. That's a bit of a character
There's more to it and there's things you can learn for more sophisticated ways of thinking about this
But there's still an ideal here, which is why I was so happy you had pedal levels on because he's still basically works like this
Yeah, and I look at that and go like man, that's amazing
Yeah, you're chasing that high. He's been high all along. Yes, using using PHP
jQuery and
SQLite I think it's amazing because he's proving
That this isn't just an nostalgic dream. He's actually doing it. He's running all these businesses now some of that is as he would admit
Up first up front is that he's just one guy and you could do different things when you just want guy when you're working in a team
When I start working on a team when I start working with Jason freed on base cam
We at first
Didn't use version control together. I used version control for myself and then I thought do you know what?
designers
Departing not smart enough to figure out CBS
And therefore I just like no, no, no, you just FTP it up. You just FTP it
I knew they knew how to do FTP and then after the third time I had overridden their changes as I got damn it
I guess I got to teach Jason CBS to not do that again, but
I think there's
Still way more truth to the fact that we can work the way we did in the 90s work the way Peter works today
Even in the team context and that we've been far too willing to hand over far too much of our developer ergonomics to the merchants of complexity
And you've been chasing that with Rails 8
So how do you bring all the cool features of a modern framework and make it no build?
Make it as easy to
Create something and to ship it as it was in the 90s with just php
It's very difficult for me to beat the peter levels approach
Of just just it's so easy to just ship some php and it should be
Why should it be harder than that our computers today are
Almost infinitely faster than what they were in the 90s
So shouldn't we be able to work in even easier ways
We should be looking back on the 90s and go like oh that was way too complicated
Now we have more sophisticated technology that's way faster and it allows us to work in these easier to use ways
But that's not true
But now you can see the line I draw in my work with Ruby and Rails and especially with Rails 8
No built to me is
Reaching back to that 90s feeling and going now we can do some of those things without giving up on all the progress
Because I do think you can get to nostalgic. I do think you can start
Just fantasizing that everything was better in the 90s. It wasn't
I mean, I was there. There was a lot of things that sucked and if we can somehow find a way to combine
The advantages and advances we've had over the past 20 years with that ease of developer ergonomics
We can win no built is
A rejection of the part of web development. I've hated the most in the past 1015 years
Which is the java script seen
And I don't say that as someone who hate java script
I mean, I often joke that java script is my second favorite programming language
It's a very distant second. Ruby is by far and away number one
But I actually like java script. I don't think it's a bad language. It gets a lot of
Flack people add a string of two plus of one and give something nonsense
And I just go like yeah, but why why would you do that? Just don't do that
The language is actually quite lovely
Especially the modern version ES6 that really introduced a proper class syntax to it
So I could work with java script in many of the same ways that I love working with Ruby
may think so much better
But in the early 2010s until quite recently all of that advancement happened in
pre-processing happened in build pipelines the browsers couldn't speak a dialect of java script
That was a pleasant to work with so everyone started to pre-compiling their java script to be able to use more modern
Ways of programming with a browser that was seen as stuck with an ancient version of java script
That no one actually wanted to work with and that made sense to me
But it was also deeply unpleasant
And I remember thinking during that time the dark ages as I refer to them with java script that
This cannot be the final destination
There's no way that we have managed to turn the internet into such an unpleasant place to work
Where I would start working on a project in java script using webpack and all of these dependencies
And I would put it down for literally five minutes and the thing wouldn't compile anymore
The amount of churn that the java script community especially with its frameworks and its tooling went through
In the decade from 2010 to 2020 was absurd
And you had to be
trapped inside of that asylum to not realize what an utterly
perverse situation we had landed ourselves in
Why does everything break all the time?
I mean the joke wouldn't be just that the software would break that would annoy me personally
But then I'd go on hacker news and I'd see some thread on the latest java script release of some framework
And the thread would be like
um
Someone would ask well aren't we using the thing we just used three months ago and people would be like that thing is so outdated
That's so three months ago
You got to get with the new program. We're completely rewriting everything for the team time
And anything you've learned in the framework you've been spending the
Last amount of time on it's all useless. You got to throw everything out and you got to start over
Why aren't you doing it stupid idiot? Is that a kind of mass hysteria that took over the developer community?
You think like where you have to keep creating new frameworks and new frameworks and we are we past that
Dark age
I think we're getting out of it and we're getting out of it because browsers have gotten so much better
There was a stagnation in browser technology some of it was an overhang all the way back from iE5
So iE5 essentially put the whole internet development experience into a deep freeze because
Microsoft won the browser wars in the mid 2000s
And then they basically expanded their browser development team because they're all right job done
We don't need any more innovation on the internet. Can we just go back to writing windows forms or something now that we control everything
And it really wasn't until
Obviously Firefox kind of kindled a little bit of something then chrome got into the scene and google got serious about moving to web forward
that
You had a kindling of maybe the browser could be better
Maybe the browser wasn't frozen in time in 2005 maybe the browser could actually
Evolved like at the development platform that it is
But then what happened was
You had a lot of smart people
Who poured in to the web because the web
Turned out to be the greatest application development platform of all time
This was where all the money was being made this were this was where all the billionaires were being minted
This was where the Facebook send whatever of the world came to be so you had all of this
Brainpower applied to the problem of how to work with the web and there were some very smart people
With some i'm sure very good ideas who did not have
Programmer happiness as their motivation number one they had other priorities
And those parties
allowed them to discount and even rationalize the complexity they were injecting everywhere
Some of that complexity came from organizational structure when you have a company like Facebook for example
That does depend on the web and want to push it forward but have sliced the development
Roll job into these tiny little niches. I'm a front-end
glob
Pipeline a configurator. Oh, yeah, well. I'm a front-end whatever engineer and suddenly
The web developer was no longer one person. It was 15 different rolls
That in itself injected a ton of complexity, but I also want to give it
The bold case here which was that some of that complexity was necessary
To get to where we are today that the complexity was a bridge
It wasn't the destination, but we have to cross that bridge to get to where we are today where browsers are
Frankly incredible the java script you can write in a text file
And then serve on a web server for browser to ingest is amazing
It's actually a really good experience. You don't need any pre-processing. You can just write text files send up to a browser
And you have an incredible development and we should also say that it can kind of be broken at least the HTML
But even the javascript could be a little bit broken and it kind of still works
Like maybe it half-ass works
But like just the amount of mess
Of smelly code that a browser has to deal with is insane
This is one of the hardest problems in computing today is to parse the entire internet because thankfully
For us as web developers, but perhaps not so much for the browser developers
Every web page that has ever been created minus the brief period would flash still runs today
The web page I did in ninth grade would render on a modern browser today 30 years later easy
That is completely crazy when you think about the amount of evolution we've had with the web how much better
We've made it how many more standards browsers have adopted it's
Essentially in the paul of project today to create a new browser
Which is why it doesn't happen very often which is why even companies like Microsoft have to throw into towel and say we can't do it
Now I actually don't think that's good for the web
There is the danger of the monoculture if we just get a single browser engine that runs everything and we are in danger of that
I love the fact that the lady bird project for example is trying to make a new browser engine from scratch
I've supported that project. I would encourage people to look into that. It's really a wonderful
Thing it's staff by a bunch of people who worked on other browser projects in the past truly independent web browser
We really need that
But I can hold that thought in my head at the same time. I hold the thought in my head that
Google's Chrome
Was pivotal to the web surviving as the premier web development platform
If it had not been for Google and their entire business depending on a thriving open web
Apple
Microsoft I think would have been just as fine to see the web go away to disappear into being something that just served
Native web application or native mobile applications and native desktop applications that they could completely control
so
I have also the problems with Google, but it's not chrome chrome is a complete gift to
Web developers everywhere to the web as a development platform and
They deserve an enormous amount of credit. I think for that even if
It's entangled with their business model and a half of
Chrome is code that spies on you or informs
Targeted ads and a bunch of things. I'm not a big fan of
I can divorce that from the fact that we need champions in the corner of the web who have trillions of dollars
Of market cap value riding on the open web. We're gonna take tangents upon a tangents upon a tangents
So let's go to chrome. I think
Chrome positive impact on humanities is immeasurable for reasons that you just described
On the technology front the features that present the competition they created. It's spurred on this
Wonderful flourishing of web technologies, but anyway. I have to ask you about the
The recent stuff with the DOJ trying to split up chrome and google. Do you think this is a good idea?
Do you think this does harm?
Is this a disaster?
And I say that as someone who's been very sympathetic to the antitrust
Fight because I do think we have antitrust problems in technology
But the one place where we don't have them
By and large is with browsers is with
The tools we used to access the open web. First of all, we have Firefox
Now Firefox is not doing all that great and Firefox has been propped up by google for many years
To deter from exactly what's going on with the DOJ that they were the only game in town
Apple has safari. I have a bunch of problems with apple too
But I love safari. I love the fact that we have a premiere browser running on a premiere operating system
That people can't turn the web into just a chrome experience
But I also think that the open web needs this trillion dollar champion or at least benefits from it
Maybe doesn't need it, but it certainly benefits from it
And of all the things that are wrong with monopoly formation in technology
Chrome is the last thing and this is why I get so frustrated sometimes about the
Anti or the monopoly fight that there are real problems
And we should be focusing on the premiere problems first like the toll booths on our
mobile phones
They're far bigger problem. It's not the open web. It's not the tools that we used to access the open web
If I don't want to use chrome if my
Customers of my businesses that run on the internet don't want to use chrome
They don't have to we're never forced to go through it the open internet is still open
So I think it's a real shame
That the DOJ has chosen to pursue google in this way
I do think there are other things you can nail google for and they're
Adminopoly maybe or the
Shenanigans they've done in controlling both sides of the ad ledger that they both
Control the supply end of the man there are problems chrome isn't it and you end up making
The web much worse and this is the thing we always got to remember when we think about legislation when we think about
monopoly fights is
You may not like how things look today and you may want to do something about it
But you may also make it worse
The good intentions behind the GDPR in Europe
Currently has amounted to what cookie banners that everyone on the internet hates that helps no one do anything better
Anything more efficient that saves no privacy in any way shape a form has been a complete boondoggle that has only enriched lawyers and accountants and
Pure crafts. Yeah, you said that the cookie banner is a monument for why Europe is losing is is doing the worst
Of all the regions in tech
It's it's a monument to good intentions leading straight to hell
And the Europe is actually world class in good intentions leading straight to hell
So hell is the cookie except button they have to accept all cookies
That's what hell looks like over and over
You don't actually ever get to the web page just on a human scale try to imagine how many hours every day are wasted
Clicking that away and how much harm we've done to the web as a platform that people enjoy
Because of them
The internet is ugly in part because of cookie banners
Cookie banners were supposed to save us from advertisement and advertisement can make the web ugly
There's plenty of examples of that
But cookie banners made the entire internet ugly in one
Spelt swoop and that's a complete tragedy
But what's even worse and this is why I call it out as a monument to everything the EU gets wrong
Is that we have known this for a decade
No one anywhere who's serious believes that cookie banners does anything good for anyone yet
We've been unable to get rid of it
There's this one piece of legislation that's now I think 10 to 12 years old
It's complete failure on every conceivable metric
Everyone hates it universally yet we can't seem to do anything about it
That's a bankrupt seat declaration for any
Body of bureaucrats who pretend or pretend to make things better for
Not just citizens, but people around the world
This is the thing that really gets me about cookie banners too
It's not just the EU
It's the entire world you can't hide from cookie banners anywhere on this planet
If you go to got that Mars on one of Elon's rockets and you try to access a web page
You'll still see a cookie banner no one in the universe is safe from this nonsense probably the interface on
On the rocket you will have basically
150 second ping time. Yeah, so it'll take you 45 seconds just to get through the cookie banners from Mars
All right, let's walk back up the stack of this recursive tangents we've been taking so chrome
We should say at least in my opinion
Is not winning unfairly it's winning in the fairway by just being better
It is if I was gonna steal man the other side just for a half second
People would say well maybe yes
Most people do
Sort of begrudgingly agreed that chrome is a pretty good browser
But then they'll say the reason it got dominance was distribution
And the reason it got distribution was because Google also controls android
And therefore can make chrome the default browser on all these phones now
I don't buy that and the reason I don't buy that is because unandroid
You're actually allowed to ship a different browser that has a browser engine that's not the same as chrome
Unlike on iOS where
If you want to ship a browser chrome for example ships for iOS, but it's not chrome. It's a farie wrapped in a dress
and
Every single alternative browser on iOS have to use the safari web engine. That's not competition
That's not what happened on android again. I think there are some nuances to it
But if you zoom out and you look at all the problems we have with big tech chrome is not it chrome one on merits
I be grudgingly have switched to chrome on that realization alone as a web developer. I just prefer it
I like Firefox in many ways. I like the ethos of it
But chrome is a better browser than Firefox full stop and by the way, we've never mentioned edge
Edge is also a good browser
Because it's also chrome in a dress, but it never gets the love. I don't think I've ever used Bing
And I'm sure Bing is really nice
Maybe you have because you know what is Bing in a dress what duck duck go
Which is actually the search engine that I use duck duck go
Gets its search results from Bing or at least it used to if they changed that that would be news to me
Well, maybe
everything
It's just a wrap or a dress everything is wearing a dress underneath. There's some other
There's some of those it turns all the dresses all the way down. Okay. Well, we're talking about they we got there from javascript and from you
Learning how to program. So eventually
The big success stories when you built them with just stuff with php
And you're like actually chipping things. Yes, and that's when the the ruby story came so what
Your big love affair with programming began there. So can you take me there? What is ruby tell the story of ruby?
Explain ruby to me
php was what converted me from just being able to
fondle html and turn out some web pages to actually being able to produce web applications myself
So I owe a tremendous gratitude to php in that regard, but I never thought of php as a calling
I never thought I'm a professional programmer who writes php
That's why I am and that's what I do
I thought of php as a tool. I needed to
smack the computer with until it produced web applications. I wanted it was very much a means to an end
I didn't fall in love with php
I'm very grateful that it taught me the basics of programming and I'm very grateful that it set the bar for the economics
But it really wasn't until ruby that I started thinking of myself as a programmer and the way that came about was
That the first time I ever got hired as a professional programmer to write code was actually
By Jason freed my business partner still all the way back in 2001
I had been working on these gaming websites in php for essentially 18 months at that point
No one had been paying me to do code in that regard and I
Connected with Jason freed
over an email sent from Copenhagen denmark to Chicago, Illinois
To a person who didn't know who I was. I was just offering
Solicit advice Jason had asked a question on the internet and I had sent them the answer and he was asking in php
And I had sent them the answer to that question and we started talking and then we started working
Which by the way is a miracle of what the internet can allow?
How can a kid in Copenhagen who's never met this guy in Chicago connect just over
Email and start working together and by the way, we're still working together now
24 years later that's incredible
But we started working together and we started working together on some client projects
Jason would do the design 37 signals would do design. I would bring the programming php
And everyone did we work on I think two or three client projects together in php
We kept hitting the same problem
That whenever you work with a client you start that project off an email. Oh, yeah
Let's work together. Here's what we're building and you start trading more and more emails and
Before a few weeks have passed you got to add someone to the project
They don't have the emails. They don't have the context. You send them. Where's the latest file?
Oh, I've uploaded on the ftp. It's like final final v06 2.0 right that's the one to get it's just a mess
A beautiful mess in some ways a mess that still runs the vast majority of projects to this day
Email is the lowest common denominator
That's wonderful
But we had dropped the ball a couple of times in serious ways with customers and we thought
We can do better. We know how to make web applications. Can't we just make a system
That's better than email for managing projects. It can't be that hard
We've been doing blogs. We've been doing to do list. Let's put some of these things together and just make a system where
Everything that anyone involved in the project needs is on one page and it has to be simple enough that
I'm not going to run a seminar teaching you how to use the system. I'm just going to give you the login code
You're going to jump into it. So that's base camp and when we started working on base camp
I for the first time in the experience I have with Jason hat the freedom of technology choice
There was no client telling me. Yeah, PHP. That sounds good. We know PHP. Can you build it in PHP? I had free reigns
And at that time I'd been reading I triple E magazine
And a couple of other magazines back from the early 2000s
where Dave Thomas and Martin Fowler had been writing about programming patterns and
How to write better code and these two guys in particular
We're both using Ruby to explain their concepts because Ruby looked like pseudocode
Whether you were programming in C or Java or PHP
All three constituencies could understand Ruby because it basically just reads language
So these guys were using Ruby to describe the concepts and first of all
I would read these articles for just the concepts they were explaining and
I'd be like, what is this program language? I mean, I like the concept you're explaining
But I also want to see the program language
Why haven't I heard of this? So I started looking into Ruby
And I realized at that time Ruby might not be known by anyone
But it's actually been around for a long time
Matt's the Japanese creative Ruby had started working on Ruby back in 93
Before the internet was even a thing
And here I am in 2003 10 years later
Picking up what seems like this hidden gem that's just laying in obscurity and plain sight
But Dave Thomas and Martin Fowler I think
successfully put me and a handful of other people on
The trail of a programming language that hadn't been used much in the West but could be
So I picked up Ruby and I thought
This is this is very different
First of all, where are all the semicolons?
I'd been programming in PHP and ASP and even done some Pascal
Looked at some C there are semicolons everywhere
And that was the first thing that struck me is where are the damn semicolons
And I started thinking actually why do we have semicolons in programming
They're to tell the interpreter that there's a new line of instructions
But I don't need him as a human. How? Oh
Someone is looking out for the human here not for the machine
So that really got me interested and then
I thought to myself. Do you know what? I know PHP quite well
I'm not an amazing programmer. I haven't been working in programming for all that long
But maybe I can figure it out. I'm going to give myself two weeks
I'm going to write a proof of concept where I talked to a database
I pulled some records. I format them a bit and I display them on an HTML page. Can I figure that out in a couple weeks?
It took about one weekend and I was completely
Mesmerized. I was completely
mind-blown
because ruby
Was made from my brain like a perfect tailored glove
By someone I'd never met like how is this even possible? We should say maybe
Like paint the picture of the certain qualities that ruby has
Maybe even compared to PHP. We should also say that there's a ridiculous
Thing that I'm used to that if you get about that there's dollar signs everywhere. Yes, I mean that there's line noise
That line noise line noise. That's such a beautiful phrase
Yeah, so there's all this things that look like programs and with ruby
I mean, there's some similarities and Python there
It just looks kind of like natural language. You can read it normally. Here's a while loop that does a
Five iterations you can literally type the number five
Dot now. I'm calling a method under number five by the way
That's one of the beautiful aspects of ruby that primitives
Like integers or also objects and you can call five dot
times
Start brackets now you're iterating over
The code in that bracket five times that's it. Okay. That's nice
That's not just nice. That's exceptional. There's literally no other programming language that I know of that has managed to boil away
The line noise that almost every other programming language would inject into a five-time iteration over block code to that extent
That's a really nice. Oh, thank you for giving that example. That's a beautiful example
Wow, I don't think I know a programming language that does that. That's really nice ruby is full of that
And there's so let me dive into a couple of examples because I really think it helps paint the picture and
Let me preface this by saying I actually I like the ethos of Python
I think the ruby and the python community share a lot of similarities
They're both dynamic interpretive languages. They're both focused on
immediacy and productivity and ease of use in a bunch of ways
But then there are also very different in many other ways and one of the one ways they're very different this aesthetically
Python to me, I hope I don't offend people too much. I've said this before. It's just it's ugly
And it's ugly at it in its base because it's full of
superfluous
Instructions that are necessary for legacy reasons
Of when Guido made Python back in 87
That are still here in 2025 and my brain can't cope with that. Let me give you a basic example
When you make a class in Python the initialize a method the starting method is deaf. Okay, fair enough
That's actually the same as ruby def definition of a method
Then it is underscore
Not one
underscore two in it
underscore underscore
parentheses start
Self
comma and then the first argument. Yeah, the whole self thing. Yeah
I look at that and go. I'm sorry. I'm out. I can't do it
It's just it's everything about it. Offense my sensibilities to the core here
You have the most important method that all new objects or classes have to implement and it is one of the most
aesthetically offensive ways of typing initialize that I've ever seen anywhere
And you guys are okay with this. Yeah, you're making me you know where
You're like talking about my marriage or something like this and I'm not realizing
I've been in a toxic relationship all along. Yeah, I just get used to it
That to me by the way was the magic of ruby it opened my eyes to how beautiful
Programs could be I didn't know I'd been working at SP. I'd been working at PHP
I didn't even have the concept that aesthetics beautiful code was something we could optimize for that something
We could pursue and even more than that that we could pursue it above other objectives
That ruby is as beautiful as it is is not an accident and it's not easy
Ruby itself is implemented and see it's very difficult to parse ruby code
Because ruby is written for humans and humans are messy creatures
They like things in just the right way. I can't fully explain
Why the underscore underscore in it underscore underscore make me
Repulse but it does and when I look at the ruby alternative. It's really instructive. So it's death same part df
space
Initialize
parentheses not even parentheses if you don't need to call it within the arguments
There's not even a parentheses that in itself is actually also a major part if the human doesn't need the additional characters
We're not just going to put them in because it be nicer to parse for the computer
We're going to get rid of the semicolons. We're going to get rid of the parentheses. We're going to get rid of
The underscores. We're going to get rid of all that ugly and is all the line noise and boil it down to its pure essentials
And at the same time, we're not going to abbreviate
This is a key difference in the aesthetics between ruby and python as well
In it is short of type it's only five characters initialize is a lot longer
But it looks a lot better and you don't type it very often
So you should look at something pretty if you don't have to do it all the time. It's okay that it's long
Those kinds of aesthetic evaluations are rife all over the ruby language, but let me give you an even better example
The if conditional that's the bedrock of all programming languages. They have the if conditional
If you take most programming languages, they'll have if that's basically the same in almost every language space start parentheses
We all do that and then you have
Perhaps let's say you're calling a object called user
Dot is admin close parentheses close parentheses start brackets
And here's what we're going to do if the user's an admin right that would be a normal programming language
Ruby doesn't do it like that
Ruby boils almost all of it away. We start with the if okay, that's the same
No parentheses necessary because there's no ambiguity for the human to distinguish that the next part is
Just a single statement. So you do if space user dot
admin question mark
Ha
Yeah, no open brackets. No parentheses. No nothing next open line. Here's your conditional that
Question mark means nothing to the computer
But it meets something to the human Ruby put in the
predicate method style
purely as a communication tool between humans
It's actually more work for the interpreter to be able to see that this question market is here
Why is this question mark in here because it just reads so nicely if user admin question mark
That's a very human phrase, but it gets better
You can turn this around you can have your
Statement you want to execute before the conditional you can do user dot
Upgrade you say you're calling an upgrade method on a user
Space if space user dot admin question mark we do the thing if the thing is true
Instead of saying if the thing is true do the thing but it gets even better
This is why I love this example with the conditional because you can keep diving into it. So
Let's flip it around
user dot down great if
exclamation point not
user dot admin right that'd be a typical way of writing it
Ruby goes
That exclamation point is light noise
Why do we have if and then an exclamation point that's ugly we could do user dot down great
unless
user admin question mark
That to me is an encapsulation of the incredible
beauty
That Ruby affords the programmer through ambiguity
That is only to serve the human reader and writer all of these statements. We've just discussed
They're the same for the computer. It'll combine down to the same C code
They'll compile down to the same assembly code
It makes no difference whatsoever. In fact, it just makes it harder to write an interpreter
But for the human who gets to choose whether the statement comes before the conditional or the predicate method has
It's just incredible. It reads like poetry at some point
It's it's also incredible that you know one language designer is creating that
You know wheat of an awesome also. It's like one person gets to make these extremely difficult decision because
It's you have to think about how does that all get parsed
And you have to think about the thousands if it's a popular language of millions of people that end up using this
And what they feel what that question mark on the for the if statement what does that feel like
For that's what matt's thought about because he started his entire mission off a different premise
Then almost every programming language designer that I'd heard at least articulate the vision
That his number one goal was programmer happiness that his number one goal was the
affordances that would allow programmers to articulate code in ways that not just
executed correctly
But we're a joy to write and we're a joy to read and that
vision is based on a fundamentally different
view of humanity
There's no greater contrast between matt's and James Gosling the designer of Java. I once listened to
James talk about the design of Java. Why was it the way it was?
Why was it so rigid and he was very blunt about it which by the way
Really appreciate and I think Gosling's done a tremendous job with Java
But his view of humanity's rather dark his view of humanity was programmers
At the average or stupid creatures
They cannot be trusted
With sophisticated programming languages because they're going to shoot their
Foot off or their hand off and that would be kind of inconvenient to the
Regional development office of a mid-tier insurance company writing code that has to last for 20 years
Now
It's actually a very Thomas Saul view of constrained capacity in humans that I've come to appreciate much later in life
But it's also a very depressing view of programmers that there are just certain programmers who are too dumb to appreciate
Code poetry. They're too ignorant to learn how to write it well
We need to give them a sandbox where they just won't hurt themselves too much
matt's when the complete opposite direction he believes in humanity
He believes in the unlimited
capacity of programmers to learn and become better so much so
That he's willing to put the
Stranger at his own level. This is the second part. I truly appreciate about Ruby
Ruby allows you to extend base classes
You know how we just talked about five dot times is a way to iterate over
A statement five times that five is obviously a base class
It's a number. Do you know what you can add your own methods to that
I did
extensively in Rails we have something called active support which is essentially my dialect of Ruby for programming web applications
And I'll give you one example. I've added a method called
Days to the number. So if you do five dot days
You get five days in seconds because seconds is the way we set cash exploration times and other things like that
So you can say
Cash expires in five dot days and you're gonna get whatever five times
24 times 60 times 60 years or whatever the
Math is right very humanly readable in a normal programming language you would type out
The seconds and then you would have a little comment above it saying this represent five days
In Ruby you get to write five days, but even better than that matt's didn't come up with it
Matt's didn't need the five days. I needed that because I needed to expire cashess
I was allowed by matt's to extend his story with my own chapters
Unequal footing such that a reader of Ruby could not tell the difference between the code Matt's wrote and the code that I wrote
He trusted me as a complete stranger from Denmark who would never met to mess with his beautiful story
That level of trust is essentially unheard of. I know there are other program languages that allow things with macros and so forth
But none do it in a way like Ruby does it none does it with an articulated vision of humanity a trust in humanity like matt's does
That is the opposite end of the spectrum of Java. Yeah, I mean for my aesthetic sensibilities just the way you describe five dot days
That's really pleasant to me like I could see myself sitting alone
Sleep deprived and just writing that it's just an easy thing you can write it in a long way with a comment
You can you can write a multiple lines you could do
And now with AI, I'm sure it's going to generate a correct but there's something really pleasant about the simplicity of that
I'm not sure what that is but you're right. There is a good feeling there
And I'm sure we'll talk about happiness from all kinds of philosophical angles
But you know
That is what happiness is made up that little exactly a good feeling there
It's the good feeling that come out of a concept
Compressed to its pure essence. There's nothing you can take away from that statement. That's a purpose
But see I also want to push back a little bit because it's not
Because I also a program at Pearl a bunch
But just just to be cool
So like it's not all about compression
No, you can compress it too far
Pearl Gulf is a thing where you can turn
Programs into something that's unreadable for humans. Now the great thing about Pearl was that it came out before Ruby
Matt's was a great student of
Wall
Was a great student of pearl was a great student of python and small talk and lisp
He took inspiration from all of these prior attempts at creating good programming languages
And really edited down the very best bits into this
So he was able to learn from his lessons but what I found incredible about Ruby is that here we are 2025
Ruby has been worked on for over 30 years and essentially the first draft
Is 90% of what we're still using there was almost a sense of divine inspiration
possible in wherever Matt's was writing that initial version of Ruby that
Transcended time to such a degree that no one has still even begun to reach it
This is the other thing I was fine fascinating
I
Generally believe in the efficient market theory that if someone comes up with a better mouse trap or better idea
Others will eventually copy them to such an extent that perhaps the original mouse trap is no longer even remembered
No one has been able to copy that essence of Ruby
They borrowed elements and that's totally fine, but Ruby still stands
taller than everyone else on these metrics on this trust in humanity and programmers and we should also say like
You know
Maybe the perfect programming language is that that metric and then there's the successful language and those are often different
There's something wonderful about the brand-in-ike story of creating javascript. Yes
Of
There's something truly beautiful
About the way javascript took over the world
I've recently got to visit the Amazon jungle and just one of my favorite things to do is just to wash the ants take over anything
Everything and it's just like it's a nice distributed system
It's a messy thing that doesn't seem to be order, but it just works and the machinery of it
Worse this better. I mean, that's actually the name of a pattern for in in suffer development and other ways of how do
Is the pattern of linux linux was quantifiably worse than I think it was minics at the time other ways of it that were more
Cathedral
less bizarre and
It's still one that there's something to it that the imperfections
Can help something go forward. It's actually a trick. I've
Studied to the degree that I now incorporated in almost all open source that I do
I make sure that when I release the first version of any new thing I work on
It's a little broken
It's a little busted in ways that invite people to come in and help me because there's no easier way to get the
collaboration of other programmers
Then to put something out that they know how to fix and improve. Yeah, that's awesome
Ruby is somehow
Or was at least a little bit different in that regard not in all regards
Matt's got the ethos of the language the design of language just right
But the first versions of ruby were terribly slow
it's taken
I mean hundreds of
Manures to get ruby to be both this beautiful yet also
highly efficient and really fast and we should say that the thing that made you fall in love with this particular programming language is meta programming
Yes, so that takes all of these elements. We've just talked about and turned them up to 11
I'll explain meta programming real soon meta programming is essentially a version of the five dot days
You get to add keywords to the language
Active record is the part of rails that communicates with the database
This is a system where every
Table in the database is represented by a class. So if we take the user example again. You do class user
um
The sends from active record base
And then the first line you can write is this. I want my users to have many posts or have many comments
Let's do that. We're making some system where users can make comments
The very next line is has underscore many space
colon comments
Now you've set up a dependency between users and comments that will give you a whole host of
Access and factory methods for users to be able to own comments to create comments to update comments in that line alone
Has many
Looks like a keyword. It looks like it's part of the Ruby language. That's meta programming when
Rails is able to add these elements to
How you define a class and then that runs code that adds a bunch of methods to the user class
That's meta programming and when meta programming is used in this way
We call it domain specific languages
You take a generic language like Ruby and you tailor it to a certain domain like describing
Relationships in the database at a object level
and
This is one of those early examples where you can do
user has many comments
Belongs underscore two space colon account now you've set up a
one-to-one relationship before we had I want to many relationship
Rails is rife with all this kind of domain-specific languages were
At sometimes it doesn't even look like Ruby you can't identify Ruby keywords
You can just identify what looks like
Keywords in its own programming language now again. I know that lisp and others
Also do this stuff. They just do it with the maximum amount of line noise that can ever be crammed into a
Programming language and Ruby does it at a level where you cannot tell my meta programming from mattes keywords and with zero line noise
Yeah, I should say that my first love was lisp. So there's a slow tear that you can't see
I've actually never written any real lisp myself. Well, how can you judge it so harshly then
Because I have two eyes and I can look at code and my aesthetic sensibilities forbid me to even go much further
Which is a limitation? I know I should actually dive into lisp because I found that I've learned a lot just diving into
Maybe I'm insulting lisp again here, but the past of programming languages with small talk for example
I think small talk is a
incredible
Experiment that also worked but isn't suitable for today's programming environments
I love that we're talking about Ruby so much and what beautiful code is what a beautiful programming language is so one of the things
That is I think implied maybe you made explicit in your
Descriptions there is that Ruby is dynamic typing versus strict typing and you have been
Not just saying that it's a nice thing
But that you will defend dynamic typing to the death like that freedom is a powerful freedom to preserve
It's the essence of what makes Ruby Ruby
This is why I don't fully understand when people call for Ruby to add static typing because to me
It's the bedrock of what this is why would you want to turn one of the most beautiful languages into something far uglier
This is one of my primary objections to
Static typing. It's not just that it limits you in certain ways. It makes meta programming harder
I write a bunch of meta programming. I've seen what it takes to do meta programming type script
I was actually one of the things that just
Really sent me on a tear of getting meta or getting type script out of some of the projects that I'm involved with we pulled type script out of
Turbo one of the front end frameworks that we have because I tried to write the meta programming in type script
And I was just infuriated. I don't want that experience
But I also don't want it from an aesthetic point of view
I hate repetition. We've just talked about how much I love that Ruby boils all of these expressions down to its
Essence you can't remove one dot you can't remove one character without losing something this moment
You go for static typing that you declare at least. I know there are ways to do implied typing and so forth
But let's just take the stereotypical case of the java example for example
capital you
User I'm declaring the type of the variable lower case user. I'm now naming my variable equals
uppercase user or new uppercase user. I've repeated user three times
I don't have time for this
I don't have sensibilities for this. I don't want my Ruby
Polluted with this now. I understand all the arguments for why people like static typing when the primary arguments is that it makes tooling easier
It makes it easier to do auto complete in editors for example
It makes it easier to find certain kinds of bugs because maybe you're calling methods that don't exist
On an object and the editor can actually catch that bug before you even run it
I don't care
First of all, I don't write code with tools. I write them with text editors
I chisel them out of the screen with my bare hands
I don't auto complete and this is why I love Ruby so much and this is why I continue to
Be in love with the text editor rather than the IDE
I don't want an IDE
I want my fingers to have to individually type out every element of it because it will force me
To stay in the world where Ruby is beautiful because as soon as it gets easy to type a lot of boilerplate
Well, guess what you can have a lot of boilerplate every single language
Basically that has great tooling support has a much higher tolerance for boilerplate because the thinking is
Well, you're not typing it anyway. You're just auto completing it. I don't want that at all. I want something where
The fabric I'm working in it's just a text file. There's nothing else to it
so
These things play together. There's the aesthetic part. There's the tooling part
There's the meta programming part. There's the fact that Ruby's
Ethos of duck typing. I don't know if you've heard that term before
It's essentially not about can I call this method if a
Object is of a certain class. It is can I call this method if the method response?
It's very out of small talk in that regard. You don't actually check of whether that
Class has the method which allows you to dynamically add methods at runtime and do all sorts of really interesting things that underpin
All the beautiful meta programming that we do in Ruby. I don't want to lose any of that
And I don't care for the benefits one of the benefits
I've seen touted over and over again is that it's much easier to write correct software
You're gonna have fewer bugs. You're gonna have
Less null pointer exceptions you're gonna have unless all this stuff. Yeah, I don't have any of that
It's just not something that occurs in my standard mode of aberration
I'm not saying I don't have bugs. Of course I do
But I catch those bugs with unit testing with integration testing those are the kinds of
precautions that will catch logical bugs things that compile but are wrong
Along with the uncapulable stuff
So I've never been drawn into this world and part of it is because I work on a certain class of systems
I fully accept that if you're writing systems that have
510 50 million lines of code with
hundreds
Thousands or tens of thousands of programmers. I fully accept that you need different methods
What I object to is the idea that what's right for a code base of 10 million lines of code with a hundred thousand
Programmers working on it is also the same thing
I should be using in my bedroom to create base camp because I'm just a single individual
That's complete nonsense in the real world
We would know that that makes no sense at all that you don't
I don't know you sure pagani to go pick up groceries at Costco
It's a bad vehicle for that. It just doesn't have the space. You don't want to muddy the beautiful seats
You don't want to do any of those things. We know
that
Certain things that are very good in certain domains don't apply to all in programming languages
It seems like we forget that now to be fair
I also had a little bit perhaps of a repetition for getting that when I first learned ruby
I was so head over heels in love with this program language that I almost found it
Unconceivable that anyone would choose any other program language at all to write web applications
And I kind of engaged the evangelism of ruby and rails in that spirit as a crusade as I just need to teach you the gospel
I just need to show you this conditional code that we just talked about and you will convert at the
point of a sharp argument now
I learned that's not the way and part of the reason it's not the way is the programmers think differently our brains
Are configured differently my brain is configured perfectly for ruby perfectly for a dynamically
duct-typed language that I can chisel code out of a text editor with
and other people need the security of
An IDE they want the security of
Classes that won't compile unless you call the methods on it
I have come to accept that but most programmers don't they're still stuck in essentially
I like static typing therefore static typing is the only way to create reliable correct systems
Which is just such a mind-blowing
To be blunt idiotic thing to say in the face of evidence
Mountains of evidence to the contrary
This is one of the reasons I'm so in love with Shopify as the
flagship
Application for ruby and rails
Shopify exists at a scale that most programmers will never touch on black friday
I think Shopify did one million requests per second
That's not one million requests of images. That's of dynamic requests that are funneling through the pipeline of commerce
I mean Shopify runs something like 30% of all e-commerce stores on the damn internet
A huge portion of all commerce and total runs through Shopify and that runs on ruby and rails so
Ruby and rails is able to scale up to that level without using
Static typing in all of what it does now. I know they've done certain experiments in certain ways
Because they are hitting some of the limits that you will hit with dynamic typing
And some of those limits you hit with dynamic typing are actually by the way
Just limits you hit when you write five million lines of code
I think the Shopify monolith is about five million lines of code at that scale
Everything breaks because you're at the frontier of what humans are capable of doing with programming languages
The difference in part is that ruby is such a succinct language that those five million if they'd been written in
Let's just say go or Java would have been 50 or 25 now
That might have alleviated some of the problems that you have when you work on huge systems with many programmers
But it certainly would also have compounded them trying to understand 25 million lines of code
So the thing does scale that's the persistent myth that it doesn't scale
Shopify and others but Shopify things a great example
By the way, I love Shopify and I love Toby you got to be on. Yeah, sure this morning for sure
He's a brilliant. I got to hang out with him and then does it somewhere forget in Utah. He's just a brilliant human
And and Shopify Shopify.com slash lux has been supporting this podcast for the longest time
I don't think actually Toby knows that they sponsor this podcast and it is a big company, right?
It's a huge company. I think just under 10,000 employees market cap of 120 billion
GMV of a quarter of a trillion every quarter and he's involved with the details
He has very much so funny story about Toby
Toby was on the rails core team back in the mid 2000s
Toby himself wrote active merchant which is one of the frameworks for creating shops
He wrote the liquid templating language that Shopify still uses to this day
He has a huge list of contributions to the rails ecosystem and he's the CEO of the company
I think it's just
It's very inspiring to me because it's such at the opposite end of what I like to do
I like to chisel code with my own hands most of the day
He runs a company of almost 10,000 people that is literally
Like world commerce depends on it a level of criticality. I can't even begin to understand
And yet we can see eye to eye on so many of these fundamental questions in computer science and program development
That is a
Dynamic range to be able to encompass rails being a great tool for the one developer who's just starting out with an idea
Who don't even fully know everything who is right at the level where PHP would have been a good fit in those late 90s
Because yeah, I can probably upload something to an FTP server and so on
Rails does have more complexity than that
But it also has so much longer runway the runway goes all the way to got them Shopify
That is about the most convincing argument I can make for sort of dynamic range that we can do a lot of it and
Even having said that
Shopify is the outlier of course
I don't think about Shopify as the primary target when I write rails
I think of the single developer actually I do think about Shopify
But I don't think about Shopify now. I think of Shopify when Toby was writing snow devil
Which was the first e-commerce store to sell snowboards that he created that was the pre
Shopify Shopify he created all by himself and that was possible because
Ruby and Rails isn't just about beautiful code. It's just as much about productivity
It's just as much about the impact and an individual programmer is able to have that they can build system where they can keep the whole thing in their head
And be able to move it forward such that you can go from one developer sitting and working on something
And that something is Shopify and turned into what it is today
When we talk about programming languages and we compare them we often compare them at a very late stage
Like what is the better programming language for let's say Twitter in 2009 when it's already a huge success
Twitter was started on Ruby and Rails
They then hit some scaling problems. It was a big debacle at the time. They end up
Then I think writing it in some other language
Which by the way, I think is the best advertisement ever for Ruby and Rails because nothing fucking happened for 10 years after
They switched over right essentially zero innovation
Some of that was because they were doing a long conversion and all of the early success in part came because they had the agility quickly change and adopt and so forth
That's what startups needs. That's what Shopify needed. That's what Twitter needed. That's what everyone needs and that's
The number one priority for Ruby and Rails to make sure that we don't lose that because what happens so often when
Development tools and programming language are driven by huge companies is that they mirror their org chart
React and everything else needed to use that is in some ways a reflection of how meta builds
Facebook because of course it is because of course it's a distraction of that
I'm not saying react isn't a great tool and that can't be used by smaller teams. Of course it can
But it's born in a very different context than something like Ruby and Rails
Let me say it's the smallest side because I think we might return to Shopify and celebrate it often
just sort of personal note
This particular podcast has way more sponsors and sponsors that want to be sponsors
That I can possibly ever have and it's really really important for me
To not give a shit and to be able to celebrate
People like I celebrate people I celebrate companies
And it has I don't care that they're sponsoring. I really don't care
I just want to make that very explicit because we're going to continue saying positive things about Shopify
I don't care stop sponsoring. It doesn't really matter to me
But yeah, I just want to make that explicit so but to linger on the scaling thing with the Twitter and the Shopify
Can you just explain to me?
What Shopify is doing with the with the jet?
What did they have to try to do to scale this?
Thing because that's kind of an incredible story, right?
Yeah, so one of the great contributions that Shopify has made to the entire Ruby ecosystem
Not just Rails, but in particular Rails is
Why jit so why jit is their compiler for for Ruby that just makes everything a lot more efficient and at
Shopify scale
Eaking out even a five ten percent improvement in rubies overhead and execution time is a huge deal
Now Shopify didn't need why jit
Shopify was already running on the initial version of Ruby that was I think 10 times slower than what we have today
If you look back upon the Ruby 186 that Topi probably started on just as I started on
And that was enough to propel Shopify to the scale that it has today
A lot of the scaling
Conversation in is lost in a failure to distinguish two things
Scale is kind of one package we talk about when there are really multiple packages inside of it one
Is runtime performance latency? How fast can you execute a single request?
Can it happen fast enough that the user will
Not notice if your Rails request takes a second and a half to execute the user's gonna notice your app is gonna feel slow and sluggish
You have to get that response time down below let's say at least 300 milliseconds
I like to target a hundred milliseconds as my latency. That's kind of performance
How much performance of that kind of latency can you squeeze out of a single CPU core?
That tells you something about what the price of a single request will be
But then whether you can
Deal with one million requests a second like Shopify is doing right now
If you have one box that can do a thousand requests a second you just need xboxes to get up to a million
And what you'll actually find is that when it comes to programming languages
They're all the same in this way. They all scale
Largely beautifully horizontally you just add more boxes the hard parts of scaling a Shopify is typically not
The program language is the database and that's actually one of the
um
Challenges the Shopify has now is how do you deal with my sequel at the scale that they're operating at when do you need to move to other
Databases to get worldwide performance all of these things the questions about scaling Ruby are economic questions
If we're spending so and so much on
Application servers if we can get just 5% more performance out of Ruby well
We could save 5% of those servers and that could filter down into the budget
Now that analysis concludes into basically one thing
Ruby is a luxury language
It's a luxury the highest luxury in my opinion. It is the
Coco Chanel a programming languages something that not everyone can afford and I mean this in the best possible way
There are some applications on the internet where each request
Has so little value you can't afford to use a luxurious language like Ruby
To program in it you simply have to slum it
With a C or a go or some other low-level language or rust talk about line noise there for a second thrift store of languages
Exactly where you need kind of just you need a very low level to do it
You can't afford to use a luxury language to you to to build it with
That's not true of Shopify. It was in true of base camp even back in 2004
It's not been true of 99% of all web applications ever created because the main cost component of 99% of web applications
It's not CPU course
It's wet course. It's human course. It's human capacity to understand and involve systems
It's their personal productivity. I did a calculation once when someone had for the 400th time
Said that oh if you switch from Ruby to some faster language you could save a bunch of money
And I calculated it out that at the time and I think the last time I did this calculation was almost a decade ago
We were spending about 15% of our operating budget on Ruby application servers
so
For me to improve my cost profile of the business
um
By seven percentage points. I'd have to pick something twice as fast
That's quite hard
Versus if Ruby and Ruby and Rails was even 10% more productive than something else
I would move the needle far more because making individual programmers more productive actually matters a lot more
This is why people are so excited about AI
This is why they're freaking out over the fact that a single programmer in silicon value makes 300 thousand dollars a year
Can now do the work of three or five at least in theory
I haven't actually seen that fully in practice, but let's just assume the theory is correct
If not now then in six months
That's a huge deal that matters so much more than whether you can squeeze a few more cycles out of the CPU
When it comes to these kinds of business applications if you're making
Unreal engine rendering stuff like Tim Sweeney you had on mm-hmm
Yeah, he needs to really sweat all those details the nanite engine can't run on Ruby
It's never going to it would not meant for that fine
These kinds of business applications absolutely can and
Everything that people are excited about AI for right now that extra capacity to just do more
That was why we were excited about Ruby back in the early 2000s
That was because I saw that we could even squeeze out a 10% improvement of the human programmer
We'd be able to do so much more for so much less probably argue about this
but
I really like working together with AI
Collaborating with AI and I would argue that the kind of code you want AI to generate is human readable human interpretable
Yes, if it's generating pearl golf code
It's just it's not a collaboration
So it has to be speaking the human it's not just you're writing the prompts in English
You also want to read the responses in the human interpretable language I can Ruby right?
So it's it's actually it's beneficial for AI too because you kind of
Said that for you the sculptor the sort of the elitist
Coco Chanel sculptor you want to on your fancy keyboard to type every single letter yourself for your own fingers
but it's also
that
The benefit of Ruby also applies in one's that is written by AI and you're actually doing with your own fingers the editing
Yes, because you can interact with it because it's human interpretable
The paradigm I really love for this was something Elon actually said on one of your shows when you guys were talking about neural link
That neural link allows the bandwidth
Between you and the machine to increase that language either spoken or written is very low bandwidth
If you are to calculate just how many bits we can exchange is we're sitting here. It's very slow
Ruby
Has a much higher bandwidth of communication
Revealed conveys so much more concept per
Character than most other programming language do
So when you are collaborating with AI you want really high bandwidth you wanted to be able to produce
Programs with you whether you're letting it write the code or not
that
Both of you can actually understand really quickly and that you can compress a
Grand comp or a grand concept a grand system into far fewer parts
That both of you can understand now. I actually love collaborating with AI too
I love chiseling my code and the way I use AI is in a separate window
I don't let it drive my code. I've tried that
I've tried the cursors and the wind serves and I don't enjoy that way of writing and one of the reasons
I don't enjoy that way of writing is I can literally feel
Competence draining out of my fingers like that
level of immediacy with the material
Disappears and the where I felt is the most was I did this
remix of Ubuntu called omacube when I switched to Linux and it's all written in bash
I'd never written any
Serious amount of code in bash before yeah, so he's using AI to collaborate to write a bunch of bash with me
Because I needed all this. I knew what I wanted. I could express it in Ruby
But I thought it was an interesting challenge to
Fildered through bash because what I was doing was setting up a Linux machine
That's basically what bash was designed for is a great constraint
But what I found myself doing was asking AI for the same way of expressing a conditional for example in bash over and over again
That by not typing it. I wasn't learning it. I was using it. I was getting
The expression I wanted but I wasn't learning it and I got a little scared
I got a little scared. Is this the end of learning and I no longer learning if I'm not typing and the way I
For me recast that was I don't want to give up on the AI
It is such a better experience as a programmer to look up API's to
Get a second opinion on something to do a draft
But I have to do it the typing myself because you learn with your fingers
If you're learning how to play the guitar you can watch as many YouTube videos as you want
You're not going to learn the guitar you have to put your fingers on the strings to actually learn the motions
And I think there is a parallel here to programming where programming has to be learned in part
By the actual typing. I'm just really this is this is fascinating listen part of my brain agrees with you 100% part doesn't
I
Think AI should be in the loop of learning now current systems don't do that
But I think it's very possible for cursor to say
To basically force you to type certain things
So like if you set the mode of learning. I just I don't want to be this
Sort of give up on AI. I really I think I think vibe coding is a skill
So
For an experienced programmer is too easy to dismiss vibe coding as a thing
I wouldn't dismiss it
But I think you need to start building that skill
And start to figure out how do you prevent the competency from slipping away from your fingers and brain
Like how do you develop that skill in parallel to the other to the other skill?
I don't know I just it's I think it's a fascinating puzzle though
I know too many really strong programmers that just kind of avoid AI because it's currently a little too dumb
Yes, it's a little too slow is actually my main problem
It's a little too dumb in some ways, but it's a little too slow in other ways when I use
Claude's code
The terminal version of a cloud which is actually my preferred way of using it. I just I get too impatient
It feels like I'm going back to a time where code had to compile and I had to go do something else
Abort some tea while the code is compiling while I've been working in Ruby for 20 years. I
Don't have compile weight in me anymore
So there's that aspect of it
But I think the more crucial aspect for me is I really care about the competence
And I've seen what happens to even great programmers the moment they put away the keyboard
Because even before AI this would happen as soon as people would get promoted
Most great programmers who work in large businesses stop writing code on a daily basis because they simply have too many meetings to attend to
They have too many other things to do and invariably they lose touch
With programming that doesn't mean they forget everything
But if you don't have your fingers in the sauce the source
You are going to lose touch with it. There's just no other way
I don't want that because I enjoy it too much
This is not just about outcomes. This is what's crucial to understand
Programming for programmers who like to code is not just about the programs they get out of it
That may be the economic value
It's not the only human value the human values just much in the expression
When someone who sits down on a guitar and plays stairways to heaven
There's a perfect recording of that that will last in eternity
You can just put it on Spotify. You don't actually need to do it. The joy
Is to command the guitar yourself
The joy of the programmer of me as a programmer is to type the code myself
If I elevate myself if my promote myself out of programming
I turn myself into a project manager a project manager of a murder of AI
Crows as I wrote the other day
I could have become a project manager my whole career
I could have become a project manager 20 years ago if I didn't care to write code myself
And I just wanted outcomes. That's how it got started in programming
I just wanted outcomes
Then I fell in love with programming and now I'd rather retire than give it up
Now that doesn't mean you can't have your cake in need to do
I've done some vibe coding where I didn't care that I wasn't playing myself
I just wanted to see something that was an idea in my head
I wanted to see something
That's fine. I also use AI all day long
In fact, I'm already at the point where if you took it away from me
I'd be like oh my god
How do we even look things up on the internet anymore?
It's stack overflow still around
Or I'm still a thing
Like how do I even find answers to some of these questions I have all day long
I don't want to give up AI
In fact, let's say the way I like to use AI
I'm getting smarter every day because of AI
Because I'm using AI
To have it explain things to me even stupid questions
I would be a little embarrassed to even enter into Google
AI is perfectly willing to give me the
ELI-5 explanation of some Unix command
I should have known already
But I don't I'm sorry
Can you just explain it to me and now I know the thing
So at the end of the day of me working with AI all day long
I'm a little bit smarter
Wait
5%
Sorry, not 5%
Half a percent maybe
That compounds over time
But what I've also seen
When I worked on the umaku project
And I tried to let AI drive for me
I felt I was maybe half a percent
Dumber at the end of the day
Okay, you said a lot interesting things
First of all
Let's just start with the very fact that
Asking dumb questions
If you go to stack overflow and ask a dumb question
Or read somebody else's dumb question
And the answer to it
There's a lot of judgment there
Yes
AI
Sometimes to an excessive degree
Has no judgment
It usually says
Oh, that's a great question
To a fault
Yeah
Oh, that's wonderful
Yeah, I mean
It's such a it's so conducive to learning
It's such a wonderful tooth learning
And I would I too would miss it
And it's a great basically search engine
And you know all kinds of nuances of a particular programming language
Especially if you don't know it that well
Or like API's
You can load in documentation
It's just so grateful learning
For me personally
It
I mean on the happiness scale
It makes me more excited to program
I don't know what that is exactly
Part of that is then
I'm really sorry stack overflow is an incredible website
There is a negativity there
There's a judgment there
There's just exciting to be out like
With a hype man next to me
Just like say
Yeah, that's a great idea
And I'll say
No, that's wrong
I'll correct the AI
And then the AI will say
You absolutely right
How did I not think about that
You know we're right to code
I'm like holy shit
I'm having
It's like a buddy
That's like
Really being positive
And it's very smart
And it's challenging me to think
And even if I never use the code to generate
I'm already a better programmer
But actually
The deeper thing is for some reason
I'm having more fun
That's a really really important thing
I like to think of it as a pair programmer
For exactly that reason
Per programming came
Boge in like the 2000s
Where you'd have two programmers in front of one machine
And you'd
Push the keyboard between you
One program would be driving
They'd be typing in
The other programmer would essentially sit
And watch the code suggest improvements
Look something up
That was a really interesting dynamic
Now unfortunately I'm an introvert
So I can do that for about five minutes before
I want to jump off a bridge
So it doesn't work for me as a full-time occupation
But AI allows me to have all the best of that experience
All the time
Now I think what's really interesting when you said about
It makes it more fun
I hadn't actually thought about that
But
What it's made more fun to me
Is to be a beginner again
It's made me
It made it more fun to learn bash
Successfully for the first time
Now I had to do the detour
Where I let it write all the code for me
And I realized I wasn't learning nearly as much
As I hoped I would
And that I started doing once I typed it out myself
But it gave me the confidence that
Do you know what if I need to do some iOS programming myself
I haven't done that in probably six years
Was the last time I dabbled in it
I never really built anything for real
I feel highly confident now
That I could sit down with AI
And I could have something in the app store
By the end of the week
I would not have that confidence
Unless I had a pair of programming body like AI
I don't actually use it very much for Ruby code
I'm occasionally impressed
Whenever I tried
They're like oh it's got this one thing right
That is truly remarkable
And it's actually pretty good
And then I'll ask you two more questions
And I go like oh yeah okay
If you were my junior programmer
I'd start tapping my fingers and going like
You got to you got to shape up
Now the great thing of course is
We can just wait five minutes
The in drop xco seems to think that
90% of all code by the end of the year is going to be written by AI
I'm more than a little bit skeptical about that
But I'm open-minded about the prospect
Programming potentially
We'll turn into a horse when done manually
Something we do recreationally
It's no longer a mode of transportation to get around LA
You're not going to saddle up
And go to the grocery store
And pick up stuff from whole foods in your saddlebags
That's just not a thing anymore
That could be the future for programming
For manual programming
Entirely possible
I also don't care
Even though we have great renditions of all the best songs
As I said
There are millions of people who love to play the guitar
It may no longer have as much economic value as it once did
I think that
I'm quite convinced it's true
That we perhaps have seen the peak
Now I understand the paradox
When the price of something goes down
Actually the overall usage goes up
And total spend on that activity goes up
That could also happen maybe
But what we're seeing right now
Is that a lot of the big shops
A lot of the companies
Are not hiring like they were five years ago
They're not anticipating they're going to need
Tons more programmers
Controversially Tobi actually put out a memo inside of Shopify
Asking everyone who's considering hiring someone
To ask the question
Could this be done by AI?
Now he's further ahead on this question
Then I am
I look at some of the code in trenches
And I go like
I'd love to use AI more
And I see how it's making us more productive
But it's not yet at the level where I just go
Like oh we have this project
Let me just give it to the AI agent
And it's going to go off and do it
But let's just be honest
You're like a Clint Eastwood type character
Cobboy on a horse
At the seeing cars going around
And you're like
Well
That's part of it
And I think it is important to have that humility
That what you are good at
May no longer be what society values
This has happened a million times in history
That you could have been
Exceptually good at saddle making for example
That's something that a lot of people used to care about
Because everyone rode a horse
And then suddenly riding a horse became this niche
Hoppy
That there's some people care about it
But not nearly as many
That's okay
Now the other thing of this is
I've had the good fortune
To
I've been a programmer for nearly 30 years
That's a great run
I try to look at life in this way
That I've already been blessed
With decades of economically viable
Highly valuable
Ways of translating what I like best
In the working world
To write Ruby code
That that was so valuable
That I could make millions and millions of dollars doing it
And if that's over tomorrow
I shouldn't look at that with regret
I should look at it with gratitude
But you're also highly experienced
Brilliant
And opinionated
Human beings
So it's really interesting to
Get your opinion on the future of the horse
Because it
You know, there's a lot of young people listening to this
Who love programming
Or who are excited by the
Possibility of building stuff with software
With a Ruby
With Ruby with Ruby on Rails
That kind of language
And now the possibility
Is it a career
Is it a career
And
How
If indeed a single person can build
More and more and more with a hub of AI
Like how do they learn that skill
Is this a good skill to learn
I mean that to me is the real
Mystery here because I think it's still absolutely true
That you have to learn how to program from scratch
Currently
But how do you balance those two skills
Because I too
As I'm thinking now
There is a scary slipping away of skill that happens
And a matter of like
Really minutes
On a particular piece of code
It's just
It's scary
Not the way
Driving
You know, when you have
A car drive for you
Doesn't quite slip away that fast
So that really scares me
So when somebody comes up to me
And asks me like
How do I learn to program
I don't know what the advice is
Because
I think it's not enough to just use cursor
Or a copilot of the generate code
It's absolutely not enough
Not if you want to learn
None of you want to become better at it
If you just become a tap monkey
Maybe you're productive in a second
But then you have to realize
Well, can anyone just tap
If that's all we're doing
Is just sitting around all day long tapping
Yes, yes, yes, yes, yes
That's not a marketable skill
Now
I always preface this
Both to myself
And when I speak to others about it
Is
Rule number one
Nobody fucking knows anything
No one can predict even six months ahead
Right now
We're probably at peak AI future hype
Because we see all the promise
Because so much of it is real
And so many people have experienced it themselves
This mind boggling thing
That the silicon is thinking
In some way
That feels eerily reminiscent of humans
I'd actually say
The big thing for me
Wasn't even chat gpt
Wasn't even clawed
It was deep seek
Running deep seek locally
And seeing the think box
Where it
Converses with itself
About how to
Formulate the response
I almost want to think
Is this a gimmick
Is it doing this
As a performance for my benefit
But that's not actually how it thinks
If this is how it actually thinks
Okay, I'm a little scared
This is
Incredibly human
How it thinks in this way
But where does that go
So
In 95
One of my favorite movies
One of my favorite B movies
Came out
The lawnmower man
Great movie
Incredible movie about virtual reality
Being an avatar and living in VR
Like the story was a mess
But the aesthetics
The world that build up was incredible
And I thought
We're five years away
I'm going to be living in VR now
I'm just going to be floating around
I'm going to be an avatar
This is where most humans
Can spend most of the day
That didn't happen
We're 30 years later
VR
Is still
Not here
It's here for gaming
It's here for some specialized
Applications
My oldest loves playing gorilla tag
I don't know if you've tried that
That's basically the hottest VR game
Wonderful
That's great
It's really hard to predict the future
Because we just don't know
And then when you factor in AI
And you have
Even the smartest people
Go like
I don't think we fully understand how this works
But then on the flip side
You have Moore's Law that
Seems to have worked for many many many years
Decreasing the size of the transistor
For example
So like
You know
Flash didn't take over the internet
But Moore's Law works
So we don't know which one AI is
And this is what I find so fascinating
To have a kid who did this presentation
But someone in the web community
Did this great presentation
On the history of the airplane
So you go from the right
Brothers flying in one of the 1903
Or something like that
And 40 years later
You have a jet flight
Just an unbelievable amount of progress
In four decades
Then in 56
I think it was
The halt design
For the Boeing 747
Essentially precursor
Was designed
And basically nothing has happened since
Just minor tweets and improvements
On the flying experience
Since the 50s
Somehow
If you were to predict
Where flying was going to go
And you were sitting in 42
And you'd seen
You'd remember the right brothers flying in 03
And you were seeing that
Jet engines coming
You're like
We're going to fly the stars
In another two decades
We're going to invent
Super mega hypersonic flights
That's going to traverse the earth
In two hours
And then that didn't happen
It tapped out
This is what's so hard about the future
We can be so excited in the moment
Because we're drawing a line
Through early dots on a chart
And it looks like those early dots
Is just going up and to the right
And sometimes it's just flatten out
This is also one of those things
Where
We have so much critical infrastructure
For example, that still runs on cobalt
That about five humans around the world
Really understand
Truly, deeply
That there's all
It's possible for society
To lose a competence
It still needs
Because it's chasing the future
Cobalt is still with us
This is one of the things I think about
With programming
Ruby and Rails is at such a level now
That in 50 years from now
It's exceedingly likely
That there's still a ton of Ruby and Rails systems running around
And very hard to predict
What that exact world is going to be like
But yesterday's weather tells us that
If there's still cobalt code from the 70s
Operating social security today
And we haven't figured out a clean way to convert that
Let alone understand it
We should certainly be
Humble about predicting the future
I don't think any of the programmers
Who wrote that cobalt code back in the 70s
Had any damn idea
Then in 2025
Chacks were still being cut
Of the business logic that they had encoded back then
But that just brings me
To the conclusion on the question
For what should a young programmer do
You're not going to be able to predict the future
No one's going to be able to predict the future
If you like programming
You should learn programming
Now is that going to be a career forever?
I don't know
But what's going to be a career forever
Who knows
Like a second ago
We thought that it was the
Blue color labor that was going to be extracted first
It was the robots that were going to take over
Then Gen AI comes out
And then all the artists suddenly look like
Holy shit
Is this going to do all animation now
Is going to do all music now
They get really scared
And now I see the latest Tesla robot
Going like
Maybe we're back now to blue color being in trouble
Because if it can dance like that
It can probably fix a toilet
So no one knows anything
And you have to then
Precision yourself for the future in such a way
That
It doesn't matter
That you pick a
Profession or path
Where if it turns out
That you have to retool and re-skill
You're not going to regret the path you took
That's a general
Life principle for me
How I look at all endeavors
I involve myself in
Is I want to be
Content with all outcomes
When we start working on a new product
At 37 signals
I set up my mental model for success
And I go
Do you know what?
If no one wants this
I will have had another opportunity
To write beautiful Ruby code
To explore a greenfield domain
To learn something new
To build a system I want
Even if no one else wants it
What a blessing
What a privilege
If a bunch of people want it
That's great
We can pay some salaries
We can keep the business running
And if it's a blow away success
Wonderful
I get to impact a bunch of people
I think one of the big open questions to me
Is
How far you can get with vibe coding
Whether an approach for a young developer
To invest
Most of the time into vibe coding
Or into writing code from scratch
So vibe coding meaning
So I'm leaning into the meme a little bit
But vibe coding meaning you generate code
You have this idea of a thing you want to create
You generate the code
And then you fix it
With both natural language to the prompts
And manually
You learn enough to manually fix it
So that's the learning process
How you fix code that's generated
Or you
You write code from scratch
And have the LLM's kind of
Tab
Tab, tab, tab
Add extra code
Like which part do you lean on
I think to be safe
You should find the beauty
And the artistry
And the skill in both
Right from scratch
So there should be some percent of your time
Just writing from scratch
And some percent vibe coding
There should be more
Of the time writing from scratch
If you are interested in learning how to program
Unfortunately you're not going to get fit
By watching fitness videos
You're not going to learn how to play the guitar
By watching YouTube guitar videos
You have to actually play yourself
You have to do the sit-ups
Programming, understanding
Learning almost anything
Requires you to do
Humans are not built to absorb information
In a way that transforms into skills
By just watching others from afar
Now ironically it seems AI is actually quite good at that
But humans are not
If you want to learn how to become a competent programmer
You have to program
It's really not
That difficult to understand
Now I understand the temptation
And the temptation is there
Because vibe coding can produce things
Perhaps in this moment
Especially in a new domain you're not familiar with
With tools you don't know
Perfectly well
That's better than what you could do
Or that you would take much longer
To get at
But you're not going to learn anything
You're going to learn in this
Superficial way that feels like learning
But it's completely empty calories
And secondly
If you can just vibe coded
You're not a programmer
Then anyone could do it
Which may be wonderful
That's essentially what happened
With the access database
That's what happened with Excel
It took the capacity of accountants
To become software developers
Because the tools became so accessible to them
That they could build a model
For how the business was going to do next week
That required a programmer prior to excel
Now it didn't because they could do it themselves
Vibe coding enables non programmers
To explore their ideas
In a way that I find absolutely wonderful
But it doesn't make your programmer
I agree with you
But I want to allow for room
For both of us be wrong
For example
There could be vibe coding
Could actually be a skill
That if you train it
And by vibe coding let's include the step of correction
The iterative correction
It's possible if you get really good at that
That you're outperforming
That people that have right from scratch
That you can come up with truly innovative things
Especially at this moment in history
While the LLMs are a little bit too dumb
To create super novel things
And a complete product
But they're starting to creep close to that
So if you're investing time now
Into becoming a really good vibe coder
Maybe
This is the right thing to do
If it's indeed a skill
We'll kind of meme about vibe coding
You just be like sitting back
And it's in the name
But if you treat it seriously
A competitive vibe coder
And get good at riding the wave of AI
And get good at the skill of editing code
Versus writing code from scratch
It's possible
That you can actually get farther in a long term
Maybe editing is a fundamentally different task
Than writing from scratch
If you take that seriously as a skill that you develop
I see, to me that's an open question
I just think I'm
I personally
And now you're on another level
But just me
Just personally
I'm not as good at editing
The code
That I didn't write
There's a difference
No one is
Of this generation
But maybe that's a skill
Maybe if you get on the same page as the AI
Because there's a consistency to the AI
It's like
It really is a pair of programmer
With a consistent style, structure, and so on
Plus with your own property
You can control the kind of road code you write
I mean, it could generally be a skill
That's the dream of the prompt engineer
I think it's complete pipe dream
I don't think editors
Exist that aren't good at writing
I've written a number of books
I've had a number of professional editors
Not all of them wrote their own great books
But all of them were great writers in some regard
You cannot give someone pointers
If you don't know how to do it
It's very difficult for an editor
To be able to spot what's wrong with a problem
If you think it couldn't make the solution themselves
Editing in my opinion is the reward
The capacity to be a good editor
Is the reward you get from being a good doer
You have to be a doer first
Now that's not the same as saying
That
Vibe coding prompt engineering
Won't be able to produce fully formed
Amazing systems even shortly
I think that's entirely possible
But then there's no skill left
Which maybe is the greatest payoff at all
Wasn't that the whole promise of AI anyway
That it was just all natural language
That even my clumsy way of formulating a question
Could result in a beautiful succinct answer
That actually to me is a much more appealing vision
That there's going to be these special prompt engineering wizards
Who know how to tackle the AI
Just right to produce what they want
The beauty of AI is to think
That someone who doesn't know the first thing about
How AI actually works
Is able to formulate their idea and their aspirations
For what they want
And the AI could somehow take that messy clump
Of ideas and produce something that someone wants
That's actually what programming has always been
There's very often been people who didn't know how to program
Who wanted programs, who then hired programmers
Who gave the messy descriptions of what they wanted
And then when the programmers delivered that back
Said oh no, actually that's not what I meant
I want something else
AI may be able to provide that cycle
If that happens to the fullest extent of it
Yeah, there's not going to be as many programmers around
Right
But hopefully
Presumably someone
Still at least for the foreseeable future
Have to understand whether what the AI is producing
Actually works or not
As an interesting case study
Maybe a thought experiment
If I wanted to vibe code
Basecamp
Or hey
And some of the products
You built
Like what would be the bottlenecks
What would I fail along the way?
What I've seen when I've been trying to do this
Trying to use vibe coding to build something real
Is you actually failed really early
The vibe coding is able to build a veneer
At the current present moment
Of something that looks like it works
But it's flawed in all sorts of ways
There are the obvious ways
The meme ways that it's leaking all your API keys
It's storing your password in plain text
I think that's ultimately solvable
Like it's going to figure that out
Or at least it's going to get better at that
But its capacity to get lost in its own labyrinth
Is very great right now
You let
It code something
And then you want to change something
And it becomes a game of whack-a-mole
Real quick
Peter levels who've been doing this wonderful flight simulator
Was talking to that
Where at a certain scale
The thing just keeps biting its own tail
You want to fix something
And it breaks five other things
Which I think is actually uniquely human
Because that's how most bad programmers are
At a certain level of complexity
With the domain
They can't fix one thing without
Breaking three other things
So in that way
I'm actually
In some way it's almost a positive signal
For that the AI is going to figure this out
Because it's done an extremely human trajectory right now
The kind of mistakes it's making
Or the kind of mistakes that junior programmers make all the time
Yeah
Uh
Can we zoom out
And look at the vision
The manifesto
The doctrine of rails
What are some of the things that make
A programming language
A framework great
Especially for web development
So we talked about happiness
Yes
The underlying objective of Ruby
What else
So you're looking at the nine points
I wrote out in I think 2012
And first before we dive into it
I want to say the reason I wrote it down
Is that
If you want a community to endure
You have to record its values
And you have to record its practices
If you don't
Eventually you're going to get enough new people come in
Who have their own ideas of where this thing should go
And if we don't have a
A guiding light
Helping us to make decisions
We're going to start
Flailing
We're going to start actually falling apart
I think this is one of the key reasons
That institutions of all kinds
Start falling apart
We forget
Why Chester Tons fence is there
We just go like
Why is that fence there?
Let's see and get out
Oh it was to keep the wolves out
Now we're all dead
Oops
So I wanted to write these things down
And if we just take them quick one by one
You talked about optimizing for programmer happiness
I put that at number one in homage of maths
And that's a lot about accepting that there is occasionally a trade-off
Between writing beautiful code
And other things we want out of systems
There can be a runtime trade-off
There can be a performance trade-off
But we're going to do it nonetheless
We're also going to
Allow ambiguity in a way that
Many programmers by default are uncomfortable with
I give the example actually here
Of in the interactive Ruby shell
Where you can play with the language or even interact with your domain model
You can quit it in two ways
At least that I found
You can write exit
Boom you're out of the program
You can write quit
Boom you're out of the program
They do the same thing
We just wrote both exit or the people built that
Wrote both exit and quit
Because they knew humans were likely to pick one or the other
Python is the perfect contrast to this
In the Python interactive protocol
If you write exit
It won't exit
It'll give you a fucking lesson
It'll basically tell you to read the fucking manual
It says use exit parentheses
Or control d i e and a file to exit
I'm like
One is very human and another is very engineer
And I mean that
Both of them in the best possible way
Python is pedantic
Python's
The value
From the start stated
Is that this should be preferably one
And only one way to do a certain thing
Ruby goes to complete opposite
No, we want the full expression that fits
Different human brains
Such that it seems like the
Language is guessing just what they want
And part of that is also you describe the principle of Lee's surprise
Which is a difficult thing to engineer into a language
Because you have to kind of
Is a subjective thing
Which is why you can't do it in one way
Which is why you use the example of both exit and quit
The principle of Lee's surprise for some people would be
Like oh exit that's how I get out of the prompt
For other people would be quit
Why don't we just do both
Okay so what's the convention over configuration
That's a big one
That's a big one that's a huge one
And it was born out of a frustration I had in the early days
With especially Java frameworks
Where when you were setting up a web application framework
For Java back in the day
It was not uncommon to literally write
Hundreds of thousands of lines of XML configuration files
Oh and it is I want the database to use the foreign keys
As post underscore id
No no no I want it as post capital id
Oh no no no you have to do a capital p id
There are all these ways where you can configure how
Foreign relation keys should work in a database
And none of them matter
We just need to pick one
And then that's fine
And if we pick one and we can depend on it
It becomes a convention
And if it's a convention we don't have to configure it
And if we don't have to configure it
You can get started with you actually care about much quicker
So convention over configuration is essentially to take that idea
That the system should come preassembled
I'm not just handing you about the fucking Legos
And asking you to build the Millennium Falcon
I'm giving you a finished toy
You can edit you can change it
It's still build out of Legos
You can still take some pieces off and put in some other pieces
But I'm giving you the final product
And this cuts against the grain of what most programmers love
They love a box of Legos
They love to put everything together from scratch
They love to make all these detailed little decisions
That just don't matter at all
And I want to elevate that up
So it's that hey I'm not trying to take the decisions away from you
I just want you to focus on decisions that actually matter
Did you truly care about no one cares about
Whether it's post underscore id or post id or pit
Yeah great defaults
Yeah it's just a wonderful thing
You have all these aspirations
They're going to do some kind of custom
Most beautiful Legos castle
That nobody's ever built from these pieces
But in reality to be productive
And most situations you just need to
Build the basic thing
And then on top of that is where your creativity comes
Absolutely
And I think this is one of those part of the doctrine
That a lot of programmers who
Get to use Ruby Enrails
begrudgingly will acknowledge
It's a nice thing
Even if they don't really like it
Like it's hard to beat the
Sort of attraction
To building with Legos from scratch
Out of programmers
That's just what we like
This is why we're programmers in the first place
Because we'd like to put these little pieces together
But we can direct that instinct
Towards a more productive end of the stack
Okay what are some of the other ones
The menu is Omakasa
It actually comes out of the same principle
That great default really matter
If you look at everything that's wrong with the JavaScript ecosystem
Right now for example
It is that no one is in charge of the menu
There are a billion different dishes
And you can configure just your tailored
Specific configuration of it
But no one done the work to make sure it all fits together
So you have all these unique problems
In the JavaScript ecosystem for example
There's probably 25 major ways of just doing the controller layer
And then as many of how to talk to the database
So you get this permutation of n times n times n
Of no one is using the same thing
And if they are using the same thing
They're only using the same thing for about five minutes
So we have no
Retained wisdom
We build up no durable skills
Rails goes the complete opposite way of saying
Do you know what? Rails is not just
A way framework
It is a complete attempt at solving the web problem
It's complete attempt at solving
Everything you need to build a great web application
And every piece of that puzzle should ideally be in the box
Pre-configured, pre-assembled
If you want to change some of those pieces later
That's wonderful
But on day one
You'll get a full menu
Designed by chef really cared about every piece of the ingredient
And you're going to enjoy it
And that's again one of those things
Many programmers think like I know better
And they do in some hyper-local sense of it
Every programmer knows better
This is what Ruby is built on
That every programmer knows better
In their specific situation
Maybe they can do something dangerous
Maybe they think they know better
And then they blow their foot off
And then they truly will know better
Because they've blown their foot off once
And won't do it again
But the menu is on the causes that
So you in general see the value in the model with
Yes, the integrated system
Integrated
Someone thought of the whole problem
This is one of the reasons why
I've been on a crusade against microservices
Since the term was coined
Micro-services was born out of essentially a good idea
What do you do at Netflix scale
When you have thousands of engineers working on millions of lines of code
No one can keep that entire system in their head at one time
You have to break it down
Micro-services can be a reasonable way to do that
When you're at Netflix scale
When you apply that pattern to a team of 20 programmers
Working on a code base of half a million lines of code
You're an idiot
You just don't need to turn
Method invocations into network calls
It is the first rule of distributed programming
Do not distribute your programming
It makes everything harder
All the failure conditions
You have to consider as a programmer
Just becomes infinitely harder
When there's a network cable involved
So I hate the idea of premature decomposition
And microservices is exactly that
The monolith says
Let's try to focus on building a whole system
That a single human can actually understand
And push that paradigm as far as possible
By compressing all the concepts
System more of it will fit into memory
Of a single operating human
And then we can have a system
Where I can actually understand all of base cap
I can actually understand all of hey
Both of those systems are just over 100,000 lines of code
I've seen people do this that maybe twice
Maybe three times that scale
And then it starts breaking down
Once you get north of certainly half a million lines of code
No individual human can do it
And that's when you get into maybe some degree of microservices can make sense
Basecamp and hey are both 100,000
100,000 lines of code
Wow, that's small
It is
Considering the fact that Basecamp
I think has something like 420 screens
Different ways and configurations
Do you include the front end in that?
No, that's the Ruby code
Well it's front end in the sense that some of that Ruby code is beneficial to the front
But it's not JavaScript for example
Now the other thing we might talk about later is
We write very little JavaScript actually for all of our applications
Hey, which is a Gmail competitor
Gmail ships I think 28 megabytes of uncompressed JavaScript
If you compress it I think it's about 6 megabytes
28 megabytes
Think about how many lines of code that is
When hey launched we shipped 40 kilobytes
It's trying to solve the same problem
You can solve the email client problem
With either 28 megabytes of uncompressed JavaScript
Or with 40 kilobytes
If you do things differently
But that comes to the same problem essentially
This is why I have fiercely fought
Splitting front end and back into part
That in my opinion this was one of the great crimes
Against West Development
That we are still atoning for
That we separated and divided
What was and should be a unified problem-solving mechanism
When you are working both on front end and back
And you understand the whole system
And you're not going to get into these camps
The decompose and eventually end up
Which shit like GraphQL
Okay
Let's fly through the rest of the doctrine
No one paradigm
No one paradigm goes to the fact that Ruby
Is a fiercely object-oriented programming language
At its core
But it's also a functional programming language
This five times I told you about
You can essentially do these anonymous function calls
And you can chain them together
Very much in the spirit of how true functional programming languages work
Ruby has even moved closer towards the functional programming
End of the scale by making strings immutable
There are ideas from all different disciplines
Of and all different paradigms of software development
That can fit together
Small talk for example
With the only object-oriented
And that was just it
Ruby tries to be mainly object-oriented
But borrow a little bit of functional programming
A little bit of imperative programming
Be able to do all of that
Rails tries to do the same thing
We're not just going to pick one paradigm
And run it through everything
Object orientation is at the center of it
But it's okay to invite all these other disciplines
And it's okay to be inspired
It's okay to remix it
I actually think one of the main benefits of rails
Is that it's a remix
I didn't invent all these ideas
I didn't come up with active record
I didn't come up with the MVC
Way of dividing and application
I took all the great ideas that I had learned
And picked up from every different camp
And I put it together
Not because there was going to be just one single overarching theory of everything
But I was going to have a cohesive unit
That incorporated the best from everywhere
Is that idea a bit attention
With the beauty of the monolith system
I think the monolith
Can be thought of as quite roomy
Quite as a big tent
That the monolith needs actually
To borrow a little bit of functional programming
For the kinds of problems that that excels
That discipline excels at solving
And that paradigm excels at solving
If you also want optical orientation as core
I actually think when I've looked at functional
Programming languages
There's a lot to love
And then I see some of the
Crazy contortions they have to go through
When part of the problem they're solving calls for mutating something
And you go like
Holy shit
This is a great paradigm for 90% of the problem
And then you're twisting yourself completely out of shape
When you try to solve the last 10
Ooh, exalt beautiful code is the next one
We've talked about that at length
And here's a great example
That really summarizes the
Domain-specific language quality of Ruby and Rails
That you can make
Code
Actually pleasant to write and read
Which is really funny to me because
As we talked about when I started learning programming
It wasn't even a consideration
I didn't even know that that could be part of the premise
That that could be part of the
solution
That
Writing code could feel as good as writing a poem
Class project
Application record belongs to account
Has many participants
Class name person
Validates presence of name
You could read it out
You didn't even change anything
High-cool or something
Right
Isn't that beautiful
Yes, nice
It's really nice
There's an intuitive nature to it
Okay, so I have specific questions there
I mean active record
Just to take that tangent
That has to be your favorite feature
It's the crown jewel
Of Rails
It really is
It is the defining characteristic of
How to work with Ruby and Rails
And it's born in an interesting level of controversy
Because it actually uses the pattern
That had been described by Martin Fowler
In the patterns of enterprise
Application architecture
One of the
Greatest books for anyone working on business systems
And if you had not read it
You must pick it up immediately
Patterns of enterprise application architecture
I think it was published in 2001
It is one of the very few programming books
That I have read many times over
It's incredible
In it
Martin describes
A bunch of different patterns
Of how to build business systems this century
An active record is a little bit of a footnote in there
The pattern is literally called active record
You can look it up in nice
It's called active record
I wouldn't even
Creative enough to come up with a name of my own
But it allows the creation
The marriage of database and object orientation
In a way that a lot of programmers find
A little off-putting
They don't actually want to
Pollute the beautiful object oriented nature
Of that kind of programming with
Sequel
There was a rant by Uncle Bob the other day
About how sequel is the worst thing ever
Baba
Okay fine whatever
I don't care
This is practical
We are making crowd applications
You're taking things out of an HTML form
And you're sticking them into a damn database
It's not more complicated than that
The more abstractions you put in
Between those two ends of the spectrum
The more you just fooling yourself
This is what we're doing
We're talking to sequel databases
By the way, quick aside
Sequel was one of those things
That have endured the onslaught of no sequel databases
Structuralist data
For a better part of a decade
And still rain supreme
Sequel was a good thing to invest your time in learning
Every programmer working with the web
Should know
Sequel to a fair degree
Even if they're working with an ORM
An object relational mapper
As active record
You still need to understand sequel
What active record does
Is not so much try to abstract the sequel
A way behind a different kind of paradigm
It's just making less cumbersome to write
Making it more amenable to build
Domain models on top of other domain models
In a way since you don't have to write every damn
Sequel statement by hand
We'll just say that active record is an ORM
Which is a layer that makes it intuitive
And human interpretable
To communicate with a database
Even simpler than that
It turns tables into classes
And rows into objects
I actually think sequels very easy to understand
Most of it you can write some sequel golf too
That's very hard to understand
But sequel at its base
And much of the criticism against sequel
Was it was written for human consumption
It's actually quite verbose
Especially if you're doing things like inserts over and over again
It's quite verbose
Insert into table parentheses
Enumerate every column you want to insert
Values, parentheses
Every value that fits with that column
It gets tedious to write sequel by hand
But it's actually very humanly readable
Active record just takes that tediousness away
It makes it possible to combine things in a way
That a humanly
Describable language just doesn't
It composes things into methods
And you can combine these methods
And you can build structures around them
So I don't dislike sequel
I dislike a lot of things in programming
I try to get rid of them
Sequel wasn't really one of them
It was just a sense of
I don't want to write the same thing over and over again
It was a
Can we be a little more succinct
Can we match it just slightly better to
The object orientation
Without trying to hide
A way the fact that we're persisting
These objects into a database
That's where I think a lot of ORMs went wrong
They tried to live in the pure world of objects
Never to consider that those objects had to be
Consisted into a sequel database
And then they came up with
A convoluted way of translating back and forth
Active record says
Do you know what just accepted
This record, this object
It's not going to get saved into some
No-sequel database
It's not going to be saved into a sequel database
So it's just structured the whole thing around that
It's going to have attributes
Those attributes are going to
Respond to columns in the database
It's not more complicated than that
Stop making it so
Yeah, but as you say
So I personally love sequel
Because I'm an algorithmist person
And so I love optimization
And I love to know how the databases actually work
So I can match the sequel queries
And the design of the tables
Such that there is
You know optimal
Squeeze the optimal performance out of the table
Okay, based on the actually way that that table is used
So I mean, I think that pushes to the point
That like there is value in learning
In understanding sequel
I wonder
Because I started looking at active record
And it looks really awesome
Does that make you lazy?
Not you
But a person that rolls in and starts using rails
You can probably get away with never really learning sequel
Right
As long as you want to stay at the entry level of competence
And this is actually my overarching mission with rails
Is to lower the barrier of entry so far down
That someone can start seeing
Stuff on the browser
Without basically understanding anything
They can run rails new
Blog
Run a couple of generators
They have a whole system
They don't understand anything
But it's an invitation to learn more
Where I get fired up
And this ties back to the AI discussion
Is when that's turned into
This meme that programmers no longer have to be competent
They can just, I mean, the AI is going to figure it out
The generators is going to figure it out
I don't need to know sequel
Active record is going to abstract it away from me
No, no, no, dude
Hold up
The path here is competence
I'm trying to teach you things
I understand I can't teach you everything in five minutes
No one who's ever become good at anything worthwhile
Could be taught everything in five minutes
If you want to be a fully well-rounded web application developer
That takes years
But you can actually become
Somewhat productive
In a few days
You can have fun in a few days
For sure, you can have fun in a few minutes
And a few hours
And over time, I can teach you a little more
Active record says like, yeah, yeah, all right
Start to hear
And then like next week
We'll do a class on sequel
And actually, you have this beautiful expression that I love
That a great programming language
Like Ruby has a soft ramp
The ramp goes to infinity
That's exactly right
So yeah, it's super accessible
Super easy to get started
And it never stops
It never stops
There's always more to learn
This is one of the reasons I'm still having fun programming
That I'm still learning new things
I can still incorporate new things
The web is deep enough as a domain
You're never going to learn all of it
Provide sharp knives
This is a good one
Because another way of saying this
The opposite way of saying this
The Java way of saying is
Do not provide foot guns
Right?
I don't want to give you sharp knives
You're a child
You can't handle a sharp knife
Here's a dull butter knife
Cut your damn steak
Right?
That's a very frustrating experience
You want a sharp knife
Even though you might be able to cut yourself
I trust humans in the same way that maps trust humans
Maybe you cut off a finger
All right, you're not going to do that again
Thankfully, there's a virtual finger
It's going to grow back out
Your competence is going to grow
It's more fun to work with sharp tools
And that actually contributes to the ramp that goes to infinity
To the learning
Value integrated systems
We kind of hit on that one
This is rails are trying to solve the whole problem of the web
Not just one little component
It's not leaving you
A bunch of pieces you have to put together
Yourself
Progress over stability
Know what, if there's one that's dated
It's probably that one
At this stage rails has been incredibly stable
Over many many generations
The last major release rails eight
Was basically a no-up upgrade
For anyone running rail seven
Rail seven was almost a no-up upgrade
For anyone running rail six
I used to think it required more churn
To get progress
To stay on the leading edge of new stuff
And I wrote this
Before I experienced the indignity
Of the 2010s in the JavaScript community
Where it seemed like stability
Was not just unvalued
It was actually despised
The churn in and off itself
Was a value we should be pursuing
Did you you were still working with the same framework
Three months later
You were an idiot
And I saw that and I actually
Recall that if I was going to write the doctrine today
I'd write that differently
I wouldn't say progress over stability
Or maybe there'd be a function of the
Age of the programming language also
Maybe or a deeper understanding of the problem
I think part of what's so fascinating about technology
Is that we have this perception
That everything constantly moves so fast
No it doesn't
Everything moves at a glacial pace
There is occasionally a paradigm shift
Like what's happening with AI right now
Like what happened with the introduction of the iPhone in 2007
Like what happened with the internet in 95
That's basically a total sum of my career
Three things changed
Everything else in between was incremental small improvements
You can recognize a Rails application written in 2003
I know because the basecamp I wrote back then
Is still operating, making millions of dollars in ARR
Servings and customers on the initial version that was launched back then
And it looks like the Rails code if I squint a little that I would write today
So most things don't change
Even in computing and that's actually a good thing
We saw with the JavaScript ecosystem
What happens when everyone gets just mad about constant churn
Things don't change that often
By the way on that small tangent
You just sort of visibly, verbally changed your mind
With the U of 15 years ago
Yes
That's interesting
Have you noticed yourself changing your mind
Quite a bit over the years
I would say
Oh yes
And then also oh no
In the sense that there are absolutely fundamental things
Both about human nature
About institutions, about programming
About business that I've changed my mind on
And then I've also had experiences that are almost even more interesting
Where I thought I had changed my mind
And I tried it a new way
Realized why I had the original opinion in the first place
And then gone back to it
So it happens both ways
An example of the later part
For example, was managers at 37 signals
For the longest time
I would rail against engineering managers
As an unnecessary burden
On a smaller even medium-sized company
And at one point
I actually started doubting myself a little bit
I started thinking like
You know what?
Maybe all programmers do need a one-on-one therapy session
Every week with their engineering manager
To be a whole individual
So we tried that for a couple of years
Where we hired some very good engineering managers
Who did engineering management
The way you're supposed to do it
The way it's done all over the place
And after that I thought like
No
No I was right
This was correct
We should not have had managers
Not every programmer needs a therapy session
With an engineering manager every week
We don't need these endlessly scheduled huddles
We don't need all these meetings
We just need to leave people the hell alone
To work on problems that they enjoy
For long stretches of uninterrupted time
That is where happiness is found
That's where productivity is found
And if you can get away with it
You absolutely should
Engineering management is a necessary evil
When that breaks down
What's the case for managers then?
The case for managers is that
If you do have a lot of people
There's a bunch of work that kind of just crops up
The one-on-one is one example
That programmers need someone to check in with
There's another idealized version
That someone needs to guide the career of juniors for example
To give them redirecting feedback
And all this other stuff
And it's not that
In the abstract I don't agree with some of those things
But in practice I've found that
They often create more problems that they solve
And a good example here is
Can you get feedback
From someone who's not better at your job than you are
You get some feedback
You can get feedback on how you show up at work
Are you being courteous to others
Are you being a good communicator
Okay, yes
But you can't get feedback on your work
And that's more important
It's more important that you work under
And with someone who's better at your job than you are
If you wish to progress in your career
And every single program I've ever worked with
Was far more interested in progressing in their career
On that metric
Getting better at their craft
Than they were in picking up pointers
That
A middle manager could teach them
That's not saying that there isn't value in it
It's not saying there isn't value in being a better person
Or a better communicator
Of course there is all those things
But if I have to choose one or the other
I value competence higher
Like that's again
I cavit this a million times
Because I know what people sometimes hear
They hear the genius asshole
It's just fine
And that's great
And you should excuse also to malicious behavior
If someone is just really good at what they do
I'm not saying that at all
What I am saying is that the history of competence
Is a history of learning from people who are better than you
And that relationship should take precedence over all else
And that relationship gets put aside
A bit when engineering managers introduced
Now the funny thing is
This conversation ties back to the early things we were talking about
Most engineering managers are actually former programmers
They at least know programming to some extent
But what I've seen time and again is that they lose their
Touch their field with it very very quickly
And turn into pointy haired bosses very very quickly
Who are really good at checking for updates
Just seeing where we are on project A here
If you need anything or we really should deliver to
Okay yes
And also no
Just shut up
Leave me the hell alone
Let me program
And then I'll come up for air
I'll talk with other programmers
Who I can spar with
That we can learn something with
That I can turn the problems over with
And we can move forward
If you look back on the history of
Computer industry
All the great innovation that's happened
It's all been done by tiny teams
With no engineering managers
Just full of highly skilled individuals
You've had John Carmigan here
I used to look up to its offer so much
Not just because I love quick
Not just because I loved what they were doing
But because he shared a bit about how the company worked
There are no managers
Or maybe they had one business guy doing some business stuff
But that was just to get paid
Everything else was basically just designers
And programmers
And there were about eight of them
And they created Got Damn Quake 2
So why do you need all these people again
Why do you need all these managers again
I think again at a certain scale
It does break down
It's hard to just have
100,000 programmers running around
Wild without any
Product, Mommies, or Daddies
Telling them what to do
I understand that
And then even as I say that
I also don't understand it
Because if you look at something like Gmail for example
That was like a side project
Done by Bushe
At Google at the time
So much of the enduring long-term value
Of even all these huge companies
Were created by people who didn't have a Got Damn Manager
And that's not an accident
That's a direct cause and effect
So I've turned in some way even more militant
Over the years against this notion of management
At least for myself
And knowing who I am and how I want to work
Because the other part of this is
I don't want to be manager
And maybe this is just me projecting the fact
And I'm an introvert who don't like to talk to people
And one on one calls every week
But it also encapsulates how
I was able to progress my career
I did not really go to the next level
With Ruby or otherwise
Until I had a door
I could close and no one could bother me
For six hours straight
So in companies probably
One of the reasons is
It's very easy to hire managers
And managers also
Delgair responsibility from you
So if you just have a bunch of programmers running around
Your kind of response
It's work
It's intellectual work
To have to deal with the first principles
Of every problem that's going on
So managers like
You can relax
I'll be taking care of
But they then hire their own managers
And it just multiplies them
multiplies them
I would love it if
Some of the great companies
We have in the United States
If there was like an extra side branch
That we could always run
Maybe physicists can come up
How to split the simulation
To where just all the managers are removed
Also
Just in that branch
Just the PR and the comms
People also
And even the lawyers
Just the engineers
And let's just see
And then we merge your back
I've essentially run that branch
At 37 signals for 20 years
And I've experimented
With forking back on the other side
I've experimented with having a full time lawyer on staff
I've experimented with having engineering managers
And I can tell you
Life is much better
At 50-60 people
When none of those individuals
Or none of those roles
It's never about the individuals
It's about the roles
None of those roles
Are in your organization full time
Occasionally you need a manager
Occasionally you need a lawyer
I can play the role of manager
Occasionally
Fine
And then I can set it back down to zero
It's almost like the
Like a cloud surface
I want to manage your service
I can call on for seven hours this week
And then I want to take it down to zero
For the next three months
Yeah, I read
I don't know if it's still the case
That base camp is an LLC
It doesn't have a CFO
Like a full time accountant
Is that
So was that
It's obvious
These days we do have a head of finance
We did not for the first
19 years of life
I think
We got away with basically just having
An accountant
Do our books in the same way you do a small ice cream shop
Except we were
Over the times I've done hundreds of millions of dollars in revenue
The scale seemed quirky
And at some point
You can also fall in love with your own quirkiness
To a degree that isn't actually healthy
And I've certainly done that over time
And we should have had someone mount
Or count the beans
A little more diligently
A little earlier
This was part of a
Blessing of just being wildly profitable
And selling software that can have infinite margins
Basically
Did you kind of can get away with a bunch of stuff
That you perhaps shouldn't
What partially taught me this lesson
Was when
We realized we had not been collecting sales tax
In different US states where we had nexus
And it took us about two years
And five million dollars
In settlements and cleanups to get out of that mess
And after that I went like
Okay fine we can hire a finance person
Okay
And we now have a wonderful finance person Ron
Who actually ended up
Replacing something else we used to have
We used to have a full-time data analytics person
Who would do all sorts of
Insight mining
For why are people signing up for this thing
We ran that for 10 years and realized
You know what
If I can have either a data analytics person
Or an accountant
I'm picking the accountant
I love this so much on so many levels
Can we just link on that advice
That you've given
That small teams are better
I think that's really
Less
Less is
More what would you say before
Wres is better
Okay, I'm sorry
We're better on adoption
With technology a lot of time
Yeah
And I think actually comes out of the same thing
It comes out of the fact that
Many of the great breakthroughs
Are created by
Not even just tiny teams
But individuals
Individuals writing something
And
In individual writing something
On some parameter
What they do is worse
Of course it's worse
When one person has to make something
That a huge company
Have hundreds
If not thousands of developers
That they can have
Work on that problem
But in so many other parameters
That worseness is the value
That less is the value
In getting real
Which we wrote back in 2006
We talk about this notion of less software
When we first got started with base camp
Back in 2004
People would ask us all the time
Aren't you petrified of Microsoft
They have so many more resources
They have so many more programmers
What if they take a liking to your little niche here
And they show up
And they just throw a thousand programmers at the problem
And my answer
Perhaps partly
Because I was like 24
Was first of all
No, no care in the world
But the real answer was
They're not going to produce the same thing
You cannot produce the kind of software
That base camp is
With a team of a thousand people
You will build the kind of software
That a thousand people builds
And that's not the same thing at all
So so much of the main breakthrough
In both end user systems
But also in open source systems
In fundamental systems
They're done by individuals
Or very small teams
Even all these classical histories of Apple
Has always been like
Well, there's a big organization
But then you had the team
That was actually working on the breakthrough
It was four people
It was eight people
It was never 200
And the large team seems to slow things down
Yes
It's so fascinating
Part of it is the manager thing
Because humans don't scale
Communication between humans
Certainly don't scale
You basically get the network cost effect
Every time you add a new node
It goes up exponentially
This is
Perhaps the key thing
Of why I get to be so fond
Of having no managers
At base camp
Because our default team size is two
One programmer
One designer
One feature
When you're operating at that level of scale
You don't need sophistication
You don't need advanced methodologies
You don't need multiple layers of management
Because you can just do
The magic of small teams
Is that they just do
They don't have to argue
Because we don't have to set direction
We have to worry about the roadmap
We can just sit down and make something
And then see if it's good
When you can get away with just making things
You don't have to plan
And if you can get out of planning
You can follow the truth
That emerges from the code
From the product
From the thing you're working on
In the moment
You know far more about what the great next step is
When you're one step behind
Rather than if you try
18 months in advance
To map out all the steps
How do we get from here to very far away
You know what?
That's difficult to imagine in advance
Because humans are very poor at that
Maybe AI one day will be much better than us
But humans can take one foot
Or put one foot in front of each other
That's not that hard
And that allows you to get away
With all that sophistication
So the process has become much simpler
You need far fewer people
It compounds
You need much less process
You need to waste less time in meetings
You can just spend these long
Glorious days and weeks
Of uninterrupted times
Solving real problems
You care about and that are valuable
And you're going to find that
That's what the market actually wants
No one is buying something
Because there's a huge company behind it
Most of the time
They're buying something because it's good
And the way you get something good is
You don't set it around to have a meal
About it
You try stuff
You build stuff
It really is kind of incredible
One person
Honestly one person can do
In 100 hours of deep work
Of focused work
Even less
So I'll tell you this
I tracked exactly the number of hours
I spend on the first version of base camp
And I was doing this because at the time I was working
On a contract basis
For Jason
He was paying me
I was going to say $15 an hour
That's what I got paid
When we first got started
I think he had bumped my pay to a glorious 25
But I was billing him
And I know that the invoice
For the first version of base camp was $400
That's what it took
For one sole individual
In 2004
To create an entire system
That has then gone on
To gross hundreds of millions of dollars
And continues to do extremely well
One person
Just me setting up everything
Part of that story is
Ruby, part of that story
Rails
But a lot of it is also just
Me plus Jason
Plus Ryan plus Matt
That was the entire company at the time
And we could create something
Of sheer sustaining value
With such a tiny team
Because we were a tiny team
Not despite of
Small is not a stepping stone
This is the other thing
That people get into their head
This is one of the big topics
Out of rework
That it gave entrepreneurs
The permission to embrace
Being a small team
Not as a waypoint
Not as like I'm trying to become
A thousand people
No, I actually like being a small team
Small teams are more fun
If you ask almost anyone
I'm sure Toby would say this too
Even at his scale
The sheer enjoyment of building something
Is in the enjoyment of building it with a tiny team
Now you can have impact
At a different scale
When you have a huge company
I fully recognize that
And I see the appeal of it
But in the actual building of things
It's always small teams
Always
How do you protect the small team
Basecamp says successfully
Stayed small
It's been the dragon you had to fight off
That like basically you make a lot of money
There's a temptation to grow
So how do you not grow
Don't take venture capital
Okay, that is the point
Point number one
Point number two is
Everybody takes venture capital
So you're ready
You're ready what
I mean that's been the the answer for the longest time
Because the problem isn't just venture capital
It's other people's money
One should take other people's money
Completely understandably
They want a return
And they would prefer to have the largest return possible
Because not them
Sitting in the code
Not them getting the daily satisfaction
Out of building something
Chiseling beautiful
Code poems out of the editor
Right they don't get that satisfaction
They get the satisfaction
Maybe of seeing something nice put into the world
That's fair
But they certainly also get a satisfaction of a higher return
And there is this sense
Certainly
Inventure capital
Stated
Inventure capital
That the whole point of you taking the money
Is to get to a billion dollars or more
Now
The path to that
Usually does go through
Running established playbooks
And when it comes to software
The enterprise sales playbook
Is
That playbook
If you're doing B2B
Software ass
You will
Try to find product market fit
And the second you have it
You will abandon your small and medium sized accounts
To chase the big whales
With a huge sales force
And by then you're a thousand people in life sucks
Uh-huh
That said
You uh
I mean people are just curious about this
I've gotten the chance
To get to know each other
He invested
In base camp
Not controlling
He bought secondaries
So this was the funny thing
Is that when
Investing have these two dual meanings
Normally when people think about investing
They think you're putting in growth
Growth capital
Because you want the business to hire more people
To do more R&Ds
That can grow bigger
Basis didn't do that actually
He bought a ownership stake
Directly from Jason and I
And 100% of the pro
Pro seats of that
Purchase went into
My and Jason's bank account
Personal bank account
Not a single cent
Went into the account of the company
Because we didn't need the money to grow
Well, we needed
Or what we certainly enjoyed
Was
To some extent maybe the vote of confidence
But more so
The security of taking a little bit off the table
So that we
Dare turn down the big bucks from venture couples
It was essentially a vaccine
Against wanting to take a larger check
From people who then wanted to take the company
To something enormous that we didn't want to go with it
So Jeff
Gabe Jason or I just enough money
That we were comfortable
Turning all these people down
In a way where if it had turned belly up
Like six months later
We wouldn't have been kicking ourselves
And gone and we had something here
That was worth millions
And now we have nothing
And I have to worry about rent and groceries again
It is a vote of confidence
I wonder from
I'd love to hear just side of the story
Of like why
Because he he doesn't need like the money
So it's really I think it probably is
Just believing in people
And wanting to have cool stuff
Be creative in the world
And make money off of it
But not like
A hundred percent
The motivation for Jeff was in a return
Because he actually has a team
He's just private office
That runs these investments
Who did the calculus on the investment pitch
We gave him
Which was so ridiculous
That Jason and I were laughing our asses off
When we were writing down our metrics
I was like no one's going to pay this
No one is going to give us this multiple
Of this amount of revenue
And that's fine
I mean we took the call
Essentially out of
Kind of an awe
The Jeff Bezos even wanted to look at us
And like do you know what
We don't want Vegicabra
We don't need other people's money
But like let's just give him a bullshit number
The no sane person would actually say yes to
And then I mean we can we can each go our own way
And his investment team said
Like Jeff no way
This makes no economic sense at all
They're asking for way too much money
With way too little revenue
And Jeff just went like
I don't care
I want to invest in these guys
Because to him at the time
It was a jump change right
Like Jason and I each got a few million dollars
I mean whatever the currency swing
Between the yen and the dollar
That day probably move 10x
That for his network
Then our investment did
Jeff's seen genuinely interested in
Being around interesting people
Interesting companies helping
Someone go to distance
And I actually
Look back on that relationship
With some degree of regret
Because I took that
Vote of confidence for granted
In ways that I'm a little bit ashamed of
Over the years I've been
More critical about some of the things
That Amazon had done
That I feel now is sort of justified
So that's just sort of part of that processing
Of it but on the economic sense
He gave us that confidence
He gave us the economic confidence
But then he also gave us the confidence
Of a CEO running
Perhaps at the time the most important
Internet business in the US
Showing up to our calls
Which we would have with him like once a year
And basically just going like
Yeah, you guys are doing awesome stuff
You should just keep doing awesome stuff
I read your book
It's awesome
You launched this thing
It's awesome
You should just do more of that
I don't actually know how to run your business
You guys know
So the book was out
I'm just sort of from a fan perspective
I'm curious about how Jeff Bezos was able to see
Because to me you're adjacent like
Special humans in the space of tech
And the fact that Jeff was able to see that
Right
How hard is it to see that
He certainly saw it very early
And I think this is something that Jeff does
Better than almost anyone else
He spots that opportunity
So far in advance
Of anyone else even opened their eyes to it
Or certainly is willing to bet on it
Far early and far harder than anyone else is
And he's just right time and again
I mean we were not the only investment that he made
And certainly Amazon had an extremely long-term vision
So far longer than I have ever had the gumption to keep
Like I think of myself as a long-term thinker
I'm playing a child's game
Compared to the game that Jeff is playing
Like when I looked at
Amazon's economics around the .com boom and bust
They looked ridiculous
Like they were losing so much money
They were so hated by the market
They were no one believed that it was going to turn into what it is
But Jeff did
In a way that that level of conviction
I really aspire to
And I think that's one of the main things I've taken away
From that relationship
Is that you can just believe in yourself
To that degree
Against those odds
That's ridiculous
He did that at so many times our level
That it's pathetic if I'm doubting myself
Yeah I think Amazon is one of those companies
I mean it's coming under a bunch of criticism over the years
This is something about humans that don't appreciate so much
That we take for granted the positive that a thing brings
Real quick and then we just start criticizing the thing
It's with the Wi-Fi and the airplanes
That's exactly
But I think I think Amazon
There could be a case made
That Amazon is
One of the greatest companies in the last 100 years
Sure I think it's an easy case to make
What I also think is that
The price you pay to be one of the greatest companies
Than the last 100 years
Is a lot of the tractors
A lot of pushback
A lot of criticism
That this is actually order restored in the universe
One of my favorite teachers in all the time I've been on the internet
Is Kathy Sierra
I don't know if you know her work
But she was actually burned
If you've short years before the cruel internet ran her off
But she wrote a blog called Creating Passioned Users
And she carved into my brain
This notion of balance in the universe
If you're creating something of value
That a lot of people love
You must create an equal
An opposite force of haters
You cannot have people who love what you do
Without also having people who hate what you do
The only escape from that is mediocrity
If you are so boring and so uninteresting
That no one gives a damn whether you exist or not
Yeah, you don't get the haters
But you also don't get the impact of people who really enjoy your work
And I think Amazon is that just at the massive scale
Right, they brought so much value and change
To technology, to commerce
That they must simply have a black hole size of haters
Otherwise, the universe is simply going to tip over
Let me ask you about small teams
So you mentioned Jason a bunch of times, Jason Fried
You have been partners for a long, long time
Perhaps it's fair to say he's more in the sort of the design
Business side and you're like the tech, the engineering wizard
How have you guys over all these years
Creating so many amazing products not murder each other
It's a great story of like partnership
What's what can you say about collaboration
What can you say about Jason the that you love that you've learned from
Why does this work?
So first I'll say we have tried to murder each other several times over the years
But far less I think in the last decade
In the early days our product
Discussions were so fierce
Then when we were having them in the office
And there were other employees around
Some of them were legitimately worried that the company was about to fall apart
Because the volume coming out of the room
Would be so high and sound so acrimonious
That they were legitimately worried the whole thing was going to fall apart
But you know what's funny is that it never felt like that in the moment
It always felt like just a peak vigorous search for something better
And that we were able to stomach that level of adversity
On the merits of an idea because it was about the idea
It wasn't about the person and it never really got
Personal not even never really it didn't get personal
It wasn't like Jason you're an asshole
It was like Jason you're an idiot
And you're an idiot because you're looking at this problem the wrong way
And let me tell you the right way to do it
As a small tangent let me say that some people have said
They'll probably return to this that you're sometimes
Can have flights of temper on the internet and so on
I never take it that way because it is the same kind of
Ilk maybe I haven't seen the right kind of
Traces of temper but usually it's about the idea and it's just excited passionate human
That's exactly what I like to think of it
It doesn't always come across as that
And I can see why spectators in particular sometimes
Would see something that looks like I'm going after the man rather than the ball
And I do think I've tried to get better at that
But in my relationship with Jason
I think it's worked so well because we have our own distinct areas of competence
Where we fully trust each other
Jason trust me to make the correct technical decisions
I trust him to make the correct design and product direction decisions
And then we can overlap and share on the business
Unmarketing on writing on other aspects of it
So that's one thing is that
If you're starting a business with someone where you do exactly the same as they do
And you're constantly contesting
Who's the more competent person?
I think that's far more difficult and far more volatile
So if you're starting a business and you're both programmers and you both work on the same kind of programming
Ah good luck
I think that's hard
I tried to pick an easier path working with a designer
Where I knew that at least half of the time
I could just delegate to his experience and competence and say
Like do you know what?
I may have an opinion, I have an opinion all the time on design
But I don't have to win the argument because I trust you
Now occasionally we would have overlaps on business or direction
Where we'd both feel like we had a strong stake in the game
And we both had a claim to competence in that area
But then for whatever reason we also both had a long-term vision
Where I would go, do you know what?
I think we're wrong here
But as I learned from Jeff Bezos by the way
I'm going to disagree and commit
That was one of those early lessons he gave us
That was absolute accruation
Perhaps even instrumental in ensuring that Jason and I have been working together for a quarter of a century
Disagree in commit is one of the all-time Jeff Bezos grades
I'm just surprised that Yoko Ono hasn't come along
You know what I mean like there's so many Yoko's in this world
It might have happened if not in part
Because we don't sit on each other's lap all the time
Most of our careers we haven't even lived in the same city
Like I lived in Chicago for a couple of years
While we were getting going after it moved to the US in 2005
But then I moved to Malibu and then I lived in Spain
And then I lived in Copenhagen and Jason Rye
From the foundation of our relationship
Learned how to work together
In a remarkably efficient way where we didn't have to actually talk that much
On any given week I'd be surprised if Jason and I spent more than
Two hours of direct exchange and communication
Yeah sometimes it's the basic human frictions
Yes I think you can rob up against another person
That person damn well better be your spouse
If it's too much for too long
Yeah but even there
Even there
COVID has really touched the relationship
It was fascinating to watch
It has
And I do think that having some separation
Which is kind of counterintuitive
Because I think a lot of people think
The more collaboration you can have the better
The more ideas they can bounce back and forth the better
And both Jason and I for whatever reason
Came to the conclusion early on in careers
Absolutely not
That's completely below me
This is why we were huge proponents of remote work
This is why I enjoy working in my home office
Where I can close the door and not see another human for like six hours at the time
I don't want to bounce ideas off you all the time
I want to bounce ideas off you occasionally
And then I want to go off and implement those ideas
There's way too much bouncing going off
And not enough scoring, not not dunking
And I think this is one of the great traps of executive rule
Once a founder elevates themselves all the way up to an executive
Where what they're doing is just telling other people what to do
That's the realm they live in 24-7
They just live in the idea realm
Oh I can just tell more people more things what to do
And we can just see it happen
If you actually have to be part of implementing that
You slow your horse
You think like do you know what?
I had a good idea last week
I'm going to save the rest of my good ideas until next month
There is a temptation for the managers
And for the people in the executive
layer to do something
Which that's something usually means a meeting
Yes
And so that's why you say
Their job is telling other people what to do
Yeah
And the meeting
So this is one of the big things you're against
It's meetings of toxic
Yeah
And this really I think ties into this with Jason Rye
If I had to count out the total number of meetings
We've had in 24 years of collaborations
Where we in person sat in front of each other and discussed a topic
I probably it'd be less than whatever three months
Out of a fan company
We just haven't done that that much
We haven't worn it out
One of this funny metaphors
That Trump came up with at one point
Was a human has like a limited number of steps in their life
Right
Like that's the longevity argument here
You can do so much activity
And then you run out
There's some kernel in that idea
That can be applied to relationship
There's some amount of exchange we can have
There's some amount of the time we can spend together
Where you can wear it out
Jason Rye were diligent about not wearing each other out
And I think that is absolutely key to the longevity of the relationship
Combined with that level of trust
And then just combining
With the level that we really like to work itself
We don't just like the brainstorming
This says where we just come up with good ideas
Now we like to do the ideas
And we like to be part of that process directly ourselves
I like to program
We like to do design
We can go off and do our little things for long stretches of time
In case you come together and go like
Hey, let's launch a great product
This might sound like
I'm asking you to do therapy
But I find myself
Just sometimes want or long for a meeting
Because I'm lonely
Like because remote work is just sitting by yourself
I don't know
You can get really lonely
For long stretches of time
Let me give you a tip
Get a wife
That's good
Damn it
Get a couple of kits
No
My family really is the great antidote
Too loneliness
And I mean that as sincerely as I can possibly say it
I certainly had exactly that feeling
You described
Early in my career when I was working remotely
And I was just like
Me living in an apartment
A total stereotype
Where for the longest time when I first moved to Chicago
All I had on the floor was a mattress
And then I bought this big TV
And I didn't even mount it
And then I had a stack of DVDs
And I was basically
I was working a lot of time
And then I would just go home and I'd do that
And it wasn't great
It really wasn't
Like I do think that humans need humans
And if you can't get them at work
And I actually sort of kind of don't want them at work
At least I don't want them for 40 hours a week
That's not what I prefer
You need something else
You need other relationships in your life
And there's no greater
Depth of relationship
If you can find someone
That you actually just want to spend a lot of time with
That's key to it
And I think it's key for both generations
And I think that
We've had families
For quite a long time
And it grounds you to in a way
Where the sprint of a startup
Can get traded in
For the marathon of an enduring company
And you get settled in a way
We talk briefly about
Sometimes I get fired up
A lot of times
Maybe even most of the times I get fired up about topics
But I don't get fired up in the same way
Now
As I used to when I was 24
I'm still like
Extremely passionate about ideas
And trying to find the right things
But
Having a family
Meeting my wife
Building a life
Around that
Has just
Mellowed everything out
In a completely cliche way
But
It
I think it's actually key
I think if we could get more
Even younger people
Not to wait until they were in the late
Got them 30s or early 40s
To hitch up with someone
We'd be better off
And we'd have more stable
Business relationships as well
Because
Folks would get that
Nurturing human
Relations somewhere else
Now when I say all of that
I also accept that there are plenty of great businesses
That's been built over the years
That have not been built remote
That have been built by
A gang of hooligans
Sitting in an office for
In men's hours of time
I mean both John Carmack
And Tim Sweeney talked about that
In the 90s with their careers
That that was just basically
Worked sleep
Hangout with the guys at the office
Right
A totally fair
That never appealed to me
Both Jason and I
Saw eye to eye on the idea
That 40 hours a week
Dedicated to work
Was enough
That if we were going to go to distance
For not just
The five to seven years
It takes to build a VC case up to an exit
But for potentially 10 years
20 years or further
We needed to become
Whole humans
Because the only that
Whole humanness
Was going to go to distance
Which included building up
Friendships outside of work
Having hobbies
Finding
A mate
And having a family
And
That
Entire
Existence
Legs of the stool
That work is not the only thing in life
Is completely
Related to the fact that we've been around for 25 years
There's way too much
Especially in America
Of false trade-offs
Or you want to build a successful business
Well you can either have
Money, enjoyment
Family or health pick one
What
Why do we have to give up
All of this
Now
I'm not saying
And there are moments
Prayers in life where you can sprint
But I am saying
If that sprint turns into a decade
You're going to pay for it
And you're going to pay for it in ways
I've seen time and again
Seemed like a very bad trade
That even if it works
And by the way most of the time it does not
Most of the time startups go bust
Most of the time people spend five, seven years
Or something that does not pan out
And they don't get the payout
And then they just sit with regret
Of like what the fuck happened to my 20s
Early on it
Jason and I basically made the pact
That working together was not going to lead to that kind of regret
That we were going to allow ourselves and each other
To build a whole life outside of work
And
The fact that that worked
Is something I feel
Is almost like forbidden knowledge
Certainly in technology circles in the US
It's something that we've tried with championed for 20 years
And we still get slacked for just two days ago
I had another Twitter beef with someone saying like
Oh well, okay, maybe it worked
But you didn't turn into Atlassian
So you're failure
You Basecamp isn't Jira
So why are you even bothering
And it's such a
Fascinating winner takes all mentality
That unless you dominate everyone else
In all the ways you've lost
When so much of life
Is far more open
To multiple winners
Where we can end up with the business
That have made hundreds of millions of dollars over the years
And we've kept much of that
To do whatever we want
And that that's enough
That's good, that's great
That's actually
Something worth aspiring to
Certainly it should be a path
For someone to consider choosing
Rather than the VC
Unicorn of bust mentality that dominates everything
I'd love to ask you about this exchange
So you can explain to me the whole saga
But just to link on that a little bit
Is I think there's a notion that's success
For tech founder
Is like
Work for a few years
All out
And then
Exit
Sort of sell your company for hundreds of millions of dollars
That's success
When it seems in reality
When you look at who the
People like you like really smart
Creative humans
Who they actually are
And what happiness entails
It actually entails working your whole life
A little bit
She's like
Because you actually love the programming
You love the building
You love the designer
And you don't want to exit
And that's something you've talked about
Really
Really eloquently about
So like you actually want to create a life
Where you're always
Doing the building
And doing it in a way that's not completely taken over your life
Mojito Island is a mirage
It always was
There is no retirement for ambitious people
There is no just sitting back on the beach
And sipping a mojito for what
For two weeks
Before you go damn crazy
And want to get back into the action
That's exactly what happens
To most people who have the capacity
To build those kinds of exits
I've never seen
I shouldn't say never
I've almost never seen anyone be able to pull that off
Yet so many think
That that's why they're doing it
That's why they're sacrificing everything
Because once I get to the finish line
I'm golden
I've won
I can retire
I can sit back
I can just relax
And you find out
That that kind of relaxation is actually hell
Yeah
It's hell for creative people
To squander
Their god-given creative juices and capacities
And
I was really lucky to read the book
Flow by Mihai
Chik Sen Mihai
Early on
Nice
The pronunciations
You know what? I had to practice that
With AI over the last few days
Because I knew I was going to cite him
And I butchered his name
Several times
So AI taught me how to pronounce that
At least somewhat correctly
But his
Main
Work over his career
Was essentially the concept of flow
That came out
Of a search for
Understanding happiness
Why are some people happy?
When are they happy?
And what he learned was quite illuminating
He learned that people aren't happy
When they sit on Muhido Island
They're not happy when they're free of all
Obligations and responsibilities
No
They're happy
In these moments
Where they're reaching and stretching
Their capacities
Just beyond what they can currently do
In those moments of flow
They can forget time and space
They can sit in front of the keyboard
Program a hard problem
Think 20 minutes of past
And suddenly it's been three hours
They look back upon those moments
With the greatest amount of joy
And that is what peak happiness is
If you take away the pursuit
Of those kinds of problems
If you eliminate all the problems from your plate
You're going to get depressed
You're not going to have a good time
Now there are people who can do that
But they're not the same kind of people
Who build these kinds of companies
So you have to accept the kind of individual you are
If you are in this path
Don't bullshit yourself
Don't bullshit yourself into thinking
I'm just going to sacrifice everything
My health, my family, my hobbies, my friends
But in 10 years I'm going to make it all up
Because in 10 years I can do it
It never works out like that
It doesn't even work out on both ends of it
It does not work out if you're successful
And you sell your company
Because you'll get bored out of your mind
Up two weeks on retirement
It doesn't work out if the company is a failure
And you regret the last 10 years
Spent for nothing
It doesn't work out if it all works
And you stay in the business
Because it never gets any easier
So you're going to fail on all metrics
If you just go
There's only work on nothing else
And I didn't want that
I wanted the happiness of flow
I understood that insight was true
But I wanted to do it in a way
Where I could sustain the journey for 40 or 50 years
And there's another interesting caveat
That I've heard you say is that
If you do X and you sell your company
And you want to stay in
And you want to do another company
That's going to usually not be as fulfilling
Yes
Because really your first baby
Like
You can't do it again
Or most people can't do it again
A
Because their second idea is not going to be as good as the first one
It is so rare
To capture lightning in the bottle
Like we have for example with Basecamp
I know this from experience
Because I've been trying to build a lot of other businesses since
And some of them have been moderate successes
Even good successes
None of them have been Basecamp
It's really difficult to do that twice
But founders or arrogant pricks
Including myself
And we like to think that
Do you know what we succeeded in large part
Because we're just awesome
Which is so much better than everyone else
And in some ways that's true
Some of the time
But you can also be really good at something
That matters for a hot moment
That that door is open
The door closes
Now you're still good at the thing
But it doesn't matter no one cares
There's that part of it
And then there's the part of it that
Going back to experience things for the first time
Only happens the first time
You can't do it again
I don't know if I have it in me
To go through the bullshit of the early days again
And I say bullshit in the sense
Of the most endearing sense
It's all great to do it
I know too much
This is one of the reasons why
Whenever I'm asked the questions
If you could tell your younger self
Something that would really
What would you say to your younger self
I would fucking not say a thing
I would not rob my younger self
Of all the life experiences
That have been blessed with
Due to the ignorance of how the world works
Building up the wisdom about how the world works
Is a joy
And you got to build it one break out of time
If you just handed all the results
It's like
Oh should we watch your movie?
Here's how it ends
I don't want to follow
I'm watching the movie now
You spoiled it
I don't want you to spoil
My business experience
I don't want to spoil any of my ignorance
The greatest blessing
Half the time when you're starting something new is
A, you don't know how hard it's going to be
B, you don't know what you don't know
Like the adventure is to pay off
The responsibility is to pay off
This is something Jordan Peterson
It's really taught me to articulate
This notion that responsibility is actually key to meaning
Man's search for meaning
Victor Frankl talks about this as well
That we can endure any hardship
If there's a reason why
Now he talked about it in truly
Life altering
Concentration camp ways
But you can also apply at a smaller scale with less criticality
Of even just your daily life
That all that hardship in building the original business
That is responsibility you take upon yourself
The appeal, the reason you take that on you
Isn't part because you don't know fully what it entails
If you had known up front
If I had known up front
How hard it would be
How much
Frustration there'd be along the way
If you just told me that in a narrative before I got started
I would have been like
Eh
Maybe I should just go get a job
I mean you just said so many smart things there
Just to pick one
It's funny that sometimes
The advice givers
The wisdom givers
Are have gone through all the bullshit
And so there is a degree to which you want to make the mistake
So I think I think I would still give the advice of
You want to have a stretch of your life
Where you work too hard
Including it a thing that fails
I don't think you can learn the lessons
Why that's a bad idea
In any other way
Except by doing it
There is a degree
But of course you don't
I think you should stretch
Should you have to stretch for a decade
I'm not so sure
Yeah the decade thing is
20s is a special topic
It's a lot to trade
You don't get your 20s back
You don't get your 30s back
You don't get your 40s back
Really
I would have regretted
Personally
If I hadn't done the other things I did in my 20s
If I hadn't had the fun I had
If I hadn't had the friends I had
If I hadn't build up the hobbies that I did
If I hadn't started
Driving race cars at an early enough age
To actually get really good at it
If I had just gone all in on business
Because I would have gotten the same out in the end
This is something Derek Sivers really taught me
Is he has this great essay
About how
When he went for a bike ride
He could go really hard all out
And he could do the ride I think in
Whatever 19 minutes
Why he could enjoy the ride
Go 5% slower
Do the ride in 21 minutes
And realize there's only two minutes apart
Either I go all in all the time
There's nothing else
I'm completely exhausted at the end
And or I travel the same distance
And I arrive maybe two minutes later
But I got to enjoy the scenery
Listen to the birds smell the flowers
That journey is also valuable
Now I say that while accepting
And celebrating
That if you want to be the best
At one thing in the world
No you have to sacrifice everything
You have to be obsessed with just that thing
There is no instant
Of someone who's the best in the world
At something
Who's not completely obsessed
I didn't need the best at anything
This was a
A rare blessing of humility
I had early on
It's like you know what
I am not that smart
I'm not that good
I'm not that talented
I can do interesting things
By combining different aspects
And elements that I know
But I'm not going to be the best at anything
And that released me
From this
Singular obsession
We're just going
I'm going to be the best programmer in the world
And I know I'm not
I fucking failed at it
Twice before I even got how conditionals work
I'm not smart enough
To be the best at anything
I'm not dedicated enough
To do that
That's a bit of a
Blessing
And I think
As a society
We have to straddle
Both celebrating peak excellence
Which we do all the time
And celebrating the peak intensity
Of mission
It takes to become that
And then also going like
You know what
We don't all need to be
Michael Jordan
Is there going to be one of those
But we should say that there's
Certain pursuits
Where a singular obsession is required
Basketball is one of them
By the way, probably racing
If you want to be the best
At that point in the world
If you want to be Senna
You got to be
Amaniac
But I would argue that
There's most disciplines
Like programming
Allows
If you want to be quote-unquote
The best
Whatever that means
I think that's judged at the end of your life
And usually if you look at that path
It's going to be a non-linear one
You're not going to look like the life of an Olympic athlete
Who's singular focus
You're going to
There's going to be some
Acid there in the 20s
Or there's going to be
A deep several detours
Which the true greats
There's going to be detours
And sometimes they're not going to be
Steve Jobs' acid type of situation
There'll be just different
Companies you worked for
Different careers
Different
Sort of
Efforts you allocated
Your life to
But it's going to be non-linear
It's not going to be a singular focus
The way I think about this sometimes
I want a good bargain on learning
I can become
In the top 5%
Of whatever I defined as good at something
Much much easier
Perhaps it's 20 times easier
100 times easier to get into the top
5%
That it is to get into the top 0.1%
That's almost impossibly hard to get into that
But if I'm content
Just being in the top 5%
I can be in the top 5%
On like five things at once
I can get really good at writing
I can get decent at driving a race car
I can become pretty good at programming
I can run a company
I can have a family
I can do a lot of things at the same time
That gives me sort of that variety
That almost that was
Idealized
Karl Marx has this idea
I'm going to fish in the morning
And hammer in the evening
And paint on the weekends
Right?
That there's a sense for me at least
Where his diagnosis of alienation was true
That just that tunnel vision
There's just this one thing
I'm just going to focus on that
It gives me a sense of alienation
I can't stomach
When I'm really deep on programming
And sometimes I go deep for weeks
Maybe even in a few cases months
I have to come up for air
And I have to go do something else
All right
All right
That was programming for this year
I've done my part
I'm going to go off writing
Or annoy people on the internet
Or drive some race cars
To do something else
And then I can do the programming thing
With full intensity again next year
Speaking of annoying people on the internet
You got to explain to me this drama
Okay, so what is this guy that said
Imagine losing to Jira
But boasting
They have a couple million dollars per year
So this had to do with this
Almost now a meme decision to leave the cloud
DHH
Left the cloud
I think that's literally a meme
But it's also a fascinating decision
Can you talk to the full saga of
DHH leaves the cloud
Yes
A leaving AWS
Saving money
And I guess the case this person is making
No
Is that we wasted our time
Optimizing in business
That could have been 100 times bigger
If we'd just gone for the moon
And for the moon includes
Venture capital
But also AG
Some of the things
In conclusion, not caring about cost
But also because AGIs
Around the corner
You should have been investing into AI
Right
Is this part of that?
Sort of
Tank ginger
And I think it's a bit of a muddy argument
But if we just take it at its
Peak ideal
Which I actually think is a reasonable point
Is that you can get my
Optically focused on counting pennies
When you should be focused on getting pounds
Right
That I've optimized our spend on infrastructure
By getting out of the cloud
And that took some time
And I could have taken that time
And spend it on making more features
I would have attracted more customers
Or spend even more time with AI
Or done other things
Opportunity cost is real
I'm not denying that
I'm pushing back on the idea
That for a company of our size
Saving $2 million a year
On our infrastructure bill
Which is about somewhere between half to two thirds
Goes directly to the bottom line
Which means it's returned to Jason Raya's owners
And our employees
Part of our profit sharing plan
It's totally worth doing
This idea that costs don't matter
Is a very Silicon Valley
Way of thinking that I can understand
At the scale of something maybe
But I also actually think it's
It's aesthetically unpleasing
I find an inefficient business
As I find an inefficient program
Full of line noise
To just be a splinter in my brain
I hate looking at an expense report
And just seeing disproportionate waste
And when I was looking at our spend
At 37 signals
A while back a few years back
I saw bills that did not pass my smell test
I remembered how much we used to spend
An infrastructure before the cloud
And I saw numbers
I could not recognize in proportion to what we needed
The fact that computers had gotten so much faster
Of a time shouldn't things be getting cheaper
Why are we spending more and more money
Surveying more customers
Yes, but with much faster computers
More's law should be lowering the cost
And the opposite is happening
Why is that happening?
And that started a journey of unwinding
Why the cloud isn't as great as the deal
As people like to think that
Yeah, can we look at the specifics
Just for people who don't know the story
And then generalize
To what it means about the role of the cloud
And in tech business
So the specifics is
You were using AWS S3
We were using AWS for everything
Hey.com launches an entirely cloud app
It was completely on AWS
For compute, for databases, for all of it
We were using all the systems
As they are best prescribed that we should
Our total cloud bill for
Basecamp, our total spend with AWS
Which I think 3.2 million
Or 3.4 million at its peak
That's kind of a lot of money
3.4 million
I mean we have a ton of users and customers
But still, that just struck me as unreasonable
And the reason why I was unaware and reasonable was
Because I had the pitch for the cloud
Ringing in my ears
Hey, this is going to be faster
This is going to be easier
This is going to be cheaper
Why are you trying to produce your own power?
Like do you have your own power plant?
Why would you not leave
The computers to the hyperscalus
They're much better at it anyway
I actually thought there was a compelling pitch
I bought in on that pitch for several years
And thought, do you know what?
I'm done ever owning a server again
We're just going to render our capacity
And Amazon is going to be able to offer us services
Much cheaper than we could buy them themselves
Because they're going to have these economies of scale
And I was thinking
Jeff's word, they're ringing
My competitor's margin is my opportunity
That was something he used to drive
Amazon.com with
That if he could just make 2%
When the other guy was trying to make 4%
He would end up with all the money
And on volume he would still win
So I thought that was the operating
Ethos for AWS
It turns out that's not true at all
AWS by the way
Operates is almost 40% margin
So just in that there's a clue
That competitors are not able to do the competitive thing
We like about capitalism
Which is to lower costs and so forth
So the cloud pitch
In my optics are fun
It's a fundamentally false
It did not get easier first of all
I don't know if you've used AWS recently
It is hella complicated
If you think Linux is hard
You've never tried to set up iam rules
Or access parameters or whatever
AWS was always difficult
It was always clever
I think it's gotten even more difficult
But yes
Now some of that is it's difficult
Because it's very capable
And you have a bunch of capacity on tap
And there are reasons
I don't think they're good enough
To justify how complicated the whole
Gingham Gingham has become
But what's certainly true is that it's no longer easier
It's not easier to use AWS
Than it is to run your own machines
Which we learned when we pulled out the cloud
And didn't hire a single extra person
Even though we operate all our own hardware
The team stayed exactly the same
So you have this three way pitch
Right
It's going to be easier
It's going to be cheaper
Certainly wasn't cheaper
We've just proved that by cutting our
Spend on infrastructure by half to two thirds
And it's going to be faster
The last bit was true
But way too many people overestimated the value of that speed
If you need a thousand computers online
In the next 15 minutes
Nothing beats the cloud
How would you even procure that
If we just need another 20 servers
It's going to take a week or two
To get boxes shipped on pallets
Delivered to a data center
On unwrapped and racked
And all that stuff
Right
But how often do we need to do that
And how often do we need to do that
If buying those services
Way way cheaper
So we get vastly more compute
For the same amount of money
Could we just buy more servers
And not even care about the fact
That we're not hyper optimized
On the compute utility
That we don't have to use things
Like automatic scaling
To figure things out
Because we have to reduce cost
Yes we can
So
We went through this journey
Over
A realization in early 2023
When I had finally had enough
With our bills
I wanted to get rid of them
I wanted to spend less money
I wanted to keep more of the money ourselves
And in just over six months
We moved seven major applications
Out of the cloud
In terms of compute
Caching databases that works
Onto our own servers
A glorious, beautiful new fleet
Bought from the king of servers
Michael Dell
Who
Really, by the way, is another icon of my
I saw he just celebrated 41 years in business
41 years
This man has been selling awesome servers
That we've been using for our entire existence
But anyway, these pallets arrive
In a couple of weeks
And we rack them up
And get everything going
And we were out
At least with the compute part
We then had a long
Multi-year commitment to his three
Because the only way to get
Decent pricing in the cloud, by the way
Is not to buy on a day-to-day basis
Not to rent on a day-to-day basis
But to bind yourself up to multi-year contracts
With computers often a year
That was in our case
And with storages with four years
We signed a four-year contract
To store our petabytes of customer files in the cloud
To be able to get something just halfway decent affordable
So all of these projects
Came together to the sense that
We're now saving literally millions of dollars
Projected about 10 million over five years
It's always hard
How do you do the accounting exactly
And TOC, this, that, and the other thing
But it's millions of dollars
But it's not just that
It's also the fact that
Getting out of the cloud
Mean meant returning to more of an original idea of the internet
That the internet was not designed
Such that three computers should run everything
It was a distributed network
Such that the individual nodes could disappear
And the whole thing would still carry on
Dark at the sign this such that
The Russians could take out Washington
And they could still fight back from New York
That the entire communication infrastructure wouldn't
Disappear because there was no hub and spoke
It was a network
I always found that
An immensely beautiful vision
That you could have this glorious internet
And no single node was in control of everything
And we've returned to much more of a single
Node controlling everything
Idea with these hyperscalers
When US East won
The main and original region
For AWS goes offline
Which just happened more than a few times over the years
Seemingly a third of the internet is offline
Like that in itself is just an insult to DARPA's design
It does detract from the fact that what AWS built was marvelous
I think the cloud has moved so many things
So far forward especially around virtualization, automation, setup
It's all those
Giant leaps forward for system administration
That's allowing us now to be able to run things on-prem
In a way that smells and feels
Much like the cloud
Just that have to cost or less
And with the autonomy and the
Satisfaction of owning hardware
I don't know what the last time you looked at
Like an actual server and took it apart
And looked inside of
These things are gorgeous
I mean, I posted a couple of pictures of our
Racks out in the data center
And people always go crazy for them
Because we've gotten so abstracted
From what the underlying metal looks like
In this cloud age that most people have no idea
They have no idea how powerful a modern CPU is
They have no idea
How much RAM you can fit into a one-year rack
Progress in computing has been really exciting
Especially I'd say in the last four to five years
After TSMC with Apple's help
Really pushed the envelope
I mean, we kind of sat still there for a while
While Intel was spinning their wheels going nowhere
And then TSMC with Apple propelling them
Really moved things forward
And now servers are exciting again
Like you're getting jumps year-to-year
And the 15-20%
Rather than the single digit we were stuck with for a while
And that all means that
Owning your own hardware is a more feasible proposition
Than it's ever been
That you need fewer machines to run ever more
And that more people should do it
Because as much as I love Jeff and Amazon
Like he doesn't need another
Whatever 40% margin on all the tech stuff
That I buy to run our business
And this is just something I've been focused on
Both because of the ideology around
Honoring DARPA's original design
The practicality of running our own hardware
Seeing how fast we can push things with the latest machines
And then saving the money
And that has all been so enjoyable to do
But also so counterintuitive for a lot of people
Because it seemed I think for a lot of people in the industry
That like we'd all decided
That we were done buying computers
That that was something we would just delegate to AWS
And Azure and Google Cloud
That we didn't have to own these things anymore
So I think there's a little bit of whiplash
For some people that
Oh, I thought we agreed
We were done with that
And then along come us
And say, yeah, do you know what?
Maybe you should have a computer
Is there some pain points to running your own servers?
Oh, plenty
There's pain points to operating computers of all kind
Have you tried just like using a personal computer these days?
Half the time when my kids or my wife
Has my problem I go like
Have you tried turning it just off and on again
Computers are inherently painful to humans
Owning your own computer though
Kind of makes some of that pain worth it
There's a responsibility that comes with actually owning the hardware
To me, Adelaide,
It's make the burden of operating that hardware seem slightly more enjoyable
Now, there are things you have to learn
Certainly at our scale too
I mean, we're not just buying a single computer and plugging into an ethernet
We have to have racks and racks of them
And you've got to set it up with network cabling
And there's some specialized expertise in that
But it's not like that
Expertise is like building nuclear rockets
It's not like it's not widely distributed
Literally the entire internet was built on people knowing
How to plug in a computer to the internet
Right?
Oh, ethernet cable goes here, power cable goes here
Let's boot up Linux
That's how everyone put anything online until
10, 12 years ago when the cloud sort of took over
So the expertise is there and can be rediscovered
You too can learn how to operate a Linux computer
Yeah, and it's you know
When you get a bunch of them there's a bunch of flashing LEDs
And it's just so exciting
Call me
Amazing
Computers are really fun
This is actually something I've gotten into even deeper
After we moved out of the cloud
Now my next kind of
tingle is that
If you can move out of the cloud
Can you also move out of the data center?
Personal servers have gotten really
scarierly quick and efficient
And personal internet connections
rival what we connected data centers with
Just a decade or two ago
So there's a whole community around this concept of home
Lapping
Which is essentially installing server hardware
In your own apartment
Connecting it to the internet
And exposing that directly to the internet
That hearts back to those glorious days of the 90s
When people building for the internet
Would host the actual website
On their actual computer in the closet
And I'm pretty fired up about that
I'm doing a bunch of experiments
I've ordered a bunch of home servers
My own apartment
I marvel at the fact that I can get a five gigabit
Fiber connection now
I think do you know what five gigabit
That could have taken base camp to
Multiple millions of MRR
In the way that back then
I ran the whole business on a single box
With 2004 technology
And I probably 100 mega bit cable
Like the capacity we have access to
Both in terms of compute and connectivity
Is something that people haven't readjusted to
And this happened sometimes in technology
Where progress sneaks up on you
This happened with SSDs
I love that by the way
We designed so much of our technology
And storage approach
And database designed
Around spinning metal desks
That had certain seek rate properties
And then we went to NVMe and SSDs
And it took quite a while for people to realize
The systems have to be built
Fultimately different now
That the difference between memory
And disc
Was now far smaller when you weren't spinning
These metal plates around
With a little head that had to read off them
You were essentially just
Dealing with another type of memory
I think we're a little bit in that same phase
When it comes to
The capacity of new businesses to be launched
Literally out of your damn bedroom
So you can get pretty far
With a large user base
With home labbing
Absolutely
That's exciting
That's like the old school
That's really exciting
It's bringing back the startup and the garage
In the literal physical sense of the word
Now some of that is
Do we need to?
You can get relatively cheap
Plowed capacity
If you don't need very much
Oh yes we need to
I mean the feeling
Of doing that by yourself
Of seeing LED lights
In your own home
I mean there's nothing like that
There's just an aesthetic to it
That I am completely in love with
And I want to try to push on
It's not going to be the same thing
As getting out of the cloud
I'm not sure
Our exit out of the cloud
Was not the exit out of the data center
We basically just bought hardware
Shipped it to a professionally managed data center
That
We didn't even actually touch
This is the other misconception
People have about moving out of the cloud
That we have a bunch of people
Who are constantly driving to a data center
Somewhere to rack
New boxes and change dead RAM
That's not how things happen in the modern world at all
We have a company called
Summit previously deft
That is what we call white gloves
They just they work in the data center
When we need something like
Hey deft
Can you go down and swap the debt
SSD and box number six
They do it
And what we see is a kin to what
Someone working with the cloud would see
You see IP addresses coming online
You see drives coming online
It's not that different
But it is a whole heck of a lot cheaper
When you are operating at our scale
And of course it is
Of course it's cheaper to own things
If you need those things for years
Rather than it is to rent it
In no other domain
Would we confuse those two things
That it's cheaper to own
For the long duration than it is to rent
There is some gray area like
I've gotten a chance to interact
With the XAI team a bunch
I'll probably going back out there
And Memphis to do a big podcast
Associate with the GROC release
And those folks
In order to achieve the speed
Of building up the cluster
And to solve some of the novel aspects
They have to do with the GPU
With the training
They have to be a little bit more hands-on
So less white glove
Oh and I love that right
They're dealing with a frontier problem
And they're dealing with
Not by renting a bunch of GPUs
At a huge markup from their main competitor
They're going like no screw that
We're going to put 100,000 GPUs
In our own tents
Right and build it in absolute record time
So I think if anything
This is testament to the idea
That owning hardware
Give you an advantage
Both at the small scale
At the medium scale
And at the pioneer levels of computing
By the way
Speaking of teams
Those are XAI, Tesla, or
Large companies
But all those folks
I don't know where it is about
You said Jeff is really good at
Finding good people
At seeing strength in people
Like Elon is also extremely
I don't know what that is
Actually I've never actually seen
Maybe you could speak to that
He's good at finding greatness
I don't think he's finding as much as he's attracting
He's attracting the talent
Because of the audaciousness
Of his goals and his mission
The clarity by which he states it
He doesn't have to go scourier
To find the best people
The best people come to him
Because he is
Talking about Elon here
One of the singular most
Invigorating figures
In both the same order of the universe here
Haters and lovers
Like he's having such an impact
That's such a scale
That of course he's got to have literally
Millions of people think he's the
Worst person in the world
And he's also going to have millions of people
Thinking he's the greatest gift to humanity
Depending on the day
I'm somewhere in between
But I'm more on the greatest gift to humanity
End of the scale
And I'm on the other end of the scale
And I think that really
Inspires people in a way
That we've almost forgotten
That
That level of audacity
Is so rare
That when we see it
We don't fully know how to analyze it
We think of Elon as finding Greg Town
And I'm sure he's also good at that
But I also think that this
Beacon
Of the mission
We're going to fucking Mars
We're going to transform
Transportation into using electricity
We're going to cover the earth
In internet
Is so grand
That there are days where I wake up
And go like what the fuck am I doing with these to-do lists
Like Jesus
Should I
Go sign up for something like that
Yeah
That sounds invigorating
In a sense I can only imagine like a
Viking back in
1050 going like
Should we go to Normandy
You may die along the way
But oh boy
That that sound like a journey and an adventure
There's a few components
There's one definitely
This bigger than life mission
And really believing it
You know
Every other sentence is about Mars
Like really believing it
It doesn't really matter what
Like anybody else
The criticism and anything
There's a very
Singular
Focused big mission
But I think it also has to do a bunch of the
Other components
Like
Being able to hire well
Once the people
Once the beacon attracts
And I just seen people that don't necessarily
On paper have a resume with the track record
I've
I've seen really
Who now turned out to be like legendary people
He basically like tosses them in the ball of leadership
See something in them
And says like
You go and gives them the ownership
And they run with it
And that happens at every scale
That there's the real meritocracy
And like there's something
There's just like
You can see the flourishing of human intellect
In these meetings
In these group getting together
Where they're like
The energy is palpable
It's
It's like exciting for me to just
Be around that
Because I don't
There's not many companies I've seen that in
Because when a company becomes successful and larger
It somehow suffocates that energy
That I guess you see in startups
At the early stages
But like it's cool to see it
At a large company that's actually able to achieve scale
You know
I think part of the secret there
Is that Elon actually knows things
And when you know things
You can evaluate the quality of work products
And when you can evaluate the quality of work products
You can very quickly tell who's full of shit
And who will actually take you to Mars
And you can fire the people who's full of shit
And you can bet on the people who get us to Mars
That capacity to directly evaluate the competency of individuals
Is actually a little bit rare
It's not widely distributed amongst managers
Hiring managers
It's not something you can easily delegate
To people who are not
Very skilled at the work itself
And Elon obviously knows a lot about a lot
And he can smell
Who knows stuff for real
And
Is this at our tiny scale
Something I've tried to do in the same order
Where when we hire programmers for example
It's going to be interesting now with AI as a new challenge
But up until this point
The main pivot point for getting hired
Was not your resume
Was not the schooling you've had
Was not your grades
Was not your pedigree
It was how well you did on two things
A, your cover letter
Because I can only work with people remotely
If they're good writers
So if you can't pen a proper cover letter
And can't bother to put it in the effort
To write it specifically for us
You're out
2
You have to be able to program really well
To degree that I can look at your code and go like
Yeah, I want to work with that person
Not only I want to work with that person
I want to work on that person's code
When I have to see it again in five years
To fix some damn bug
So we're going to give you a programming test
That simulates the way we work for real
And we're going to see how you do
And I've been surprised time and again
Where I thought for sure
This candidate is a shooant
They sound just right
The CV is just right
And then you see the code
Getting churned in
I'm like no way
No way are we hiring this person
And the other way has been true
As well
I've got a like
I don't know about this guy
Or this
This woman
Yeah, I don't know
And then they turn in their code stuff
And I like holy shit
Can that person be on my team
Tomorrow
Preferably
The capacity to evaluate work product
Is a superpower when it comes to hiring
There's the step
That's the Elon dude really well
Which is be able to show up and say
This can be done simpler
Yes
But he knows what he's talking about
And then the engineer
Because Elon knows enough
The engineer
First reaction
You can kind of tell
Like it's almost like
Rolling your eyes
If your parent tells you something
Yes
This is not
No, we've
I've been working on this for a month
You don't know
But then when you have that conversation a little more
You realize
No, it can be
Done simpler
Find the way
So there's a good
When two engineers are talking
One might not have perfect information
But if
If the senior engineer has like good instinct
That's like been battle earned
Then you can say simplify
And it actually will result in simplification
And I think this is the hallmark of the true greats
That they not only have the insight into
What's required to do the work
But they also have the transcenten
Vision to go beyond what
The engineer would do
The programmer would do
I think if we are looking at these rareties
Obviously the myth of Steve Jobs
Was also this
Even though perhaps he was less technical
Than Elon is in many ways
He had the same capacity to show up
To a product team
And really challenge them to look harder for the simplification
Or for making things greater
In a way that would
Garner disbelief
From the people who were supposed to do it
Like this guy is full of shit
Like this is crazy
We can never
And then two months later it is
So
There is something of this
Where you need
You need the vision
You need it anchored by the reality
Of knowing enough about what's possible
Knowing enough about physics
Knowing enough about software
That you're not just
Building bullshit
There are plenty of people who can
Tell a group of engineers
No, just do it faster
Like that's not a skill
It's got to be anchored in something real
But it's also going to be anchored
In
It's a tired word
But a passion for the outcome
To a degree where you get personally insulted
If a bad job is done
This is what I've been writing about lately with Apple
They've lost that asshole
Who would show up and tell engineers
That
What they did was not good enough
In ways that would actually perhaps
Make them feel a little small in the moment
But would spark that
Zest
To really fix it
Now they have a logistics person
Who's very good at sourcing components
And lining up production gant charts
But you're not getting that magic
Now what's interesting with that whole scenario was
I actually thought how well Tim cooked
Ran things and has run things
At Apple for so long
That maybe we were wrong
Maybe we were wrong about the criticality
Of Steve Jobs
To the whole mission
Maybe you could get away with not having it
I think the bill was just
Going to come later and now it has
Apple is failing in all these ways
That someone who would blow up Steve's ghost
And really exult him would say like see
This is what's happening now
So the other thing here too of course
Is it's impossible to divorce
Like your perception of what's
A critical component of the system
And the messy reality of a million different moving parts
In the reality of life
And you should be skeptical about your own analysis
Your own thesis at all time
Since you mentioned Apple
Have to ask
Somebody in the internet submitted the question
Does DHA still hate Apple
I believe the question is
So there was a time
When base camp went to war
With Apple over the 30%
What can you tell the saga of that battle
Yes
But first I'll tell you
I fell in love with Apple
Which was all the way back in
Also early 2000s
When
Microsoft was dominating the industry
In a way we now see
Apple and Google dominate mobile phones
Microsoft was just everything
When it came to personal computers
And I really did not like the Microsoft of the 90s
The Microsoft of the 90s was the
Cut off the air supply
To net scape kind of characters
Was the Bill Gates sitting defiant
In an interview with the DOJ asking about what the definition of what is
And just
Overall unpleasant
I think you can have respect for what was achieved
But I certainly didn't like it
And as we've talked about
I came begrudgingly to the PC
After Commodore fell apart
And I couldn't continue to use the Amiga
So I already had a bit of a bone to pick with
PCs just over the fact that I love my Amiga so much
But then in the early 2000s
Apple emerged as a credible alternative
Because they bet the new generation of Macs
Ununix underpinnings
And that allowed me to escape from Microsoft
And suddenly I became one of the biggest boosters of Apple
I was in my graduating class at the Copenhagen Business School
I started with the first white iBook
First person using Mac
And by the time we were done in graduating
I had basically converted half the class
To using Apple computers
Because I would evangelize them so hard
And demonstrate them
And do all the things that a superfan would do
And I continued that work over many years
Jason or I actually
And I think 2004, 2005
Did an ad for Apple
That they posted on the developer side
Where we were all about our Apple
So integral to everything that we do
And we look up to them
And we are inspired by them
And that love relationship
Actually continued for a very long time
I basically just became a Mac person for 20 years
I didn't even care about looking at PCs
It seemed irrelevant to me
Whatever Microsoft was doing
Which felt like such a relief
Because in the 90s
I felt like I couldn't escape
Microsoft and suddenly I had found my escape
And now I was with Apple
And it was glorious
And they shared so many of my sensibilities
And my aesthetics
And they kept pushing the envelope
And there was so much to be proud of
So much to look up to
And then that sort of started to change with the iPhone
Which is weird because the iPhone is what made modern Apple
It's what I lined up
In 2007 together with Jason
For five hours
To stand in the line
To buy a first generation product
Where Apple staff would clap at you
When you walked out the store
I don't know if you remember that
It was a whole ceremony
And it was part of that
Myth and mystique
All of Apple
I wasn't in the market for other computers
I wasn't in the market for other computer ideas
I thought perhaps I'd be with the Mac until the end of days
But as Apple discovered
The gold mine
It is to operate a toll booth
Where you don't have to innovate
Where you don't actually even have to make anything
Where you can just take 30% of other people's business
There was a rot
That's crept in
To the foundation of Apple
And that started all the way back
From the initial launch of the App Store
But I don't think we saw at the time
I didn't see at the time
Just how critical
The mobile phone would become to computing in general
I thought when the iPhone came out
That like, oh, it's like a mobile phone
I've had a mobile phone since the early 90s
Well, it wasn't a mobile phone
It was a mobile computer
And even more than that
It was the most important computer
Or it would become the most important computer
For most people around the world
Which meant that if you like to make software
And wanted to sell it to people
You had to go through that computer
And if going through that computer meant
Going through Apple's toll booth
And not just having to ask them permission
Which in and of itself was just an dignity
When you're used to the internet
Where you don't have to ask anyone permission about anything
You buy the main and you launch your business
And the customers show up
Boom, you're success
And if they don't
Well, you're failure
Now suddenly before you could even launch
You'd have to ask Apple for permission
That always sat wrong with me
But it wasn't until we launched
Hey in 2001
That I saw the full extent of the rot
That has snug into Apple's Apple
For people who don't know
And we'll talk about it
Hey, is this amazing email
Sort of attempt to solve the email problem
Yes
I like to pitch it as
What Gmail would have been
With 20 years of lessons
Applied in a way where they could actually ship
Gmail was incredible when you launched in 2004
And it still is a great product
But it's also trapped in its initial success
You can't redesign Gmail today
It's just that's way too many users
So if you want fresh thinking on email
I wanted fresh thinking on email
I needed to build my own email system
And not just my own email client
That's what a lot of people have done over the years
They build a client for Gmail
But you're severely constrained
If you don't control the email server as well
If you really want to move the ball forward with email
You have to control both the server and the client
And that was the adacious mission we set out to do with hey
And that was what's funny
I thought our main obstacle here would be Gmail
It's the 800 pound gorilla into email space
Something like
70% of all email in the US is sent through Gmail
I think their world rates are probably in that neighborhood as well
They're just absolutely huge
And trying to attack an enormous
Established competitor like that
Who's so actually still loved by plenty of people
And it's free seems like a suicide mission
And it was only a mission we signed up for
Because we had grown ambitious enough
After making base camp for 20 years
That we thought we could tackle that problem
So I thought hey
This is dumb
I would not advise anyone to go ahead
To head with Gmail
That seems like a suicide mission
We're going to try anyway
Because you know what
If we fail
It's going to be fine
We're just going to build a better email experience
For me and Jason
And the people at the company
And our cat
And that'll be okay
Because we're going to fort to do so
But when we got ready to launch
After spending two years building this product
Millions of dollars in investment to it
We obviously needed mobile apps
You're not going to be a serious
Contender with email
If you're not on a mobile phone
And you need to be there with a native client
So we had built a great native client
For both iOS and free Android
And as we were getting ready to launch
We submitted both of them to the app stores
Got both of them approved on
I think Friday afternoon
For the iOS app
And we then went live on Monday
And we were so excited
Hey world
We've been working on this new thing
I'd love for you to check it out
And of course
That's with anything
When you launch a new product
There's some bugs
So we quickly found a few
In the iOS client
And submitted a new build to Apple
Hey here's our bug fixes
Can you please update
And that's when all the help broke loose
Not only where they not going to prove
Our update
They said oh wait a minute
We gave your permission to be in the app store
But I'm sorry that was a mistake
We see that you're not using our in that payment system
Which means that we don't get
30% of your business
You will have to rectify that
Or you can't be in the app store
And first I thought like
Well it got approved already
We're running on the same model
We've run Basecamp on
In the app store for a decade
If you're not signing up through the app
And we're signing up our own customers
On our own website
And they're just going to the app store
To download their companion app
We're going to be fine
That was the truth
Right?
That was why I never got so fired up about the app store
Even as Apple started tightening the screws
Was like my business was okay
Now suddenly my business wasn't okay
Apple was willing to destroy
Hey
If we did not agree to give them 30%
Of all the signups that came through the iOS app
And it wasn't just about the 30%
It was also about splitting
And not longer having a direct relationship with our customers
When you sell an app in the app store
You're not selling an app to a customer
You're selling an app to inventory at Apple
And then Apple sells an app to that customer
That customer has a purchasing relationship with Apple
So if you want to give discounts or refunds
Or whatever it's complete hell
If you want to easily support multi-platform
That's complete hell
If someone signs up for a hey on their iPhone
And they want to switch to Android
But that billing relationship
It's tied to Apple
It's complete hell
For a million reasons
I did not want to hand my business over to Apple
I did not want to hand 30% of our revenue over to Apple
So we decided to do something that seemingly Apple had never heard before
We said no
We're not going to add the in-app payment
I don't care if you're threatening us
This is not fair, this is not reasonable
Police approve
And of course they didn't
And it escalated
And after a couple of days
We realized, you know what?
This isn't a mistake
This isn't going away
We're going to be dead
If they go through with this
If we're not going to yield
And give them the 30%
They're going to kick us off
Unless
We make such a racket
Such noise
That they will regret it
And that's exactly what then happened
We were blessed by the fact that we launched
Hey one week before the WWDC
Their worldwide developer conference
Where Apple loves to get up on stage
And harp on how much they do for developers
How much they love them
And why you should build for their new devices
And so on and so forth
And then we also just happen to have a platform on the internet
Which is very convenient
When you need to go to war
With a $3 trillion company
So I started kicking and screaming
Oh boy
And essentially
Turning it up to
11 in terms of the fight
And going public
With our
Denial to be in the app store
And that turned into a prolonged two week battle with Apple
That is essentially ended in the best possible outcome
We could have gotten
As David fighting Goliath
Which was a bit of a truce
We wouldn't hand 30% over to Apple
They wouldn't kick us out of the app store
But we had to build some bullshit
Dummy account
Since the app did something
When you downloaded it
That was a rule that Phil Schiller seemingly made up on the fly
When pressed for the fifth time
By the media about why
We couldn't be in the app store
When a million other companion apps could
But we just happened to be able to create so much pain and noise for Apple
That it was easier for them to just let us be
Than to keep on fighting
What do you think about Tim Sweeney's victory
With that bake over Apple
I think it is incredible
And the entire developer ecosystem
Not just on iOS
But on Android as well
Oh epic
Tim Sweeney and Mark Rain
An enormous debt of gratitude
For taking on the only battle
That has ever inflicted a series wound
On Apple
In this entire sorted
Campaign of monopoly enforcement
And that is Epic's fight versus them
Tim recently revealed that it has cost well over a hundred million dollars
In legal fees to carry on this battle against Apple
We for a hot moment considered suing Apple
When they were threatened to kick us out
We shopped the case around with a few law firms
And perhaps of course
They would tell us you have a good case
We need their turn to sell a product here
But they would also tell us
It's going to cost a minimum of ten million dollars
And it's going to take five to seven years
Through all the appeals
Now we now learn the actual price tag was ten times higher
Right? Epic spent over a hundred million
It would have destroyed us
To take on Apple in the legal realm
Only a company like Epic could do it
And only a company run by founders
Like Tim
Like Mark could risk the business in the way that they did
The audacity they had to provoke the fight in the first place
Which I thought was just incredible
And to stick with it for the long term
No board would have signed off
On this lawsuit to a professional CEO
No freaking way
So the fact that they've been able to beat Apple
In also the most hilarious way possible
I think it's just incredible
Because remember their first victory in the case
Was actually not much of a victory
There were about eleven counts in the trial
Apple basically won ten of them
And the judge awarded
Epic this one little win
That Apple couldn't tell them not to link out to the internet
To be able to do the payment processing
So they won this one little thing
And Apple instead of just taking the ten out of eleven wins
And going fine
You can have your little links
But all these other rules stay in place
Decided to essentially commit criminal contempt of court
As they've now been referred to for prosecution
And anger at the judge is such a degree
That the rule of law in the US now is
That you can launch an app in the app store
And you don't have to use in-app payment
But you can have a direct billing relationship with a customer
If you just link out to the open internet
When you take the credit card
And then hop back into the app
And we owe all of that to Tim and Mark
We owe all of that to Epic
We're going to launch new apps any minute now
I hope actually next week to take advantage of this
That revamp the hay apps is that
People who download the hay app off the Apple app store
Can sign up in the app
And can then use the web to put in the credit card
So we don't have to pay 30% of this
We have a direct billing relationship
And such that they can take that
Subscription to Android to PCs
Whatever without any hassle
And we have Tim and Mark to thank for it
Yeah, Tim, like you said founders
But also specific kind of founders
Because I think maybe you can educate me on this
But Tim is somebody who maintains
To this day sort of the unreasonableness of principles
That's what I love
I think sometimes maybe even with founders
You can get worn down
It's a large company
There's a lot of smart quote-unquote people around you
Lawyers and just whispering your ear over time
And you're like, what just be a reason we'll be in it
You know, this is a different thing
To be the sort of maintain
I mean, Steve Jobs did this
The maintain
Still are the asshole
Yes
Who says no
Yes, whole company
I'll sink this whole fucking company over this
That's the exact language basically I used
In our original campaign
I will burn this business down
Before I hand over 30% of it to Apple
And that sort of indignation
That actual rage
Is something I try to be a little careful about tapping into
Because it is a little bit of a volatile compound
Because I mean, I have a bunch of employees
We have a bunch of customers
It would be pretty sad
If the journey of 37 singles after 25 years
Would come to an end
Because Apple would burn us down
Or I would burn the business down over this fight with Apple
But I think you also need that level of conviction
To be able to even drive day-to-day decisions
One of the other Apple examples
I know I'm racking on Apple a little bit here
And I don't actually hate them
I really don't
I am tremendously disappointed
At the squandered relationship
That did not need to be sold
Away for so little
Now I understand
That the App Store toll booth is actually pretty big business
It's multiple billions
But Apple is a trillion dollar company
And I think in the lens of history
This is going to come off as a tremendous mistake
And I think it's already coming off as a tremendous mistake
The flop that was Division Pro
Was partly because Apple had pissed off every other developer
No one was eager to come build the kind of experiences
For their new hardware
That would perhaps have made it a success
So when you're on top
And you have all the cards
You can dilute yourself into thinking
That you can dictate all terms at all times
And there are no long-term consequences
Apple is learning finally
The fact that there are long-term consequences
And the developers actually are important to Apple's business
And the relationship is not entirely one-sided
We don't owe our existence
To Apple and Apple alone
We build our own customer bases
Apple has been beneficial to the industry
I'm glad the iPhone exists
Da da da da
It's not that it doesn't go both ways
But Apple wants it only one way
And I think
That is a mistake
And it's a mistake that was avoidable
And A, that's disappointing
Certainly disappointing
For me, I literally spent 20 years evangelizing this shit
Right?
I've spent so much money buying Apple hardware
Extusing a bunch of things
They've done over the years
And then
For what?
For the fact that you wanted 30% of something that I created
In the most unreasonable way possible
Couldn't we have found a better way to do this
I think they're getting to get forced to do it better way
But did you also have to go through the indignity
Of having a criminal contempt charge
Against you getting referred to prosecution
It just seems so beneath Apple
But it also seems so in line
With what happens to huge companies
Who are run by
Quote-unquote professional managers
Rather than founders
And unreasonable people
Well, we should probably also say
That the thing you love about Apple
The great spirit of Apple, I think, still persists
And there's a case we made
That this 30% of things
A slice, a particular slice of a company
Not a defining aspect of the company
And that Apple is still on top
In the hardware that it makes
And a lot of things that it makes
And
You know, this is
That could be just a hiccup
In a long story of a great company
That
Does a lot of awesome stuff for humanity
So like Apple is a truly special company
We mentioned Amazon
There's no company like Apple
I agree
This is why the disappointment is old
Yeah, because we had such high
aspirations and expectations
To Apple
That they were the shining
City on the hill
And they were guiding the industry
In a million positive ways
I think
As we talked about earlier
Hardware is exciting again
In large part
Because Apple
bought P.A. Semi
And pursued a
Against all odds
Mission to get arm
Up to the level it is today
And we have these incredible M chips now
Because of it
And
The design sensibilities
That Apple bring to the table
Are unparalleled
No one has taste
Certainly at the hardware level
Like Apple does
Even at the software level
I'd say
There's a lot of taste left in Apple
But there's also some real sour taste now
So they have to wash that off
First, I think
Before they find that we're back
But Apple's been in
In a morat as before
I mean
Wasnyak and Steve Jobs
Started this thing in the garage
Has great success with the Apple too
He hands the company over to a sugar drink salesman
Who tanks the company into the 90s
He doesn't learn the lesson
Spends the next 20 years building up this amazing company
Then hands the company over again
To a logistics person
Who
Presumably had more redeeming qualities
Than
The first guy who put in charge
But still ends up
Leading the company astray
Now
This is the norm
The norm is
The great companies don't last forever
In the long arc of history
Almost no company lasts forever
There are very few companies
Around that was here 100 years ago
Even fewer 200 years ago
And virtually nothing that are a thousand years old
Outside of a handful of Japanese swordsmakers
Something like that right
So you can get the looted into thinking
That something is forever
When you're in the moment
And they seem so large
Apple could absolutely stumble
And I think they have more reason
To stumble now than ever
They're behind on AI terribly behind
Their software quality
Is faltering in a bunch of ways
The competition is catching up on the hardware game
In part because TSMC is not an Apple subsidiary
But a foundry that services AMD
And Nvidia
And others
Were now able to use the same kind of advanced processes
This is something I learned
After not looking at PC hardware for the longest time
That holy smokes
AMD actually makes CPUs
That are just as fast
If not faster than Apple's
They're not quite as efficient yet
Because ARM
Has some fundamental efficiencies over x86
But they're still pretty good
So Apple should have reason to worry
Apple shareholders should have reason to be concerned
Not just about all these stumbles
But also by the fact that Apple is run by old people
Apple's board has an average age of I think 75
Their entire executive team is above 60
Now
That sounds horribly agist
And in some ways it a little bit is
In the same way I'm agist against myself
Like I'm 45 now
And I sort of kind of have to force myself
To really get into AI
Because it is such a paradigm shift
And a lot of people when they reach a certain age
Or just happy to stay with what they know
They don't want to go back to being a beginner
They don't want to go back to
Having to relearn everything
And I think like
This is a little hard for me at 45
How the hell do you do that at 75
Mm-hmm
I have to come back to you mentioned it earlier
Your parent
Can you speak to the impact
That becoming a father
Has had in your life
I think what's funny about fatherhood is that
For me I wasn't even sure it's something I wanted
It took meeting the right woman
And letting her
Convince me
That this was the right idea
Before we even got started
I didn't have
Starting my own family on the list of priorities
In my late 20s or even early 30s
It was really the impetus of meeting my wife Jamie
And her telling me
This is what I want
I want to have a family
I want to get married
I want to have kids
I want to have three
And me going
For a second like whoa whoa whoa
And then
All right let's do it
And I think
That's the kind of happy accident
Where some parts of my life have been very driven
Where I knew exactly what I wanted
And how to push forward to it
And what the payoff was going to be
But when it comes to having a family
That always felt like a very fuzzy abstract idea
The chirps someday
Maybe
And then it became very concrete
Because I met a woman who knew what she wanted
And looking back on it now
It almost seems
Crazy like there's just fork in the road of reality
Where if that hadn't happened
And I had been sitting here now
Not being a father
Not having a family
The level of regret
Knowing what I know now
About the joys of having that family
Would have been
existential
Would have been
I don't know if they would have been devastating
I think men have a little bit of a longer window
To pursue these things
Than women do
There are just certain biological facts
But
Ending up with the family I have now
Ending up with my three boys
Have been
Just a transformative experience in the sense that
Here's something that turned out to be the most important thing
And it was an open secret
Not even an open secret
It was an open truth
Through all of history
You listen to anyone who's ever had children
They will all say my children are the most important to me
Yet somehow that wisdom couldn't sink in
Until you were in the situation yourself
I find those truths fascinating
When you can't actually relay them with words
I can tell you hey
Lex
What are you doing?
Get a wife
Make some kids
Get a move on it
And these are just words
They're not
Communicating the gravity of what it actually feels to go through the experience
And you can't really learn it
Without going through it
Now of course you can be influenced
Then whatever we can all help contribute
And little sparks and little seeds
Can grow in your your mind about it
But still has to happen
And
Now that I am in this situation
And just the sheer joy on a daily basis
Where you think your level of life satisfaction is on a scale of one to ten
Yeah
And then the satisfaction of seeing your children
Understand something
Accomplish something
Learn something
Do something
Just be
Just goes like oh my god
The scale doesn't go from one to ten
It goes from one to a hundred
And I've been playing down here in the one to ten range
All this time and there's a one to a hundred
That has been humbling
In a way that
Is impactful in and of itself
This whole idea that I thought I had a
Fair understanding of like the boundaries of life
In my early 30s
Like what is this about?
I mean I've been on this earth long enough now here to know something
And you were saying I don't know
I did not know
I did not know that the scale was much much
Brother
And I've often talked about
The joys of having kids
And just seeing your own DNA
Which
Is remarkable to me because literally that's been the pursuit of
Human since the dawn of time
I am here today because
Whenever 30,000 years ago some Neanderthal
Had the same realization that I should procreate
And I should continue my bloodline
And that all amounts to me sitting here
Here now but
It didn't become a practical reality
To me before meeting the right woman
And I think that that's
Sometimes
Not part of the conversation enough
That there's something broken at the moment
About how
People pair up in the Western world
And it's at the source of why
We're not having enough children
Because there's not enough couples
There's not enough marriage
There's not a lot of these
There's not enough of all these traditional values
That even 50, 60, 70 years ago
Was just taking for granted
We're in this grand experiment
Of what happens if we just remove a bunch of institutions
What happens if we no longer value marriage
As something to aspire to
What happened if parenthood
Is now seen in some camps
It's almost something like
Weird or against your own self-expression
It's a grand experiment that
I'm kind of curious how it turns out
I'd prefer to watch it as a movie
Like the children of men
Of like that was a good show
I kind of wish that was reality
But we're seeing that reality play out
While I'm sitting here in a very traditional
Two-parent loving household
With three children and going
Um
This is now at the top
I've done a lot of things in my life
I've
Built software
Built companies
I've raised cars
I've done all sorts of things
And I would trade all of it
In a heartbeat
For my kids
That's just a really fascinating human experience
That the depth of that bond
Is something
You can't appreciate before you have it
But
I also think there is a role to play
To talk it up
Because we're being bombarded
Concently with reasons
Why not to
Oh, it's too expensive
Um
Well, you could get divorced and then you might lose half
There's all these
Voices
Concentry articulating the case against marriage
The case against having children
That those of us who chosen to do the traditional thing
To get marriage and to have children
Have an obligation
To kind of talk it up a little bit
Which would have seen ridiculous again
50 years ago that you have to talk up
Something so fundamental of that
But I have become
Kind of obligated in that sense
To do just that
To talk it up
To say
Do you know what
You can look at everything that I've done
And if you like some of those parts
Realize that to me in the situation
The kids, the family, the wife
Is more important than all of it
And it sounds like a cliche
Because you've heard it a thousand times before
And by becoming a cliche
Maybe you start believing it's not true
That it's just something people say
But it is reality
I know almost no parents
That I have personal relationships with
That don't consider their children
To be the most important thing in their life
So there's a lot of interesting things you say
So one, it does seem to be
I know a lot of
Parents
Perhaps more interestingly
I know a lot of super successful people
Who are parents
Who
Really love their kids
And who say that the kids
Even helped them to be more successful
Now the interesting thing
Speaking to what you're saying is
It does seem for us humans
It's easy to articulate the negatives
Because they're sort of concrete, pragmatic
You know, it costs more
It takes some time
You know, they can be
You know, crying all over the place
They're
You know, tiny narcissists running around
Whatever
Which is all true
But yeah
Puping everywhere
That kind of stuff
But to articulate
The thing you were speaking to
There's this little creature
That you love more than anything
You've ever loved in your life
It's hard to convert that into words
You have to really experience it
But I believe it
And I want to experience it that
But I believe it
Because just from a scientific method
Have seen a lot of
People who are not honestly
Not very capable of love
Fall completely in love with their kids
Yes
Like, you know, very sort of
Let's just call it what it is
Engineers that are very like
Loop up
Yes, they just fall in love
And it's like, all right
People who just like you said
They don't really want
They don't really care
Or don't really think about having kids
That kind of stuff
Once they do it changes everything
So, you know
But it's hard to convert into words
One of the reasons I think it's also difficult is
I mean, I like kids
Not that actively dislike them
But when I was around other people's kids
I didn't have a emotional reaction
Some women have, right?
They see a baby
And they go, oh
I never had any emotion of that
I mean, I could appreciate
I'm glad for you that you have children
It did not provoke anything in me
The emotions that are provoked in me
When I look at my own children
This doesn't exist in the same universe
So you don't have something
You don't have a complete parallel
Or at least a lot of men
Or at least me
I didn't have sort of a framework to put it into
What would it be like to have my own child
And then you experience
And you just, it's like the
And it happens so quickly too
This is what I found fascinating
It happens before
That little human is even able
To return any words to you
That the love you develop to an infant
It happens quite quickly
Not necessarily
Immediately
I don't know
Different people have different experiences
But it took me a little bit
But then once it hit
It just hit like
Cake of a horse
And I love that it's also just such a universal experience
That you can be the most successful person in the world
You can be the poorest person in the world
You can be somewhere in the middle
And we share this experience
That being a parent
For most of them
Turns out to be the most important thing in their life
But it is really nice
To do that kind of experience with the right partner
But I think because I'm such an empath
The cost of having the wrong partner is high for me
But then I also like realized
Man
I have a friend of mine who's divorced
Happily
And he still loves the shit out of his kids
And it's still beautiful
It's a mess
But there's all of that love is still there
And it's
You know, you just have to make it work
It's just that I don't know
That kind of like divorce would destroy me
You should listen to the School of Life
Yes, this great
Bit on YouTube
You will marry the wrong person
If you accept upfront
That you will marry the wrong person
That every potential person you can marry
Is going to be the wrong person on some dimension
They're going to annoy you
They're going to be
Not what you hoped in certain dimensions
The romantic ideal
That everything is just perfect all the time
Is not very conducive
To the reality of hitching up and getting
Making babies
Because I think as you just accounted
Even when it turns to shit
I find that
Most of the people I personally know
Where things have fallen apart and have turned to shit
Never in a million years would they go like I regret it
I would rather my children did not exist
Because a relationship turned sour
I mean, I think you should try very hard
And I think this is also one of those things
Where we didn't fully understand
Those fences
And when we pulled them up
And celebrated how easy it is to get divorced for example
That that wasn't going to have some negative consequences
I'm not saying you shouldn't have divorces
I'm not saying return to
At times past
I'm saying though
That civilization
Over thousands of years developed certain technologies
For ensuring the
Continuation of
Its own institutions and its own life
That perhaps we didn't fully appreciate
I mean, again
This is something Jordan Peterson and others
Are far more articulate to speak about
And that I've learned a lot
To just analyze my own situation
Why is it that this incredible burden it is
To be responsible for someone else's life
That you brought into this world
Is also the most rewarding part of existence
That's just curious
Before I heard Peterson articulate
The value of taking on the greatest burden
You know how to carry
I always thought about burdens as a negative things
Why would I want the burden of a child
I might screw it up
I might be a bad parent
They might have bad out
All this stuff right
All the reasons why you shouldn't
And so few voices are articulating why you should
Yeah, but I should also add on top of that
The thing you mentioned
Currently perhaps in the West
The matchmaking process
It is broken
It's broken and technology made it worse
It's fascinating
This whole thing
That that hasn't been solved
So hiring great teams
That's probably been solved the best
Out of matchmaking
Finding great people to hire
Second finding great friends
That's like
That's also hasn't been solved
And it's breaking down
It's breaking down
And third is matchmaking for like relationships
That's like the worst
And in fact technology made it even worse
Yes
It's fascinating
It is
It's a great example again
Of how all the greatest
Intentions
Still let us straight to hell
I really enjoyed
Luis Perry's analysis of
The sexual revolution
Not being an unqualified good
Which was something I hadn't
Thought about at all
Before she articulated it
That of course
Women should be able to
Have freedom
Until termination
And abortions
And all of these things
And Luis Perry is not arguing against it either
Of course
But there are
Second order effects
That we don't appreciate at the time
And we may not have ready made solutions for
That's just interesting
You make life better
In a million different ways
And somehow we end up more miserable
Why is that?
Why is it that
Humans
Find meaning
In hardship
And I think
Some of that
Is that
It's a difficult question to
Answer through
Science
And again, Peter's in the ticket late as well
This idea that you have to find some of it through art
Some of it through authors
Some of it through
Different
I was just about to say modes of knowing
Before I
Stop myself because that sounds like Wu Bullshit
But there are different ways to
Acquire
Those deep lessons
That
Sort of a
Paper
It's not going to tell you
I mean, this is really
The point
Uh, also applies to religion for example
If you remove from society the softer religion
Yes, you better have a good replacement
And we've had a bunch of bad replacements
Especially over the last few decades
Religion is one of those things I've struggled with a lot
Because I'm not religious
But I sort of wish I was
I can now
Fully appreciate the enormous value
Having an operating system like that
Brings not just at the individual level
But rather at a societal level
And it's not clear at all what the answer is
I think we've tried a lot of dead ends
When it came to replacements
And people have been filling that void
In a million different ways that seem
Worse than all the religions
Despite their faults
In a myriad of ways
Have been able to deliver
Yeah, religion is like
The cobalt code
It's just yes
It's these institutions
Where we don't fully understand the rules
And why they're there
And what's going to happen if we remove them
Some of them
Seems obvious to me
Or just bullshit
Of the time
Oh, you should need
Whatever, shellfish
Because in that region of the world
There was something something something
Okay fine
But there's a bunch of other things
That are pivotal
To keeping society functioning for the long term
And we don't fully understand which is which
What's the bullshit
And what's the load bearing pillars of society
Can you speak to
The hit on productivity that kids
Have
Did the increase your productivity decrease it
Or is that even the wrong question to ask
I think it's one of the reasons why ambitious people
Are often afraid
Of having children
Because they think I have so much more to do
And I barely have enough time now
How would I possibly be able to
Accomplish the things I want to accomplish
If I add another human into the mix
Now
A
We've always worked 40 hours a week
Not 80 or 100 or 120
I think that's very beneficial
B
Kids
Don't exist in this vacuum of just
Them alone being entered into your life
Hopefully there's a partner
And in my life
I'm married to a wonderful woman
Who decided to stop working her corporate job
When we got together
And have been able to carry a huge part of that
Responsibility
I was just about to say burden
And I think that's exactly how it often gets
Presented especially
From a feminist perspective
That carrying for your own children
Is some sort of unpaid labor
That has to
Be compensated for in some specific way
Beyond the compensation of what
Bringing life into this world
Racing
Wonderful humans
There's something screwy
About that analysis
That I actually think the
Modern trad movement
Is
A reply against
Whether they have all the answers
I'm certainly not sure of either
But there's something that's just
Not right in the analysis
That children are burden
And that if
Woman chooses to
Stay at home with the kids
That that some sort of failure mode
Of feminist ambition
I think that's actually a complete dead end
Now
Depends on different people
Different circumstances
I can just speak to
My life
Being married to a wonderful woman
Who have decided to
Be at home with the kids
At least that their early age
And
Taking on a lot of those responsibilities
Now it doesn't mean there isn't
Plenty of ways that I
Have to be part of that and have to chip in
But it's allowed me to continue to work
The 40 hours a week
That I've
Always worked
But it's made the 40 hours more strict
I have a
Schedule where I wake up
Whatever 630
And we have to get out of the door
Little before 8
I usually have to play at least one or two rounds of fortnight
With my youngest, sometimes middle child
Then take the kids to school
Get in start work at, I don't know, 839
Then work until 530, sometimes 6 o'clock
But then it's dinner
And I have to be there for that
And then I have to read to the kids
And by the time that's done
I don't want to go back to work
So my work time really is
9 to 5, 9 to 6
Depending of whatever is going on
Sometimes there's some urgencies and you have to tend to them
But it's made it more structured
And I found some
Some benefit in that and I found some productivity in that
That I can't goof around quite as much
That the day will end at around
536
That's just if I didn't accomplish what I wanted to do today
If I get to that time, it's done
I'm over, I have to
Try again tomorrow
Whereas before having a family and before having kids
I could just like
Not do it and just make it up in the evening
So in that way it's made me more structured
But it hasn't really changed my volume of work all that much
I still work about the same amount of hours
And that's by the way enough
This is one of the key points we make in
It doesn't have to be crazy at work
The latest book we wrote
Is that there's enough time
40 hours a week is actually a ton
If you don't piss it away
Most people do piss it away
They piss it away in meetings
They piss it away on
Just stuff that doesn't matter
When even three hours
Four hours of concentrated uninterrupted time
Every day would move the goals they truly care about
Way down the field
I think kids do make you more productive in that way
For people who need it especially
People like me
They create their urgency
Like if you have to be done by five
It's maybe counterintuitive notion
For people like me who like to work
You can really fill the day
Yes
With love
Yes
Of work
And if you have to be done by five
You're going to have to do the deep work
And get it done
Like really focus singular work
Yes
And then you're just going to cut off all the questions
It keeps you honest
Because
You can squander one day
You can squander two days
But if I squander a whole week
I feel terrible
Now that's just some drive
I have in me
Where I feel content
And full of meaning
If I actually do stuff that matters
If I can look back upon the week
And go like that
That was a nice week
Really
We move forward
Maybe we didn't get done
But we move forward
And everything got better
And I think kids really help
Just time box things in that way
And a lot of people need that
Because I find just so much of the
Celebration of overwork to be so tiresome
Oh I work 60 hours or 80 hours, 100 hours a week
And just like
First of all, no you don't
No you don't
Like those 80 hours are full of all sorts of fluff
That you label work
But that I would laugh at
And that most people laugh at
That you would laugh at
If you actually did the analysis
Of where is that time going
Most of the important stuff
That have to be done
Is done in these uninterrupted chunks of two hours here
Four hours there
Five hours there
The hard part is making sure you get them in the whole piece
So don't give me
Don't give me that
There's time enough
And also
What's so important
That it ranks above
Continuing you lineage
I think there's just some
Ancient
Honor
In the fact that again
This DNA that's sitting on this chair
Traveled 30,000 years to get here
And you're going to squander all that away
Just so you can send a few more emails
There is something that's also hard to convert
Into words of
Just
The kind of fun you can have just playing
With your kids
I don't know what that
On the surface
It's like
I can have that kind of fun
Just playing video games by myself
But no
It's like
There's some magical about it right
I have a thousand hours
Logged in fortnight
Since
19 I think
All of it with my kids
I'd never be playing fortnight
Well I don't know if I'd never would be
I wouldn't be playing a thousand hours of fortnight
If it wasn't for my kids
The enjoyment for me is to
Do something with them
That I also happen to enjoy
I really love fortnight
It's a
Phenomenal game
I don't have to force myself to play that with them
I often ask
Like hey
Do you want to play fortnight
But still
It's an activity
That I get to share with them
It's a passion that I get to share with them
I've started doing go-carting with my oldest
I've been driving
Race cars for a long time
And now they're getting into go-carting
And just
Being at the go-cart track
Seeing them going around
Seeing them get faster
Seeing them learn that skill
You just go
Look at like
What else would I be doing with my life
At
My age 45
I'm standing here
Truly enjoying
Life I brought into this world
What else is it
It was so important
At this stage
That I would otherwise be spending my time on
All right, like you mentioned
You like to race cars
And you do it at a world-class competitive level
This is incredible
So how'd you get into it
What attracts you to racing
What do you love about it
The funny thing about
Getting into racing
Is I did not get my driver's license
Until I was 25
I grew up in Copenhagen, Denmark
Where
The
Tax
On cars
Is basically over 200 percent
So you pay for
Three cars and you get one
And I didn't even have to money for one car
Let alone three
So I could not afford a car growing up
We did not have a car growing up
But Copenhagen is a
Nice city to be able to get around
On a bike or with a bus
Or as I did for a long period of time on rollerblades
But
When I was 25
I realized I wanted to spend more time with you
As I wasn't sure yet that I was going to move there
That turned out later to be true
But I knew that if I wanted to spend time in the U.S
I needed to have a driver's license
I was not going to get around very
Well, if I didn't know how to drive a car
So I got a driver's license at 25
Then ended up moving to the U.S. later that year
And I'd always been into
Video games, racing video games
Metropolitan Street Racer
Under Dreamcast
Was one of those games that really sucked me into
It was the precursor to
Project Gautam
Which was the precursor to
Essentially Forza Horizon I think
Oh, okay. I think that's what the lineage goes
It's just a great game
I actually just fired it up on an emulator
A few weeks ago
And it's sort of kind of holds up
Because it has enough real car dynamics
That it smells a little bit like driving a real car
It's not just like an arcade racer like Segarelli
Or something like that
But I'd always been into that
Then I got my driver's license at 25
And moved to the U.S.
And then two years later
A friend that I'd met in Chicago
Took me to
The Chicago Audubon Country Club
Which is this great track
About 45 minutes from Chicago
And I sat in a race car
And I drove a race car for the first time
And I had
The same kind of
Sudo-religious experience
I did as when I started working on Ruby
Where I did
Maybe 20 laps
In this
Basically a master race car
From I think like the 90s or something
I get pretty cheap race car
But a real race car
Single-seater
Manual gearbox
But it's both slick wheels
All the stuff
And after having had that experience
First of all
It was just the most amazing thing ever
Like the physical sensation of driving a race car
Is really unique
And I think if you're driving a car fast
You have maybe a 2% taste of it
The exposure to the elements
That you get in the single-seater race car
Especially one like that
Where your head is actually out in the elements
You can see the individual wheels
And your sensation of speed
Is just so much higher
Is at a completely different level
So can you actually speak to that
So even at that
Even at that Mazda
So you can feel
Can you feel like the track
reverberating
You feel the grip
Not only can you see the bumps
Because you're literally looking straight at the wheels
You can feel all the bumps
Because you're running a slick tire
It's a really stiff setup
It's nothing like taking a fast street car
Out on a racetrack
And try to drive a little bit around
So can you feel like the slipping
If the traction
That's a huge part of the satisfaction
Of driving a race car
It's driving in at the edge of adhesion
As we call it
Where
The car is actually sliding a little
But a couple of percent slip angle
Is the fastest way to drive a race car
You don't want to slide too much
That looks great, lots of smoke
But it's not fast
How you want to drive it
Is just at the limit of adhesion
Where you're rotating the car
As much as your tires can manage
And then slightly more than that
And playing at keeping it just at that level
Because when you're at the level of
Or at the limit of adhesion
You're essentially just a tiny movement
Away from spinning out
It doesn't take much
Then the car starts rotating
Once it starts rotating
You lose grip
And you're going for the wall
That balance
Of danger and skill
Is what's so intoxicating
And it's so much better than racing video games too
Because the criticality
Is taking up two nodges
I often think about people really like gambling
Where I think like
Aren't you just playing poker
And like no
The point is not poker
Poker is maybe part of it
But the point is that I could lose my house
Right? Like that's the addiction
That some people get
To gambling
That there's something real on the line
When you're in a race car
There's something very real on the line
If you get it wrong
At the very least
You're going to spin out
And properly hit a wall
And it's going to be expensive
At the very worst
You're not getting out alive
And even if modern race cars have gotten
Way safer
Than they used to be
There is that element of danger
That's real
That there are people
Who still get seriously hurt
Or even killed
In a race car
It's
Mercifully rare compared to what it used to be
When those
Maniacs in the 60s
Would do Formula One
And whatever
13% of the grid
Wouldn't make it to the end of the year
Because they just
Die in a
fiery
Flaming
Fireball
But there's still some of it there
And I think that
Since that there's something on the line
Really contributes to it
But it's more than that
There's just just a physical sensation
There's activation of all your forces
There's the flow
And I think
That really
Cement's like why I got addicted
Because I always
I love that flow I got out of programming
But getting flow out of programming
Is a very inconsistent process
I can't just sit down
In front of a keyboard and go like
All right
Let's get the flow going
It doesn't happen like that
The problem has to be just right
It has to meet my skills
And just the right moment
It's a bit of a lottery
In a race car it's not a lottery at all
You sit down in that car
You turn the ignition
You go out and track
And I get flow virtually guaranteed
Because you need
Or I need
At least 100% of my brain processing power
To be able to go
At the speed I go
Without
Crashing
So
There's no time to think about
The internet
Or the meeting next week
Or product launch
It just
It's
Completely zen
In actually
The literal sense of the word
I think of
Someone who's really good at meditation
That's probably kind of state they get into
Where
It's just clear you're in the now
There's nothing but you
And the next corner
That's a really addictive
Experience
So after about that
I couldn't get enough
I just
I kept going to the track
Ever opportunity I got
Every single weekend
For about four years
I would go to the track
And by the end of that time
I'd finally worked up enough skill
And enough success with the company
That I could afford to go
Quote a quote real racing
So I started doing that
I started driving these porches
And then as soon as I got into that
As soon as I got into
Quote a quote real competition
I was like
I wonder how far you can take this
And
It didn't take that long
Before I decided
Do you know what
I could take this all the way
My great hero in racing
Is Tom Christensen
Fellow Dane
The
Mr. Lamar
As they call it
The greatest endurance race in the world
The 24 hours of Lamar
Has been one
More times
Than any other
By Tom Christensen
He won the race
Nine times
So Tom
Just
Really turned me on to Lamar
I've been watching Lamar
Since
I think the 80s
I have my earliest memories
Of watching that on tv
The race has been going since
I think uh
20s
But in the 80s
I got kind of into it
And then in the
Like 90s
Early 2000s
When Tom started winning
I like
Pretty much every other day
Started watching the
Race almost religiously
So I thought
Do you know what
I want to get to Lamar
And this is the magic thing about racing
That
If I get into basketball
Like I can't set a realistic
Expectation that I'm going to play in the NBA
That I'm going to go to the finals
Or I get into tennis
And I'm going to play at Wimble then
That just doesn't happen
But racing is special in this way
Because it requires
A fair amount of money
To keep these cars running
It's really expensive
It's like having a small startup
You need to fly a bunch of people around the world
And buy expensive equipment and so forth
So you need a bunch of capital
And I had some
Through the success of the company
So I could do it
Which
meant that I could get to Lamar
So I set that as my goal
I want to get to Lamar
And I started racing
In real competition 2009
And three years later in 2012
I was at the grid of Lamar
For the first time
We should say
So Lamar
24 hour race
Endurance
I mean this is insane
There are three drivers
Mind you
So it's not like one
Guy just driving for 20 hours
24 hours straight
But still it's a pretty tough race
Both physically and mentally
Especially mentally
When you've been up
For 24 plus hours
You're not quite a sharp
When you first wake up
And this is funny about Lamar too
It starts at around four o'clock in the afternoon
So you've already been up for half a day
By the time the race starts
And then there's 24 hours to go
Before you're done
And you'll be in the car
For anywhere from
Usually an hour and a half
To a maximum of four hours
The regulations say
Four out of six is the max you can do
I've spent perhaps two and a half hours
In a single stint at Lamar
It's pretty taxing
You're going
200 miles an hour
Into some of these turns
And there's another
60 cars on track
Whenever I'm in my normal category
Which is the LNP-2 category
I have GT cars
Which are more like a Ferrari and a Porsche
That I have to overtake
And then I have these hypercars
Which is the top class that are overtaking me
So you got a lot going on
And you got to stay sharp
For two and a half hours straight to do that
That is just a guaranteed way to get
Incredible flow
For long long stretches of time
That's why you get addicted to it
That's why I got addicted
You got to talk me through this video
This video of you in these LNP-2s
This is such a cool
This is so cool
And this was probably
My favorite battle of my career
Shut
And Hanboa Hanson has beat
Host and Fart
Yeah, so this is me
Driving against Nico Miller
At the Shanghai International Circuit
You're on the outside
I'm on the outside in the
Cool white
And we go a whole track around
With basically a piece of paper
Between a seat down this back straight
I get so close to him
Because I want to force him over on the other side of the track
Such that he can't just box me in
And we've been fighting already at this point
For basically 40 minutes straight
I've been managing to keep this professional driver
Behind me for 40 minutes
And he finally passes me
But we just keep the battle on for the whole time
And it really just shows both these kinds of cars
The Lamont Prototype
We don't actually have a touch
We get within about an inch
And keep going around the Shanghai Circuit too
How did you get so good
Like what
I mean that's a fascinating story
Right
That you are able to get so good
I'm pretty good for the kind of driver I am
Which is called the Gentleman Driver
Which means I'm not a professional driver
And like many good Gentleman drivers
When we're at our really best
We can be quite competitive
With even professional drivers
Who have been doing this their whole life
The difference between us
And the professionals
Is the professionals could do it every time
Or more or less every time
So I can't be this good all the time
When everything is just right
I can be competitive with
Professional drivers
But that's not how you win championships
That's not how you get paid by factories to drive
You got to be good every time you go out
So that's a huge difference
But some of it was also just
I really put my mind to it
By the time I realized race cars
Is what I want to do as my serious hobby
I put in thousands of hours
Have you crashed?
What's the worst crash?
I've had a lot of crashes
But thankfully, Nuggan would
I haven't had any crashes
Where I've gotten really seriously heard
Have you like wrecked the car?
Oh yes
Oh yes
I've wrecked many a car
So what does that feel like
Just you wreck a car
Like how do you get
It feels like total shit
If you're in a real race
And other people depend on you
It's not even so much the car
Although it's also
Sometimes that
These cars are expensive to repair
And that sucks
And it feels
So wasteful
In a way
When you crash
Some of these cars
But
The sense that you're letting a team down
Endurance
Racing is the team sport
Not only do you have your mechanics
You usually have co-drivers
So when I crash
I just feel like
Damn it
I could have avoided this
Yeah, but also
You could have died
Do you know what's funny
I never think about that
I don't think you can
Because I think the moment you start thinking about
Being able to die
You can't do it
You can't go fast
Well, I'm sure
Not to go all
Car all young and
Freud here
But I'm sure that's always
Present in the back of your mind
Somewhere
You're not just bringing it to the surface
It is in the sense that
It's part of the appeal
It's part of
The sense that there's something on the line
That this isn't just virtual
I can't just hit reset
Restart
Reboot
If I crash this car
We're going to be out
Or we're going to be this advantage
Or it's going to get destroyed
Or I might get hurt
I've gotten
Lightly hurt a few times
I actually had the year we won
Twenty-Fares of Le Mans in our class
I'd been training in this formula
3.5
Car
It's a really fast car
It's a really nice exercise to do
But it's also
It doesn't have power steering
So some of these race cars
Especially the open seats
Or so they don't have power steering
Which means that the steering wheel
Is basically directly connected
To the front wheels
So if you crash one of those cars
And the front wheels suddenly turn
You're really going to hurt your hands
If you don't get your hands off the wheel
I hadn't raised enough of those cars
To know that I had to get
Or to have to instinct
To have developed instinct
That I had to get my hands off the wheel
So I didn't
And I really hurt my hand
And this was just I think a month before
The twenty-fares of Le Mans
So I thought, oh man
I'm going to have to miss it this year
I had like a
Not a cast
It was just seriously sprained
And then somehow
Miraculously
Like a week before the event
I was like, oh yeah
Actually it's okay now
So got to do it
And that would have been
Grave regret
If I would have seen my team
Go to on to win the race
And I would have to sit on the sidelines
But I really have been quite fortunate
In the sense that
Most of my crashes have just been expensive
Or sporting inconvenient
They've never been
Something where I got seriously hurt
But I've seen plenty of people
Who have
In fact
My co-driver this year
And for several years
Petro Fidipaldi
Drove a race car at Spa
Spa is one of the great race tracks
Of all time
And has this iconic corner called Arouche
Which is probably the most famous corner in all of motorsports
That has a great compression
Before you
Climb uphill
It's a extremely fast
Very difficult corner
And just as he does the compression
His car basically sets out
And he loses his power steering
And he drives straight into the wall
And breaks both his legs
And basically
Face the prospect
That maybe his career was over
I've had other
teammates
And people I know
Have serious injuries
That's really hurt them
And yet what's funny as you say
You think that would sink in
The year before
We won
In 2014
That same car
Had a Danish driver in it
At Le Mans
At the race I was driving
Who died
He lost control of the car
When
There was a bit of rain on the track
And the track was
Unfortunately designed in such a poor way
That there was a
Very big tree
Right behind the railing
And he
Hit that tree
At full speed
Pulled
90 g's
And was dead on the spot
Which was just such an
Extremely
Awful
Experience to go through
I finished second
That year
Which should have been caused for a bunch of celebration
But it was just
Tainted by the fact that
Not only did a driver die
A fellow
Dane
died
A guy I knew died
That was
That was pretty tough
So that
Throw that into the pile of the
The things have to be considered
Is the weather conditions
A commission of the track
The
Weather is dry or wet
It's a huge part of it
Even just last year at Le Mans
It was raining
And I was out
And
I hadn't made a serious mistake at the 24th of Le Mans
Since I
Did the first race in 2012
Where I put it
In the sand trap
With like four hours to go
And we lost a couple of laps getting pulled out
But it didn't actually change anything for our
Result because
That was just how the field was spread out
I'd made minor mistakes over the years
But nothing that really set us out
And that the race last year
When it was raining
I first clobbered a Ford Mustang
When I made an overambitious pass
On a damp part of the track
And couldn't stop in time
And then
Felt absolutely awful
As I sat in the gravel pit for two laps
And knew that our race was over
A race where we were highly competitive
You're not blessed with a competitive car
A competitive team and competitive setup every year
I know how rare that is
So to know that we had had a chance that year
And I sort of squandered it
Felt really bad
But that got compounded
I got back on track
Barely made it another stint
And then put it in the gravel
Trapped again when it started raining
On the entrance into Porsche
So
This is part of why racing is so
Addicting too
Because the highs are very very high
When you win a race
Like the twenty-farris of Le Mans
It feels just incredible
There's so much emotion
But if you fuck it up
The lows are very very low
What are the things you're paying attention to when you're driving
What's what what is the what are the parameters
What are you loading in
Are you
Feeling
The grip
Are you basically increasing the speed
And seeing what like a constant feedback system
Effect that has on the grip
You're trying to
Manage that and try to find that optimal slip angle
Are you looking around using your eyes
Are you smelling things
Are you listening is feeling the wind
Are you
Are you all looking at the field too
Like how did you not hit that guy at all
You get close with the niches
Right so you have to pay attention to that too
It's really interesting about that specific battle
Where we're literally a few inches apart
I can't fully explain it
But humans can develop an incredible sense of space
Where I can't see the edge of the back of my car
But I can know exactly where it is
I can have a mental model in my head
That gives me the exact dimensions of this car
So that I can run within a few inches of a competitive car
Or within a few inches of the wall
And not hit either
When things go well
The car is about two meters wide
And it's quite long
Five meters
And you can't see everything
The mirrors are actually kind of shit
There's no rear view mirror in these cars
You can't see out the back
You can only see through your two side mirrors
But you form this intuitive mental model
When you get good enough at this
But what I actually pay attention to most
Is I run a program
What I try to do when I go to a racetrack
Is I try to load up the best program I know how
For every single corner
What's my break point
What's my acceleration point
What's my break trailing curve
And I try to pick up that program in part
Just by finding it myself
And how fast I can go
But even more so than that
By copying my professional competitors
Or not competitors
Code drivers
So I usually always race with a pro
And modern race cars produce an absolute enormous amount of data
And you can analyze all that data after each outing
You can see an exact trace
Of how much you pushed the brake pedal
How much you did in terms of steering inputs
When you got on the gas
You can see every millisecond
You're losing is evident in those charts
So what I try to do is I try to look at the chart
And then I try to load that in
And like that's what I got to do
Oh in this corner 17
I actually I have to be
10 bar lighter on the brake
So I try to load that program in
And then I try to repeat it
Now then there are all the things that changes
Your tires change quite a lot
These tires are made to only last
40 minutes in many cases
Sometimes at Le Mans we can go longer
But at some race tracks they last a little of 40 minutes
Before they really fall off
So you got to manage that
That the grip is constantly changing
So your program have to suddenly fit those changing circumstances
And then in endurance racing
You're constantly interacting with other cars
Because you're passing slower classes
Or you're getting passed by a faster class
So that's part of the equation
And then you're trying to dance the car around the limit of adhesion
So you got all those factors playing at the same time
But above all else for me
Is to try to become a robot
Like how can I repeat this set of steps
Exactly as I'm supposed to
For two and a half hours straight without making
100 milliseconds worth of mistakes
Yeah low latency algorithm
That's really a huge part of it actually
Your latency is enormously important
In terms of being able to catch
When the car starts slipping
You get this sensation in your body
That the G-forces are a little off
The slip angle is a little off
And then you have to counter steer
And obviously the best race car drivers
Just feel like an intuition
I have some intuition
I don't have all of it
So I do occasionally spend my car
But that's the challenge
From everything you've studied and understand
What does it take to achieve mastery in racing
Like what does it take to become the best race car driver in the world
Obsession is part of it
When I read and hear about Senna
And the other greats
They were just singularly focused
Max bestapin is the current champion of the world
And he is the same kind
Max has been fascinating to watch
I mean he's a phenomenal race car driver
But he also literally does nothing else
When he's not at the racetrack
He's driving sim racing
Like he's literally in video games
Doing more racing
When he's not doing all the racing
He's already doing
Is there a specific skill that
Have that like stands out to you as supernatural
Through all that obsession
Like what
Is it a bunch of factors
Or are they actually able to
Like you said develop a sense
Is it they're able to get to the very edge of the slip
They're able to develop
Very fine tune sensibilities for when the car is sliding
They can feel just these tiny moments
Or movements in the chassis
That transports up usually through their ass
That's why you call this like a a button meter
That goes up and you feel like the car is loose
Or you feel like you're just about to lock up
You can really hone that tuning
Then the other thing is you have to have really good reaction time
And when you look at great Formula One drivers
They can generally have a reaction time
Just under 200 milliseconds
Which is awesome
And even 10 milliseconds
Difference makes a huge difference
You'll see it when the Formula One grit for example
They do a standing start
And you see the five red lights come on
And when the last light goes out
They're supposed to release the clutch and get going
And they can time this
So you can see exactly who has the reaction time
And even being off by 20 milliseconds
Can make the difference of whether you're in front or behind
At the first corner
How much of winning is also just this
Strategy of jocling for position
There's some of that
And some of it is also just nerve
Who wants it more
That's exactly when that sense of danger comes in
There's a great quote from Fernando Alonso
When he was driving at Sasuka
Against Shumaka I think
They're coming up to this incredibly fast corner
It's very dangerous
And Alonso basically accounts
I was going to make the pass
Because I knew he had a wife and kid
Said homey
That's so gay
Just absolutely
I knew he valued life more than I did
So there's a bit of poker
Sometimes in that
Who's going to yield
There's a bit of chicken race in that regard
And sometimes it doesn't work
No one yields and you both crash
But very often one person will blink first
Can the pass be both on the inside and the outside
Or is he...
You can pass wherever you want
As long as you have
Just a slight part of the car on the racetrack
And then you just improvise and take risks
What a sport
And then Sam of course is like
The legendary risk taker
Yes
And even before him
By the time...
I mean he died
In the 90s
But by the time we got to the 90s
Racing was already a lot safer than it was
When Nikolau raised in the 60s
That level of danger is no longer there
There's still just a remnant of it
And it is still dangerous
But nothing like that
And it's a little hard to compare
Through the ages like who's the greatest driver of all time
I think there's a fair argument that Senna is
But we don't have the data
We don't know who he was up against
Like how would he fare
We pitted him against Max Verstappen today
I do think sometimes that
You can have a bit of nostalgia for the all-time greats
But the world moves forward
And new records are being set all the time
And the professionalism keeps improving
Sometimes to the detriment of the sport
I think there's a lot of professional drivers
Who are not only just very good at driving
But are very good at being corporate spokesperson
And it used to be quite different
There used to be more characters in racing
That had a bit more personality
That they were allowed to shine
Because there weren't a billion sponsorships on the line
That they were afraid to lose
Ridiculous question
What's the greatest car I've ever made
Or maybe what's the funnest one to drive
The greatest car for me of all time is the Pagani Sonda
Okay, I'm looking this up
Pagani Sonda
So the Pagani Sonda
Was made by this wonderful Argentinian
Called Horacio Pagani
Like that's a beautiful car
Well
It's a gorgeous car
You can look up mine
It's the Pagani Sonda HH
Yep
So
That's um
A car I had made in 2010
After we visited the factory in Marna
And by sheer accident ended up with
This car
But it became my favorite car in the world basically
When I watched an episode of Top Gear
I think in 2005
Where one of the presenters was driving the Pagani Sonda F
Around and I just thought
That's the most beautiful car in the world
It is the most incredibly sounding car in the world
If I one day
Have the option
This is what I want
And then I have the option
In 2010
I've had the car ever since
I'm never ever going to sell it
It's truly a masterpiece that stood this test of time
There's some great cars from history
That are recognized as being great in their time
This car is still great
Have you taken it on the racetrack?
I have
It's terrible at that
But I want to say it's terrible at that
That's not what it's designed for
It's designed for the road
And that's why it's great
There are a lot of fast cars
That are straddling
They're race car for the road
You don't actually want a race car for the world
A race car for the world is the pain in the ass
It's way too stiff
It's way too loud
It's way too uncomfortable
You can't actually take it on a road trip
So this actually feels good driving
Oh totally
Totally
And you of course always go to speed limit
Always
This is why I love having this car in Spain
Because they're a little more relaxed
Not entirely relaxed
But more relaxed than they are in a lot of places
In Denmark
I kid you not
If you are on the highway
And you go more than twice the speed limit
They confiscate your car and keep it
You're not getting it back
They don't even care if it's your car or not
Like if you were boring my car
And you went twice the speed limit
It's gone
So they don't do that in Spain
I mean they
In most places except for the German Autobahn
They get pissy
If you go twice the speed limit
For all sorts of fair reasons
They're not advocating that you should be going
Much more than that
But there are certain special roads
Where you can't open things up
No one's in harm's way
And that's an incredible sensation
And I do think that some of those speed limits
Actually are kind of silly
And I'm not just saying that in a vacuum
In Germany
They have the glorious Autobahn
And on the Autobahn
There is no speed limit
In a bunch of segments
And they're so committed
To their speed limitless Autobahn
Which is by the way very weird
Of Germans
They usually love rules
They usually very precise about
And then they have this glorious thing called the Autobahn
There was a great case
A couple of years ago
Where a guy took out a Bugatti
Shiran
When 400 kilometers an hour
On the Autobahn
And he filled it
And put it on YouTube
And a case was brought against him
Because even though they don't have a speed limit
They do have rules
And you can't drive recklessly
And he won the case
He wasn't driving recklessly
He was just going very
Very fast
I've done the Autobahn a couple of times
My wife and I went on a road trip in Europe in 2009
And I got the Lamborghini Guiada
We were driving up to 200 miles an hour
And I'd driven 200 miles an hour
Or close to it on a racetrack
Before that feels like one thing
Driving on a public road
200 miles an hour feels really really fast
Scary
Actually a little scary yes
Because you constantly think like
On a racetrack
You know the road
You know the surface
You can walk the track
And most of the time
You can know if there's a dip
On a public road
You can't know if there's suddenly a pothole
Soon believe there's not going to be a pothole
On the German Autobahn
But it does feel a little scary
But also exhilarating
Speed is just
Intrinsically really fun
I don't know anyone I've taken out in a fast car
Well actually I do know a few people
Most people that take out in a fast car
They grin
Just it's a human reaction to grin
When you go really fast
Do you know what the fastest you've ever gone
That's probably at Le Mans
I think when the LNP2s
Were at their maximum power
And had 600 horsepower
And really sticky tires
We were going 340 kilometers now
Which is just over
200 miles an hour
A bit over 200 miles an hour
That's
That does feel fast
And it's really interesting with speed
Is that the difference between
Going let's say 150 and 160
Doesn't feel that much
Actually those 10
Mild and hour
But the difference between going 190
And 200 feels
Crazy faster
Which as a percentage change is actually
Last than going from
150 to 160
But there's some sense of
Exponentiality
Once you get up to those limits
Where it's just on a complete different level
Yeah because to me like 110
120 feels fast
200
That's
That's crazy
It really is crazy
I got to ask you about the
The details of your programming setup
The IDE
All that kind of stuff
Let's paint the picture of the perfect
Programming setup
Do you have a
Programming setup that you enjoy
Or are you very flexible
Like how many monitors
What kind of keyboard
What kind of chair
What kind of
Desk
It's funny because if you'd ask me
Let's see a year and a half ago
I would have given you the same answer
As I would given anyone for basically 20 years
I want to Mac
I like the
Magic keyboard
I like the
Single monitor
Apple makes an
Awesome 6K 32 inch
XDR screen that I've still haven't found anyone who beaten
That I still use
Even though I switched away from
Apple computers
I still use their monitor because it's just
Fantastic
But I've always been a single screen kind of guy
I do like a big screen
But I don't want multiple screens
I've never found that that really works with my
Perception
I want to be able to just focus on a single thing
I don't want all of it all over the place
And I've always used multiple virtual desktops
And be able to switch back and forth between those things
But the setup I have today
Is
Linux
I switched to a little over a year ago
After I finally got fed up with Apple enough
That I couldn't do that anymore
And then I use
This low profile mechanical keyboard
Called the low free
Flow
84
Which is just the most glorious sounding keyboard
I've ever heard
I know there are a lot of connoisseurs of mechanical keyboards
They'll probably contest me on this
This is too talky or too clicky or too clacky or
Whatever but for me
The low free flow
84 is just
At the light
That I did not even know existed
Which is so funny because
I mean I've been programming for a long time
Mechanical keyboards have been a thing
For a long time
And to keep what when you look at it like this
It just kind of
It looks plain
It doesn't look extravagant
But
The tactile sensation you get out of
Pushing those keys
The
The talky sound
That you hear when the keys hit the board
It's just sublime
And I'm kicking myself
That I was in this
Mac
Bubble
For so long
That I wasn't even in the market
To find this
I didn't
I knew mechanical keyboards existed
But to be blunt
I thought it was a bit of a nerd thing
That only
Real nerds that were much more nerdy than me
Whatever care about
And then I got out of the Apple bubble
And suddenly I had to find everything again
I had to find a new mouse
I had to find a new keyboard
I had to find everything
And I thought like all right
Let me give mechanical keyboards a try
And I gave quite a few of them a try
The keycron is one of the big brands
And that I didn't like that at all
I tried a bunch of other keyboards
And then I finally found this keyboard
And I just went like
Angels of singing
Where have you been my whole life
We spent as programmers
So much of our time
Interacting with those keys
It really kind of matters
In a way I didn't fully appreciate
I used to
Defend
At the Apple
Magic keyboard
Like it's great
It's actually a great keyboard
And I think from what it is
This ultra low
Profile ultra low travel
It's actually a really nice keyboard
But once you tried
A longer travel
Mechanical keyboard
There's no going back
You do have to remember
In many ways
Both on the software side
And the hardware side
That you do spend a lot of hours
Yes
Behind the computer
It's worth
It's worth investing in
And also worth exploring
Until you find the thing
Where the angels start singing
Whatever
That's exactly right
And I actually do regret that a little bit
Especially with this damn keyboard
I think I could have been listening
To these beautiful
Falky keys
For years and years
But sometimes
You have to get really pissed off
Because you open your eyes
And see that something else exists
I feel the same way about Linux
So I've been using Linux
On the server
Since
Late 90s
Probably if we ran servers on Linux
Back then
I never seriously considered it as a desktop option
I never ran Linux before
Directly myself
I always thought
Do you know what
I just
I want to focus on programming
I don't have time for all these configuration files
And all this setup bullshit
And what not
And Apple is close enough
It's built on Unix
Undependence
Why do I need to bother with Linux
And again it was one of those things
I needed to
Try new things
And try something else to
Realize that there is other things other than Apple
And again it's not because I hate Apple
I think they still make good computers
I think a lot of the software
Is still also pretty okay
But I have come to realize
As a web developer
Linux is just better
Yeah
Linux is just better
It's closer to
What I deploy on
The tooling is actually phenomenal
And if you spend a bit of time setting it up
You can record
A reproducible environment
That I've now done
With this Omacube
Concept
Or a project that I've done
That I can set up a new Linux machine
In less than 30 minutes
And it's perfect
It's not pretty good
It's not like I still need to spend two hours on
It's perfect
Because you can code all aspects of
The development environment
Into this
And I didn't know
I didn't even know
To be fair
That Linux could look as good as it can
If you look at a stock of Ubuntu
Or Fedora boot
I mean
Not that it's ugly
But I'd pick the Mac in the day of the week
You look at a
You look at Omacube
I mean I'm biased here
Of course because I built it with my own sensibilities
But I look at that and go like
This is
Better
This is beautiful
And then you look at some of those true Linux
Ricing setups
Where people go nuts with everything
And you go
Oh yeah
I remember when computers used to be fun in this way
When there was this individuality
And this setup
And it wasn't just all bland
The sameness
And I think that's the flip side
Sometimes of something like Apple
Where they have really strong opinions
And they have really good opinions
And they have very good taste
And it looks very nice
And it also looks totally the same
And Linux has far more variety
And far more texture and flavor
Sometimes also annoyances
And bugs and whatever
But I run Linux now
It's a Ubuntu base
With the Omacube stuff on top
The low-freak keyboard
I use a
Latchetek
What's it called
The MS3 mouse
Which I love how it feels in my hand
I don't love how it looks
I actually
Was a
Magic mouse
Stan
For the longest time
I thought it was genius
That Apple integrated the trackpad
Into a mouse
And I used that
And I always thought it was
Ridiculous that people would slag it
Just because you had to charge it
By flipping it over
Because the battery would last for three months
And then you charge it for half an hour
I felt like
That was a perfect
Compatibility with my sensibilities
I don't mind giving up a little
Inconvenience
If something is beautiful
And that magic mouse is beautiful
But
Wasn't going to work on Linux
So I found something else
The MS3 is nice
But it sometimes do wish
Like the magic mouse
Is pretty good
Yeah, Linux is really great
For customizing everything
For tiling
For macos
For all of that
I also do the same in Windows
With auto-hockey
Or just customize the whole thing
To your preferences
If you're a developer
You should learn
How to control your environment with the keyboard
It's just
It's faster
It's more fluid
I think
One of those silly things
I've come to truly appreciate
About my
Omicoup setup
Is that I can
In
Whatever time it takes to refresh the screen
Probably five milliseconds
Switch from one virtual desktop to another
Even
On Windows
Can't get that smooth
Get close
Can't get that smooth
On macOS
For whatever reason
Apple insists on having this
Infuriating animation
When you switch between virtual desktops
Which makes it system you don't want to
You don't want to run full screen apps
Because it's too cumbersome
To switch between the virtual desktops
The kind of
Immediately that you can get
From
A wonderful Linux setup
In that regard it's just next level
Yeah and it seems like a subtle thing
But you know
A difference of
Millie seconds
And latency
Between switching
The virtual desktops for example
I don't know it changes
It changes how you use the computer
It really does
Similar thing with VR right
There if there's some kind of latency
Or
Like it just completely takes you out of it
And it's funny
I actually had to watch
I think it was the
Primogen on YouTube
When he was showing off his setup
And I was seeing how quickly he was switching between those virtual desktops
And I'd always been using virtual desktops
But I didn't like switching too much
Because just of that latency
And it's like
Oh you can do that on Linux
Oh that's pretty cool
So I run that
And then my editor of choice now is
NeoVem
Oh good
All right well we're out of time
All right you did for many many years
You used what does it text me
Yes
Text mate
That was actually
That was the main block of moving away from Apple
Everything else I thought
You know what I can swing it
But text mate was
And is a wonderful editor
One I helped birth into this world
The programmer Alan Ugo
Is a good friend of mine
All the way back from those
The party days
When we were lugging our computers around
And he was a big Mac guy
And in
In 2005 he was writing this editor
And I helped him
With the project management
Of kind of keeping him on track
He was only focused on getting something released
Because I really wanted it for myself
And I thought this was the last editor
I thought I was never going to switch
Forgive me for not knowing
But how
Featureful is this editor?
It's quite featureful
But it's
A gooey driven editor in some regards
It was really early on
With ways of recording macros
And having
Sort of sophisticated syntax highlighting
And it did a bunch of first
And it was just a really pleasant editing experience
I think these days
A lot of people would just use VS code
VS codes exist in the same universe
As text mate in some ways
And actually I think it's compatible
With the original text mate bundles
The original text mate format
So it really trailed a path there
But it also just
Didn't evolve
Now a lot of people saw a huge problem with that
They were like oh it needs to have more features
And you have all these things
I was like I'm happy with this text editor
That hasn't changed that all
Basically when Alan stopped working on it
For a decade or more
I don't need anything else
Because as our original discussion went
I don't want an ID
I don't want the editor to write code for me
I want a text editor
I want to interact with characters
Directly
And NeoVim allows me to do that
In some ways that are even better than text mate
And I love text mate
But BI as you know
Once you learn the commands
And it sounds
I sometimes feel like BI fans overplay
How difficult it is to learn
Because it makes them perhaps seem kind of
More awesome that they were able to do it
It's not that difficult
And it doesn't take that long in my opinion
To learn just enough combo moves
To get that high of holy shit
I could not do this in any other edit
How long did it take you
And by the way I don't know
I'm still a haven yet
Or I know intellectually
But just like with kids I haven't
I haven't gone in
All the way and I haven't used them
You have a treat in mind
Well I switched in about
I had three days when I switched here
About a year ago
I had three days of cursing
Where I thought it was absolutely terrible
And it was never going to happen
And I had three days of annoyance
And already the next week
I was like this is sweet
I'm not going anywhere
Oh well
But I also had a bit of a head start
About 20 years ago in the early 2000s
I tried them for like a summer
And it didn't stick
I didn't for whatever reason love it at the time
But NeoVim is really good
The key to NeoVim
Is to realize that you don't have to build
The whole damn editor yourself
So a lot of NeoVim stands
They're like here's how to write the
Config from scratch
Over 17 episodes
That's going to take you three weeks
I don't care that much
I love a great editor
I love to tailor it a little bit
But not that much
So you have to pair
NeoVim
With this thing called LazyVim
LazyVim.org
Is a distribution
For NeoVim
That takes all the drudgery
Out of getting an amazing editor
Experience right out of the box
Ridiculous question
We talked about a bunch of programming languages
You told us how much you love JavaScript
It's your second favorite programming language
With TypeScript be the third
Then
TypeScript
Wouldn't even be in this universe
I hate TypeScript as much as I like JavaScript
So what
You hate
Oh man, I'm not smart enough to understand the math of that
Okay
Before I ask about other programming languages
What's
If you can encapsulate
Your hatred of TypeScript
Into something that could be human interpretable
What would be the reasoning
The JavaScript
Smiles a lot like Ruby
When it comes to
Some aspects of its meta programming
And TypeScript just complicates that
To an infuriating degree
When you're trying to write that kind of code
And even when you're trying to write the normal kind of code
None of the benefits that accrue to people who like it
Like auto completion
Is something I care about
I don't care about auto completion
Because I'm not using an IDE
Now I understand
That that is part of what separates it
And why
I don't see the benefits
I only see the costs
I see the extra typing
I see the
Type gymnastics that you sometimes have to do
And were a bunch of people give up
And just do any
Instead, right?
Like that they don't actually use the type system
Because it's just too frustrating to use
So
I've ever only felt the frustration of TypeScript
And the obfuscation of TypeScript
In the code
That
Gave me no payoff
Again, I understand that there is a payoff
I don't want the payoff
So for my situation
I'm not willing to make the trade
And I'm not willing to take
A language that's underneath
Is as dynamic
Of a language as rubious
And then turn it into this
Pretend static type language
I find that just
Intellectually insulting
Do you think it will
And do you think it should die
TypeScript
I don't want to take something away from people who enjoy it
So if you like TypeScript
All the most part of you
If you're using TypeScript
Because you think that's what a professional program is supposed to do
Here's my permission
You don't have to use TypeScript
There's something deeply enjoyable about
A brilliant program
Or such as yourself
DHH talking shit
It's just like one of my favorite things in life
What are the top three programming languages
Everyone should learn
If you're talking about beginner
I would 100% start with Ruby
It is magic for beginners
In terms of just understanding the core concepts
Of conditionals and loops
And whatever
Because it makes it so easy
Even if you're just making a
Shell program that's
Outputing to the terminal
Getting hello world running
In Ruby is basically
Puts
P-U-T-S
Space
Start quotes
Hello world and quotes you've done
Right, there's no fluff
There's nothing to wrap it into
There are other languages that does that
Especially in the
Pearl or Python would be
Rather similar
But go would not
Java would not
There's a lot of other languages
That have a lot more ceremony
And boilerplate Ruby has none of it
So it's a wonderful
Starting language
There's a book called
Learned to program
By
Pine
That uses Ruby
Essentially to just teach basic programming
Principles
That I've seen heavily
Recommended
So that's a great language
How quickly would you go to Rails
It depends on what you want to do
If you want to build web applications
Go to Rails right away
Learn Ruby along with Rails
Because
I think what really helps
Power through learning programming
Is to build programs that you want
Right, if you're just learning it in the abstract
It's difficult to motivate yourself to actually do it
While some people
Learn languages just for the fun of them
Most people do not
Most people learn it because they have a mission
They want to build a program
They want to become a programmer
So you got to use it for something real
And actually find it's easier to learn programming that way too
Because it drives your learning process
You can't just learn the whole thing up front
You can't just sit down and read the language specification
Then you're like
Like Neo
Now I know Kung Fu
Now I know Ruby
It doesn't download that way
You actually have to type it out
In anger
On a real program
Yeah
Yeah
For sure
So I would start there
But then number two
I probably would be JavaScript
Because JavaScript just is language
You need to know
If you want to work with the web
And the web is the greatest
Application platform of all time
If you're making
Business software
Collaboration software
All this kind of stuff
If you're making video games
You should probably go off
Learn C++ or C
Or something else like that
But if you're in the realm of web applications
You got to learn JavaScript
Regardless of what else you learn
You got to learn JavaScript
So if you're learning Ruby
What does Ruby not have
In terms of programming concepts
That you would need other languages for
I don't know if there's any concepts missing
But it doesn't have the speed
Or the low level access
Memory manipulation
That you would need to build
A 3D gaming engine
For example
No one's going to build that in Ruby
You can build
Quite low level stuff
When it comes to web technologies
In Ruby
But at some point
You're going to hit the limit
And you should do something else
I'm not someone who prescribed
Just Ruby for everything
Just once you reach the level of abstraction
That's involved with web applications
Ruby is superb
But if you're writing for example
HTTP proxy
Go
It's great for that
We've written quite a few HTTP proxies lately
At the company for various reasons
Including our cloud exit and so forth
And Kevin
One of the programs I'm working with
He writes all of that and go
Go just have the primitives
And it has the pace and the speed
To do that really well
I highly recommend it
If you're writing an HTTP general proxy
Do it and go
Great language for that
Don't write your business logic
I know people do
But I don't see the point in that
So what would you say they're three
So go Ruby
Plus Rails
JavaScript
Yeah if you're
Will or interested in working with the web
I'd probably pick those three
Go Ruby and JavaScript
Go Ruby and JavaScript
Okay
Functional languages
Someone's talking about OCaml
There's always
They are always going to show up
They're always
It must be some kind of
OCaml industrial complex
Or something like this
But they always say mention OCaml
I love that there are people
Love functional languages to that degree
Those people are not me
I don't care at all
I care about functional
Principles when they help me
In these isolated cases
Where that's just better than everything else
But at heart
I'm an object-oriented guy
That's just how I think about programs
That's how I like to think about programs
That's how I carve up
A big problem space
Into a domain language
Objects are my jam
Yeah, me too
So I program a list per bunch
For like AI applications
For basic
So I'll tell OHS engines
That kind of stuff
And I just try OCaml
Just to force myself
To program just a very basic game of life
A little simulation
It's much
You know, a list
Is just parentheses everywhere
It's actually not readable at all
That's my path with a list
OCaml is very intuitive
Very readable
That's nice
I really should pick up a language like that at some point
I've been programming long enough
That it's a little embarrassing
That I haven't actually
Done anything real and anger
In a fully functionally programming language
Yeah, but like I have to figure out
I'm sure there's an answer to this
What can I do though be useful for me
Like that I actually want to build
Yes
That's my problem
That a functional language is better suited for
That's right
Because I really want to experience the language properly
That's right
Yeah, because I'm still
Yeah, I'm very at this point
A very object oriented
Brained
Yes
And that's my problem too
I just
I don't care as much about these low-level problems
In computer science
I care about the high level
I care about writing software
I care about the
abstraction layer
That really floats well
With web applications and business logic
And I just
I've come to accept that about myself
Even though
As we talked about
When I was a kid
I really wanted to become a games programmer
And then I saw what it took
To write a collision detection engine
And I go like, yeah, that's not me at all
I'm never going to be into
vector matrix
manipulation
Or any of that stuff
It's way too much math
And I'm more of a writing person
Than I'm a math person
I mean, you're just in the way you were speaking today
You have like a
poetic literary
Approached
Programming
Yes
Yeah, that's exactly right
So I did actually
A keynote at RailsConf 10 years ago
Where I call myself a software writer
I mean, I'm not the first person to say that
Software writer has been in the vernacular for a long time
But the modern
Identity that most programmers adopt
When they're trying to be serious
Is software engineer
And I reject that label
I'm not an engineer
Occasionally I dabble in some engineering
But the vast majority of the time
I'm a software writer
I write software
For human consumption
And for my own delight
I can get away with that
Because I'm working in a high level language like Ruby
Working on collaboration software
And to do lists and all the other stuff
Again, if I was trying to apply
My talent to writing 3D game engines
No, that's not the right mindset
That's not the right identity
But I find that the software engineering
Identity flattens thing a little bit
I'd like to think that we have software writers
And software mathematicians
For example
And then those are actually richer
Ways of describing the abstraction level
That you're working at
Than engineer
Yeah, and I think
If AI becomes more and more successful
I think we'll need software writer skill
More and more
Because it feels like that's the realm of which
Because it's not writer
You're going to have to do the software
You're going to have to be a computer person
But there's a more
I don't know
I just don't want to romanticize it
But it's more poetic
It's more literary
It's more feels like writing it
A good blog post than
I actually wish that AI
Had a bit higher standards for writing
I find the fact that it accepts my
Slobby incomplete sentences
A little offensive
I wish there was like a strict mode for AI
Where it would snap my fingers
It was just feeding in keywords
And like, speak proper
Do pronunciation
Do punctuation
Because I love that
I love crafting
At just write sentence
That hasn't been boiled down
That it has no meat on it
Has no character in it
It's succinct
It's not overly flowery
It's just write that
Writing phase
To me
Is just addictive
And I find that
When programming is the best
It's almost equivalent
Exactly to that
You also have to solve a problem
You're not just communicating a solution
You have to actually figure out
What are you trying to say
But
Even writing has that
Half the time when I start
Writing a blog post
I don't know exactly which arguments I'm going to use
They develop as part of the writing process
And that's how writing software
Happens to you
Know roughly the kind of problem you're trying to solve
You know exactly how you're going to solve it
And actually start typing
The solution emerges
Actually as far as I understand
You're in Jason working on a new book
It's in the early days of that kind of topic
I think he said is some
He tweeted that it's going to be titled
Something like
We don't know what we're doing
Up front or something
That that kind of topic
And you figure out along the way
That's a big part of it
Trying to give more people the permission
To trust during instincts in their own gut
And realizing that
Developing
That supercomputer in your stomach
Is actually the work of a career
And that you should not discard
Those feelings in
Preference to over
Com- or not even complicated
To analytics
To intellectualism
Very often when we look at the
Big decisions we've had to make
They've come from the gut
Where you cannot fully articulate
Like why do I think this is the right thing
Well because I've been in this business for 20 years
And I've seen a bunch of things
And I've talked up to a bunch of people
And that is percolating into this being the right answer
A lot of people
Are very skeptical about that in business
Or unable to trust it
Because it feels like they can't rationalize
Why are we doing something
Well because I feel like it
Damn it
That's a great privilege of being
A bootstrapped independent founder
Who don't oh their business to someone else
And doesn't have to produce a return
Because I feel like a lot of the bullshit
Really creeps in when you're trying to rationalize
To other people
Why you do the things you do
And why you take the decisions that you do
If you don't have anyone to answer to
You are free to follow your gut
And
That's
Hell of enjoyable way to work
And it's also
In very often the correct way to work
Your gut knows a lot
Like you can't articulate it
But it's spot on
More times than not
Having to make a plan can't be a paralyzing thing
I've often
I mean I suppose there's different kinds of brain
The first of all
I can't wait to read that book
If it materializes
They I often feel like
In the more
In the more interesting things I do in my life
I really don't know what I'm doing up
Up front
And I think there's a lot of people around me
I care for me
They really want me to know what I'm doing
They're like what's the plan
What's the why are you doing this crazy thing
And I if I if I had to wait until I have a plan
I'm not going to do it
Like people they have different brains
On this kind of stuff
Some people really are planners
And it maybe energizes them
I think most creative pursuits
Most really interesting
Most novel pursuits are like
Kind of have to just take the leap
And then just figure out as you go
My favorite essay in rework
Is the last one
And it's entitled Inspiration is Perishable
And I think that captures a lot of it
That if you take the time
To do a detailed plan
You may very well have lost the inspiration
By the time you're done
If you follow the inspiration
In that moment
And trust your gut
Trust your own competence
That you will figure it out
You're going to get so much more back
You're going to go on the adventure
You otherwise wouldn't have
Whether that's just a business decision
Or a life decision
You have to seize that inspiration
There's a great set of children's books
Written by this Japanese author
About chasing an idea
And trying to get a hold of it
And it's beautifully illustrated
As an idea
Something that's floating around
As something you have to catch
And latch onto
That I really feel
Catchers this notion that
Inspiration is perishable
It'll disappear
If you just put it back on the shelf
And say like
Well, I got to be diligent about this
I got to line up a plan
You may run out
And then there's no
There's no steam to keep going
I have to ask about open source
What does it take
To run a successful open source project
You've spoken about
That it's a misconception
That open source is democratic
It's actually meritocratic
That's a beautiful way to put it
So there's often is a kind of
A benevolent dictator at the top
Often
So can you just speak to that
Having run a successful open source
Projects yourself
And being a benevolent dictator yourself
Which is going to be a bit of a
Bias piece of evidence here
But
Why is it just great
You should definitely have dictators
And they should control everything
Especially when the dictators meet
Now, well
I think I learned very early on
That a quick way to burn out
In open source is to treat it
As
A business
As though your users are customers
As though they have claims
Of legitimacy on your time
And your attention
And your direction
Because I faced this
Almost immediately
With Ruby and Rails
As soon as it was released
There were a million people
Who had all sorts of opinions
About where I ought to take it
And not just opinions
But actually demands
Unless you implement
An oracle database adapt
This is always going to be a toy
It was actually more or less that exact
Demand
That prompted me to have a slide
At one of the early
Rails conferences
That just said
Fuck you
Yeah, I saw that
I'm not going to do what you tell me to
I'm here as a bringer of gift
I am sharing
Code that I wrote
On my own time
On my own volition
And you don't have to say thank you
I mean be nice if you did
You can take the code and do whatever you want with it
You can contribute back if you want
But you can't tell me what to do
Or where to go or how to act
I'm not a vendor
This is a fundamental misconception
That uses of open source occasionally
Step into it because they're used to buying software
From companies who really care about
Their business
I care about people using my software
I think it's great
But we don't have a transactional
Relationship
I don't get something back
When you tell me what to do
Except grief
And I don't want it
So you can keep it
So my open source philosophy from the start has been
I got to do this
Primarily for me
I love when other people
Find use in my open source
It's not my primary motivation
I'm not primarily doing it for other people
I'm primarily doing it for me
And my own objectives
Because um
As Adam Smith said
It's not for the benevolence of the butcher
That we expect our daily meat
It's for his self-interest
And I actually find that to be a beautiful thought
That our comments increase in value
When we all pursue our self-interest
Certainly in the realm of open source
This is also why I reject this notion
That open sources in some sort of crisis
That there's a funding crisis
That we have to spend more
No you we don't
Open source has never been doing better
Open source has never controlled more domains in software
Than it has right now
There is no crisis
There's a misconception
From some people making open source
And from a lot of people using open source
That open source is primarily like commercial software
Something you buy
And something
Where you can then make demands
As a customer
And that the customer is always right
Customers not always right
Not even in business
But certainly not in open source
In open source the customer as it is
Is a receiver of gifts
We are having a gift exchange
I show up and give you my code
If you like it you can use it
And if you have some code that fits in
With where I'm going with this
I would love to get those gifts back
And we can keep trading like that
I give you more gifts
You give me some of your gifts
Together we pull all the gifts
That's that someone showing a brand new
Just get a mountain of gifts
This is the magic thing of open source
Increases the total some value of what's in the comments
When we all pursue our own self-interest
So I'm building things for rails that I need
And you know what?
You want me to do that
You do not want me to build things
That I don't need on behalf of other people
Because I'll do a crap job
I do
I build much better software
When I can evaluate the quality of that software
By my own use
I have to
I need this feature
I'm going to build a good version of that feature
And I'm going to be just enough just for me
So I'm not going to blow it
I'm not trying to attract the customer here
I'm not trying to see some angle
I'm just building what I need
And if you go into open source with that mentality
That you're building for you
And everything else is a bonus
I think
You have all the ingredients to go to distance
I think the people who burn out in open source
Is when they go in thinking
I'm making all these gifts
I don't really need them myself
But I'm like hoping someone else does
And maybe they'll also give me some money
That's a losing proposition
It never basically works
If you want money for your software
You should just sell it
We have a perfectly fine model
Of commercial software
That people can make that kind
And then they can sell it
But I find a lot of
Confusion
Let's just call that politely
In open source contributors
Who want to have their cake need to
They like the
Mode of working with open source
They maybe even like the status
That comes from open source
But they also would like to earn a living
For making that open source
And therefore they
Occasionally end up with the kind of
Grievances
That someone who feels under-appreciated
Or work will develop
When others aren't doing enough to recognize their great gifts
And then they might walk away
I wish I had one of the
I wish I had more insight into their mind state
Of the individual
People that are running these projects
Like if they're feeling sad
Or they need more money
Or they're
It's just such a dark box
It can be
I mean of course there's some communication
But I just
I just sadly see too often
They just kind of walk away
Right
And I think
That's actually
So part of the beauty of open source
This one
You are not obligated to do this code
Forever
You're obligated to do this
For as long as you want to do it
That's basically your own obligation
But there is
I know
Okay, so you might criticize this and push back
You did write a blog post on forever
Until the end of the internet with $10
There is a beautiful aspect
And you found a good balance there
But I don't know
You're bringing so much joy to people with this thing you created
It's not an obligation
But there's a real beauty
To taking care of this thing you've created
There is
And not forgetting
I think we
I think what the open source creator is not seeing enough
I mean there's like
How many lives you're making better
There's certain pieces of software
That I just quietly use a lot
Yes
And like they bring my life joy
And I wish I could communicate that well
There's ways to donate
But it's inefficient
It's usually hard to donate
It is
There's some ways
For some people that made it easier
Get up donations
This one way of doing it
I donate to a few people
Even though
I don't
Love the paradigm
I also accept that we can have multiple paradigms
I can accept that I can do open source from one set of motivations
And other people can do
Open source for other motivations
We don't all have to do it the same way
But I do want to counter the misconception
That open source is somehow in its crisis
Unless we all start paying for open source
That model already exists
It's commercial software
It works very well
And plenty of great companies have been built off the back of it
And the expectations are very clear
I pay you this amount
And I get this software
Open source once you start mixing money into it
Gets real money real fast
And a lot of it is just
From those misaligned expectations
That if you feel like
You're starving artists
As an open source developer
And you are owed
X amount of money
Because your software is popular
You're delusional
And you need to knock that off
Just get back on track
Where you realize that you're putting gifts into the world
If you get something back in terms of monetary competition
Okay, that's a bonus
But if you need that money back
In terms of monetary competition
Just charge for software
Or go work for a software company
That will employ you to open
Do open source
There's tons of that
That is probably actually
The primary mode
That open source software
Is being developed in the world today
Commercial companies
Making open source
That they need themselves
And then contributing it back
So I'm glad you brought
Sort of like drew some hard lines here
It's a good moment to bring up
What I think is
The
Maybe one of the greatest open source projects ever
WordPress
And
You spoke up in October
24
About some of the stuff that's been going on
With the WordPress's founder
Matt Molllewig
In a blog post
Open source royalty and mad kings
It's a really good blog post
Sort of just the idea of
Benevolent dictated for life
This model for open source projects
And then the basic implication
Was that
Matt as the BDFL of WordPress
Has lost his way a bit
With his battle
With WP engine
So I should also say that
I really love WordPress
It brings me joy
I think it's a really
It's a beacon of what open source could be
I think it's made the internet better
A lot a lot of people to create wonderful websites
And I also think
Now you might disagree with this
But from everything I've seen
WP engine
Just gives me bad vibes
I think they're not a good
The good guy in this
I don't like it
I understand the frustration
I understand all of it
But I don't think that excuses the behavior
There is a bit of
See this kind of
Counter just a little bit what you said
Which is
When you have an open source project of that size
There is a bit of it
Like when you're the king
That for a project
Of a kingdom that large
There's a bit of responsibility
Anyway, could you speak to your
Maybe to your empathy
Of Matt and
To your criticism
And what
And maybe
Pain to path of
How
He and WordPress can be winning again
First the echo would you say about
What a wonderful thing it is
That WordPress exists
There are not many projects
In the open source world
Or in the world at large
That has had as big of an impact
On the internet
As WordPress has
He deserves a ton of
Accolades for that work
So that was my engagement
Essentially my premise
Do you know what I had tremendous respect
Respect for what Matt has built
With WordPress
With that entire ecosystem has built around itself
It's a true marvel
But
There's some principles that are larger than my
Personal sympathies to the characters involved
I agree
The civil lake
Private equity company that's involved with
WP engine
It's not my natural ally
I'm not the natural ally
Of private equity
Doing
Some game with the P engine
That's not my interest
In the case my interest is
Essentially
Set of principles
And the principles are
If you release something as open source
People are free to use it
As they see fit
And they are free to
Donate code
Or resources
Or money back to the community
As they see fit
You may disagree
Whether they've done enough
Whether they should do more
But you can't show up
After you've given the gift
Of free software
To the world
And then say now that you've used that gift
You actually owe me
Huge slide of your business
Because you got too successful
Using the thing I gave you
For free
You don't get to take a gift back
That's why we have
Open source licenses
They stipulate exactly what the
Obligations are on both sides of the equation
The users of open source don't get to demand
What the makers of open source do and how they act
And the makers of open source don't get to
Suddenly show up with a ransom note
To the users and say actually you owe me
For all sorts of use
I'm 100% allergic to that kind of
Interaction
And I think Matt unfortunately for whatever reason
Got so wrapped up in what he was owed
That he failed to realize
What he was destroying
WordPress and automatic already makes
A ton of money
This is part of the wonder of WordPress
This is a project that generates hundreds of millions of dollars
And Matt didn't feel like he was getting enough of that
That's not a good argument bro
You can't just violate the spirit
And the letter of these open source licenses
And just start showing up with the man letters
Even to characters that are not particularly sympathetic
This goes to the root of my interpretation of open source in general
The gpl is a particular license that actually demands code
From people who use it under certain circumstances
I've never liked the gpl
I don't want you shitty code if you don't want to give it to me
What am I going to do with that?
Some code dump that you
I'm not on board with that part of Stolman's vision at all
I love the MIT license
To me that is the perfect license
Because it is mercilessly short
I think it's two paragraphs
Three paragraphs
Really short
And it basically says
Here's some software
It comes with no warranty
You can't sue me
You can't demand anything
But you can do whatever the hell you want with it
Have a nice life
That's a perfect open source interaction in my opinion
And that license needs to be upheld
These licenses in general, even the gpl, even if I don't like it
We have to abide by them
Because if we just set aside those licenses
When we in a moment's notice
Feel like something slightly unfair
We've lost everything
We've lost the entire framework
That allowed open source to prosper
And allowed open source to become such an integral part of commerce too
I mean back when open source was initially finding its feet
It was at war with commercial software
Stolman is at war with commercial software
And always has been
Bill Gates was in return at war with open source for the longest time
The open source licenses and the clarity that they provide
allowed us to end that war
Today commercial software and open source software can peacefully coexist
I make commercial software, I sell base camp, I sell hay
And then I also make a bunch of open source software that I give away for free's gifts
That can't happen if we start violating these contracts
No commercial company is going to go
Let me base my next project off this piece of open source
If I'm also running the liability that some mad maker is going to show up
Seven years in and demand I give them $50 million
That's not an environment conducive to commerce, collaboration or anything else
And it's just basically wrong
I think there's one analysis that's all about kind of the practical outcomes of this
Which I think are bad
There's also some an argument that's simply about ethics
This is not right
You can't just show up afterwards and demand something
This is not too dissimilar in my opinion
To the whole Apple thing we talked about earlier
Apple just showing up and feeling like they're entitled to 30% of everyone's business
No
That's not right
That's not fair
So I think Matt unfortunately kind of stared himself blind
On the indignity
He thought was being perpetrated against him
Because there was all this money being made by VP engine
Making a good product and not giving quite enough back in Matt's opinion
Tough, tough cookie
I think there maybe I'm reading too much into it
But there might be some personal stuff too
Which they weren't not only not giving enough
But probably implicitly promising that they will give
And then taking advantage of him in that way in his mind
Just like interpersonal interaction
And then you get like
Interpersonally frustrated
You forget like the bigger picture ethics of it
It's like when a guy keeps saying you know promising he'll do something
And then you and then you realize you wake up one day like a year or two later
Wait a minute
I was being lied to this whole time
And then that I don't even know if it's about money
I'd get mad too
It's solely fine to get mad when people disappoint you
That's not justification for upending decades of open source
Licenses and the essential the fact of case law we've established around it
This is why I chose to even weigh in on this
Because I like WordPress I don't use WordPress
I'm not a part of that community
I don't actually have a
Dog in this fight
I'm biased if anything towards Matt just as a fellow BDFL
I would like to see him do well with this
But I also think there's some principles that stake here that
Ring much louder
I don't want rails to suddenly
Betainted by the fact that it's open source and whether companies can rely on it and build businesses on it
Because wait maybe one day I'm gonna turn Matt
And I'm gonna turn Matt King and I'm gonna show up with the demand ransom letter
No screw that we
We have
Way more to protect here. There's way more at stake than your personal beef
With someone or your perceived grievance over what you're owed. What would you recommend?
What do you think you should do can do to walk it back to to heal
Decide
This is the curious thing he could decide to give this up
That's very very difficult for driven ambitious people to do
To accept that they're wrong and to give up and lay down their sword. So
I had a hope earlier on in this that that was possible
I haven't seen any evidence that Matt is interested in that and I find that deeply red fault
But that's her his prerogative. I continue to speak out when he's violating the spirit and ethics of open source
but I
Wish he would just
Accept that this was a
Really bad idea. He just he made a bad bet and I thought
I think he thought he'd just get away with it that they'd just pay up
And that he could put pressure. I mean, I know that temptation when you sit as the head of a very important project
You know that that comes with a great degree of power and you really need a great degree of discipline
To rain that in and not exercise that power at every step where you feel aggrieved
I've felt aggrieved a million times over
In the 20 plus years of ruby and rails
I've really tried very hard not to let those
Sometimes petty sometimes substantial grievances over time
Seabind to the foundation of the ecosystem and risk ruining everything
As the king of the rail kingdom as the power got into your head over the years
I'm sure it has. I mean who wouldn't do pace around in your chamber
I do
And I do marvel at both what's been built what's been possible over a million applications
I've been made with ruby and rails by one estimate that I've seen businesses like Shopify and GitHub and
A million others have been built on top of something that I started. That's very gratifying
but
You really have to be careful not to smell your own exhaust too much
And you have to be just as careful not to listen too much to the haters
And not to listen too much to the super fans either that you assess the
value and
Sort of principles of what you're working towards on its own merits on your own scoreboard. I try to
Block that out and then just go well. I'm working on rails because I love to write ruby
I love to use ruby to make web applications
That's my north star and I'll continue to do that and I'll continue to share
all of the open source gifts that I
Uncover along the ways
And that's it. That's enough too. I don't have to get all of it out of it
This is sometimes just as with the guy who thought I'd given up on being Jira or something instead of doing base cam
There are people over the years who've asked like why didn't you charge for rails like don't you know how much money
Have been made off rails if we just look at something like Shopify. It's worth billions of dollars
I'm not a billionaire and so freaking what I got more than enough. I got plenty of my share. I will say though. I'm also
Introspective enough to realize that if it hadn't panned out as well as it did for me on my own business
Maybe I would have been more tempted
Maybe if you see other people build huge successful companies off the back of your work
And you really don't have a
Pot to piss in you might be tempted to get a little
Upset about that. I've seen that in the rails world as well where there are people who contributed
substantial bodies of work and then got really
Miffed when they didn't feel like they got enough back
I was fortunate enough that the business that Jason or I built with Ruby and rails was so successful as it was
And I I made the money I needed to make that I didn't need to chase the rest of it
But we should also just
Make explicit that many people in your position
Chase
Chase the money. It's not that difficult to chase basically you turned away money. You made a lot of decisions that
Just turn away money
Maybe I also think of
This example with Matt he probably thought there was easy money for the taking and it wasn't so easy
Was it it looked like low-hanging dollar bills
And they turned out to be some really sour grapes it turned out that he turned
He probably destroyed
vast sums of money by undermining the whole WordPress
Trust and the ecosystem and putting question marks in the heads of folks who would choose to you at WordPress or something else going forward
So I often think when people think like oh you left money on the table first of all so what I don't have to have all the money
But second of all maybe the money wasn't on the table at all and maybe the cost
Even if you got the money maybe the cost in other ways yes, we've talked about yes
Without way all the money these you could have possibly gotten meaning like I think you said that the thing that makes you happy
Is flow and tranquility those two things beautifully really beautifully put
and you know
gaining money might
Assigned to your responsibility of running a larger thing that takes away
The flow that you gain from being from from fundamentally for you what flow means is programming
And then tranquility is like I think you also have a beautiful post of like
Nirvana is an empty schedule
When I look at a upcoming week and I see that I have no schedule meetings at all
Which is quite common or maybe I just have one thing from one hour on one day
I think to myself do you know what this could very easily have been very different
We could have been running a company of hundreds of people or thousands of people and my entire calendar would have been packed
Solid with a little tetris blocks of other people's demands on my attention and time
And I would have been miserable as fuck yeah
And I look at that and go like that
What more can I
Ask for which is a really nice state of being at actually say
I didn't have this always I did have early on in my career some sense of
Like I need a little more a little more security and I remember this really interesting study where a bunch of
Researchers asked people who would make certain amounts of money how much money would it take
For you to feel secure they'd ask people who had a million dollars network. How much money do you need
For any two million two million then it'd be good then they asked people with them at net worth of five million. How much do you need
10 any 10
Ask people with 10 million. What do you need 20
Every single time people would need double of what they did
I did that for a couple of double links until I realized you know what this is silly. Yeah
I am already where I wished I would be and a million times over
So
What less is there to pursue now that doesn't mean that
If more money is coming my way, I'm gonna say no to it. Of course not
But it does mean that I'm free to set other things higher
And I also do think you realize
As Jim Kerry would say I wish everyone would get all the money that they wished for and they'd realize it wasn't the answer
that money solves a whole host of
Problems and anxieties and then it creates a bunch of new ones
And then it also doesn't touch a huge swath of the human experience at all
The world is full of miserable anxious hurt rich people
It's also full of miserable anxious poor people and I'd rather be a miserable anxious rich person that a poor person
But it isn't this magic wand that make everything go away and that's again one of those
Insights just like having children that you cannot communicate in words
I've never been able to sway a person who's not wealthy that wealth wasn't gonna solve all the problems
One quote you've returned to often and I enjoy a lot is the Coco Chanel quote of the best things in in life are free
And the second best things are very very expensive and I guess the task is
To focus on
Surround yourself with the best things in life like family and all of this and not caring about the other stuff
I would ease and say you can care about the other stuff just know the order priority. Yeah
if you are blessed with
A partner that you love some children that you adore you've already won the greatest prize that most humans
Are able to achieve
Most humans in this world if they are of
Marital age and they have children if you ask and what's the most important thing they would all say that
They would all say that no matter whether they're rich or poor
It's easy to lose sight of that when you're chasing the second best things because you know what they're also very nice
I I really like that Pagani sonda
It was a very expensive car and I would have no chance of acquiring it if I hadn't become rather
Successful in business. So I don't want to dismiss it either. It's great fun to have money
It's just
Not as fun for quite as long or as deep as you think it is and these other things having
An occupation and a pursuit that you enjoy being able to carry burdens
With a stiff of a lip and with again a sense of meaning
Is incredible to have family to have friends to have hobbies to have all these things that are actually available
To most people around the world
That's winning and it doesn't mean you have to discount your ambitions. It doesn't mean you can't reach for more
but
It does mean it's pretty dumb if you don't realize that
It's not going to complete you in some hocus-pocus-woose sense
To make more it it really isn't
What gives you hope about the future
This whole thing we have going on here human civilization
I
Find it easier to be optimistic
optimistic than pessimistic because I don't know either way
So if I get to choose why not just choose to believe it's going to pan out yeah like we suffer more in our
Imagination than we do in reality. That's one of the quotes out of stoicism and I also think we have a tendency
A lot of humans have a tendency to be
pessimistic in advance for things they don't know how it's going to pan out
Climate change for example is making a lot of people very anxious and very pessimistic about the future
You know nothing
40 years ago we thought the problem was that the planet was going to be too cool
I happen to believe that it's probably correct that the planet is getting too hot and that CO2 has something to do with it
Whether we have the right measures to fix it in time if that's even possible or not
Is completely up in the air and we don't know if you convince yourself with such certainty that the world is going to turn to shit
It is right up here in your head today
Climate change might wipe out this entire species in 200 years
It's not next year
It's not 10 years from now you life might become more unpleasant and there might be more negative effects and so on
Yes, okay, but then deal with that hardship when it arrives
Don't take down in advance. How are you helping earth by just walking around being depressed?
I think our whole conversation today is also an indication. It's just two humans talking
There's billions of us and there is something about us that wants to
Solve problems and build cool stuff. Yes, and so we're gonna build our way out of whatever shit we get ourselves into
This is what humans do we create problems for ourselves and and come up
Figure out how to build rocket ships
to
To get out of those problems and sometimes the rocket ships create other problems like nuclear warheads and then we'll I'm sure
I hope
Figure out ways how to avoid those problems and then there'll be nanobots and then
The aliens will come and it'll be a massive war between the nanobots and aliens and and that will bring also all of us humans together
To funny thing just to pick up one of the points you mentioned the atom bomb for example
When that was first invented a lot of people thought we have essentially ended life on earth, right?
Or maybe we prevented world war three from happening in the past 80 years because
Assured neutral annihilation kept the superpowers from attacking each other at least head on and kept their
Fighting to proxy wars. You know what proxy wars are not great, but they're probably better than world war three with nuclear weapons
So it's quite difficult in the moment to tell what's actually benefit and what's
Not and I think we should be a bit more humble. I've certainly become more humble over time of
Thinking I know which way it's gonna turn
I think the pandemic was a huge moment for a lot of people where there was so much certainty
About whether this intervention work or that intervention didn't work and most people were wrong
Certainly a lot of very smart people very
Qualified people got that just utterly and catastrophically wrong
So just a little intellectual humility. I think back upon that and go like you know what I'm not a PhD in virology
Um, and I don't claim that like I somehow saw how it always gonna play out
But the people were really experts and that's it got a bunch of it wrong nobody knows anything
I keep reminding myself of that every day. No one knows anything. We can't predict
The economy a month out. We can't predict world affairs mother. The world is just too complicated
Yeah, I when I watch the Netflix documentary chimp empire
And how you know, there's a hierarchy of chimps
All of that looks eerily similar to us humans. We're recent descendants
So these
Experts some of the chimps are
Got a PhD others don't
Others are really muscular. Others are like beta male kind. They're sucking up to the alpha
There's a lot of interesting dynamics going on that really maps clearly to the geopolitics of the day
I don't have nuclear weapons, but the nature of their behavior similar to ours
So I think
I think we barely know what's going on, but I do think there's like a basic
Uh
Will to cooperate
The basic compassion that underlies are just the human spirit that's there
And maybe that is just me being optimistic
But if that is indeed there, then we're gonna be okay. The capacity is certainly there
Whether we choose that capacity or not who knows and what situation
I think accepting that we all have the capacity for both ways for both incredible generosity and
kindness and also cruelty
I think
Young with this whole theory of the shadow was really spot on that we all have that capacity in us and accepting that
It's our job to attempt to cultivate the better parts of our human nature
is
Weight against our propensity to sometime be the worst of ourselves
I'm excited to find out what's gonna happen. It's so awesome to be human
I don't want to die. I kind of want to be alive for a while to see all the cool shit we do and uh one of the cool things
I want to see is all the software you create and all the things you tweet
All the trouble you get yourself into on twitter
um
David the i'm a huge fan like i said
I thank you for everything you've done for the world for the millions of developers you've inspired
And uh one of whom is me and thank you for this awesome conversation brother. Thanks so much for having me
Thanks for listening to this conversation with dhh to support this podcast
Please check out our sponsors in the description and consider subscribing to this channel
And now let me leave you with some words from rework by dhh and jason freed
What you do is what matters not what you think or say or plan
Thank you for listening and hope to see you next time

---

*Transcribed using OpenAI Whisper (base model)*
