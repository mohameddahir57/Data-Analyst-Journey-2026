# Dec 20 — Advanced SQL Practice

Today is about **combining** everything you've learned. In the real world, you don't get asked "Write a Left Join". You get asked "Why did sales drop last month?" or "Who are our best returning customers?".

## The Problem Solving Framework
When facing a complex SQL problem, don't just start typing `SELECT`.

1.  **Understand the Goal**: What specific metrics do I need? (e.g., "Retention Rate").
2.  **Identify the Data**: Which tables hold the answer? Do I need to join them?
3.  **Break It Down**:
    - Do I need to filter data first? (WHERE)
    - Do I need to aggregate it? (GROUP BY)
    - Do I need a running total or ranking? (Window Functions)
    - Do I need intermediate results? (CTEs)
4.  **Build Layer by Layer**: Start with a CTE or a subquery, check if it works, then build the next layer.

## Common Advanced Patterns

### 1. Month-over-Month (MoM) Growth
Comparing current performance vs previous performance.
**Tools**: `CTE` (to aggregate by month) + `LAG()` (to see previous month).

### 2. Customer Retention / Churn
Did a customer who bought in Jan also buy in Feb?
**Tools**: `Self Join` or `LEAD()` to look ahead at the next order date.

### 3. Ranking & Segmentation
Finding the "Top 10%" or labeling customers as "VIP".
**Tools**: `NTILE()`, `RANK()`, `CASE WHEN`.

## Today's Mission
Open `Dec20_AdvancedPractice.sql` and solve the business scenarios using these advanced techniques.
