-- Dec 11 — GROUP BY + HAVING
-- SQL Foundations: Aggregation & Grouping


-- 1. SETUP: Create Tables & Insert Data
-- Same tables, fresh data for aggregation examples.

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

-- Clear existing data
DELETE FROM products;
DELETE FROM customers;
DELETE FROM orders;

-- Insert Sample Data
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
(1, 1200.00, '2023-01-15'), -- Abdi
(1, 25.00, '2023-01-16'),   -- Abdi
(1, 300.00, '2023-02-01'),  -- Abdi
(2, 150.00, '2023-03-05'),  -- Leyla
(3, 80.00, '2023-05-12'),   -- Farah
(3, 120.00, '2023-06-01'),  -- Farah
(5, 200.00, '2023-07-20');  -- Mohamed
-- Amina (ID 4) has 0 orders

-- 2. LEARNING: Examples

-- Example A: Simple Aggregation
-- Goal: Calculate the total revenue (sum of all order totals).
SELECT SUM(total) 
FROM orders;

-- Example B: GROUP BY
-- Goal: Count how many products are in each category.
SELECT category, COUNT(*) 
FROM products 
GROUP BY category;

-- Example C: GROUP BY + JOIN
-- Goal: Calculate total amount spent by EACH customer.
SELECT customers.name, SUM(orders.total) as total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

-- Example D: HAVING
-- Goal: Find customers who have spent MORE than $500.
SELECT customers.name, SUM(orders.total) as total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING SUM(orders.total) > 500;


-- 3. PRACTICE EXERCISES
-- Write your queries below each comment.

-- Exercise 1: Calculate the average price of products in each category.
-- Show: category, average price.
SELECT category, AVG(price) 
FROM products 
GROUP BY category;


-- Exercise 2: Find the total number of orders placed by each customer.
-- Show: Customer Name, Count of orders.
-- Hint: JOIN customers and orders, then GROUP BY name.
SELECT customers.name, COUNT(orders.id) 
FROM customers 
JOIN orders ON customers.id = orders.customer_id 
GROUP BY customers.name;


-- Exercise 3: Find categories that have MORE than 2 products.
-- Hint: GROUP BY category HAVING COUNT(*) > 2.
SELECT category, COUNT(*) 
FROM products 
GROUP BY category 
HAVING COUNT(*) > 2;


-- Exercise 4: (Challenge) Find the total revenue per Country.
-- Hint: Join customers and orders. Group by Country. Sum the totals.
SELECT customers.country, SUM(orders.total) 
FROM customers 
JOIN orders ON customers.id = orders.customer_id 
GROUP BY customers.country;
