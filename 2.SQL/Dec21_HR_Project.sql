-- Dec 21 — Project: Employee HR Dataset Analysis

-- 1. SETUP: Schema Cleaning
DROP TABLE IF EXISTS performance_reviews;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 2. CREATE TABLES

CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT
);

CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dept_id INTEGER,
    hire_date DATE,
    salary REAL,
    manager_id INTEGER, -- Self-referencing FK
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE performance_reviews (
    review_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    review_date DATE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5), -- 1=Poor, 5=Excellent
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- 3. INSERT DATA

-- Departments
INSERT INTO departments (dept_id, name, location) VALUES
(1, 'Engineering', 'Mogadishu'),
(2, 'Sales', 'Hargeisa'),
(3, 'HR', 'Mogadishu'),
(4, 'Marketing', 'Bosaso');

-- Employees
-- Managers
INSERT INTO employees (emp_id, first_name, last_name, dept_id, hire_date, salary, manager_id) VALUES
(1, 'Asha', 'Ali', 1, '2020-01-15', 150000, NULL),
(2, 'Bile', 'Hassan', 2, '2020-03-01', 140000, NULL);

-- Staff
INSERT INTO employees (emp_id, first_name, last_name, dept_id, hire_date, salary, manager_id) VALUES
(3, 'Cumar', 'Dhuule', 1, '2021-06-01', 95000, 1),      -- Engineering, Reports to Asha
(4, 'Daud', 'Farah', 1, '2022-02-15', 88000, 1),       -- Engineering, Reports to Asha
(5, 'Ebyan', 'Gedi', 1, '2020-08-20', 110000, 1),       -- Engineering, Reports to Asha
(6, 'Farah', 'Warsame', 2, '2023-01-10', 65000, 2),    -- Sales, Reports to Bile
(7, 'Geedi', 'Abdi', 2, '2023-05-05', 62000, 2),       -- Sales, Reports to Bile
(8, 'Hibo', 'Yusuf', 3, '2021-11-01', 70000, NULL),    -- HR
(9, 'Idriss', 'Omar', 1, '2024-05-01', 45000, 5),      -- Eng Intern, reports to Ebyan
(10, 'Jamilah', 'Kheyre', 4, '2024-02-20', 80000, NULL); -- Marketing

-- Reviews
INSERT INTO performance_reviews (review_id, emp_id, review_date, rating) VALUES
(1, 3, '2023-12-01', 5), -- Cumar
(2, 4, '2023-12-05', 4), -- Daud
(3, 5, '2023-12-10', 5), -- Ebyan
(4, 6, '2024-01-15', 3), -- Farah
(5, 7, '2024-01-20', 4), -- Geedi
(6, 3, '2022-12-01', 4), -- Cumar (Previous review)
(7, 9, '2024-06-01', 5); -- Idriss

-- 4. PROJECT QUESTIONS
-- Write your queries below each question.

-- Q1. Count the number of employees in each department.
SELECT d.name, COUNT(e.emp_id) as total_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.name;


-- Q2. Find the AVERAGE salary per department.
SELECT d.name, AVG(e.salary) as avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.name;


-- Q3. List the top 3 highest-paid employees in the entire company.
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 3;


-- Q4. Find employees who have a performance rating of 5 (Excellent).
SELECT e.first_name, e.last_name, r.rating, r.review_date
FROM employees e
JOIN performance_reviews r ON e.emp_id = r.emp_id
WHERE r.rating = 5;


-- Q5. Find the highest-paid employee IN EACH DEPARTMENT.
-- Hint: Use a Window Function like RANK() OVER (PARTITION BY ... ORDER BY ... DESC).
WITH RankedSalaries AS (
    SELECT 
        first_name, 
        last_name, 
        dept_id, 
        salary, 
        RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as rank
    FROM employees
)
SELECT d.name as department, rs.first_name, rs.last_name, rs.salary
FROM RankedSalaries rs
JOIN departments d ON rs.dept_id = d.dept_id
WHERE rs.rank = 1;


-- Q6. Calculate the difference between each employee's salary and their department's average salary.
-- Hint: CTE or Window Function AVG() OVER (PARTITION BY ...).
SELECT 
    e.first_name, 
    e.last_name, 
    e.salary, 
    d.name, 
    e.salary - AVG(e.salary) OVER (PARTITION BY e.dept_id) as diff_from_avg
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;


-- Q7. List employees hired in 2024.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '2024%';


-- Q8. List Employee Name and their Manager's Name.
-- Hint: Self Join on employees table (e1.manager_id = e2.emp_id).
SELECT 
    e.first_name || ' ' || e.last_name as employee, 
    m.first_name || ' ' || m.last_name as manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;


-- Q9. Calculate the total salary cost for the 'Engineering' department.
SELECT SUM(e.salary) as total_eng_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.name = 'Engineering';


-- Q10. (Challenge) Find employees who have more than 1 review.
SELECT e.first_name, e.last_name, COUNT(r.review_id) as review_count
FROM employees e
JOIN performance_reviews r ON e.emp_id = r.emp_id
GROUP BY e.emp_id
HAVING COUNT(r.review_id) > 1;
