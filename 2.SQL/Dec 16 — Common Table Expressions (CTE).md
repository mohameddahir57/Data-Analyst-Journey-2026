# Dec 16 — Common Table Expressions (CTE / WITH)

A **Common Table Expression (CTE)** is a temporary result set that you can reference within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. They are defined using the `WITH` keyword.

Think of a CTE as a "named temporary table" that exists only for the duration of a single query.

## 1. Syntax

```sql
WITH cte_name AS (
    -- Your query here
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

## 2. Why use CTEs?

1.  **Readability**: They break complex queries into smaller, logical building blocks.
2.  **Organization**: Instead of deeply nested subqueries, you read constraints and logic from top to bottom.
3.  **Reusability**: You can reference the same CTE distinct times in the main query (though mostly useful in more complex scenarios).

## 3. CTE vs. Subquery

**Subquery**:
```sql
SELECT columns
FROM (
    SELECT ... 
    FROM table 
    WHERE ...
) AS subquery_alias;
```
*Harder to read if there are multiple layers.*

**CTE**:
```sql
WITH step1 AS (
    SELECT ... 
    FROM table 
    WHERE ...
)
SELECT columns
FROM step1;
```
*Clean and readable.*

## 4. Multiple CTEs

You can define multiple CTEs in a single query by separating them with commas.

```sql
WITH 
    sales_2023 AS (
        SELECT * FROM sales WHERE year = 2023
    ),
    top_agents AS (
        SELECT agent_id, SUM(amount) as total
        FROM sales_2023
        GROUP BY agent_id
    )
SELECT * 
FROM top_agents;
```

## 5. PRACTICE EXERCISES

Exercise 1: Use a CTE to calculate the total sales for each agent.
-Then, select agents whose total sales are greater than 2000.
-Hint: PART 1 (CTE): Select agent_name, SUM(amount)... GROUP BY agent_name. PART 2: Select from CTE WHERE total > 2000.



Exercise 2: Find employees who earn MORE than the average salary of their own department.
-Hint: Use a CTE to calculate avg salary per department (like Example B). 
-Then JOIN the original employees_cte table with this CTE.



Exercise 3: (Challenge) Rank employees by salary within their department using a CTE.
-Then select only the Top 1 earner in each department.
-Hint: CTE should include RANK() OVER(PARTITION BY...).
-Outer query should filter WHERE rank = 1.
