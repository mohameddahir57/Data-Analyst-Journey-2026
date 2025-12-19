# Dec 19 — Data Modeling (ERD Basics)

Data Modeling is the process of defining how data is stored, connected, and structured. It's the blueprint for your database. We use **Entity Relationship Diagrams (ERD)** to visualize this.

## 1. Core Concepts
- **Entity**: A real-world object (e.g., Customer, Product, Order). Becomes a **Table**.
- **Attribute**: A characteristic of an entity (e.g., Customer Name, Price). Becomes a **Column**.
- **Relationship**: How entities interact (e.g., A Customer *places* an Order). Becomes a **Foreign Key** or a **Junction Table**.

## 2. Keys
- **Primary Key (PK)**: A unique identifier for a specific row (e.g., `customer_id`). Cannot be NULL.
- **Foreign Key (FK)**: A field that links to the Primary Key of another table. This creates the relationship.

## 3. Relationships (Cardinality)
### One-to-One (1:1)
One record in Table A relates to exactly one record in Table B.
- *Example*: User <-> UserProfile (if separated for security).
- *Implementation*: PK of one table is also the FK in the other.

### One-to-Many (1:N)
One record in Table A relates to multiple records in Table B. **Most common.**
- *Example*: Author (1) <-> Books (N). One author writes many books.
- *Implementation*: Put the `author_id` (FK) inside the `Books` table.

### Many-to-Many (N:M)
Multiple records in Table A relate to multiple records in Table B.
- *Example*: Students <-> Classes. A student takes many classes; a class has many students.
- *Implementation*: Requires a **Junction Table** (or bridge table) in the middle, containing `student_id` and `class_id`.

## 4. Normalization Basics
Normalization is organizing data to reduce redundancy and improve integrity.
- **1NF (First Normal Form)**: No repeating groups. Each cell contains a single value. (e.g., Don't store "Red,Blue,Green" in one 'color' column).
- **2NF**: Must be in 1NF + all non-key columns depend on the *entire* primary key.
- **3NF**: Must be in 2NF + no transitive dependencies (columns shouldn't depend on other non-key columns).

## 5. PRACTICE EXERCISES

### Exercise 1: Create a 'Publishers' table.
- It should have at least: publisher_id (PK) and name.
- Hints:
- CREATE TABLE publishers ...


### Exercise 2: Create a Many-to-Many Relationship for 'Categories'.
- A Book can belong to many Categories (Fiction, Adventure).
- A Category can have many Books.
- Steps:
- 1. Create a 'categories' table (category_id, name).
- 2. Create a junction table 'book_categories' with (book_id, category_id).


### Exercise 3: Write a Query
- Find all member names who have borrowed '1984'.
- Hint: Join Members -> Loans -> Books.