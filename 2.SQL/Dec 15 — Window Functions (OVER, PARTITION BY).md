# Dec 15 — Window Functions (OVER, PARTITION BY)

Today we unlock one of the most powerful tools in SQL: **Window Functions**. Unlike aggregate functions (like `SUM` or `COUNT`) which collapse rows into a single result, Window Functions perform calculations across a set of table rows **without** collapsing them.

## 1. What are Window Functions?

A Window Function performs a calculation across a set of table rows that are somehow related to the current row.

- **Aggregate Functions** (`GROUP BY`): Reduce the number of rows (e.g., 100 sales records -> 1 distinct result per day).
- **Window Functions** (`OVER`): Keep the original rows (e.g., 100 sales records -> 100 results, each with a calculated 'running total' or 'rank' column attached).

**Basic Syntax:**
```sql
SELECT column_name, 
       FUNCTION_NAME(column_name) OVER (
           PARTITION BY column_name 
           ORDER BY column_name
       )
FROM table_name;
```

---

## 2. The `OVER()` Clause

The `OVER()` clause is what defines a window function. If you use `OVER()` with nothing inside it, the "window" is the entire table.

*Example: Compare each employee's salary to the average salary of the WHOLE company.*
```sql
SELECT name, salary, 
       AVG(salary) OVER() as avg_company_salary 
FROM employees;
```

---

## 3. `PARTITION BY`

`PARTITION BY` divides the window into smaller "partitions" or groups. The function restarts its calculation for each partition. It is similar to `GROUP BY`, but again, it keeps all rows.

*Example: Compare each employee's salary to the average salary of THEIR department.*
```sql
SELECT name, department, salary, 
       AVG(salary) OVER(PARTITION BY department) as avg_dept_salary 
FROM employees;
```

---

## 4. `ORDER BY` within `OVER()`

Using `ORDER BY` inside `OVER()` is critical for cumulative calculations (like running totals) and ranking. It defines the sequence of rows **within** the window.

*Example: Calculate a Running Total of sales over time.*
```sql
SELECT date, amount, 
       SUM(amount) OVER(ORDER BY date) as running_total 
FROM sales;
```

---

## 5. Common Functions (Ranking & Aggregates)

### A. Ranking Functions
- `ROW_NUMBER()`: Assigns a unique, sequential integer (1, 2, 3...) to each row.
- `RANK()`: Assigns a rank (1, 2, 2, 4...) with gaps if there are ties.
- `DENSE_RANK()`: Assigns a rank (1, 2, 2, 3...) without gaps for ties.

*Example: Rank employees by salary.*
```sql
SELECT name, salary, 
       RANK() OVER(ORDER BY salary DESC) as salary_rank 
FROM employees;
```

### B. Window Aggregates
You can use standard aggregates like `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()` as window functions.

*Example: Calculate the cumulative sum (running total) per department.*
```sql
SELECT department, date, amount,
       SUM(amount) OVER(PARTITION BY department ORDER BY date) as dept_running_total
FROM sales;
```

---

## Practice Goals
1. Understand the difference between `GROUP BY` and `OVER`.
2. Use `PARTITION BY` to calculate group-relative stats (like pct of total).
3. Use `ORDER BY` to calculate Running Totals.
4. Use `RANK()` or `ROW_NUMBER()` to find "Top N" items.

## PRACTICE EXERCISES
(See the accompanying SQL file for hands-on practice!)
