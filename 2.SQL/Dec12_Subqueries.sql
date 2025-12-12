-- Dec 12 — Subqueries
-- SQL Foundations: Nested Queries

-- 1. SETUP (Run this if you haven't already, or to reset data)
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

-- Clear distinct data to ensure clean state
DELETE FROM products;
DELETE FROM customers;
DELETE FROM orders;

-- Insert Data
INSERT INTO products (name, price, category) VALUES 
('Laptop', 1200.00, 'Electronics'),
('Mouse', 25.00, 'Electronics'),
('Desk Chair', 150.00, 'Furniture'),
('Coffee Table', 80.00, 'Furniture'),
('Headphones', 200.00, 'Electronics'),
('Monitor', 300.00, 'Electronics'),
('Bookshelf', 120.00, 'Furniture');

INSERT INTO customers (name, country) VALUES 
(1, 'Abdi Warsame', 'Somalia'),
(2, 'Leyla Hassan', 'Kenya'),
(3, 'Farah Ali', 'Somalia'),
(4, 'Amina Yusuf', 'UK'),
(5, 'Mohamed Nur', 'USA');

INSERT INTO orders (customer_id, total, order_date) VALUES 
(1, 1200.00, '2023-01-15'),
(1, 25.00, '2023-01-16'),
(1, 300.00, '2023-02-01'),
(2, 150.00, '2023-03-05'),
(3, 80.00, '2023-05-12'),
(3, 120.00, '2023-06-01'),
(5, 200.00, '2023-07-20');

-- 2. LEARNING: Examples

-- Example A: Scalar Subquery
-- Goal: Find products that are MORE expensive than the average product price.
SELECT name, price 
FROM products 
WHERE price > (SELECT AVG(price) FROM products);

-- Example B: Subquery with IN
-- Goal: Find customers who have made an order (IDs exist in orders table).
SELECT name 
FROM customers 
WHERE id IN (SELECT DISTINCT customer_id FROM orders);

-- Example C: Subquery with NOT EXISTS (or NOT IN)
-- Goal: Find customers who have NEVER placed an order.
SELECT name 
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.id
);

-- Example D: Derived Table (Subquery in FROM)
-- Goal: Find the average total spent by customers (only those who spent anything).
-- First we sum per customer, THEN average those sums.
SELECT AVG(total_spent)
FROM (
    SELECT customer_id, SUM(total) as total_spent
    FROM orders
    GROUP BY customer_id
) as customer_totals;


-- 3. PRACTICE EXERCISES

-- Exercise 1: Find products that cost LESS than the average price of 'Electronics'.
-- Hint: Subquery should calculate AVG(price) WHERE category = 'Electronics'.
SELECT name, price 
FROM products 
WHERE price < (SELECT AVG(price) FROM products WHERE category = 'Electronics');


-- Exercise 2: Find the names of customers who have placed an order worth MORE than $300.
-- Hint: Use `IN` with a subquery on the orders table.
SELECT name 
FROM customers 
WHERE id IN (SELECT customer_id FROM orders WHERE total > 300);


-- Exercise 3: (Challenge) Find the product with the HIGHEST price.
-- Hint: WHERE price = (SELECT MAX(price)...)
SELECT name, price 
FROM products 
WHERE price = (SELECT MAX(price) FROM products);


-- Exercise 4: List all products that are more expensive than 'Desk Chair'.
-- Hint: Subquery finds the price of 'Desk Chair'.
SELECT name, price 
FROM products 
WHERE price > (SELECT price FROM products WHERE name = 'Desk Chair');

