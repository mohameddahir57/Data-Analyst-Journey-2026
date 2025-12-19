-- Dec 19 — Data Modeling (ERD Basics)
-- Scenario: Design a small schema for a Local Library.
-- Entities: Books, Authors, Members, Loans.

-- 1. SETUP: Clean Slate
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS members;

-- 2. CREATE PARENT TABLES first (tables that don't depend on others)

-- Authors Table
-- Relationship: One Author can write Many Books (1:N)
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INTEGER
);

-- Members Table
-- Relationship: One Member can have Many Loans (1:N)
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    join_date DATE
);

-- 3. CREATE CHILD TABLES (tables that have Foreign Keys)

-- Books Table
-- Foreign Key: author_id links to authors(author_id)
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT,
    published_year INTEGER,
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Loans Table (Transaction / Junction-like Table)
-- Relationship: Links Members and Books.
-- A Member can loan many books. A Book (copy) can be loaned many times over history.
-- This effectively creates a Many-to-Many relationship between Members and Books over time.
CREATE TABLE loans (
    loan_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- 4. INSERT DATA TO VERIFY RELATIONSHIPS

INSERT INTO authors (author_id, name) VALUES (1, 'J.K. Rowling'), (2, 'George Orwell');

INSERT INTO books (book_id, title, author_id) VALUES 
(101, 'Harry Potter 1', 1),
(102, 'Harry Potter 2', 1),
(103, '1984', 2);

INSERT INTO members (member_id, first_name, last_name) VALUES (1, 'Ali', 'Hassan');

-- Ali borrows 1984
INSERT INTO loans (loan_id, book_id, member_id, loan_date) VALUES (1, 103, 1, '2024-01-15');

-- 5. QUERY DATA (JOINING ACROSS THE MODEL)
-- Who borrowed which book and who wrote it?
SELECT m.first_name, b.title, a.name as author_name
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
JOIN authors a ON b.author_id = a.author_id;


-- 6. PRACTICE EXERCISES

-- Ex 1: Create a 'Publishers' table.
CREATE TABLE IF NOT EXISTS publishers (
    publisher_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT
);

-- Ex 2: Create a Many-to-Many Relationship for 'Categories'.
-- 1. Create 'categories' table
CREATE TABLE IF NOT EXISTS categories (
    category_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

-- 2. Create junction table 'book_categories'
CREATE TABLE IF NOT EXISTS book_categories (
    book_id INTEGER,
    category_id INTEGER,
    PRIMARY KEY (book_id, category_id), -- Composite PK
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Test insertion for Ex 2
INSERT INTO categories (category_id, name) VALUES (1, 'Fiction'), (2, 'Scifi'), (3, 'Adventure');
INSERT INTO book_categories (book_id, category_id) VALUES (101, 1), (101, 3), (103, 2); -- Harry Potter is Fiction/Adventure, 1984 is Scifi


-- Ex 3: Write a Query
-- Find all member names who have borrowed '1984'.
SELECT m.first_name, m.last_name
FROM members m
JOIN loans l ON m.member_id = l.member_id
JOIN books b ON l.book_id = b.book_id
WHERE b.title = '1984';
