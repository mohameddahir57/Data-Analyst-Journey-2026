# Dec 8 — SQL Foundations: SELECT + WHERE

## 1. Concept Overview

### SELECT
The `SELECT` statement is the most basic and frequently used command in SQL. It allows you to choose which **columns** (attributes) you want to retrieve from a table.

- **`SELECT *`**: Retrieves **all** columns.
- **`SELECT column1, column2`**: Retrieves specific columns.

### WHERE
The `WHERE` clause is used to filter records. It extracts only those records that fulfill a specified condition. It essentially selects which **rows** you want to see.

- **Text**: Text values must be enclosed in single quotes (e.g., `'Somalia'`, `'Electronics'`).
- **Numbers**: Numeric values should **not** be in quotes (e.g., `100`, `25.50`).

## 2. Syntax Reference

```sql
-- Selecting specific columns
SELECT column1, column2
FROM table_name;

-- Selecting all columns
SELECT *
FROM table_name;

-- Filtering with WHERE
SELECT *
FROM table_name
WHERE column_name = value;
```

### Comparison Operators
| Operator | Description | Example |
| :--- | :--- | :--- |
| `=` | Equal to | `WHERE country = 'Kenya'` |
| `>` | Greater than | `WHERE price > 100` |
| `<` | Less than | `WHERE price < 50` |
| `>=` | Greater than or equal to | `WHERE price >= 200` |
| `<=` | Less than or equal to | `WHERE price <= 50` |
| `<>` or `!=` | Not equal to | `WHERE country != 'USA'` |

---

## 3. Exercise Solutions

Here are the solutions to the practice exercises in `Dec8_Select_Where.sql`.

### Exercise 1
**Goal:** Select only the name and category from the products table.
M products;


### Exercise 2
**Goal:** Find all products that cost less than (<) $50.


### Exercise 3
**Goal:** Find all customers who are from 'Kenya'.


### Exercise 4
**Goal:** Find all products in the 'Electronics' category.


### Exercise 5 
**Goal:** Find all products cost more than OR equal to (>=) $200.



