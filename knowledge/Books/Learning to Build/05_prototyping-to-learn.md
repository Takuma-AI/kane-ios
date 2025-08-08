# Chapter 5: Prototyping to Learn

**Book:** Learning to Build  
**Section:** Chapter Five  
**Mental Model:** Execution & Learning  
**Tags:** #orthogonal-arrays #control-factors #noise-factors #empirical-data #system-thinking

## Core Concept: The Chip Guy's Trap

At a major cookie manufacturer, "the chip guy" spent months in an endless cycle: fix fragility, chips too big; fix size, wrong texture. After 1,000 experiments, he was no closer to solving the problem. Every solution created a new problem.

**The Fatal Flaw**: Testing one factor at a time (A/B testing) while thinking narrowly about one problem/one solution. Always "one prototype away" but never arriving.

**The Solution**: Look at problems as systems with control and noise factors. Use orthogonal arrays to test thousands of permutations through handful of tests. Bob solved in weeks what took the chip guy months.

## Mental Model: A/B Testing vs. Prototyping to Learn

**A/B Testing (Red Line)**:
- One problem, one solution mindset
- Test single factors sequentially
- Needle in haystack approach
- Based on theoretical knowledge
- Confirms hypotheses
- Creates job security for engineers

**Prototyping to Learn (Green Line)**:
- System-wide understanding
- Test multiple factors simultaneously
- Empirical discovery approach
- Pushes limits to find failure points
- Reveals tradeoffs
- Creates real solutions

> "A/B testing is job security for engineers." — Dr. Genichi Taguchi

## The Prototyping Process: Dish Soap in Argentina

### 1. System Design
**Question**: How does dish soap work? What's its job?

**Discovery**:
- Surfactants attack fat and carbohydrates
- Foam provides user feedback (not just cleaning)
- Must work with sponges (thickness matters)
- Smell and color considerations
- Competitive cost structure
- Six different functions total

### 2. Prioritization
**Critical Systems**:
- Bubbles (user feedback)
- Thickness (sponge retention)
- Cleaning system (core function)

**Independent Systems**:
- Fragrance
- Color

### 3. Functionality Analysis

**Control Factors** (What we can change):
- Chemical makeup
- Surfactant percentages
- Active ingredients

