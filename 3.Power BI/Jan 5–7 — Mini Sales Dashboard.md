# Jan 5–7 — Mini Sales Dashboard

## 🎯 Goal
Combine everything you've learned in Week 1 (Import, Clean, Model) to build your first complete dashboard.

## 📅 The Plan
- **Day 5**: Import & Clean data.
- **Day 6**: Build the Data Model (Relationships).
- **Day 7**: Design Visuals & Finalize Layout.

---

## 🛠️ The Project Brief
You are the analyst for a small electronics retailer. The manager wants a single-page report showing:
1.  **Total Sales** & **Total Quantity** sold.
2.  **Sales by Region** (Which region is best?).
3.  **Top Selling Products**.
4.  **Sales Trend** over time (Are we growing?).

### The Data
I have provided two files:
1.  `Jan5_Sales.csv` (Transactions).
2.  `Jan5_Products.csv` (Product details).

---

## 🚀 Step-by-Step Guide

### Step 1: Import & Prepare (Day 5)
1.  **Get Data**: Load `Jan5_Sales.csv` and `Jan5_Products.csv`.
2.  **Transform (Power Query)**:
    - Check data types (Price, Quantity = Numbers; Date = Date).
    - Are there any blank rows? Remove them.
    - *Bonus*: If the "Region" column looks messy (e.g., "North " vs "North"), fix it using "Trim" or "Replace Values".
3.  **Close & Apply**.

### Step 2: Data Modeling (Day 6)
1.  Go to **Model View**.
2.  Connect `Products` (Dimension) to `Sales` (Fact) using `ProductID`.
3.  Ensure it is a **One-to-Many** relationship.
4.  *Self-Check*: Create a quick table with `ProductName` and `Total Sales` to make sure the numbers aren't repeating.

### Step 3: Visuals & Design (Day 7)
Go to **Report View** and build the following:

#### 1. KPI Cards (Heads-up Numbers)
- Create a **Card Visual** for `SalesAmount` (Sum).
- Create a **Card Visual** for `Quantity` (Sum).

#### 2. Bar Chart (Categorical Comparison)
- **Axis**: `Region`.
- **Values**: `SalesAmount`.
- *Question: Which region is winning?*

#### 3. Line Chart (Trend)
- **Info**: We want to see sales over time.
- **X-Axis**: `Date`.
- **Y-Axis**: `SalesAmount`.

#### 4. Table (Detailed View)
- Columns: `ProductName`, `Category`, `SalesAmount`.
- Sort by SalesAmount to see the top sellers.

#### 5. Slicer (Interactivity)
- Add a **Slicer** for `Category` (Electronics, Accessories, etc.).
- Try clicking "Electronics" and watch the whole dashboard update!

## ✅ Checklist
- [ ] Data Cleaned in Power Query.
- [ ] Model created (Sales connected to Products).
- [ ] 4 Visuals Created (Cards, Bar, Line, Table).
- [ ] Slicer added for filtering.
