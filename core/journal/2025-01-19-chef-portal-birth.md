# August 18, 2024 - Chef Portal Progress

Started the chef portal project properly today. After two months of working with Chef Austin and Lee, we've learned what works: start with the epicenter, ship daily, teach through doing.

## Morning - Finding the Nucleus

"Slow down to speed up," I told them at 9:30 AM. I explained how we could use ChatGPT to build an app in five minutes, but when it breaks, you won't know why. It won't be opinionated from your point of view.

Lee nodded - he knew this pain. "We're always in reaction mode. We rarely have time to strategically approach designing a solution."

So we went analog. Pen and paper. 15 minutes of individual sketching.

Chef's breadboard: Three screens. "Your home screen is your current contracts, your money, and 'what am I worth?' Click a contract, it's pre-populated with double the deposit. Override if needed. Send." That's it.

Lee's breadboard: Seven screens with branching logic, admin views, deposit tracking. The whole operational machine.

The convergence at 10:20 AM: Lee stopped mid-explanation. "Actually, Chef, your three boxes are my three boxes. I just went deeper."

By 10:55, we had our epicenter: chefs see clients, enter services, get paid. 

By the end of the call, Chef had an epiphany: once we set the strong foundation for this "Nucleus" of the experience to work, all the scattered processes they have around spreadsheets, google drive, etc. can be gradually designed into the system. This is the beginning of something much bigger.

## Afternoon - From Magic to Mechanics

The original plan for the afternoon was to get Claude Code installed. Going on a mid-day walk, I realized that Chef needed a more fundamental walkthrough to internalize how to work with the terminal. So I changed my approach.

2 PM. Chef sharing his Windows screen. "Type wsl," I said. We entered Linux.

"How do we get to the root?" Chef pulled up his notes, hunting. "CD squiggly line," he read.

We built from zero:

- `mkdir hello-cheffie` (Chef: "That means make directory")
- `touch index.html` ("That creates files?")
- `notepad.exe index.html` (opening Windows Notepad from Linux blew his mind)

Chef typed his first HTML:

```html
<h1>Hello Cheffy</h1>
<p>This is fucking great</p>
```

Lee burst out laughing: "I feel like I'm in 1990!"

After wrestling with git authentication, we deployed. Chef stared at his site live on Render: "So from end to end, I went from creating index.html to deploying it on the internet."

Silence. You could hear him reframing everything.

## The Command Revolution

After this meeting, I completely redesigned the epc-portal repo. Instead of day-by-day curriculum ("Day 1: Do this, Day 2: Do that"), I decided to create reusable commands that guide Chef through product development regardless of when he works.

`/mockup` - Turn sketches into clickable ERB templates with mock controllers

`/database` - Design the minimum viable data structure based on interface mocks

`/integrate` - Connect Square, Zapier, any external API that requires clarification of what's needed, research, implementation

`/test` - Ensure everything works by designing test suites

Each command is a conversation, not a script. They check existing work, adapt to progress, guide decisions. Chef can chain them together: shape an idea, mockup the interface, wire the database, integrate payments. The same commands work whether building the first feature or the fiftieth.

This is the AI sous chef promise realized - not replacing Chef's judgment but augmenting his execution with consistent, reusable processes. You can see the commands here: https://github.com/kateleext/epc-portal/tree/main/.claude/commands 

## What Changed

Two months ago: We built features because we could. Chef watched AI do magic.

Today: Chef typed `ls` and knew what it meant. He sees Claude Code as "typing terminal commands for me."

The proof: When Amy called about weekend bookings ("Two people booked! They paid!"), Chef could context-switch to business and return to code. He's not drowning. He's swimming.

When I explained specialized agents - one for interfaces, one for debugging, one that checks dark mode for Amy - his response was immediate: "I want a bunch of little agents."

Tomorrow we turn sketches into mockups. By Friday, real payments. But the real victory is Chef understanding the system, owning the process, building from the nucleus.

The difference two months makes.