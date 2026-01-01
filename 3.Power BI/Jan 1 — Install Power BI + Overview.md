# Jan 1 — Install Power BI + Overview

##  Goal
Understand what Power BI is, install the desktop version, and get familiar with the interface so you can start importing data.

## 1. What is Power BI?
Power BI is a collection of software services, apps, and connectors that work together to turn your unrelated sources of data into coherent, visually immersive, and interactive insights.

- **Power BI Desktop**: A free Windows application we will use to build reports.
- **Power BI Service**: An online SaaS (Software as a Service) service for publishing and sharing.
- **Power BI Mobile**: Apps for Windows, iOS, and Android.
  
## 2. Installation
If you haven't installed it yet:
1.  Go to the [Microsoft Store](ms-windows-store://pdp/?productid=9NTXR16HNW1T) (Recommended for automatic updates) or download from the [web](https://powerbi.microsoft.com/en-us/desktop/).
2.  Install and launch **Power BI Desktop**.
3.  Sign in (optional for Desktop, but required for sharing). You can click "Cancel" or "X" on the sign-in prompt to just use the Desktop app.

## 3. Understanding the Interface (The "Big Three" Views)
On the left sidebar, you will see three main icons. These are your workspace views:

###  1. Report View
This is the default view where you build your visuals.
- **Canvas**: The big white space where you drag charts.
- **Visualizations Pane**: Choose chart types (Bar, Line, Pie, etc.).
- **Data Pane**: Your tables and columns appear here.

###  2. Table View (Data View)
Looks like Excel. You see the actual data rows and columns here.
- Useful for checking if data loaded correctly.
- You cannot edit cells here (unlike Excel), but you can view them.

### 🔗 3. Model View
Shows your tables as blocks with lines connecting them.
- This is where you manage **Relationships** between tables (e.g., connecting a `Sales` table to a `Products` table).

##  Practical Exercise: First Import
Let's test the interface by loading a simple file.

### Step 1: Get Data
I have created a simple file for you called `Jan1_Data.csv` in this folder.
1.  Open Power BI Desktop.
2.  On the **Home** ribbon, click **Get Data** > **Text/CSV**.
3.  Navigate to this folder and select `Jan1_Data.csv`.
4.  Click **Load** (Don't click "Transform Data" just yet, we will do that later).

### Step 2: Explore the Views
Once loaded:
1.  **Report View**: Look at the "Data" pane on the right. Expand the `Jan1_Data` table to see columns like `Date`, `Product`, `Sales`.
2.  **Table View**: Click the table icon on the left. Do you see the rows of data?
3.  **Model View**: Click the diagram icon. Since we only have one table, it will be a single box.

### Step 3: Create Your First Visual
1.  Go back to **Report View**.
2.  Drag the `Product` column onto the white canvas.
3.  Drag the `Sales` column onto the same list.
4.  Power BI should automatically create a table or chart showing Sales by Product.

##  Checklist
- [x] Power BI Desktop is installed.
- [x] I can navigation between Report, Table, and Model views.
- [x] I successfully loaded the practice CSV.