**Noise Factors** (What we can't control):
- Hard vs. soft water in Argentina
- Greasy foods vs. carbohydrates
- User behavior variations

### 4. Testing with Orthogonal Arrays

**Measurement Design**:
- **Foam Test**: George Foreman grill, specific soap/water amounts, measure scrubs to foam and duration
- **Thickness Test**: Time soap stays on sponge vs. running through

**Unexpected Discovery**: Blue (oil-based) color reduced cleaning effectiveness because surfactants broke down color instead of grease. Yellow (water-based) had no impact.

**Result**: 18 prototypes answering all questions about performance, cost, and tradeoffs. Example: Magnesium chloride increased foam without cost but reduced thickness.

## Mental Model: Theory vs. Empirical Data

**Theory-Based Approach**:
- Assumes expertise provides answers
- Works from past knowledge
- Changes context when problems arise
- Gets you "in the game" (minor leagues)

**Empirical Approach**:
- Acknowledges more unknown than known
- Uses present data for future innovation
- Changes system based on learning
- Gets you to innovation (major leagues)

### The Tile Manufacturing Revolution

Taguchi loved telling this story to underscore the importance of prototyping to learn and the limits of existing theory.

For 100 years, tile manufacturers everywhere struggled to produce uniform tiles. By the 1950s, they'd largely reached the point where they accepted the problem as unchangeable. But Taguchi set out to test that theory.

**The Discovery Process**:
First, he went to the production line to figure out how the system worked. Tiles came out of the kiln by the thousands, went down the production line, and were stacked into enormous piles to use space efficiently.

**The Problem**: As tiles dried, the ones on the outside dried faster, shrank, and got brittle causing them to crack easily. The tiles in the center couldn't drive off moisture well and therefore wouldn't shrink as much and crack.

**Traditional "Solution"**: Manufacturers couldn't produce uniform tiles, leading to a major sorting endeavor after each day's run involving scores of people who grouped tiles into 3-4 size categories.

**Taguchi's Approach**: 
- Looked at control factors vs. noise factors
- Asked: "How can I design an experiment that changes things I control so tiles are less sensitive to the context in which they dry?"
- Focused solely on the kiln:
  - What distance did tiles travel?
  - What temperatures were they subjected to?
  - How fast did temperatures ramp up and down?
  - How long did they hold temperatures?

**The Revolutionary Result**: By playing with the kiln alone, Taguchi solved the problem that plagued manufacturers for 100 years. They never had to sort again. This not only solved the size issue but increased capacity tenfold.

**The Lesson**: "It underscores the power of obtaining present, empirical data—prototyping to learn—as opposed to relying on past theory. The problem with relying on existing theory alone is that it causes you to assume certain aspects are known."

### Bob's Engineering School Rebellion

The conflict between traditional teaching and Taguchi's methods came to a head when Bob returned to school after his transformative internship.

**The Catapult Assignment**: Design an experiment with catapult, rubber band, ball, and cup. "How many degrees do you need to pull back this rubber band, to make that ball fly ten feet away, and land in this cup?"

**Traditional Approach**: One problem, one solution—find the rubber band angle.

**Bob's Systems Thinking**: 
- What happens when ball size changes?
- What about wind friction?
- When rubber band stretches from overuse?
- How does catapult height factor in?
- How does cup size matter?

**Bob's Experiment**: Designed tests for variety of features, found 18 different ways to get ball into cup. Selected most effective design:
- Doubled rubber bands
- Made catapult shorter
- Pulled band 32 degrees
- Result: 100% accuracy

**Professor's "Right" Answer**: 22 degrees with standard setup = 30% success rate

**The Confrontation**: 
Professor: "No, no, no! You are making it too complicated."
Result: D grade for failing to follow instructions

**Bob's Realization**: "They wanted me to frame the problem, think about the problem, and design a solution around the problem. They wanted me to do traditional A/B testing where you create a hypothesis and test that hypothesis. Yet now I knew that there was another way forward and I could not unsee it."

**The New Method**: "Under the leadership of Taguchi, Deming, and Moore I had learned to assume that I knew nothing, test a set of different factors simultaneously to understand how the system worked, and only then to form a hypothesis, empirically through data and observation."

## The Unknown Unknown: Pound Cake Wisdom

A pound cake requires:
1. Ground grass seeds from Middle East (flour)
2. Crystallized tropical grass juice (sugar)
3. Secretions from jungle birds (eggs)
4. Fat from lactating beasts (butter)

Combined in specific order with specific heat for specific time = "simple" cake.

**The Lesson**: What seems simple today required centuries of innovation. There's vastly more unknown than known. Prototyping creates possibilities by finding the next evolution.

## Mental Model: PhD Trap

**Traditional View**: Innovation requires being the smartest expert in the room

**Reality**: Experts are overly biased, assuming more is known than true

**What Actually Works**:
- Methods, tools, and frameworks
- Problem-solving approaches
- Hard work and humility
- Knowing that you don't know

> "Part of what made Taguchi, Deming, and Moore so successful was their humbleness to know that they did not know."

## Decision Framework for Prototyping

1. **Frame the System**
   - How does it work?
   - What are all functions?
   - What drives performance?

2. **Identify Variables**
   - Control factors you can change
   - Noise factors you can't control
   - Prioritize critical systems

3. **Design Experiments**
   - Use orthogonal arrays
   - Test multiple factors simultaneously
   - Measure right things

4. **Learn from Results**
   - Some things work, others don't
   - All results teach
   - See tradeoffs clearly

5. **Iterate with Humility**
   - More unknown than known
   - Theory gets you started
   - Empirical data gets you home

## Applications

### Product Development
- Stop one-factor-at-a-time testing
- Map entire system before testing
- Use orthogonal arrays for efficiency
- Expect surprises (blue dye problem)

### Problem Solving
- Don't chase symptoms
- Look for system interactions
- Test at boundaries
- Find where things fail

### Innovation Strategy
- Hire for methods over expertise
- Value empirical over theoretical
- Create learning systems
- Embrace the unknown

### Cost Management
- See all tradeoffs simultaneously
- Understand system interactions
- Optimize whole, not parts
- Make informed compromises

## Key Insights

1. **Systems beat symptoms** - One problem/solution thinking creates endless cycles

2. **Empirical beats theoretical** - Present data trumps past knowledge

3. **Multiple beats single** - Test many factors simultaneously for true understanding

4. **Humility beats expertise** - Knowing you don't know enables discovery

5. **Tradeoffs are inevitable** - No "best" solution, only informed choices

6. **Measurement drives innovation** - Can't improve what you can't measure

## Taguchi's Wisdom

**On Problems**: "All problems are problems of variation of function"

**On Solutions**: "Don't get caught up in the solution, get caught up in the problem. A well-framed problem is 10x easier to solve."

**On Measurement**: "How do you make something better if you can't measure the variation?"

**On Robustness**: "How do I make myself least sensitive to problems?"

### Taguchi's Character and Teaching Style

Bob met Taguchi during his first internship at age 20, when Taguchi was in his 60s. Bob was the student in the front row asking all the questions while others remained silent: "Wait a second, I don't understand..." Taguchi loved the questions, solidifying their relationship.

**Taguchi as Teacher**: 
- Equivalent of the Dalai Lama for innovation
- Smart in a practical way
- When told he couldn't do something, he'd figure out a way
- Would take pliers and use as hammer—then make them a better hammer
- Supremely resourceful

**The Beginning of Night Vision**: "Learning from Taguchi was the beginning of night vision goggles for me. He taught me how to form questions, so that I could get to intent then take that intent and turn it into action."

**The Steering Wheel Analogy**: "When you drive a car you may have intent to turn, but that intent starts in your head. It's the action of turning the wheel that brings intent to life. Most people talking about turning a car would say you need a steering wheel, but without a steering wheel we might innovate 400 other ways to turn a car. The consumer's intent was way more important than knowing how they wanted their steering wheel built."

**Measurement Obsession**: Always forced Bob to the right level—"You're measuring the wrong thing; you're not thinking about this right." With the paint problem: "You've got to measure the functional thing that's not happening. Where's the variation?"

**Personal Quirks**:
- Had analogies as inside jokes: "That works just like a spring" (referring to displacement force)
- Would use this for completely unrelated problems
- Bob would have to explain to confused rooms

**His Legacy**: 
- Concept of robustness—making things work across all conditions
- Maximizing what you have rather than asking for more
- Probably the best engineer Bob ever worked with
- Like Mr. Miyagi—"wax on, wax off"—teaching through doing

## Related Concepts

- Introduction: Variation of Function - Foundation for system thinking
- Chapter 1: Red Line vs. Green Line - Prototyping approach differences
- Chapter 3: Empathetic Perspective - Understanding all stakeholders in system
- Chapter 6: Making Tradeoffs - Prototyping reveals necessary compromises