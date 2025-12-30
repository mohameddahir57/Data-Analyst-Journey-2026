# Capstone Project: Business Dashboard

**Scenario**: You are the Lead Data Analyst for **Somali National Trading Co.** The CEO wants a high-level dashboard to track sales performance against targets for each regional office.

## Data Sources
1.  **Sales Data** (`Project — Dashboard Sales.csv`): Daily transaction records.
2.  **Targets** (`Project — Dashboard Targets.csv`): Yearly revenue goals for each branch.

## Your Mission

### Phase 1: Data Preparation (Power Query)
1.  Import both files into Excel using **Data > Get Data**.
2.  Check for data quality (ensure currency columns are numbers, dates are dates).
3.  Load both tables to the **Data Model** (Select "Only Create Connection" + "Add to Data Model").

### Phase 2: Data Modeling (Power Pivot)
1.  Go to **Power Pivot > Diagram View**.
2.  Create a relationship between the tables using **BranchID**.

### Phase 3: Calculations (DAX)
1.  Create a Measure for **Total Sales**:
    ```dax
    Total Sales = SUM('Project — Dashboard Sales'[Revenue])
    ```
2.  Create a Measure for **Target Amount**:
    ```dax
    Target Amount = SUM('Project — Dashboard Targets'[YearlyTarget])
    ```
3.  Create a KPI Measure for **Performance %**:
    ```dax
    Achievement % = DIVIDE([Total Sales], [Target Amount], 0)
    ```

### Phase 4: Visualization (Dashboards)
1.  Create a **Pivot Chart** showing **Total Sales by Region**.
2.  Create a Card (or simple Pivot) showing the overall **Achievement %**.
3.  Add a **Slicer** for `Product` to see how different categories are performing.
4.  Arrange them into a clean, professional dashboard sheet.

## Deliverable
A fully functional Excel Workbook with a dynamic dashboard that allows the CEO to filter by Product and see which Regional Offices are hitting their targets.
