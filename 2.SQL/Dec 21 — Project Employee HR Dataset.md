# Dec 21 — Project: Employee HR Dataset Analysis (Capstone)

**Welcome to final SQL challenge!**

You have been hired as a Data Analyst for **TechCorp**, a growing software company. The HR Director needs your help to analyze employee performance, salary distribution, and department statistics.

You will use **all** the skills you've learned so far:
- Joins (Inner, Left, Self)
- Aggregations (Group By, Having)
- Window Functions (Rank, Avg over Partition)
- CTEs (Common Table Expressions)

## The Dataset
We will create a schema with 3 tables:

1.  **Departments** (`dept_id`, `name`, `location`)
2.  **Employees** (`emp_id`, `name`, `dept_id`, `hire_date`, `salary`, `manager_id`)
3.  **Performance_Reviews** (`review_id`, `emp_id`, `review_date`, `rating`)

## The Mission
Open `Dec21_HR_Project.sql` and write the queries to answer the following questions:

1.  **Headcount**: Count the number of employees in each department.
2.  **Salary Analysis**: Find the average salary per department.
3.  **Top Earners**: List the top 3 highest-paid employees in the entire company.
4.  **Performance**: Find employees who have a performance rating of 5 (Excellent).
5.  **Department Top**: Find the highest-paid employee **in each department** (Use a Window Function).
6.  **Salary Gap**: Calculate the difference between each employee's salary and their department's average salary.
7.  **New Hires**: List employees hired in 2024.
8.  **Manager Check**: List Employee Name and their Manager's Name (Self Join).
9.  **Budget**: Calculate the total salary cost for the 'Engineering' department.
10. **Consistent Performers**: (Challenge) Find employees who have more than 1 review.



# PROJECT QUESTIONS
## Write your queries below each question.

### Q1. Count the number of employees in each department.
- Hint: Join Departments and Employees, then Group By.


### Q2. Find the AVERAGE salary per department.


### Q3. List the top 3 highest-paid employees in the entire company.


### Q4. Find employees who have a performance rating of 5 (Excellent).


### Q5. Find the highest-paid employee IN EACH DEPARTMENT.
- Hint: Use a Window Function like RANK() OVER (PARTITION BY ... ORDER BY ... DESC).


### Q6. Calculate the difference between each employee's salary and their department's average salary.
- Hint: CTE or Window Function AVG() OVER (PARTITION BY ...).


### Q7. List employees hired in 2024.


### Q8. List Employee Name and their Manager's Name.
- Hint: Self Join on employees table (e1.manager_id = e2.emp_id).


### Q9. Calculate the total salary cost for the 'Engineering' department.


### Q10. (Challenge) Find employees who have more than 1 review.

Good luck!
