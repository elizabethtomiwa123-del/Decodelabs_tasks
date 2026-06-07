# Task 3: SQL Data Analysis

## Overview
This project focuses on querying the sales_data_3 database to extract key business metrics and perform data aggregation to support strategic decision-making.

## SQL Query Implementation

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


SELECT 
    ReferralSource, 
    COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM sales_data_3
GROUP BY ReferralSource
ORDER BY Unique_Customers DESC;


SELECT
  OrderStatus,
  COUNT(OrderID) AS Number_of_orders,
  ROUND(100.0 * COUNT(OrderID) / (SELECT COUNT(OrderID) FROM sales_data_3), 2) AS Percentage
FROM 
  sales_data_3
GROUP BY OrderStatus
ORDER BY Number_of_orders DESC;
