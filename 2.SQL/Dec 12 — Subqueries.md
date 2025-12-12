# Dec 12 — Subqueries

Today we dive into **Subqueries** (also known as inner queries or nested queries). A subquery is a query nested inside another SQL query.

## 1. What is a Subquery?

A subquery is a `SELECT` statement within another statement (like `SELECT`, `INSERT`, `UPDATE`, or `DELETE`).  
The inner query executes distinct from the outer query, and its result is used by the outer query.

**Basic Syntax:**
```sql
SELECT column_name
FROM table_name
WHERE column_name OPERATOR (SELECT column_name FROM table_name WHERE ...);
```

## 2. Types of Subqueries

### A. Scalar Subqueries
Returns a **single value** (one row, one column). Often used in `WHERE` clauses with comparison operators (`=`, `>`, `<`).

*Example: Find products more expensive than the average product price.*
```sql
SELECT name, price 
FROM products 
WHERE price > (SELECT AVG(price) FROM products);
```

### B. Single-Column Subqueries (Lists)
Returns a **list of values** (one column, multiple rows). Used with `IN` or `NOT IN`.

*Example: Find customers who have placed an order.*
```sql
SELECT name 
FROM customers 
WHERE id IN (SELECT DISTINCT customer_id FROM orders);
```

### C. Table Subqueries (Derived Tables)
Returns a **virtual table** (multiple columns and rows). Used in the `FROM` clause. You **must** give it an alias.

*Example: Calculate the average of total order amounts per customer.*
```sql
SELECT AVG(total_spent) 
FROM (
    SELECT customer_id, SUM(total) as total_spent 
    FROM orders 
    GROUP BY customer_id
) AS customer_totals;
```

## 3. Correlated Subqueries
A subquery that deals with the **outer query** for its values. It is executed once for **each row** processed by the outer query.

*Example: Find products whose price is above the average price OF THEIR OWN category.*
```sql
SELECT p1.name, p1.price, p1.category
FROM products p1
WHERE price > (
    SELECT AVG(price) 
    FROM products p2 
    WHERE p2.category = p1.category
);
```

## 4. EXISTS and NOT EXISTS
Used to test for the existence of any record in a subquery.

*Example: Find customers who have placed at least one order (alternative to JOIN/IN).*
```sql
SELECT name 
FROM customers c
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.id
);
```

## Practice Goals
1. Understand when to use a subquery vs. a JOIN.
2. Write queries using `IN`, `EXISTS`, and scalar comparisons.
3. Understand the concept of Derived Tables in the `FROM` clause.

