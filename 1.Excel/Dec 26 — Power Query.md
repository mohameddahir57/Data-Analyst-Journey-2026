# Day 26: Power Query (Get & Transform)

Stop using formulas like `LEFT`, `RIGHT`, `FIND` to clean data. Power Query records your cleanup steps and lets you replay them on new data with one click context.

## 1. Importing Data
1.  Go to the **Data** tab.
2.  Click **Get Data** (or **From Text/CSV**).
3.  Select `Dec 26 — Raw Telecom Data.csv`.
4.  Click **Transform Data** (Important! Do NOT click Load yet).

## 2. The Power Query Interface
*   **Center**: Data preview.
*   **Left**: Queries (Tables).
*   **Right**: **Applied Steps**. This is the magic. Every click is recorded here.

## 3. Cleaning the "Messy" Telecom Data
Follow these steps to clean the file:

### Step A: Fix Header Issues
The first two rows contain report metadata ("REPORT GENERATED..."), not data.
1.  **Home** > **Remove Rows** > **Remove Top Rows** > Type `2`.
2.  Now "ID", "Customer_Info" are in row 1.
3.  **Home** > **Use First Row as Headers**.

### Step B: Remove Junk Rows
There are blank rows in the data.
1.  Click the arrow on the `ID` column.
2.  Uncheck `(null)` or `(blank)`.
3.  Click OK.

### Step C: Split Columns
"Customer_Info" has Name and City combined (e.g., "Ahmed Ali - Mogadishu").
1.  Select `Customer_Info` column.
2.  **Home** > **Split Column** > **By Delimiter**.
3.  Select **Custom** and type ` - ` (space dash space).
4.  Click OK.
5.  Rename columns to `Name` and `City`.

### Step D: Split Usage Data
"Usage_Data" has "50GB | 200min".
1.  Select `Usage_Data`.
2.  **Split Column** > **By Delimiter**.
3.  Use ` | ` (space pipe space).
4.  Rename to `Data_GB` and `Voice_Min`.

### Step E: Fix Dates
Power Query is smart, but sometimes needs help.
1.  Select `Join_Date`.
2.  Right-click column header > **Change Type** > **Date**.
3.  Replace Errors (if any): Right-click > **Remove Errors** (or fix them manually in source).

## 4. Loading Data
Once clean:
1.  **Home** > **Close & Load**.
2.  Excel creates the clean table in a new sheet.

---

## Why Power Query?
*   **Repeatable**: Next month, when you get a new "Messy" file, just overwrite the old CSV and click **Data > Refresh All**. Excel reapplies all steps automatically!
*   **Auditable**: You can see exactly what changed in the "Applied Steps" list.
