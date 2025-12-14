# Dec 14 — Project: Customer Purchase Analysis

## Overview
This is the **Capstone Project** for Week 2 ("SQL Foundations"). You will apply everything you've learned so far to analyze a dataset for a fictional e-commerce store called **"GlobalMart"**.

## The Data
You will be working with 4 related tables:
1.  **Customers**: `customer_id`, `name`, `country`, `email`
2.  **Products**: `product_id`, `name`, `category`, `price`
3.  **Orders**: `order_id`, `customer_id`, `order_date`, `total_amount`
4.  **Order_Items**: `item_id`, `order_id`, `product_id`, `quantity`

## Objectives
1.  **Revenue Analysis**: Understand where money is coming from (Country, Product Category).
2.  **Customer Insights**: Identify VIP customers and inactive users.
3.  **Product Performance**: Find best-sellers and slow-moving inventory.

## Project Questions
Write queries to answer the following:

### Part 1: Basic Analysis (Select, Where, Order By)
1.  List all **Electronics** products that cost more than $500.
2.  Find the top 3 most expensive orders (show `order_id`, `order_date`, `total_amount`).

### Part 2: Aggregation & Grouping (Count, Sum, Group By)
3.  Calculate the total revenue generated from **EACH country**.
4.  Count how many new customers joined (or placed their first order) in 2023 vs 2024 (Hint: extracting year might differ by DB, but safe to assume string format 'YYYY-MM-DD'). *Alternatively: Count orders per year.*

### Part 3: Joins & Multi-Table Analysis
5.  List customers who have **NEVER** placed an order. (Hint: `LEFT JOIN` or `NOT EXISTS`).
6.  Find the **Best Selling Product** (by total quantity sold).

### Part 4: Advanced (Subqueries & Complex Logic)
7.  Find customers who have spent **more than the average** customer.
8.  (Challenge) List the name of every customer who bought a 'Laptop'.
