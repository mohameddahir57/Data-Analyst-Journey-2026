#  **WEEK 2 — SQL Foundations (Dec 8–14)**

*Beginner SQL → strong fundamentals*



## ** Dec 8 — SELECT + WHERE**

### **Definition**

`SELECT` chooses columns.
`WHERE` filters rows.

### **What you learn**

* Select specific columns
* Filter rows with conditions
* Comparison operators (=, >, <, >=, <=)
* Use simple text filters

### **Examples**

```sql
SELECT name, price
FROM products;
```

```sql
SELECT *
FROM customers
WHERE country = 'USA';
```

```sql
SELECT *
FROM orders
WHERE total > 100;
```



## ** Dec 9 — ORDER BY + LIMIT**

### **Definition**

`ORDER BY` sorts the data.
`LIMIT` reduces the number of rows.

### **What you learn**

* Sort ascending / descending
* Show top N rows
* Combine ORDER BY + LIMIT

### **Examples**

```sql
SELECT *
FROM orders
ORDER BY total DESC;
```

```sql
SELECT name, score
FROM students
ORDER BY score DESC
LIMIT 5;
```

(Top 5 students.)



## ** Dec 10 — JOINs (INNER, LEFT, RIGHT)**

### **Definition**

JOIN connects two tables using a common column.

### **What you learn**

* INNER JOIN → only matching records
* LEFT JOIN → all from left + matches
* RIGHT JOIN → all from right + matches

### **Examples**

```sql
SELECT orders.id, customers.name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;
```

```sql
SELECT p.name, o.quantity
FROM products p
LEFT JOIN orders o ON p.id = o.product_id;
```

---

## ** Dec 11 — GROUP BY + HAVING**

### **Definition**

`GROUP BY` groups data for summaries.
`HAVING` filters after grouping.

### **What you learn**

* Count items by category
* Sum totals per customer
* Difference between WHERE vs HAVING

### **Examples**

```sql
SELECT category, COUNT(*)
FROM products
GROUP BY category;
```

```sql
SELECT customer_id, SUM(total) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total) > 500;
```

(Filter customers who spent more than $500.)



## ** Dec 12 — Subqueries**

### **Definition**

A query inside another query.

### **What you learn**

* Subqueries in SELECT
* Subqueries in WHERE
* Return a single value
* Return a list of values

### **Examples**

```sql
SELECT name
FROM customers
WHERE id IN (SELECT customer_id FROM vip_customers);
```

```sql
SELECT name,
       (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.id) AS order_count
FROM customers;
```



## ** Dec 13 — Aggregation Practice**

### **Definition**

Aggregation = summarize data.

### **What you learn**

* SUM
* AVG
* COUNT
* MIN, MAX
* Combine with GROUP BY

### **Examples**

```sql
SELECT AVG(price) FROM products;
```

```sql
SELECT customer_id, SUM(total)
FROM orders
GROUP BY customer_id;
```



## ** Dec 14 — Project: Customer Purchase SQL Analysis**

### **What you will do**

* Analyze customer orders
* Identify top customers
* Identify highest-selling products
* Use: SELECT, WHERE, JOIN, GROUP BY, HAVING





#  **WEEK 3 — SQL Advanced (Dec 15–21)**

*Professional-level SQL skills*



## ** Dec 15 — Window Functions (OVER, PARTITION BY)**

### **Definition**

Window functions perform calculations *without* grouping the rows.

### **What you learn**

* ROW_NUMBER
* RANK
* SUM() OVER()
* PARTITION BY

### **Examples**

```sql
SELECT customer_id,
       total,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total DESC) AS rank
FROM orders;
```



## ** Dec 16 — Common Table Expressions (CTE / WITH)**

### **Definition**

A CTE is a temporary result you can reuse.

### **What you learn**

* WITH clause
* Write readable queries
* Break big queries into steps

### **Examples**

```sql
WITH high_value AS (
    SELECT * FROM orders
    WHERE total > 200
)
SELECT * FROM high_value;
```



## ** Dec 17 — Index Basics & Query Optimization**

### **Definition**

Indexes speed up search and filtering.

### **What you learn**

* What an index is
* When to use it
* Query performance basics
* EXPLAIN plan (conceptually)

### **Example**

(Concept — you won’t always use CREATE INDEX in practice.)

```sql
CREATE INDEX idx_customer_id ON orders(customer_id);
```



## ** Dec 18 — Complex Joins + Multiple Tables**

### **Definition**

Using 3+ tables in one query.

### **What you learn**

* Joining customers + orders + products
* Alias usage
* Combining multiple join types

### **Examples**

```sql
SELECT c.name, o.id AS order_id, p.name AS product_name
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN products p ON p.id = o.product_id;
```



## ** Dec 19 — Data Modeling (ERD Basics)**

### **Definition**

ERD = Entity Relationship Diagram
Shows tables and how they connect.

### **What you learn**

* Primary keys
* Foreign keys
* One-to-many vs many-to-many
* Normalization (simple explanation)

### **Example Concept**

Customers (1) → (many) Orders.



## ** Dec 20 — Advanced SQL Practice**

### **What you learn**

* Hard JOIN challenges
* Window function practice
* CTE + subquery practice
* Multi-table problems

### **Examples**

* Top 3 products by total revenue
* Monthly sales with ranking
* Customer lifetime value (simple)



## ** Dec 21 — Project: Employee HR Dataset Analysis**

### **You will:**

* Analyze HR data
* Salary distribution
* Department performance
* Use JOIN + window functions
* Build clean SQL reports


