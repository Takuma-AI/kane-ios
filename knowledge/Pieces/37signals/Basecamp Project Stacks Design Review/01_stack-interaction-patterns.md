# Stack Interaction Patterns

## Core Concept
"You can think of it as a folder, essentially." The stacks feature allows organizing multiple Basecamp projects together. As Jason describes: "This is just like one separate place to put the stuff that's in play. Like currently kind of in play."

## Three Ways to Create Stacks

### 1. Project-on-Project
"You can either drag a project and recently visited on top of another project. And you'll see that the context changes into a create stack. Once you release that, you'll move to the top to the pinned areas."

### 2. Recently Visited to Pinned
"You can as well just drag the project from recently visited on top of let's say, a house remodel in this case. And a new stack is going to be created exactly the same as previously was."

### 3. Drag to Empty Corner
"You can as well drag a project from, let's say, getting started to any corner. Within the pinned area at the top and same, you get a new stack."

## Stack Management

### Naming and Organization
"You can click inside. You can give it a new name. Let's call it cycle five. Save it."

"It's just so much easier to organize your pinned areas. And I know many people have many projects in the pin areas. It is very hard to keep track of, you know, where things are."

### Movement and Positioning
"You can move the stacks. You can still move them around in the top section. So let's say I'm working on cycle five. I want to have it on the top left. I'm going to move it there."

## Design Decisions

### Stack Naming Debate
Jason explores the naming behavior: "So, so every time you create a stack, it says new stack. And we don't ask you to rename it there. Had you explored or do you want to explore like concatenating the two projects that you if you create a new stack."

The team considered alternatives:
- Using the first dropped project's name
- Concatenating project names
- Keeping "new stack" as default

Doran explains: "One of the things that I've considered when we when we first started this was to have the stack name being the name of the project that you first drop... But again, you know, to your points, like it might not make sense for a lot of people."

### Visual Design Evolution
The previous design showed miniature versions: "So this is the previous version where the stack would not be actually, you know, a wide project like box. Something like that you see the projects within the stack. And that was the nice side about this is that you would just like in a glimpse, see what's inside."

But they moved away from it: "It in this one situation, it kind of looks alright, but when you have a bunch of them, it starts to feel pretty overwhelming pretty quickly."

## Interaction States

### Open Stack Behavior
"So this whole area is locked. And it's because the this panel is taking so much space. Yeah, it would be quite fiddly to try to drag stuff inside."

The team decided: "It's almost like a model, except that it doesn't have a dark background like as we, as we have it in other places."

### Removing Projects
"If you drag the other one out, is that essentially the same as... Yeah, we can just condition there. Yeah, you should show a message. You should show this message."

### Emptying Stacks
"Yeah, so when you click this, the projects go back in the pinned areas, then you get a message, no projects in this stack. And then that bottom link changes to delete stack."

## Transition and Animation
Jason's feedback on transitions: "Does this sort of zoom up or is it just like materializing because it'd be nice. If it grew, it fades, it fades in."

"I just would, if we can get that to look nice, I think it'd be, it feel. More like what you expect."