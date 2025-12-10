# Dec 10 — JOINs (INNER, LEFT, RIGHT)

JOINs are used to combine rows from two or more tables, based on a related column between them.

## 1. INNER JOIN
Returns records that have matching values in **both** tables.

- **Use case**: "Show me orders and the customer who made them."
- If a customer has no orders, they won't appear.
- If an order has no valid customer (rare in good DBs), it won't appear.

**Syntax:**
```sql
SELECT columns
FROM TableA
INNER JOIN TableB ON TableA.key = TableB.key;
```

## 2. LEFT JOIN (Left Outer Join)
Returns all records from the **left** table (TableA), and the matched records from the right table (TableB).

- **Use case**: "Show me ALL customers, and their orders if they have any."
- If unmatched, the result is `NULL` from the right side.
- Very useful for finding "missing" data (e.g., Customers with NO orders).

**Syntax:**
```sql
SELECT columns
FROM TableA
LEFT JOIN TableB ON TableA.key = TableB.key;
```

## 3. RIGHT JOIN (Right Outer Join)
Returns all records from the **right** table (TableB), and the matched records from the left table (TableA).

- **Use case**: Opposite of Left Join. "Show me all Orders, and the matching Customer."
- Note: `RIGHT JOIN` is less common because you can usually just swap the tables and use a `LEFT JOIN` (which is often easier to read).

**Syntax:**
```sql
SELECT columns
FROM TableA
RIGHT JOIN TableB ON TableA.key = TableB.key;
```

## Visualizing JOINs
Think of Venn Diagrams:
- **INNER JOIN**: The intersection (overlap) properly.
- **LEFT JOIN**: The entire Left circle + the overlap.
- **RIGHT JOIN**: The entire Right circle + the overlap.

## 4. PRACTICE EXERCISES


 Exercise 1: Show the Order ID, Order Date, and the Name of the customer who placed it.
 - Use INNER JOIN.

 Exercise 2: Show ALL customers and the Date of their orders.
 - Use LEFT JOIN. Include customers with no orders.
 
 Exercise 3: List the Customer Name, Product purchased (assume a column exists? Wait, we don't have an order_items table yet).
 - Let's stick to simple joins. 
 - Challenge: List the Name of customers from 'Somalia' and their Order Totals.
 - Only show those from Somalia.

Exercise 4: Find the total number of orders placed by EACH customer.
- Hint: This needs GROUP BY which is tomorrow's topic, so let's try something simpler.
- Review Challenge: List all orders sorted by Order Date (newest first), showing the Customer Name.


 
