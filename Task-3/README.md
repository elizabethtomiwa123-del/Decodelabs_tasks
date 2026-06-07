# Task 3: SQL Data Analysis

## Overview
This project involves querying the sales_data_3 database to extract key business metrics and perform data aggregation to support strategic decision-making.

## SQL Queries

### 1. Revenue Performance Analysis
Business Goal: Financial breakdown of revenue by segmenting data based on order status (Delivered, Lost/Pipeline).

`sql
SELECT 
    ROUND(SUM(TotalPrice), 2) AS total_potential_revenue,
    ROUND(SUM(CASE WHEN OrderStatus = 'delivered' THEN TotalPrice ELSE 0 END), 2) AS realized_revenue,
    ROUND(SUM(CASE WHEN OrderStatus IN ('cancelled', 'returned') THEN TotalPrice ELSE 0 END), 2) AS total_lost_revenue,
    ROUND(SUM(CASE WHEN OrderStatus IN ('shipped', 'pending') THEN TotalPrice ELSE 0 END), 2) AS active_pipeline_revenue,
    ROUND(
        SUM(CASE WHEN OrderStatus IN ('cancelled', 'returned') THEN TotalPrice ELSE 0 END) / 
        NULLIF(SUM(TotalPrice), 0) * 100, 2
    ) AS loss_percentage
FROM sales_data_3;

 ### 2. Customer Acquisition by Referral Source
Business Goal: Identify effective marketing channels by analyzing the number of unique customers acquired through each referral source.

SELECT 
    ReferralSource, 
    COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM sales_data_3
GROUP BY ReferralSource
ORDER BY Unique_Customers DESC;


### 3. Order Status Distribution
Business Goal: Assess operational workflow health by determining the percentage of total orders in each status category.

SELECT
  OrderStatus,
  COUNT(OrderID) AS Number_of_orders,
  ROUND(100.0 * COUNT(OrderID) / (SELECT COUNT(OrderID) FROM sales_data_3), 2) AS Percentage
FROM 
  sales_data_3
GROUP BY OrderStatus
ORDER BY Number_of_orders DESC;
