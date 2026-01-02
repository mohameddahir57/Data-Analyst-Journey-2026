# Jan 2 — Import Data

##  Goal
Learn how to connect Power BI to different data sources (Excel, CSV, Web) and check data types.

## 1. "Get Data" - The Connectors
Power BI can connect to 100+ sources. The most common ones are:
- **Excel Workbook**: For `.xlsx` files.
- **Text/CSV**: For simple comma-separated files.
- **Web**: To scrape tables from a website.
- **SQL Server**: For enterprise databases.

## 2. The Importance of Data Types
When you load data, Power BI guesses the data type (Text, Number, Date). If it guesses wrong, your charts won't work.

**Common Types:**
- **Decimal Number** (12.50) → For prices, revenue.
- **Whole Number** (10) → For quantity, age.
- **Date/Time** (1/1/2026) → For trend analysis.
- **Text** ("Apple") → For names, categories.

> ** Crucial:** You cannot sum a "Text" column. If your Sales column is formatted as Text, Power BI won't let you calculate total sales.

---

##  Practical Exercise: Loading & Checking
We will load a file and check if Power BI reads it correctly.

### Step 1: Load the Data
I have created a file called `Jan2_Sales.csv` (simulating an Excel export).
1. Go to **Home** > **Get Data** > **Text/CSV**.
2. Select `Jan2_Sales.csv`.
3. Click **Load**.

### Step 2: Check Data Types in Table View
1. Go to the **Table View** (sidebar icon 2).
2. Click on the `Jan2_Sales` table.
3. Select the **SalesAmount** column.
4. Look at the top ribbon under **Column Tools** > **Data type**.
   - Does it say *Decimal Number* or *Fixed Decimal Number*? (Good )
   - Does it say *Text*? (Bad  - We need to fix this later).

### Step 3: Check the Date
1. Select the **OrderDate** column.
2. Check the **Data type**. It should be *Date* or *Date/Time*.
3. Change the **Format** to something readable like `Short Date` (e.g., *3/14/2001*).

### Step 4: Simple Visualization
1. Go to **Report View**.
2. Drag `OrderDate` to the axis.
3. Drag `SalesAmount` to values.
4. Does it show a line/bar chart over time? If yes, your data types are correct!

##  Checklist
- [ ] Loaded `Jan2_Sales.csv`.
- [ ] Verified `SalesAmount` is a Number.
- [ ] Verified `OrderDate` is a Date.
- [ ] Created a chart using both fields.

