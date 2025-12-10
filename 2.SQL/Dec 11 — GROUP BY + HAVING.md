# Dec 11 — GROUP BY + HAVING

## 1. Aggregation Functions
Aggregation functions perform a calculation on a set of values and return a single value.

- **COUNT()**: Returns the number of rows.
- **SUM()**: Returns the total sum of a numeric column.
- **AVG()**: Returns the average value of a numeric column.
- **MAX()**: Returns the largest value.
- **MIN()**: Returns the smallest value.

## 2. GROUP BY
The `GROUP BY` statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

- It is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG).

**Syntax:**
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name;
```

## 3. HAVING
The `HAVING` clause was added to SQL because the `WHERE` keyword could not be used with aggregate functions.

- **WHERE**: Filters rows **before** aggregation.
- **HAVING**: Filters groups **after** aggregation.

**Syntax:**
```sql
SELECT column_name, COUNT(*)
FROM table_name
GROUP BY column_name
HAVING COUNT(*) > 5;
```

## Order of Execution
1. **FROM** & **JOIN** (Get tables)
2. **WHERE** (Filter rows)
3. **GROUP BY** (Group rows)
4. **HAVING** (Filter groups)
5. **SELECT** (Select columns)
6. **ORDER BY** (Sort results)
7. **LIMIT** (Limit rows)


 ## 4. PRACTICE EXERCISES
 Write your queries below each comment.

Exercise 1: Calculate the average price of products in each category.
- Show: category, average price.

Exercise 2: Find the total number of orders placed by each customer.
- Show: Customer Name, Count of orders.
- Hint: JOIN customers and orders, then GROUP BY name.

Exercise 3: Find categories that have MORE than 2 products.
- Hint: GROUP BY category HAVING COUNT(*) > 2.

Exercise 4: (Challenge) Find the total revenue per Country.
- Hint: Join customers and orders. Group by Country. Sum the totals.


