# Dec 13 — Aggregation

## Focus
Today is about solidifying your knowledge of **Aggregation** (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) combined with **Grouping** (`GROUP BY`), **Filtering Groups** (`HAVING`), and **Data Retrieval** from multiple tables (`JOIN`).

## Core Concepts Review
1.  **Aggregate Functions**: Summarize data (e.g., `SUM(total)`).
2.  **GROUP BY**: Groups rows sharing a property so aggregates apply per group.
3.  **HAVING**: Filters the *results* of the aggregation (e.g., `HAVING SUM(total) > 1000`).
4.  **JOIN**: Connects related data (e.g., Customers + Orders) before aggregating.

## Practice Scenario: Library Management
We will use a Library scenario with `books`, `members`, and `loans`.

## PRACTICE EXERCISES

Exercise 1: Count how many books belong to each genre.
- Expected: Novel: 2, Historical: 2, Romance: 1, Poetry: 1

Exercise 2: Find members who have borrowed total of more than 1 book (history of loans).
- Hint: Count loan_ids per member_id in the loans table.

Exercise 3: Which genre has been borrowed the most times?
- Hint: Join books and loans, group by genre, order by count descending.

Exercise 4:Find the total number of books currently NOT returned (Active Loans) per member.
- Hint: return_date is NULL.

