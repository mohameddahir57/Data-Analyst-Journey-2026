-- Dec 10 — JOINs (INNER, LEFT, RIGHT)
-- SQL Foundations: Combining Tables

-- 1. SETUP: Create Tables & Insert Data
-- We will use the same tables as before, but with meaningful relationships.

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
('Mouse', 25.50, 'Electronics'),
('Desk Chair', 150.00, 'Furniture'),
('Coffee Table', 80.00, 'Furniture'),
('Headphones', 200.00, 'Electronics');

INSERT INTO customers (name, country) VALUES 
(1, 'Abdi Warsame', 'Somalia'),
(2, 'Leyla Hassan', 'Kenya'),
(3, 'Farah Ali', 'Somalia'),
(4, 'Amina Yusuf', 'UK'),
(5, 'Mohamed Nur', 'USA'),
(6, 'New User', 'Canada'); -- User with NO orders

INSERT INTO orders (customer_id, total, order_date) VALUES 
(1, 1200.50, '2023-01-15'), -- Abdi
(2, 25.00, '2023-02-10'),   -- Leyla
(3, 150.00, '2023-03-05'),  -- Farah
(1, 85.00, '2023-05-12'),   -- Abdi again
(5, 45.00, '2023-06-01');   -- Mohamed
-- Note: Amina (ID 4) and New User (ID 6) have NO orders.

-- 2. LEARNING: Examples

-- Example A: INNER JOIN
-- Goal: List matching Customer Name and Order Total.
-- Only returns customers who HAVE made matching orders.
SELECT customers.name, orders.total, orders.order_date
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

-- Example B: LEFT JOIN
-- Goal: List ALL Customers and their Order Totals.
-- Returns 'NULL' for orders if the customer has made none.
SELECT customers.name, orders.total
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

-- Example C: Finding "Missing" Relationships (LEFT JOIN + WHERE NULL)
-- Goal: Find Customers who have NEVER placed an order.
SELECT customers.name
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.id IS NULL;

-- 3. PRACTICE EXERCISES
-- Write your queries below each comment.


-- Exercise 1: Show the Order ID, Order Date, and the Name of the customer who placed it.
-- Use INNER JOIN.
SELECT orders.id, orders.order_date, customers.name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;


-- Exercise 2: Show ALL customers and the Date of their orders.
-- Use LEFT JOIN. Include customers with no orders.
SELECT customers.name, orders.order_date
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;


-- Exercise 3: (Challenge) List the Customer Name, Product purchased (assume a column exists? Wait, we don't have an order_items table yet).
-- Let's stick to simple joins. 
-- Challenge: List the Name of customers from 'Somalia' and their Order Totals.
-- Only show those from Somalia.
SELECT customers.name, orders.total
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
WHERE customers.country = 'Somalia';


-- Exercise 4: Find the total number of orders placed by EACH customer.
-- Hint: This needs GROUP BY which is tomorrow's topic, so let's try something simpler.
-- Review Challenge: List all orders sorted by Order Date (newest first), showing the Customer Name.
SELECT orders.id, orders.order_date, customers.name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
ORDER BY orders.order_date DESC;
