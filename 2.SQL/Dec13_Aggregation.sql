-- Dec 13 — Aggregation Practice
-- Scenario: Library Management System

-- 1. SETUP
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER PRIMARY KEY,
    title TEXT,
    author TEXT,
    genre TEXT,
    published_year INTEGER
);

CREATE TABLE IF NOT EXISTS members (
    member_id INTEGER PRIMARY KEY,
    name TEXT,
    join_date DATE
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE,
    return_date DATE -- NULL if not returned
);

-- Clear old data
DELETE FROM books;
DELETE FROM members;
DELETE FROM loans;

-- Insert Data
-- Insert Data
INSERT INTO books (title, author, genre, published_year) VALUES 
('From a Crooked Rib', 'Nuruddin Farah', 'Novel', 1970),
('Sweet and Sour Milk', 'Nuruddin Farah', 'Novel', 1979),
('Black Mamba Boy', 'Nadifa Mohamed', 'Historical', 2010),
('The Orchard of Lost Souls', 'Nadifa Mohamed', 'Historical', 2013),
('Ignorance is the Enemy of Love', 'Faarax M.J. Cawl', 'Romance', 1974),
('Selected Poems', 'Hadraawi', 'Poetry', 1993);

INSERT INTO members (name, join_date) VALUES 
('Idil Xasan', '2023-01-10'),
('Sharmaarke Cabdi', '2023-02-15'),
('Fartuun Axmed', '2023-03-20'),
('Khadar Geedi', '2023-05-01');

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES 
(1, 1, '2023-06-01', '2023-06-15'), -- Idil borrowed From a Crooked Rib
(2, 1, '2023-06-20', NULL),         -- Idil borrowed Sweet and Sour Milk (Not Returned)
(5, 2, '2023-07-01', '2023-07-10'), -- Sharmaarke borrowed Ignorance is the Enemy of Love
(6, 2, '2023-07-15', NULL),         -- Sharmaarke borrowed Selected Poems (Not Returned)
(1, 3, '2023-08-01', '2023-08-14'), -- Fartuun borrowed From a Crooked Rib
(3, 4, '2023-08-05', NULL),         -- Khadar borrowed Black Mamba Boy (Not Returned)
(5, 1, '2023-09-01', NULL);         -- Idil borrowed Ignorance is the Enemy of Love (Not Returned)


-- 2. PRACTICE EXERCISES

-- Exercise 1: Count how many books belong to each genre.
-- Expected: Novel: 2, Historical: 2, Romance: 1, Poetry: 1
SELECT genre, COUNT(*) as book_count
FROM books
GROUP BY genre;


-- Exercise 2: Find members who have borrowed total of more than 1 book (history of loans).
-- Hint: Count loan_ids per member_id in the loans table.
SELECT m.name, COUNT(l.loan_id) as total_loans
FROM members m
JOIN loans l ON m.member_id = l.member_id
GROUP BY m.name
HAVING COUNT(l.loan_id) > 1;


-- Exercise 3: Which genre has been borrowed the most times?
-- Hint: Join books and loans, group by genre, order by count descending.
SELECT b.genre, COUNT(l.loan_id) as borrow_count
FROM books b
JOIN loans l ON b.book_id = l.book_id
GROUP BY b.genre
ORDER BY borrow_count DESC
LIMIT 1;


-- Exercise 4:Find the total number of books currently NOT returned (Active Loans) per member.
-- Hint: return_date is NULL.
SELECT m.name, COUNT(l.loan_id) as active_loans
FROM members m
JOIN loans l ON m.member_id = l.member_id
WHERE l.return_date IS NULL
GROUP BY m.name;
