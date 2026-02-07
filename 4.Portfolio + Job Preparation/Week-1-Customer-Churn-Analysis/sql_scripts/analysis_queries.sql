-- SQL Script for Week 1: Customer Churn Analysis

-- 1. Create the table schema
CREATE TABLE IF NOT EXISTS customer_churn (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    ServiceType VARCHAR(50),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges DECIMAL(10, 2),
    Churn VARCHAR(5)
);

-- 2. Basic Analysis Queries
-- Calculate overall churn rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_percentage
FROM customer_churn;

-- Average monthly charges for churned vs retained
SELECT 
    Churn, 
    AVG(MonthlyCharges) AS avg_monthly_charges
FROM customer_churn
GROUP BY Churn;

-- Churn by service type
SELECT 
    ServiceType, 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY ServiceType;
