# Jan 16 — CALCULATE & SUMX

## 1. The CALCULATE Function
`CALCULATE` is the most powerful function in DAX. It is the **only** function that can modify the filter context.

### Syntax
`CALCULATE(Expression, [Filter1], [Filter2], ...)`

*   **Expression**: The measure or calculation you want to evaluate (e.g., `[Total Sales]`).
*   **Filters**: conditions that override the current context.

### Why is it useful?
Imagine you want to calculate "Sales for Red Products Only" regardless of what the user has selected in a slicer.

## 2. The SUMX Function (Iterators)
`SUM` adds up a column. `SUMX` goes row-by-row, performs a calculation, and *then* adds up the results.

### Syntax
`SUMX(Table, Expression)`

*   **Table**: The table to iterate over.
*   **Expression**: The math to do on each row.

*Recall Jan 15: We made a calculated column for `Revenue` then `SUM`-ed it. `SUMX` lets us do that in one step without the extra column!*

---

## 3. Exercises

### Part 1: Using CALCULATE
1.  Open your Power BI file from Jan 15.
2.  Create a new Measure: **Electronics Sales**.
    ```DAX
    Electronics Sales = CALCULATE([Total Sales Sold], 'Jan15_DAX_Basics'[Category] = "Electronics")
    ```
3.  Test it:
    *   Create a card visually.
    *   It should show the total for Electronics only.
    *   Now create a slicer for Category. Select "Furniture".
    *   *Result*: The normal `[Total Sales Sold]` card changes to Furniture numbers. The `[Electronics Sales]` card **stays the same** (or goes blank if the filter conflicts heavily, but conceptually it overrides).
    *   *Actually, standard CALCULATE replaces context. So if you pick Furniture, and the measure forces Electronics, you might get blank (intersection is empty) or overwrite depending on "ALL" usage. For simple basics, just observe it calculating specific logic.*

4.  Create a Measure: **All Sales (Ignore Filters)**.
    ```DAX
    All Sales = CALCULATE([Total Sales Sold], ALL('Jan15_DAX_Basics'))
    ```
    *`ALL` removes filters.*

5.  Create a Measure: **% of Total**.
    ```DAX
    % of Total = DIVIDE([Total Sales Sold], [All Sales])
    ```
    *Show this in a matrix. It gives you the percentage share of each category.*

### Part 2: Using SUMX
1.  Create a Measure: **Total Revenue (SUMX)**.
    ```DAX
    Total Revenue SUMX = SUMX('Jan15_DAX_Basics', 'Jan15_DAX_Basics'[Quantity] * 'Jan15_DAX_Basics'[UnitPrice])
    ```
2.  Compare this to your `SUM(Column)` measure. They should be identical.
    *   *Benefit: You can delete the Calculated Column now to save file size!*

---

## 4. Key Takeaway
*   **CALCULATE**: Changes **WHERE** (which subset of data) we are calculating.
*   **SUMX**: Changes **HOW** (row-by-row logic) we are calculating.
