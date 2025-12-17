/*
Dec 17 — Index Basics & Query Optimization
*/

-- 1. SETUP: Create a dummy table for testing
-- We will create a large-ish table of 'Users'
DROP TABLE IF EXISTS LargeUsers;

CREATE TABLE LargeUsers (
    UserID INTEGER PRIMARY KEY, -- Clustered Index created automatically here
    Username VARCHAR(50),
    Email VARCHAR(100),
    SignupDate DATE,
    Country VARCHAR(50),
    ReputationScore INT
);

-- Note: In a real scenario, we'd insert 100k+ rows to really see performance differences.
-- For this practice, we'll imagine this table is populated with 1 Million rows.
-- INSERT INTO LargeUsers ... (Skipped for brevity)

--------------------------------------------------------------------------------
-- 2. CREATE INDEX EXAMPLES
--------------------------------------------------------------------------------

-- Scenario: We frequently search for users by their Email addresses.
-- Query: SELECT * FROM LargeUsers WHERE Email = 'john.doe@example.com';
-- WITHOUT Index: Full Table Scan (Slow)
 
-- Create a Non-Clustered Index on Email
CREATE INDEX idx_users_email ON LargeUsers(Email);

-- NOW: The engine uses the index to find the row instantly.


-- Scenario: We frequently filter by Country and order by ReputationScore.
-- Query: SELECT * FROM LargeUsers WHERE Country = 'USA' ORDER BY ReputationScore DESC;

-- Create a Composite Index (Multi-column)
CREATE INDEX idx_users_country_reputation 
ON LargeUsers(Country, ReputationScore);

--------------------------------------------------------------------------------
-- 3. QUERY OPTIMIZATION & SARGABLE QUERIES
--------------------------------------------------------------------------------

/* 
   SARGABLE = Search ARGument ABLE (Can use the index)
   NON-SARGABLE = Cannot use the index efficiently
*/

-- EXAMPLE 1: Functions on columns
-- Bad (Non-Sargable): The DB has to calculate YEAR() for every single row.
SELECT * FROM LargeUsers WHERE YEAR(SignupDate) = 2023;

-- Good (Sargable): Compares the raw column data directly.
SELECT * FROM LargeUsers WHERE SignupDate >= '2023-01-01' AND SignupDate <= '2023-12-31';

-- EXAMPLE 2: Wildcards
-- Bad: Leading wildcard prevents B-Tree traversal.
SELECT * FROM LargeUsers WHERE Username LIKE '%Admin';

-- Good: Trailing wildcard allows index range scan.
SELECT * FROM LargeUsers WHERE Username LIKE 'Admin%';

-- 4. CLEANUP
DROP INDEX idx_users_email ON LargeUsers;
DROP TABLE LargeUsers;
