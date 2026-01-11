# Jan 11 — Cards & KPIs

## 🎯 Goal
Learn how to display "Headline Numbers" (Total Revenue, Total Profit) and track performance against a goal (KPI).

## 1. Card Visual
- The simplest visual.
- Shows ONE big number.
- Usage: Place 3-4 cards at the top of your dashboard (e.g., Total Sales, Total Transactions).

## 2. KPI Visual (Key Performance Indicator)
- Shows 3 things:
  1.  **Value**: What we achieved (e.g., $5M Sales).
  2.  **Trend**: Line chart behind the number.
  3.  **Target**: What we wanted (e.g., $4M Goal).
- **Color Coding**: Automatically turns Green (Good) or Red (Bad).

## 🛠️ Practical Exercise: Big Numbers
I have created `Jan11_KPI.csv`.

### Step 1: The "Big Number" (Card)
1. Select **Card** Visual (the one with `123` icon).
2. Drag `ActualSales` to Fields.
3. It shows a big number (e.g., "14K").
4. **Format**: Go to "Callout Value" and change the Display Units to "None" if you want to see the exact number.

### Step 2: Multi-Row Card
1. Select **Multi-row Card**.
2. Drag `Region`, `ActualSales`, `TargetGoal`.
3. It creates a grouped list of numbers. Good for summaries.

### Step 3: The KPI Visual
1. Select **KPI** Visual.
2. **Value**: Drag `ActualSales`.
3. **Trend Axis**: Drag `Month` (Date).
4. **Target**: Drag `TargetGoal`.

### Step 4: Interpret the KPI
- Look at the big number. Is it Green or Red?
- **Green** = Actual > Target.
- **Red** = Actual < Target.
- **Background**: The squiggly line shows the history over the months.

##  Checklist
- [ ] Created a standard Card.
- [ ] Created a Multi-row Card.
- [ ] Built a KPI visual with Value, Trend, and Target.
- [ ] Understood why the text turned Green or Red.


