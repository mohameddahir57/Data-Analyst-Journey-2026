-- Dec 9 — ORDER BY + LIMIT
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

-- Clear existing data to avoid duplicates if re-running
DELETE FROM products;
DELETE FROM customers;
DELETE FROM orders;

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

-- Example A: ORDER BY (Ascending)
-- Goal: Sort products by price from lowest to highest.
SELECT * 
FROM products 
ORDER BY price ASC;

-- Example B: ORDER BY (Descending)
-- Goal: Sort products by price from highest to lowest.
SELECT * 
FROM products 
ORDER BY price DESC;

-- Example C: LIMIT
-- Goal: Show only the first 3 customers.
SELECT * 
FROM customers 
LIMIT 3;

-- Example D: TOP N Pattern (ORDER BY + LIMIT)
-- Goal: Find the top 2 most expensive orders.
SELECT * 
FROM orders 
ORDER BY total DESC 
LIMIT 2;

-- 3. PRACTICE EXERCISES
-- Write your queries below each comment.

-- Exercise 1: List all customers sorted alphabetically by name (A-Z).
SELECT * 
FROM customers 
ORDER BY name ASC;


-- Exercise 2: Find the 3 least expensive products.
SELECT * 
FROM products 
ORDER BY price ASC 
LIMIT 3;


-- Exercise 3: Find the single most recently placed order (Sort by date DESC, Limit 1).
SELECT * 
FROM orders 
ORDER BY order_date DESC 
LIMIT 1;


-- Exercise 4: List the top 2 products with the highest price.
SELECT * 
FROM products 
ORDER BY price DESC 
LIMIT 2;


-- Exercise 5: (Challenge) Find the 3 most expensive 'Electronics' products. 
-- Hint: Use WHERE first, then ORDER BY, then LIMIT.
SELECT * 
FROM products 
WHERE category = 'Electronics' 
ORDER BY price DESC 
LIMIT 3;


