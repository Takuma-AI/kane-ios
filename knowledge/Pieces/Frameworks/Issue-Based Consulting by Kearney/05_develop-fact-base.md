# Chapter 5: Develop Fact Base

**Framework:** Issue-Based Problem Solving  
**Section:** Data & Analysis  
**Mental Model:** Strategic Data Collection  
**Tags:** #data-collection #fact-base #data-requests #flexible-foundation #sourcing-strategy

## The Core Philosophy

"Getting the raw data and aggregating it ourselves gives us control over data." Rather than accepting pre-digested summaries, building a flexible fact base from granular data enables dynamic analysis and prevents multiple iteration cycles. The goal is to create a data foundation that can answer current questions and adapt to new ones that emerge.

## The Three-Step Data Request Process

### Step 1: Unconstrained Thinking
**Question**: "If we had access to every possible piece of information, to what level of detail could we go?"
- Think ultimate drivers
- Ignore practical limitations temporarily  
- Identify ideal data granularity

### Step 2: Feasible yet Sufficient
**Question**: "What is the lowest level of detail we can practically use? How do the client's existing systems structure this data?"
- Balance ideal with realistic
- Consider client's data systems
- Ensure sufficient detail for analysis

### Step 3: Logical Data Structure
**Question**: "Rather than just one big list, what individual data groupings do we want?"
- Organize into logical entities
- Plan for relationships between datasets
- Structure for efficient analysis

## Mental Model: Flexible Data Foundation

**Traditional Approach**: Request aggregated summaries matching current needs
**Flexible Foundation**: Request raw data allowing dynamic aggregation

### The Power of Raw Data
Instead of asking for:
```
Sourcing Group    | Total Annual Spend
Travel            | $43.9M
Couriers         | $2.0M
Fuel             | $12.6M
```

Ask for:
```
Invoice No | Expenditure Type | Invoice Amount | Date | Vendor | Department
298       | G409            | $139.95       | ...  | ...   | ...
299       | A710            | $24,000.03    | ...  | ...   | ...
```

### Benefits
1. **Flexibility to aggregate/disaggregate at will**
2. **Speed** - Client avoids pre-processing
3. **Control** - Ensure accuracy of categorizations
4. **Adaptability** - New analyses without new requests

## Avoiding Data Request Iterations

"Data request iterations occur quite regularly and have the potential to disrupt or delay the project"

### Common Causes of Multiple Requests

**Project Type** | **Typical Problem**
---|---
Procurement | Initial spend categorization too broad for sourcing groups
Channel Strategy | Aggregated data obscures cross-subsidization
Pricing | Customer groupings lack detail for new pricing models
Any project | IT extracts using wrong criteria, discovered after analysis

### Prevention Strategies
1. **Request raw transactional data** when possible
2. **Understand data structure** before requesting
3. **Test with small sample** before full extraction
4. **Build in flexibility** for unforeseen analyses

## Data Source Hierarchy

Not all data comes from client systems. Sources in order of preference:

### 1. Quantitative Client Data
- Internal systems
- Transaction records
- Financial data
- Operational metrics

### 2. External Research
- Industry benchmarks
- Competitor data
- Market studies
- Academic research

### 3. Estimates and Assumptions
- Should-cost modeling
- Capacity assumptions
- Sensitivity ranges

### 4. Qualitative Insights
- Internal SME interviews
- External expert interviews
- Observations (plant visits)
- Previous experience

## Example: Creating Analytical Flexibility

The framework shows a grain storage analysis where:

### First Request (Too Aggregated)
"Capacity Utilization of Aerated Storage" - Single summary number

### Second Request (Appropriately Detailed)  
"Capacity Utilization by Depot" - Shows variation:
- CIA: 417k tonnes
- EMU: 367k tonnes  
- Mirrool: 201k tonnes
- WMV: 154k tonnes
- Yanco: 197k tonnes

This detail revealed utilization patterns invisible in the aggregate, enabling targeted recommendations.

## Best Practices for Fact Base Development

### Data Quality Verification
- Check completeness
- Validate against known totals
- Look for outliers/errors
- Test internal consistency

### Documentation
- Record all assumptions
- Note data limitations
- Track transformation steps
- Maintain audit trail

### Organization
- Clear file naming conventions
- Version control
- Separate raw from processed
- Build data dictionary

## Common Pitfalls

1. **Accepting pre-filtered data**: Losing records that might be relevant
2. **Not understanding the data structure**: Leading to misinterpretation
3. **Over-aggregation in request**: Limiting analytical flexibility
4. **Under-documentation**: Forgetting assumptions and transformations

## Key Insight

A flexible fact base is like having all the ingredients rather than a pre-made meal. You can cook different dishes as needs emerge rather than being locked into what was initially ordered. The upfront investment in obtaining granular data pays dividends in analytical agility and insight generation.

## Related Concepts
- Chapter 4: Analytical Framework - Defines what data is needed
- Chapter 6: Analyze Data - Using the fact base for testing hypotheses
- Chapter 2: Issue Tree Analysis - Ensures comprehensive data coverage