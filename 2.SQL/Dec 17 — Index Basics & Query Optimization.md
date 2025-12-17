# Dec 17 — Index Basics & Query Optimization

## 1. What is an Index?

An **Index** in a database is a data structure (commonly a B-Tree) that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space.

Think of an index like the **index at the back of a book**. If you want to find every mention of "GROUP BY", you don't scan every single page (a "Full Table Scan"). Instead, you look at the index, find the page numbers, and jump straight there.

### Why use Indexes?
- **Speed**: Drastically faster `SELECT` queries, especially using `WHERE`, `JOIN`, and `ORDER BY`.
- **Enforcement**: Primary Key and Unique constraints are enforced using indexes.

### The Cost of Indexes
- **Write Speed**: Every time you `INSERT`, `UPDATE`, or `DELETE`, the database must also update the index.
- **Storage**: Indexes take up disk space.

---

## 2. Creating and Dropping Indexes

### Common Syntax
```sql
-- Create an index on a single column
CREATE INDEX idx_customer_lastname 
ON Customers (LastName);

-- Create a composite index (multiple columns)
CREATE INDEX idx_order_date_amount 
ON Orders (OrderDate, Amount);

-- Drop an index
DROP INDEX idx_customer_lastname;
-- (Syntax varies slightly by DB: MySQL vs PostgreSQL vs SQL Server)
```

### Types of Indexes
1.  **Clustered Index**: Determines the physical order of data in the table. Usually the Primary Key. Only one per table.
2.  **Non-Clustered Index**: A separate structure pointing to the data rows. You can have many.

---

## 3. Query Optimization Basics

Writing efficient SQL is just as important as indexing.

### A. The `EXPLAIN` Statement
Used to see *how* the database will execute your query.
```sql
EXPLAIN SELECT * FROM Orders WHERE Amount > 1000;
```
Look for **"Full Table Scan"** (bad for large tables) vs **"Index Scan"** or **"Index Seek"** (good).

### B. Sargable Queries (Search ARGument ABLE)
Queries should be written so the engine *can* use an index.

**Bad (Non-Sargable):** altering the column data prevents index use.
```sql
-- Engines often have to calculate YEAR(OrderDate) for every row
SELECT * FROM Orders WHERE YEAR(OrderDate) = 2023;
```

**Good (Sargable):** comparing the raw column value.
```sql
SELECT * FROM Orders 
WHERE OrderDate >= '2023-01-01' AND OrderDate <= '2023-12-31';
```

### C. Avoid `SELECT *`
Only select columns you need.
- Reduces network traffic.
- Might allow an **"Index Only Scan"** (if the index contains all requested columns, the DB doesn't even need to touch the main table!).

### D. Wildcards at the Start
**Bad:**
```sql
WHERE Name LIKE '%Smith' -- Cannot use standard B-Tree index effectively
```
**Good:**
```sql
WHERE Name LIKE 'Smith%' -- Can use the index to find range starting with 'Smith'
```
