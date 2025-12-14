-- Dec 14 — Project: Customer Purchase Analysis
-- Week 2 Capstone Project

-- 1. SETUP
CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    country TEXT,
    email TEXT
);

CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    total_amount REAL
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

-- Reset Data
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM customers;

-- Insert Customers
-- Insert Customers
INSERT INTO customers (customer_id, name, country, email) VALUES 
(1, 'Abdi Warsame', 'Somalia', 'abdi@example.com'),
(2, 'Fartuun Ali', 'Djibouti', 'fartuun@example.com'),
(3, 'Amina Diop', 'Senegal', 'amina@example.com'),
(4, 'Khadija Hassan', 'Kenya', 'khadija@example.com'),
(5, 'Omar Geedi', 'Ethiopia', 'omar@example.com'),
(6, 'Leyla Ahmed', 'Somalia', 'leyla@example.com'),
(7, 'Kwame Osei', 'Ghana', 'kwame@example.com');

-- Insert Products
INSERT INTO products (product_id, name, category, price) VALUES 
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Smartphone', 'Electronics', 800.00),
(103, 'Headphones', 'Electronics', 150.00),
(104, 'Desk Chair', 'Furniture', 200.00),
(105, 'Coffee Table', 'Furniture', 120.00),
(106, 'Running Shoes', 'Apparel', 90.00),
(107, 'T-Shirt', 'Apparel', 25.00);

-- Insert Orders (2023 and 2024 data)
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES 
(1, 1, '2023-05-10', 1350.00), -- Abdi bought Laptop + Headphones
(2, 3, '2023-06-15', 800.00),  -- Amina bought Smartphone
(3, 1, '2023-11-20', 200.00),  -- Abdi bought Chair
(4, 4, '2024-01-05', 90.00),   -- Khadija bought Shoes
(5, 5, '2024-02-14', 2160.00), -- Omar bought 2 Laptops + Shoes (Gift?)
(6, 2, '2024-03-01', 25.00),   -- Fartuun bought T-Shirt
(7, 3, '2024-03-10', 120.00);  -- Amina bought Table

-- Insert Order Items (Linking orders to products)
INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 101, 1), (1, 103, 1), -- Order 1: Laptop, Headphones
(2, 102, 1),              -- Order 2: Smartphone
(3, 104, 1),              -- Order 3: Chair
(4, 106, 1),              -- Order 4: Shoes
(5, 101, 2), (5, 106, 1), -- Order 5: 2 Laptops, Shoes
(6, 107, 1),              -- Order 6: T-Shirt
(7, 105, 1);              -- Order 7: Coffee Table


-- 2. PROJECT QUESTIONS
-- Write your queries below each question.

-- Q1. List all Electronics products that cost more than $500.
SELECT * FROM products WHERE category = 'Electronics' AND price > 500;


-- Q2. Find the top 3 most expensive orders (show order_id, order_date, total_amount).
SELECT order_id, order_date, total_amount FROM orders ORDER BY total_amount DESC LIMIT 3;


-- Q3. Calculate the total revenue generated from EACH country.
SELECT c.country, SUM(o.total_amount) as total_revenue 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
GROUP BY c.country;


-- Q4. Count orders per YEAR (e.g. 2023: 3, 2024: 4).
-- Hint: strftime('%Y', order_date) in SQLite or similar functions.
SELECT strftime('%Y', order_date) as order_year, COUNT(*) as total_orders 
FROM orders 
GROUP BY order_year;


-- Q5. List customers who have NEVER placed an order.
SELECT * FROM customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


-- Q6. Find the Best Selling Product (by total quantity sold).
-- Hint: JOIN order_items and products, GROUP BY product name.
SELECT p.name, SUM(oi.quantity) as total_sold 
FROM products p 
JOIN order_items oi ON p.product_id = oi.product_id 
GROUP BY p.product_id 
ORDER BY total_sold DESC 
LIMIT 1;


-- Q7. Find customers who have spent more than the average customer.
-- Hint: Subquery to find average total_amount first.
SELECT c.name, SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(total_amount) as customer_total
        FROM orders
        GROUP BY customer_id
    )
);


-- Q8. (Challenge) List the name of every customer who bought a 'Laptop'.
-- Hint: Join Customers -> Orders -> Order_Items -> Products.
SELECT DISTINCT c.name 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id 
JOIN order_items oi ON o.order_id = oi.order_id 
JOIN products p ON oi.product_id = p.product_id 
WHERE p.name = 'Laptop';

