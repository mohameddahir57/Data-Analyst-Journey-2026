# Jan 12–14 — Customer Insights Dashboard

## 🎯 Goal
Build a dashboard focused on **Customer Behavior**.
Unlike the "Sales Dashboard" (Week 1), this one needs to look deeper: *Who* is buying, *Where* are they, and *How much* do they spend?

## 📅 The Plan
- **Day 12**: Import & Data Model (Customers + Sales).
- **Day 13**: Create Visuals (Maps, Slicers, Matrices).
- **Day 14**: Formatting & Polishing (Themes, Titles, Colors).

## 🛠️ The Project Brief
The Marketing Director wants to know:
1.  **Total Customers** & **Total Revenue**.
2.  **Top 5 Customers** by Spend.
3.  **Sales by Country** (Map Visual).
4.  **Sales by Membership Level** (Gold vs Silver).

### The Data
I have provided:
1.  `Jan12_Customers.csv` (Dimension: Name, Country, Level).
2.  `Jan12_Sales.csv` (Fact: Date, CustomerID, Amount).
   
## 🚀 Step-by-Step Guide

### Step 1: Model Setup (Day 12)
1.  Load both files.
2.  **Model View**: Connect `Customers` to `Sales` via `CustomerID`.
3.  **Check**: Is it One-to-Many? (One Customer, Many Purchases).

### Step 2: Visuals (Day 13)
#### 1. The Headers
- **Card**: Sum of `Amount` (Revenue).
- **Card**: Count Distinct of `CustomerID` (Total Customers). *Right-click the field > Count (Distinct).*

#### 2. The Map
- Select **Map** visual.
- **Location**: `Country`.
- **Bubble Size**: `Amount`.
- *Result: Big bubbles where you sell the most.*

#### 3. Top Customers
- Select **Bar Chart**.
- **Y-Axis**: `CustomerName`.
- **X-Axis**: `Amount`.
- **Filter**: Use the "Filters Pane" to show only "Top N" items (Top 5).

#### 4. Membership Analysis
- Select **Pie Chart** or **Donut Chart**.
- **Legend**: `MembershipLevel` (Gold, Silver, Bronze).
- **Values**: `Amount`.

### Step 3: Polish (Day 14)
1.  **Insert > Text Box**: Add a big title "Global Customer Report 2026".
2.  **View > Themes**: Try a predefined theme (e.g., "Solar" or "Storm").
3.  **Slicers**: Add a slicer for `Year` or `Country` to make it interactive.

## ✅ Checklist
- [ ] Data Model Connected.
- [ ] Count Distinct used for "Total Customers".
- [ ] Map Visual created.
- [ ] "Top 5" Filter applied to a bar chart.
- [ ] Theme applied for professional look.

