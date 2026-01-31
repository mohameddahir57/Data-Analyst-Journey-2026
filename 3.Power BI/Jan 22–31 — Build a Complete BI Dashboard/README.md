# Global E-Commerce Executive Dashboard

## 📊 Project Overview
This project is a comprehensive Business Intelligence dashboard built using **Power BI**. It provides a high-level overview of global sales performance, profitability, and customer insights for a fictional e-commerce company.

## 📂 Project Structure
*   **`data/`**: Contains the source CSV files.
    *   `Orders.csv`: Transactional sales data (Fact Table).
    *   `Products.csv`: Product details (Dimension Table).
    *   `Customers.csv`: Customer demographics (Dimension Table).
    *   `Regions.csv`: Geographic data (Dimension Table).
*   **`images/`**: Target design screenshots.
    *   `executive_summary.png`
    *   `product_performance.png`
    *   `customer_insights.png`
*   **`README.md`**: This file.

## 🛠️ Tech Stack
*   **Power BI Desktop**: Main tool for modeling and visualization.
*   **Power Query**: Data cleaning and transformation.
*   **DAX (Data Analysis Expressions)**: Advanced calculations.

## 🚀 Getting Started

### 1. Data Import & Modeling
1.  Open **Power BI Desktop**.
2.  Import all CSV files from the `data/` directory.
3.  Establish relationships in the **Model View** (Star Schema):
    *   `Orders[ProductID]` ↔ `Products[ProductID]`
    *   `Orders[CustomerID]` ↔ `Customers[CustomerID]`
    *   `Orders[RegionID]` ↔ `Regions[RegionID]`

### 2. Implementation Checklist
- [ ] Create a `Calendar` table for time intelligence.
- [ ] Write DAX measures (Total Revenue, Profit, Margin, YoY Growth).
- [ ] Build the **Executive Summary** page.
- [ ] Build the **Product Performance** page.
- [ ] Build the **Customer Insights** page.

## 🎨 Dashboard Design
Below are the target designs for each page of the project:

### Executive Summary
![Executive Summary](images/executive_summary.png)

### Product Performance
![Product Performance](images/product_performance.png)

### Customer Insights
![Customer Insights](images/customer_insights.png)

## 📜 Key DAX Measures
```dax
Total Revenue = SUM(Orders[Revenue])
Total Profit = SUM(Orders[Revenue]) - SUM(Orders[Cost])
Profit Margin = DIVIDE([Total Profit], [Total Revenue], 0)
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Calendar'[Date]))
Revenue YoY % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY], 0)
```

*This project is part of the **Data Analyst Journey 2026** curriculum (Week 4 Portfolio Project).*
