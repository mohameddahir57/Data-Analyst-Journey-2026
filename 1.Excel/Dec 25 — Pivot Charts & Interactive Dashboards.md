# Day 25: Pivot Charts & Interactive Dashboards

Dashboards give a high-level view of your data. Today, we turn Pivot Tables into visual Pivot Charts and connect them with Slicers for an interactive experience.

## 1. Creating a Pivot Chart
A Pivot Chart is like a regular chart, but it's linked to a Pivot Table.
1.  Click inside your Pivot Table.
2.  Go to **PivotTable Analyze** > **PivotChart**.
3.  Select a chart type (Column, Line, Pie, etc.).
4.  Click OK.

*Note: If you filter the Pivot Table, the Chart updates (and vice-versa).*

## 2. Best Practices for Dashboards
*   **Keep it Simple**: Don't clutter with too many charts. 3-4 key metrics is often enough.
*   **Consistency**: Use the same color scheme.
*   **Layout**: Place the most important chart at the top left.
*   **Remove Clutter**: Hide Field Buttons on the chart (Right-click button > **Hide All Field Buttons on Chart**) for a cleaner look.

## 3. Connecting Slicers (The Magic)
By default, a Slicer only filters the Pivot Table it was created from. You can make ONE Slicer control MULTIPLE Pivot Charts.
1.  Create multiple Pivot Tables and Charts (e.g., Sales by City, Sales by Product).
2.  Insert a Slicer (e.g., for "Payment Method").
3.  Right-click the Slicer > **Report Connections**.
4.  Check the boxes for *all* the Pivot Tables you want to filter.
5.  Click OK. Now, clicking "EVC Plus" updates ALL charts instantly!

---

## Step-by-Step Dashboard Project

**Setup**:
1.  Open `Dec 25 — Dashboard Data.csv`.
2.  Data contains sales for branches in Mogadishu, Hargeisa, and Kismayo.

### Step 1: Prepare the Pivot Tables
1.  **Pivot 1**: Total Sales by **City** (Rows: City, Values: Sum of Total).
2.  **Pivot 2**: Sales over Time (Rows: Date [Grouped by Month], Values: Sum of Total).
3.  **Pivot 3**: Sales by **Product Line** (Rows: Product Line, Values: Sum of Total).
    *   *Tip: Place these on a sheet named "Calc_Sheet".*

### Step 2: Create Pivot Charts
1.  For **Pivot 1**, insert a **Column Chart** (Sales by City).
2.  For **Pivot 2**, insert a **Line Chart** (Sales Trend).
3.  For **Pivot 3**, insert a **Bar Chart** (Top Products).
4.  Cut (Ctrl+X) and Paste (Ctrl+V) these charts onto a new sheet named "**Dashboard**".

### Step 3: Clean Up
1.  Align the charts nicely.
2.  Right-click buttons on charts > **Hide All Field Buttons**.
3.  Add Chart Titles (e.g., "Performance by City").

### Step 4: Add Interactivity
1.  Click any chart > **Insert Slicer** > Select **Payment** and **CustomerType**.
2.  Place Slicers on the side.
3.  **Crucial Step**: Right-click "Payment" Slicer > **Report Connections** > Check all 3 Pivot Tables. Repeat for "CustomerType".

### Step 5: Test It!
*   Click "EVC Plus" on the slicer. Watch all three charts update to show only mobile money sales!
