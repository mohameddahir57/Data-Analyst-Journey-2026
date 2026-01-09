# Jan 8 — Bar & Line Charts

## 🎯 Goal
Master the two most fundamental charts in data visualization:
1.  **Bar Charts**: For comparing categories (e.g., Sales by Product).
2.  **Line Charts**: For trends over time (e.g., Sales by Month).

## 1. Bar vs. Column Chart
They are the same thing, just rotated.
- **Column Chart (Vertical)**: Good for time (Years) or few categories.
- **Bar Chart (Horizontal)**: Good for long names (e.g., "Sony Wireless Noise Cancelling...").

**Best Practice:**
- Sort your bars! (Highest to Lowest).
- Don't use too many colors (stick to one color, highlight the max if needed).

## 2. Line Chart
- **X-axis**: Always Time (Day, Month, Year).
- **Y-axis**: The number you are measuring (Sales, Profit).
- **Legend**: Use to split the line (e.g., one line for 2024, one for 2025).

---

## 🛠️ Practical Exercise: Comparisons & Trends
I have created `Jan8_Visuals.csv`.

### Step 1: Load Data
1. Load `Jan8_Visuals.csv`.
2. Check `Date` is formatted as Date.
3. Check `Revenue` is a Number.

### Step 2: Create a Bar Chart (Comparison)
1. Select **Clustered Bar Chart** from visualizations.
2. **Y-Axis**: `Category`.
3. **X-Axis**: `Revenue`.
4. **Sort**: Click the 3 dots (...) on the visual > Sort Axis > Sort by Revenue (Descending).
   - *Result: easy to see which category creates the most money.*

### Step 3: Create a Line Chart (Trend)
1. Select **Line Chart**.
2. **X-Axis**: `Date`.
3. **Y-Axis**: `Revenue`.
4. **Legend**: Drag `Region` here.
   - *Result: You see 3-4 lines comparing how different regions performed over time.*

### Step 4: Formatting Challenge
1. Click the **Paintbrush** icon (Format visual).
2. **Data Labels**: Turn them On.
3. **Title**: Change it to "Revenue Trends by Region".
4. **Y-Axis**: Turn off the title if it's obvious.

## ✅ Checklist
- [ ] Created a sorted Bar Chart.
- [ ] Created a Line Chart with a Legend.
- [ ] Added Data Labels.
- [ ] Customized the Title.
