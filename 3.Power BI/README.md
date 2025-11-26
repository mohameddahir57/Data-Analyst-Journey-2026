
#  January 2026 — Power BI Complete 



# WEEK 1 — POWER BI BASICS

## Jan 1 — Install Power BI + Overview

**Topics:**

* What is Power BI?
* Power BI Desktop installation
* Understanding the interface

**Explanation:**
Power BI is a tool used to turn raw data into dashboards and insights.
You will learn the **3 main views**:

* **Report View** → for visuals
* **Data View** → to see tables
* **Model View** → create relationships

**Example:**
Import an Excel file and see how it appears in the Data View.



## Jan 2 — Import Data

**Topics:**

* Get Data
* Excel, CSV, Web, SQL
* Data types

**Explanation:**
Power BI can connect to almost any data source. Today you practice loading files.

**Example:**
Load `Sales.xlsx` and check:

* Date column → Date type
* Quantity → Whole Number
* Price → Decimal Number

Correcting data types is important for calculations.



## Jan 3 — Power Query Basics

**Topics:**

* Remove columns
* Filter rows
* Split columns
* Fill down
* Remove duplicates

**Explanation:**
Power Query is where you **clean your data** before building dashboards.

**Example:**
From a "Full Name" column, split into:

* First Name
* Last Name

Or remove customers with missing names.



## Jan 4 — Table Relationships

**Topics:**

* Fact tables vs Dimension tables
* One-to-many relationship
* Why relationships matter

**Explanation:**
Power BI links tables together so visuals work properly.
Today you understand which table should connect to which.

**Example:**
`Sales (Fact)` → connects to → `Products (Dimension)`
using `ProductID`.

One Product has many Sales → One-to-Many.



## Jan 5–7 — Mini Sales Dashboard

**Goal:** Build a small dashboard from your cleaned data.

**You will create:**

* Total Sales (Card)
* Sales by Category (Bar Chart)
* Sales Trend (Line Chart)
* Top 5 Products (Table)

**Learning:**
You combine everything from Week 1 into 1 simple project.



# **WEEK 2 — VISUALIZATIONS**

## Jan 8 — Bar & Line Charts

**Topics:**

* When to use Bar vs Column
* When to use Line charts
* Sorting, colors, labeling

**Example:**

* Bar chart: *Sales by Category*
* Line chart: *Sales by Month*



## Jan 9 — Tables & Matrices

**Topics:**

* Matrix rows, columns, values
* Table formatting
* Conditional formatting

**Example:**
Matrix:

* Rows: Product Category
* Columns: Year
* Values: Total Sales

Table:

* Product name
* Quantity
* Profit
  with color formatting for highest values.



## Jan 10 — Slicers & Filters

**Topics:**

* What is a slicer
* Page filters vs report filters
* How slicers control visuals

**Example:**
Add slicers for:

* Year
* Product category
* Country

Selecting “2024” updates all visuals instantly.



## Jan 11 — Cards & KPIs

**Topics:**

* KPI card
* Indicators
* Trend lines
* Setting goals

**Example:**
KPI:

* Value: Total Sales
* Target: 1M
* Status: Green if above target, Red if below



## Jan 12–14 — Customer Insights Dashboard

**You will build:**

* Customer segmentation
* Top customers
* Customer lifetime value
* Customer geography (map)

**Skills:**

* Combine multiple visuals
* Use slicers
* Improve layout and design



# WEEK 3 — DAX

## Jan 15 — Calculated Columns & Measures

**Topics:**

* Difference between the two
* When to use which
* Simple SUM, COUNT, AVERAGE

**Example:**
**Measure:**

```
Total Sales = SUM(Sales[Amount])
```

**Calculated Column:**

```
Profit = Sales[Price] - Sales[Cost]
```



## Jan 16 — CALCULATE & SUMX

**Topics:**

* CALCULATE() changes filter context
* SUMX iterates row by row

**Examples:**

```
Sales 2024 = CALCULATE(SUM(Sales[Amount]), Sales[Year] = 2024)
```

```
Total Profit = SUMX(Sales, Sales[Quantity] * Sales[ProfitPerUnit])
```



## Jan 17 — Row Context vs Filter Context

**Explanation:**
Row context = row-by-row
Filter context = after filters (slicers, visuals)

**Example:**
If you click “2023” slicer → filter context changes all visuals.



## Jan 18 — Time Intelligence

**Topics:**

* YTD
* MTD
* SamePeriodLastYear
* DateAdd

**Example:**

```
Sales YTD = TOTALYTD(SUM(Sales[Amount]), Dates[Date])
```



## Jan 19–21 — Revenue & Profit Dashboard

**You will create:**

* Revenue KPIs
* Profit trend
* Year-over-year comparison
* Time intelligence visuals



# WEEK 4 — FULL PORTFOLIO PROJECT

## Jan 22–31 — Build a Complete BI Dashboard

**Final Project Includes:**

* Clean data in Power Query
* Build a proper model (star schema)
* Create DAX measures
* Use slicers, KPIs, maps
* Build multiple pages
* Create insights
* Publish to Power BI Service

**Deliverables:**

* Power BI (.pbix) file
* Dashboard screenshots
* Portfolio description



