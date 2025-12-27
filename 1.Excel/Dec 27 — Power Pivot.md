# Day 27: Power Pivot (The Data Model)

Standard Excel Tables are flat. Power Pivot lets you build a relational model inside Excel, connecting multiple tables without using a single VLOOKUP.

## 1. Concept: Fact vs. Dimension Tables
*   **Fact Table** (`Sales`): Contains transactions. Lots of rows, repeats ID numbers.
*   **Dimension Table** (`Products`): Contains details about those IDs. Unique list of Products.

**Goal**: Link them so you can analyze Sales by Product Name.

## 2. Loading Data to the Model
1.  **Data** > **Get Data** > **From Text/CSV**.
2.  Select `Dec 27 — Products.csv`.
3.  **Important**: Click the arrow next to "Load" and choose **Close & Load To...**
4.  Check **Only Create Connection**.
5.  Check **Add this data to the Data Model**.
6.  Repeat for `Dec 27 — Sales.csv`.

## 3. Creating Relationships
1.  Go to the **Power Pivot** tab (or **Data** > **Manage Data Model**).
2.  Click **Diagram View**.
3.  You will see two blocks: `Sales` and `Products`.
4.  Drag `ProductID` from the **Sales** table and drop it on `ProductID` in the **Products** table.
5.  A line appears connecting them. You have created a relationship!

## 4. Analyzing with a Pivot Table
1.  In the Power Pivot window, click **PivotTable**.
2.  Values: Drag `Quantity` from the **Sales** table.
3.  Rows: Drag `ProductName` from the **Products** table.
4.  **Magic**: It works! Excel knows which product name belongs to which sale ID because of the relationship.

## 5. Why is this better than VLOOKUP?
*   **Performance**: VLOOKUP is slow on big data. Relationships are instant.
*   **File Size**: No need to duplicate "Cement Bag" 500 times in your Sales sheet.
*   **Flexibility**: You can update the Product price in one place, and it flows through.

---

## Practice Steps
1.  Open valid empty Excel workbook.
2.  Import `Dec 27 — Products.csv` and `Dec 27 — Sales.csv` to the Data Model.
3.  Create the relationship.
4.  Create a Pivot Table showing **Total Quantity Sold by Category**.
