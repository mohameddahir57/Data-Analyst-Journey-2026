-- Dec 16 — Common Table Expressions (CTE / WITH)
-- SQL Advanced: Making queries readable and organized

-- 1. SETUP (Run this to create the practice environment)
CREATE TABLE IF NOT EXISTS employees_cte (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
);

CREATE TABLE IF NOT EXISTS sales_cte (
    sale_id INTEGER PRIMARY KEY,
    agent_name TEXT,
    amount INTEGER,
    sale_date DATE
);

-- Clear old data
DELETE FROM employees_cte;
DELETE FROM sales_cte;

-- Insert Data
INSERT INTO employees_cte (name, department, salary) VALUES 
('Alice', 'Engineering', 120000),
('Bob', 'Engineering', 100000),
('Charlie', 'Sales', 70000),
('David', 'Sales', 85000),
('Eve', 'Engineering', 120000),
('Frank', 'HR', 60000);

INSERT INTO sales_cte (agent_name, amount, sale_date) VALUES
('Charlie', 500, '2023-01-01'),
('Charlie', 1500, '2023-01-05'),
('David', 2000, '2023-01-02'),
('David', 500, '2023-01-08'),
('Charlie', 200, '2023-01-10'),
('David', 1000, '2023-01-15');


-- 2. LEARNING: Examples

-- Example A: Simple CTE
-- Goal: Filter employees with high salaries first, then select from that filtered list.
WITH high_earners AS (
    SELECT * 
    FROM employees_cte 
    WHERE salary > 80000
)
SELECT name, department, salary 
FROM high_earners
ORDER BY salary DESC;


-- Example B: CTE vs Subquery
-- Task: Find the average salary of each department, then find departments above the company average.

-- Way 1: Subquery (Harder to read?)
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) as avg_salary
    FROM employees_cte
    GROUP BY department
) as dept_avgs
WHERE avg_salary > (SELECT AVG(salary) FROM employees_cte);

-- Way 2: CTE (Cleaner)
WITH department_stats AS (
    SELECT department, AVG(salary) as avg_dept_salary
    FROM employees_cte
    GROUP BY department
),
company_stats AS (
    SELECT AVG(salary) as avg_company_salary
    FROM employees_cte
)
SELECT d.department, d.avg_dept_salary
FROM department_stats d
JOIN company_stats c ON d.avg_dept_salary > c.avg_company_salary;


-- 3. PRACTICE EXERCISES

-- Exercise 1: Use a CTE to calculate the total sales for each agent.
-- Then, select agents whose total sales are greater than 2000.
-- Hint: PART 1 (CTE): Select agent_name, SUM(amount)... GROUP BY agent_name. PART 2: Select from CTE WHERE total > 2000.

WITH agent_sales AS (
    SELECT agent_name, SUM(amount) as total_sales
    FROM sales_cte
    GROUP BY agent_name
)
SELECT *
FROM agent_sales
WHERE total_sales > 2000;



-- Exercise 2: Find employees who earn MORE than the average salary of their own department.
-- Hint: Use a CTE to calculate avg salary per department (like Example B). 
-- Then JOIN the original employees_cte table with this CTE.

WITH dept_avg AS (
    SELECT department, AVG(salary) as avg_trans
    FROM employees_cte
    GROUP BY department
)
SELECT e.name, e.department, e.salary, d.avg_trans
FROM employees_cte e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_trans;



-- Exercise 3: (Challenge) Rank employees by salary within their department using a CTE.
-- Then select only the Top 1 earner in each department.
-- Hint: CTE should include RANK() OVER(PARTITION BY...).
-- Outer query should filter WHERE rank = 1.

WITH ranked_employees AS (
    SELECT name, department, salary,
           RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rank
    FROM employees_cte
)
SELECT name, department, salary
FROM ranked_employees
WHERE rank = 1;
