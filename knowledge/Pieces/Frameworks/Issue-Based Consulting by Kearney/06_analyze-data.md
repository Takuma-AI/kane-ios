# Chapter 6: Analyze Data

**Framework:** Issue-Based Problem Solving  
**Section:** Data & Analysis  
**Mental Model:** Iterative Analysis  
**Tags:** #data-analysis #sensitivity-analysis #hypothesis-testing #revision #analytical-techniques

## The Core Philosophy

"During analysis, be prepared to review and revise Issue and Hypothesis Trees." Analysis is not a linear process of confirming what you expected, but an iterative journey of discovery where findings reshape understanding. The framework emphasizes flexibility - letting data guide you to insights rather than forcing data to fit preconceptions.

## The Analysis Workflow

### Three-Stage Process
1. **Organize data** - Structure for analysis
2. **Conduct analysis** - Test hypotheses systematically  
3. **Update visualizations** - Reflect new insights

This cycle repeats as understanding deepens and new questions emerge.

## Analytical Techniques Arsenal

The framework provides a comprehensive toolbox:

### Statistical Analysis
- **Correlation/Regression**: Linear, Non-Linear, Logistic, CHAID
- **Forecasting**: Moving Averages, Trend, Seasonality
- **Probability**: Discrete and Continuous distributions
- **Simulation**: Monte Carlo, Bootstrapping, Queuing theory

### Process Analysis
- **Value streaming**: Identify waste and optimization opportunities
- **Process control**: Cp/Cpk metrics
- **Root-cause analysis**: Five whys, Fishbone diagrams
- **FMEA**: Failure Mode and Effects Analysis

### Optimization
- **Mathematical optimization**: Linear, Non-Linear programming
- **Decision models**: Markov Chains, Genetic algorithms
- **Inventory optimization**: EOQ, EBQ models

### Specialized Analysis
- **Marketing analytics**: Conjoint, Cluster, RFM, Affinity
- **Strategic analysis**: SWOT framework
- **Financial modeling**: NPV, IRR, Payback

## Mental Model: Hypothesis-Driven Analysis

**Traditional**: Analyze everything, hope for insights
**Hypothesis-Driven**: Test specific assertions systematically

### The Testing Process
1. Start with highest-impact hypotheses
2. Design simplest test that proves/disproves
3. Interpret results objectively
4. Revise hypothesis tree based on findings
5. Iterate until conclusions are solid

## The Critical Role of Sensitivity Analysis

"Conduct sensitivity analyses on the various models and identify critical assumptions"

### Purpose of Sensitivity Analysis
- **Quick sanity check** on result validity
- **Present findings as ranges** rather than false precision
- **Identify critical variables** that drive outcomes
- **Build confidence** in recommendations

### Sensitivity Testing Approach
1. **Test for zero value** - What if key variables were eliminated?
2. **Test positive correlations** - Variables that move together
3. **Test negative correlations** - Offsetting variables
4. **Develop realistic ranges** - Not just mathematical extremes

### Example Application
If your model shows $10M savings from consolidation:
- What if volume is 20% lower? (Still positive?)
- What if costs are 15% higher? (Still worthwhile?)
- What's the breakeven point? (Minimum viable case?)
- What drives the biggest swings? (Focus management attention)

## Revising Based on Findings

Analysis often reveals the initial hypothesis tree was incomplete or wrong:

### When to Revise
- Hypothesis conclusively disproven
- New important factor discovered
- Assumed relationships don't exist
- Different root cause identified

### How to Revise
1. Document what was learned
2. Update issue tree with new branches
3. Generate new hypotheses
4. Design new analyses
5. Maintain audit trail of changes

## Quality Checks During Analysis

### Data Quality Verification
- Does the data meet standards?
- Are there gaps or anomalies?
- Is the sample representative?

### Analysis Validity
- Right statistical test for data type?
- Assumptions of method met?
- Correlation vs. causation considered?

### Result Reasonableness
- Do findings pass the "smell test"?
- Can you explain results simply?
- Do multiple analyses corroborate?

## Common Pitfalls

1. **Analysis paralysis**: Perfect analysis that delays decisions
2. **Confirmation bias**: Only seeing supporting evidence
3. **Over-complexity**: Using advanced techniques when simple suffices
4. **False precision**: Presenting estimates as exact
5. **Ignoring sensitivity**: Not testing assumption impact

## Key Insight

Analysis is where hypotheses meet reality. The goal isn't to prove you were right initially, but to discover what's actually true. By combining systematic hypothesis testing with sensitivity analysis and a willingness to revise, you build recommendations on solid ground rather than wishful thinking.

## Related Concepts
- Chapter 5: Develop Fact Base - Source of data for analysis
- Chapter 7: Develop Recommendations - Translating analysis into action
- Chapter 3: Hypothesis Generation - What we're testing through analysis