# Jan 15 — Calculated Columns & Measures

## 1. What is DAX?
**DAX** stands for **Data Analysis Expressions**. It is the formula language used in Power BI, Power Pivot, and Analysis Services. 

Think of DAX like Excel formulas, but much more powerful for working with relational data and dynamic contexts.

## 2. Calculated Columns vs. Measures
This is the **most important** concept to learn first.

| Feature | Calculated Columns | Measures |
| :--- | :--- | :--- |
| **Calculation Time** | Calculated **row-by-row** when data is loaded/refreshed. | Calculated **on the fly** when used in a visual. |
| **Storage** | Stored in RAM (increases file size). | stored only as logic (does not increase file size). |
| **Context** | **Row Context**: knows the current row's values. | **Filter Context**: knows the current filters in the report (slicers, visuals). |
| **Use Case** | When you need to filter/slice by the result (e.g., 'High Value' vs 'Low Value' category). | For numerical aggregations (Total Sales, Profit Margin, YTD). |
| **Best Practice** | Use sparingly. | Use for almost all numerical analysis. |

---

## 3. Basic Syntax & Math Operators
The syntax is very similar to Excel:
`New Measure Name = FUNCTION(Table[Column])`

*   `+` (Add)
*   `-` (Subtract)
*   `*` (Multiply)
*   `/` (Divide)

---

## 4. Basic Aggregation Functions
These work exactly like Excel but iterate over a column in a table.

*   `SUM(Table[Column])` - Adds up all values in the column.
*   `AVERAGE(Table[Column])` - Averages the column.
*   `COUNT(Table[Column])` - Counts numerical values.
*   `DISTINCTCOUNT(Table[Column])` - Counts unique values.

---

## 5. Exercises

### Part 1: Import Data
1.  Open Power BI Desktop.
2.  Get Data > Text/CSV > Select `Jan15_DAX_Basics.csv`.
3.  Load the data directly (it's clean).

### Part 2: Calculated Columns (Row Context)
We want to calculate the specific profit for **each individual transaction**.

1.  Go to **Data View** (2nd icon on left sidebar).
2.  Right-click on the simpler `Sales` table (or whatever it's named) > **New Column**.
3.  **Revenue Column**:
    ```DAX
    Total Revenue = 'Jan15_DAX_Basics'[Quantity] * 'Jan15_DAX_Basics'[UnitPrice]
    ```
4.  **Cost Column**:
    ```DAX
    Total Cost = 'Jan15_DAX_Basics'[Quantity] * 'Jan15_DAX_Basics'[Cost]
    ```
5.  **Profit Column**:
    ```DAX
    Profit = 'Jan15_DAX_Basics'[Total Revenue] - 'Jan15_DAX_Basics'[Total Cost]
    ```
    *Notice how these fill 100% of the rows instantly.*

### Part 3: Measures (Filter Context)
Now we want to see the totals on our report canvas.

1.  Go to **Report View** (1st icon).
2.  Right-click the table name in the Data pane > **New Measure**.
3.  **Total Sales Soles**:
    ```DAX
    Total Sales Sold = SUM('Jan15_DAX_Basics'[Quantity])
    ```
4.  **Total Value Measures**:
    ```DAX
    Total Revenue Value = SUM('Jan15_DAX_Basics'[Total Revenue])
    ```
    *(Note: We are SUM-ing the column we just made)*
5.  **Profit Measure**:
    ```DAX
    Total Profit Value = SUM('Jan15_DAX_Basics'[Profit])
    ```

### Part 4: Testing Context
1.  Create a **Matrix** visual.
2.  Drag `Category` to Rows.
3.  Drag `Total Profit Value` (Measure) to Values.
4.  Drag `Profit` (Calculated Column) to Values (choose "Sum" if it doesn't auto-sum).
    *   *They look the same? Yes, usually. But Measures are dynamic.*
5.  Add a **Slicer** with `Product`.
6.  Click "Laptop".
    *   *Notice how the Measure updates instantly based on the filter context.*

---

## 6. Key Takeaway
*   **Columns** are for **Data** (filtering, categorizing).
*   **Measures** are for **Math** (aggregating, analyzing).
