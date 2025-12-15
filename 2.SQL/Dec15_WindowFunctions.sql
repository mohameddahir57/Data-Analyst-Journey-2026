-- Dec 15 — Window Functions (OVER, PARTITION BY)
-- SQL Advanced: Analytics without collapsing rows

-- 1. SETUP (Run this to create the practice environment)
CREATE TABLE IF NOT EXISTS employees_window (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER,
    hire_date DATE
);

CREATE TABLE IF NOT EXISTS sales_window (
    sale_id INTEGER PRIMARY KEY,
    agent_name TEXT,
    amount INTEGER,
    sale_date DATE
);

-- Clear old data
DELETE FROM employees_window;
DELETE FROM sales_window;

-- Insert Data
INSERT INTO employees_window (name, department, salary, hire_date) VALUES 
('Alice', 'Engineering', 120000, '2021-01-15'),
('Bob', 'Engineering', 100000, '2021-06-01'),
('Charlie', 'Sales', 70000, '2022-02-10'),
('David', 'Sales', 85000, '2021-11-20'),
('Eve', 'Engineering', 120000, '2020-03-05'),
('Frank', 'HR', 60000, '2023-01-10'),
('Grace', 'Sales', 70000, '2022-05-15');

INSERT INTO sales_window (agent_name, amount, sale_date) VALUES
('Charlie', 500, '2023-01-01'),
('Charlie', 1500, '2023-01-05'),
('David', 2000, '2023-01-02'),
('David', 500, '2023-01-08'),
('Grace', 300, '2023-01-03'),
('Charlie', 200, '2023-01-10'),
('David', 1000, '2023-01-15');


-- 2. LEARNING: Examples

-- Example A: OVER() with no arguments (The "Whole Table" Window)
-- Goal: Show every employee alongside the Average Salary of ALL employees.
SELECT name, salary, 
       CAST(AVG(salary) OVER() AS INTEGER) as avg_company_salary
FROM employees_window;


-- Example B: PARTITION BY
-- Goal: Show every employee alongside the Average Salary of THEIR Department.
SELECT name, department, salary,
       CAST(AVG(salary) OVER(PARTITION BY department) AS INTEGER) as avg_dept_salary
FROM employees_window;


-- Example C: ORDER BY (Ranking)
-- Goal: Rank employees by salary from highest to lowest.
SELECT name, salary,
       RANK() OVER(ORDER BY salary DESC) as salary_rank
FROM employees_window;


-- Example D: ORDER BY and PARTITION BY (Ranking within groups)
-- Goal: Rank employees by salary WITHIN their own department.
SELECT name, department, salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_rank
FROM employees_window;


-- Example E: Running Total (Cumulative Sum)
-- Goal: Calculate a running total of sales amounts over time.
SELECT sale_date, agent_name, amount,
       SUM(amount) OVER(ORDER BY sale_date) as running_total
FROM sales_window;


-- 3. PRACTICE EXERCISES

-- Exercise 1: Assign a unique ID (Row Number) to each employee, ordered by Hire Date (newest first).
-- Hint: Use ROW_NUMBER().
SELECT name, hire_date,
       ROW_NUMBER() OVER(ORDER BY hire_date DESC) as row_num
FROM employees_window;


-- Exercise 2: Compare each employee's salary to the Maximum salary in their department.
-- Hint: Use MAX() with PARTITION BY.
SELECT name, department, salary,
       MAX(salary) OVER(PARTITION BY department) as max_dept_salary
FROM employees_window;


-- Exercise 3: Calculate the Running Total of sales for EACH agent separately, ordered by sale date.
-- Hint: Partition by agent_name, Order by sale_date.
SELECT agent_name, sale_date, amount,
       SUM(amount) OVER(PARTITION BY agent_name ORDER BY sale_date) as agent_running_total
FROM sales_window;


-- Exercise 4: Find the top 2 highest paid employees in EACH department.
-- Hint: You might need a CTE (Common Table Expression) or Subquery to filter the result of RANK() <= 2.
SELECT * FROM (
    SELECT name, department, salary,
           RANK() OVER(PARTITION BY department ORDER BY salary DESC) as rank
    FROM employees_window
) 
WHERE rank <= 2;


-- Exercise 5: (Challenge) Calculate the percentage of the department's total salary that each employee earns.
-- Hint: salary / SUM(salary) OVER(PARTITION BY department)
SELECT name, department, salary,
       salary * 100.0 / SUM(salary) OVER(PARTITION BY department) as pct_of_dept_total
FROM employees_window;
