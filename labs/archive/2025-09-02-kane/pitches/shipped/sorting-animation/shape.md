# Sorting Animation - Smooth Transitions

## Problem
Current sorting feels abrupt. When users tap Need/Want/Kill, the transaction disappears instantly and the next one appears. This breaks the meditative flow we're trying to create.

## Appetite
2 days

## Solution
Add a gentle fade-out/fade-in transition between transactions:
1. User taps decision button
2. Current transaction fades out (300ms)
3. Next transaction fades in (300ms)
4. Buttons remain in place, creating stability

Simple CSS transitions, no complex JavaScript animations.

## Rabbit Holes
- Custom animation libraries
- Swipe gestures or drag interactions
- Loading states between transactions
- Particle effects or celebrations

## No-Goes
- Slowing down the experience (600ms total max)
- Bouncy or playful animations (maintain seriousness)
- Different animations per button
- Undo functionality

## Success
Users report the experience feels more thoughtful and less jarring. The meditation quality improves without sacrificing speed.