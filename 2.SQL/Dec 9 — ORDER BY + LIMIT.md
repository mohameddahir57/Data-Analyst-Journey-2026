# Dec 9 — ORDER BY + LIMIT

## 1. ORDER BY
The `ORDER BY` clause is used to sort the result set in either ascending or descending order.

- **ASC**: Ascending order (default). Low to High (0-9, A-Z).
- **DESC**: Descending order. High to Low (9-0, Z-A).

**Syntax:**
```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC|DESC];
```

## 2. LIMIT
The `LIMIT` clause is used to specify the number of records to return. This is useful on large tables to improve performance or when you only need the "Top N" results.

**Syntax:**
```sql
SELECT column1, column2
FROM table_name
LIMIT number;
```

## 3. Combining ORDER BY + LIMIT
This is a very powerful combination used to find "Top" or "Bottom" lists (e.g., Top 5 customers, Most expensive product).

**Syntax:**
```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 DESC
LIMIT 5;
```

## 4. PRACTICE EXERCISES

Exercise 1: List all customers sorted alphabetically by name (A-Z).

Exercise 2: Find the 3 least expensive products.

Exercise 3: Find the single most recently placed order (Sort by date DESC, Limit 1).

Exercise 4: List the top 2 products with the highest price.

Exercise 5: (Challenge) Find the 3 most expensive 'Electronics' products.

Hint: Use WHERE first, then ORDER BY, then LIMIT.

