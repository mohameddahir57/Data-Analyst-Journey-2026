# Jan 17 — Row Context vs Filter Context

## 1. The Two Contexts
Understanding this separates beginners from pros.

### Row Context
*   **Definition**: "I know which row I am in right now."
*   **Where it exists**: Calculated Columns, Iterators (SUMX, FILTER).
*   **Limitation**: It does **not** know about other rows or filters automatically.

### Filter Context
*   **Definition**: "I know which data is currently visible/filtered."
*   **Where it exists**: Visuals, Measures, Slicers.
*   **Behavior**: It filters down the table *before* calculation starts.

## 2. Context Transition
This is the magic helper. When you use a **Measure** inside `CALCULATE` or other functions, DAX automatically turns the current Row Context into an equivalent Filter Context.

---

## 3. Exercises

### Part 1: Debugging Context
1.  Create a Calculated Column called `Wrong Total`.
    ```DAX
    Wrong Total = SUM('Jan15_DAX_Basics'[Quantity])
    ```
2.  Look at the data view.
    *   *Observation*: It shows the Grand Total (e.g., 36) on **every single row**.
    *   *Why?* `SUM` is an aggregation function. It only respects **Filter Context**. In a calculated column, there is no Filter Context (no slicers selected), so it sees the whole table. It ignores the **Row Context**.

### Part 2: Fixing with Context Understanding
1.  If you wanted a running total or specific row total in a column, you'd need unique identifiers or logic that respects the row.
2.  However, creating a **Measure** `Total Sales = SUM(Quantity)` looks at the visual's filters (Category = "Electronics") and calculates correctly.

### Part 3: The EARLIER Function (Concept)
*   *Note: `EARLIER` is old-school DAX. Variables (`VAR`) are better now, but you might see it.*
*   It refers to the "previous" row context loop.
*   **Task**: Just read about `VAR`.
    ```DAX
     Profit Margin = 
     VAR CurrentSales = [Total Sales Sold]
     VAR CurrentCost = [Total Profit Value] -- assuming we meant cost here, or just math
     RETURN
     DIVIDE(CurrentCost, CurrentSales)
    ```
    *Variables store a value (static) which helps performance and readability.*

---

## 4. Key Takeaway
*   If your number is the same on every row of a table visual, you probably lost your Filter Context.
*   If your number is the Grand Total in a column, you are trying to Aggregating without Context.
