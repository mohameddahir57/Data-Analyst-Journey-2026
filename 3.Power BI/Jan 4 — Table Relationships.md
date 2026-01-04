# Jan 4 — Table Relationships

## 🎯 Goal
Understand how to link multiple tables together (Data Modeling) so you can slice and dice data from different sources.

## 1. The Concept: Fact vs. Dimension tables
Instead of having one giant table with everything repeated, we split data into efficient tables.

### 🏭 Fact Table (The "Transactions")
- Contains numbers (Sales, Quantity, Profit).
- Very long (millions of rows).
- Has duplicates (e.g., Product ID 101 sold many times).
- Example: `Sales_Table`

### 🏷️ Dimension Table (The "Lookup")
- Contains descriptions (Product Name, Customer Name, Address).
- Short (thousands of rows).
- **Unique keys** (Product ID 101 appears only once).
- Example: `Products_Table`, `Customers_Table`

## 2. Relationships
We connect the **Fact Table** to the **Dimension Table** using a common column (Key).
- **Common Type:** One-to-Many (*).
- One Product (from Dimension table) -> Sold Many times (in Fact table).

---

## 🛠️ Practical Exercise: Building a Simple Model
I have created two files: `Jan4_Sales.csv` (Fact) and `Jan4_Products.csv` (Dimension).

### Step 1: Load Both Tables
1. **Get Data** > `Jan4_Sales.csv` > Load.
2. **Get Data** > `Jan4_Products.csv` > Load.

### Step 2: Go to Model View
1. Click the **Model View** icon (the third one on the left sidebar).
2. You will see two boxes:`Jan4_Sales` and `Jan4_Products`.

### Step 3: Create the Relationship
Power BI might auto-detect it. If not:
1. Drag `ProductID` from the **Products** table...
2. ...and drop it on top of `ProductID` in the **Sales** table.
3. You should see a line connect them with a `1` on one side and a `*` on the other. This is a **One-to-Many** relationship.

### Step 4: Verify in Report View
1. Go to **Report View**.
2. Create a Table visual.
3. Drag `ProductName` from the **Products** table.
4. Drag `Quantity` from the **Sales** table.
5. If the relationship works, you will see the correct quantity sold for each product name!
   - *If it didn't work, you'd just see the same total numbers repeated for every row.*

## ✅ Checklist
- [ ] Loaded Sales and Products tables.
- [ ] Connected them via `ProductID`.
- [ ] Verified the relationship works in a visual.
