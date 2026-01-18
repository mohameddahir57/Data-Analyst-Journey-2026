# Jan 18 — Time Intelligence

## 1. Prerequisites
Time Intelligence functions **REQUIRE** a proper Date Table.
*   Must have contiguous dates (no gaps).
*   Must cover the full year (Jan 1 to Dec 31) for standard calculations.

## 2. Common Functions
*   `TOTALYTD(Measure, 'Date'[Date])`: Year-to-Date total.
*   `SAMEPERIODLASTYEAR('Date'[Date])`: Returns the same dates but 1 year back.
*   `DATEADD('Date'[Date], -1, MONTH)`: Shifts dates by N intervals.

## 3. Exercises

### Part 1: Setup
1.  Import `Jan18_Time_Data.csv`.
2.  **Create a Date Table** (Quick way for practice):
    *   Modeling > New Table.
    *   `Dates = CALENDAR(DATE(2022,1,1), DATE(2024,12,31))`
3.  **Mark as Date Table**: Right-click table > Mark as Date Table > Select 'Date' column.
4.  **Create Relationship**: Join `Jan18_Time_Data[Date]` to `Dates[Date]`.

### Part 2: Calculations
1.  Create basic measure: `Total Sales = SUM('Jan18_Time_Data'[Sales])`.
2.  **YTD Sales**:
    ```DAX
    Sales YTD = TOTALYTD([Total Sales], 'Dates'[Date])
    ```
3.  **Last Year Sales**:
    ```DAX
    Sales LY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Dates'[Date]))
    ```
4.  **Growth Calculation**:
    ```DAX
    Sales Growth = [Total Sales] - [Sales LY]
    ```

### Part 3: Visualize
1.  Create a Table visual.
2.  Add `Dates[Year]` and `Dates[Month]`.
3.  Add `[Total Sales]`, `[Sales LY]`, and `[Sales Growth]`.
4.  Notice how 2022 shows empty for "Sales LY" (because 2021 doesn't exist). 2023 compares to 2022 exactly.

## 4. Key Takeaway
*   Never rely on auto-date/time for serious models. Build a dedicated Date table.
