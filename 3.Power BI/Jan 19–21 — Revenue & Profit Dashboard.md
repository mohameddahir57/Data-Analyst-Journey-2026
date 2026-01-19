# Jan 19–21 — Revenue & Profit Dashboard Project

## 1. Objective
Build a complete dashboard answering:
1.  How are we performing against Targets?
2.  What is our Year-over-Year growth?
3.  Who are our top products?

## 2. Requirements

### Data Model
*   Load `Jan19_Project_Data.csv`.
*   Create a `Dates` table (Jan 1, 2023 to Dec 31, 2024).
*   Join `Dates[Date]` to `Sales[Date]`.

### DAX Measures Needed
1.  **Total Revenue**: `SUM(Quantity * UnitPrice)` (Use SUMX).
2.  **Total Target**: `SUM(Target)`.
3.  **Revenue LY**: Revenue for Same Period Last Year.
4.  **YoY Growth %**: `DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])`.
5.  **Target Achievement %**: `DIVIDE([Total Revenue], [Total Target])`.

### Visuals
1.  **KPI Cards**:
    *   Total Revenue (with Trend Axis)
    *   YoY Growth % (Conditional Formatting: Red if negative, Green if positive)
    *   Target Achievement %
2.  **Bar Chart**: Revenue by Region.
3.  **Line Chart**: Revenue vs Target by Month.
4.  **Matrix**: Product Category breakdown with Sparklines.

## 3. Advanced Challenge (Optional)
*   **RankX**: Create a measure to rank products by Revenue.
    `Rank = RANKX(ALL('Sales'[Product]), [Total Revenue])`
*   Filter the visual to show only Top 5.

## 4. Deliverable
*   Save file as `Week3_Project.pbix`.
*   Take a screenshot of your dashboard.
