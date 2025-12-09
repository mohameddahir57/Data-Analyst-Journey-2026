-- Dec 8 — SELECT + WHERE
-- SQL Foundations: Selecting Columns & Filtering Rows

-- 1. SETUP: Create Tables & Insert Data
-- Run this section first to create the environment.

CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL,
    category TEXT
);

CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY,
    name TEXT,
    country TEXT
);

CREATE TABLE IF NOT EXISTS orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    total REAL,
    order_date DATE
);

-- Insert Sample Data
INSERT INTO products (name, price, category) VALUES 
('Laptop', 1200.00, 'Electronics'),
('Mouse', 25.50, 'Electronics'),
('Desk Chair', 150.00, 'Furniture'),
('Coffee Table', 80.00, 'Furniture'),
('Headphones', 200.00, 'Electronics'),
('Notebook', 5.00, 'Stationery');

INSERT INTO customers (name, country) VALUES 
('Abdi Warsame', 'Somalia'),
('Leyla Hassan', 'Kenya'),
('Farah Ali', 'Somalia'),
('Amina Yusuf', 'UK'),
('Mohamed Nur', 'USA');

INSERT INTO orders (customer_id, total, order_date) VALUES 
(1, 1200.50, '2023-01-15'),
(2, 25.00, '2023-02-10'),
(3, 150.00, '2023-03-05'),
(4, 500.00, '2023-04-20'),
(1, 85.00, '2023-05-12'),
(5, 45.00, '2023-06-01');

-- 2. LEARNING: Examples
-- Example A: SELECT specific columns
-- Goal: See only the names and prices of products.
SELECT name, price 
FROM products;

-- Example B: SELECT all columns (*)
-- Goal: See every detail of every customer.
SELECT * 
FROM customers;

-- Example C: WHERE clause for filtering (Exact Match)
-- Goal: Find customers who live in 'Somalia'.
SELECT * 
FROM customers 
WHERE country = 'Somalia';

-- Example D: WHERE with Number Comparison (>)
-- Goal: Find orders where the total amount is greater than $100.
SELECT * 
FROM orders 
WHERE total > 100;

-- 3. PRACTICE EXERCISES

-- Exercise 1: Select only the name and category from the products table.

```sql
SELECT name, category
FROM products;
```

-- Exercise 2: Find all products that cost less than (<) $50.

```sql
SELECT *
FROM products
WHERE price < 50;
```

-- Exercise 3: Find all customers who are from 'Kenya'.
 
```sql
SELECT *
FROM customers
WHERE country = 'Kenya';
```

-- Exercise 4: Find all products in the 'Electronics' category.

```sql
SELECT *
FROM products
WHERE category = 'Electronics';
```

-- Exercise 5: (Challenge) Find all products cost more than OR equal to (>=) $200.

```sql
SELECT *
FROM products
WHERE price >= 200;
```



