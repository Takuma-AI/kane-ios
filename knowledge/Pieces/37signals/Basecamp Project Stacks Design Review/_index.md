# 37signals: Live Design Review for Basecamp Project Stacks

**Date**: September 18, 2023  
**Participants**: Jason Fried, Doran, Nicholas (mentioned)  
**Feature**: Basecamp Project Stacks - A new organizational system for the homepage

## Overview

A detailed design review session where Jason Fried provides feedback on the new "stacks" feature for Basecamp's homepage. The feature allows users to organize multiple projects into folder-like groups, addressing the challenge of managing numerous pinned projects.

## Key Sections

### 1. [Stack Interaction Patterns](01_stack-interaction-patterns.md)
The core mechanics of creating, managing, and interacting with stacks. Covers the three ways to create stacks, naming conventions, visual design evolution, and the decision to move from showing miniature project previews to a cleaner, simpler design.

### 2. [The Pinning Philosophy Debate](02_pinning-philosophy-debate.md)
A deep philosophical discussion about whether projects in stacks should automatically become "pinned." Jason argues for maintaining project state (pinned vs. unpinned) when moving in and out of stacks, proposing a shift from thinking about the top section as "pinned" to thinking of it as "up top" with two types of content: pinned items and stacks.

### 3. [Design Feedback and Microcopy](03_design-feedback-microcopy.md)
Detailed refinement of language, typography, and visual design. Includes discussions about changing "create a stack" to "stack these projects," removing italics in favor of small caps, and ensuring safety mechanisms for potentially destructive actions.

### 4. [Mobile Shipping Strategy](04_mobile-shipping-strategy.md)
The challenge of shipping desktop features before mobile parity. Jason advocates for waiting or doing a "soft launch" to the community, recognizing that stacks would be especially valuable on mobile's limited screen space but could create confusion if projects appear differently across platforms.

### 5. [Future Vision and Expansion](05_future-vision-expansion.md)
Jason's vision for how the feature could expand, including custom backgrounds, client logos, and color coding. Emphasizes how the simplified design creates more opportunities for future enhancement while maintaining the "Fisher Price" philosophy of straightforward, intuitive interfaces.

## Key Themes

### Simplicity Through Constraint
The evolution from showing miniature project previews to a cleaner design that allows for future expansion demonstrates how constraints can lead to better solutions.

### State and Context
The extensive debate about pinning reveals deep thinking about how interface elements should maintain or change state based on context, and how users' mental models affect design decisions.

### Pragmatic Shipping
The discussion about mobile parity shows the balance between ideal implementation and practical concerns like branch management and user communication.

### Progressive Enhancement
Starting with a simple implementation that can grow over time, rather than trying to build all features upfront.

## Notable Quotes

**On the pinning philosophy:**
> "It's doing two things when it shouldn't do two things. It should do one thing."

**On mobile strategy:**
> "Creating stacks and organizing your stuff is such a personal thing to do."

**On future potential:**
> "There's a lot of opportunities here to expand this simple idea, which is what we get when we simplify this."

**On design philosophy:**
> "It's within the spirit of just Fisher Price, which is, you know, simplifying these things, making them very straightforward."

## Design Process Insights

This review demonstrates 37signals' design process:
- Direct, specific feedback
- Thinking through edge cases and scenarios
- Balancing technical constraints with ideal design
- Considering the full user journey across devices
- Building with future expansion in mind
- Maintaining philosophical consistency

The session shows how seemingly small features (organizing projects) can reveal deep questions about information architecture, state management, and user mental models.