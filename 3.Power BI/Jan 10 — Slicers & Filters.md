# Jan 10 — Slicers & Filters

## 🎯 Goal
Learn how to make your report **interactive**. Instead of static charts, let the user choose what they want to see.

## 1. Slicers
- Visual buttons on the page.
- User clicks "2026" -> All charts update to show only 2026 data.
- **Common Slicers**: Date Range, Country, Category.

## 2. Filters Pane
- Hidden panel on the right.
- **Visual Filter**: Filters ONLY the selected chart.
- **Page Filter**: Filters everything on this page.
- **Report Filter**: Filters every page in the entire file.

---

## 🛠️ Practical Exercise: Making it Interactive
I have created `Jan10_Interactivity.csv`.

### Step 1: Build Basics
1. Load data.
2. Create a **Bar Chart** (`Sales` by `Country`).
3. Create a **Table** (`Date`, `Product`, `Sales`).

### Step 2: Add a Slicer (Text)
1. Click blank space. Select **Slicer** visual.
2. Drag `Category` into it.
3. You now see checkboxes (Electronics, Furniture, etc.).
4. Click "Furniture". Watch your Bar Chart and Table shrink to show only furniture!

### Step 3: Add a Date Slicer
1. Add another **Slicer**.
2. Drag `Date` into it.
3. Power BI detects it's a date and gives you a **Range Slider**.
4. Drag the slider to shorten the time period. Watch the table update.

### Step 4: The "Filters Pane" (Hidden Power)
1. Click on your **Bar Chart**.
2. Look at the **Filters** pane (next to Visualizations).
3. Drag `Sales` into "Filters on this visual".
4. Set it to **"Is greater than 1000"**.
5. Apply. Now your chart removes small sales, *without* the user needing to click anything.

## ✅ Checklist
- [ ] Added a Category Slicer (Checkboxes).
- [ ] Added a Date Slicer (Slider).
- [ ] Verified that clicking slicers updates other charts.
- [ ] Used the Filters Pane to hide small data.
