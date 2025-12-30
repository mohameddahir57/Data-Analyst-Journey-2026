# Day 28: Intro to DAX (Data Analysis Expressions)

DAX is the formula language behind Power Pivot (and Power BI). It allows you to create powerful calculations that change dynamically based on your filters.

## 1. Setup (The Data Model)
Before writing DAX, ensure you have multiple tables loaded into the Data Model and related (like in Day 27).
1.  Import `Dec 28 — DAX Sales.csv` and `Dec 28 — DAX Services.csv`.
2.  Link them on `ServiceID` in the Diagram View.

## 2. Calculated Columns vs. Measures
*   **Calculated Column**: Computes a value for *every row* in your table. Looks like Excel formulas.
    *   *Usage*: Only when you need to filter or group by the result (e.g., "High Value Order").
    *   *Formula*: `Total Cost = Sales[Quantity] * 5`
*   **Measure**: Computes a value *on demand* (aggregate) based on the current context (filters).
    *   *Usage*: For any numerical analysis (Sales, Profit, Ratio). **Use Measures 99% of the time.**
    *   *Formula*: `Total Qty = SUM(Sales[Quantity])`

## 3. Essential DAX Functions

### A. RELATED
Fetches a value from a related table (similar to VLOOKUP).
*   **Scenario**: Get the `RatePerKg` from the Services table into the Sales table.
*   **Calculated Column**:
    ```dax
    = RELATED('DAX Services'[RatePerKg])
    ```

### B. SUMX (Iterator)
Multiplies two columns row-by-row and then sums them up.
*   **Scenario**: Calculate Total Revenue (Quantity * Rate).
*   **Measure**:
    ```dax
    Total Revenue = SUMX(Sales, Sales[Quantity] * RELATED('DAX Services'[RatePerKg]))
    ```

### C. CALCULATE (The King of DAX)
Changes the filter context for a calculation. "Calculate the Sum of Quantity, BUT only for Air Cargo."
*   **Measure**:
    ```dax
    Air Cargo Quantity = CALCULATE(SUM(Sales[Quantity]), 'DAX Services'[ServiceName] = "Air Cargo")
    ```

### D. TIME INTELLIGENCE
Compare data to previous periods easily.
*   **Measure**:
    ```dax
    Sales Last Year = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Calendar'[Date]))
    ```

---

## Practice Exercises

**Setup**:
1.  Load the CSVs into Power Pivot.
2.  Create Relationship on `ServiceID`.

### Exercise 1: Create a Measure for Total Quantity
1.  Go to Power Pivot > **Measures** > **New Measure**.
2.  Name: `TotalQty`.
3.  Formula: `= SUM('DAX Sales'[Quantity])`.
4.  Test it in a Pivot Table.

### Exercise 2: Revenue Calculation (SUMX)
1.  Create a Measure named `Revenue`.
2.  Formula: `= SUMX('DAX Sales', 'DAX Sales'[Quantity] * RELATED('DAX Services'[RatePerKg]))`.
3.  Analyze Revenue by Region.

### Exercise 3: Filtered Measure (CALCULATE)
1.  Create a Measure named `Mogadishu Revenue`.
2.  Formula: `= CALCULATE([Revenue], 'DAX Sales'[Region] = "Mogadishu Port")`.
3.  Compare `Revenue` vs `Mogadishu Revenue` side-by-side.
