-- Dec 20 — Advanced SQL Practice
-- Scenario: You are the Lead Analyst for an E-commerce store.
-- The CEO wants answers to complex growth and behavior questions.

-- 1. SETUP: Create a dedicated dataset for analysis
-- We need enough history to calculate Month-over-Month growth.

CREATE TABLE IF NOT EXISTS sales_data (
    sale_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    sale_date DATE,
    amount REAL
);

DELETE FROM sales_data;

-- Inserting data spanning multiple months
INSERT INTO sales_data (sale_id, customer_id, sale_date, amount) VALUES
-- Jan 2024
(1, 101, '2024-01-05', 100.00),
(2, 102, '2024-01-15', 150.00),
(3, 101, '2024-01-20', 50.00),  -- Returning customer
-- Feb 2024 (Growth)
(4, 103, '2024-02-02', 200.00),
(5, 101, '2024-02-10', 120.00), -- Loyal customer
(6, 104, '2024-02-14', 300.00),
-- Mar 2024 (Dip)
(7, 102, '2024-03-01', 50.00),
(8, 103, '2024-03-05', 100.00),
-- Apr 2024 (Recovery)
(9, 105, '2024-04-01', 400.00),
(10, 101, '2024-04-10', 80.00),
(11, 104, '2024-04-12', 150.00);


-- 2. CHALLENGES

-- Challenge 1: Monthly Revenue & Growth (MoM)
-- Calculate:
-- A) Total Revenue per Month (format '2024-01', '2024-02'...)
-- B) The Previous Month's Revenue (using LAG)
-- C) The % Growth Rate ((Current - Prev) / Prev * 100)
-- Hint: Use a CTE to calculate monthly totals first.

/*
WITH MonthlySales AS (
    SELECT 
        strftime('%Y-%m', sale_date) AS sales_month,
        SUM(amount) AS total_revenue
    FROM sales_data
    GROUP BY 1
)
SELECT 
    sales_month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY sales_month) AS prev_month_revenue,
    -- (total_revenue - prev_month) / prev_month ...
FROM MonthlySales;
*/


-- Challenge 2: Customer Retention Analysis
-- Identify customers who made a purchase in BOTH January AND February.
-- Hint: You can use a Self Join or INTERSECT.
-- Try investigating:
-- SELECT DISTINCT customer_id FROM sales_data WHERE ... '2024-01' ...
-- INTERSECT
-- SELECT DISTINCT customer_id FROM sales_data WHERE ... '2024-02' ...


-- Challenge 3: RFM Segmentation (Recency, Frequency, Monetary) Lite
-- We want to label customers based on their spending.
-- - 'VIP': Spent > 300 total
-- - 'Regular': Spent between 100 and 300
-- - 'New/Low': Spent < 100
-- Return: Customer_ID, Total_Spent, Customer_Segment

/*
SELECT 
    customer_id,
    SUM(amount) as total_spent,
    CASE
        WHEN SUM(amount) > 300 THEN 'VIP'
        WHEN SUM(amount) BETWEEN 100 AND 300 THEN 'Regular'
        ELSE 'New/Low'
    END AS customer_segment
FROM sales_data
GROUP BY customer_id
ORDER BY total_spent DESC;
*/


-- Challenge 4: Running Total of Revenue
-- Show every sale, and the cumulative total revenue of the business up to that day.
-- Window Function: SUM(amount) OVER (ORDER BY sale_date)

SELECT 
    sale_date, 
    amount,
    SUM(amount) OVER (ORDER BY sale_date) as running_total
FROM sales_data;
