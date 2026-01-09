# Jan 9 — Tables & Matrices

## 🎯 Goal
Understand the difference between a simple **Table** and a **Matrix** (Pivot Table) to display detailed numbers effectively.

## 1. Table Visual
- Just like an Excel sheet.
- Displays rows of data.
- Good for looking at exact details (e.g., a list of 100 transactions).
- **Pro Tip:** Use "Conditional Formatting" (Data Bars / Background Color) to make it readable.

## 2. Matrix Visual
- Similar to an **Excel Pivot Table**.
- It bundles (groups) data.
- You have **Rows** (Hierarchy), **Columns**, and **Values**.
- Allows you to "Drill Down" (click a + button to see details).

---

## 🛠️ Practical Exercise: Table vs Matrix
I have created `Jan9_MatrixData.csv`.

### Step 1: Create a Simple Table
1. Select **Table** visual.
2. Drag `Region`, `Product`, `Sales`.
3. It just lists them. Sort by `Sales` to see the highest.

### Step 2: Create a Matrix (The Pivot)
1. Select **Matrix** visual.
2. **Rows**: Drag `Region` and then `Product` (place Product *below* Region).
3. **Values**: Drag `Sales`.
4. **Columns**: Drag `Year`.

### Step 3: Experiencing "Drill Down"
1. Look at your Matrix. You should see just Regions (North, South, etc.) and their totals.
2. See the little text "North" with a `+` sign (or click the "Expand" arrows in the header).
3. Click it! It opens up to show the Products *inside* that Region.
   - *This is unique to the Matrix visual.*

### Step 4: Add Heat
1. With Matrix selected, go to **Format** (Paintbrush).
2. **Cell elements** > Turn on **Background color**.
3. Now high numbers are Dark Blue, low numbers are Light Blue.
   - *Instant Heatmap!*

## ✅ Checklist
- [ ] Created a Table visual.
- [ ] Created a Matrix with a hierarchy (Region > Product).
- [ ] Used Drill Down (+) to expand a level.
- [ ] Added Conditional Formatting (Heatmap).
