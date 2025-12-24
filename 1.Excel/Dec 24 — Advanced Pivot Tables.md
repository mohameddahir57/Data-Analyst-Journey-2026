# Day 24: Advanced Pivot Tables

Move beyond basic summarization. Learn to group data dynamically, create your own formulas *inside* the pivot table, and show values as percentages.

## 1. Grouping Data
You can group text, numbers, and dates.
*   **Dates**: Drag a Date field to Rows. Right-click any date > **Group**. Select Months, Quarters, or Years.
*   **Numbers**: Right-click a number (like Age) > **Group**. Set "By" to 10 to create age bins (20-29, 30-39).
*   **Text**: Select multiple items (Ctrl+Click) > Right-click > **Group**. Good for grouping specific regions (e.g., Banadir + Puntland = "Mega Markets").

## 2. Calculated Fields
Need to calculate `Profit` but only have `Sales` and `Cost`? You don't need to add a column to your source data.
1.  Click inside the Pivot Table.
2.  Go to **PivotTable Analyze** tab > **Fields, Items, & Sets** > **Calculated Field**.
3.  Name it `Profit`.
4.  Formula: `= Sales - Cost`.
5.  Click OK.

## 3. Show Values As...
Instead of just "Sum of Sales", show context.
1.  Right-click the values column.
2.  **Show Values As**:
    *   **% of Grand Total**: Market share.
    *   **% of Column Total**: Contribution to that month/category.
    *   **Difference From**: Growth from previous month.
    *   **Running Total**: Cumulative sum year-to-date.

---

## Practice Exercises

**Setup**:
1.  Open `Dec 24 — Advanced Pivot Tables.csv`.
2.  Insert a Pivot Table on a new sheet.

### Exercise 1: Grouping by Month & Quarter
*   **Goal**: Analyze Sales trends over time.
*   **Action**:
    1.  Drag `Date` to Rows and `Sales` to Values.
    2.  Right-click any date > **Group**.
    3.  Select **Months** AND **Quarters**.
    4.  See how Excel creates a hierarchy.

### Exercise 2: Calculated Field (Profit Margin)
*   **Goal**: Calculate the Profit for each Region.
*   **Action**:
    1.  Drag `Region` to Rows.
    2.  Create a Calculated Field named `Profit` (`= Sales - Cost`).
    3.  Observe the new column.

### Exercise 3: % of Total Sales
*   **Goal**: Which Region contributes the most?
*   **Action**:
    1.  Drag `Sales` to Values *again* (so you have it twice).
    2.  Right-click the second Sales column > **Show Values As** > **% of Grand Total**.
    3.  Identify which Somali region has the highest percentage.

### Exercise 4: Slicers & Timelines
*   **Goal**: Filter interactively.
*   **Action**:
    1.  **PivotTable Analyze** > **Insert Slicer** > Check `Region`.
    2.  **PivotTable Analyze** > **Insert Timeline** > Check `Date`.
    3.  Use the Timeline to show only "Q1" (Jan-Mar) sales.
