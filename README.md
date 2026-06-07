# DecodeLabs-Internship
Repository for my data analytics internship projects at DecodeLabs, featuring Exploratory Data Analysis (EDA) and Power BI dashboards."


## Week 1: Data Cleaning Project
In this week, I performed data cleaning on the internship dataset. Key accomplishments:
* Handled null values in the `CouponCode` column by replacing them with "None".
* Converted the `Date` column data type to "Date" format for chronological analysis.
* Extracted Year, Month, and Day components for detailed reporting.
* Verified data integrity using Column Quality checks in Power Query.

---

## Week 2: Exploratory Data Analysis (EDA)
In this week, I conducted a deep-dive EDA on the e-commerce sales dataset to uncover performance drivers.

### Analytical Process
- Financial & Price Distribution: Profiled price distribution as right-skewed, confirming most inventory is lower-priced. Validated the inverse relationship between price and quantity (Law of Demand).
- Marketing & Operations: Identified Instagram as the top referral source. Analyzed payment trends, noting "Online Payment" as the leader.
- Customer Retention: Segmented repeat purchase metrics and identified a retention bottleneck (only 11 repeat customers recorded).
- Sales Performance: June emerged as the peak sales month, with "Chairs" identified as the primary revenue driver.

### 💡 Strategic Insight
Pivot to Retention: Data reveals a clear retention bottleneck. To drive sustainable growth, we must shift strategy from high-cost acquisition toward loyalty-driven outreach, focusing on converting existing customers into repeat buyers.
# Week 3: SQL Data Analysis

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


## Week 4 Data visualization
Business Goal: Identify trends and patterns,uncover operational Inefficiences,monitor key performance indicators

### 1.Dashboard Insights: Revenue Realization Gap Analysis (2023 - Mid 2025)
Overview
This dashboard provides a comprehensive audit of the company’s revenue cycle. It highlights the discrepancy between "Potential Revenue" and "Realized Revenue," specifically focusing on leakage points in the sales pipeline.
Key Analytical Findings
High Revenue Leakage: The organization is experiencing a 41.09% Lost Revenue rate. This is a critical KPI indicating that nearly half of the potential business value is currently failing to convert due to order cancellations or returns.
Category-Specific Risks: The "Top Product Categories by Loss" chart reveals that Laptops, Tablets, and Monitors are the primary contributors to revenue loss. This suggests a potential issue in the fulfillment or quality control of high-value electronic goods.
Order Status Composition: The pie chart indicates that while a majority of orders are "Delivered," the "Returned" and "Cancelled" segments are significant enough to warrant an immediate operational review.
Performance Trends: The "Lost Revenue Percentage Trend" indicates a shift in loss volume over time, which provides a timeline for when these "leaks" became most pronounced.
Strategic Recommendations
Targeted Investigation: Initiate a quality control audit for the "Laptop" and "Tablet" categories to determine if high loss is due to product defects, shipping damages, or inaccurate product descriptions.
Pipeline Optimization: Review the "Active Pipeline" revenue (502.49K) to identify orders that are at risk of transitioning into the "Lost" category and implement proactive customer support for those specific transactions.
Focus on Realization Rate: The product-level table shows varying Realization Rates; management should prioritize marketing and sales efforts on products that demonstrate higher stability and lower return rates.





### 2.Dashboard Insights: Customer Experience & Revenue Performance
Overview
This dashboard shifts the focus from revenue loss to customer-centric metrics. It evaluates how customers interact with the product catalog and tracks the conversion efficiency across the revenue lifecycle.
Key Analytical Findings
Conversion Efficiency: The 19.18% Conversion Rate provides a clear benchmark for operational success. This is a critical metric for evaluating marketing ROI and user experience effectiveness.
Revenue Lifecycle Distribution: The "Revenue Lifecycle Stages" bar chart demonstrates a balanced distribution across stages (Cancelled, Returned, Pending, Shipped, Delivered), suggesting that a significant portion of revenue is tied up in the "Pending" or "Returned" phases rather than final settlement.
Product Popularity vs. Revenue: The "Top Products by Revenue" chart highlights that Chairs and Printers are the primary drivers of total revenue. This contrast is valuable when compared to your first dashboard, which identified Laptops and Tablets as high-loss items.
Revenue Performance Trends: The "Revenue Performance Over Time" line chart reveals fluctuations across quarters. Identifying the specific "dips" in this chart could correlate with seasonal marketing campaigns or external supply chain disruptions.
Strategic Recommendations
Customer Retention Strategy: Utilize the "Top Returning Customers" table to identify your "VIP" segment. Offering these customers targeted loyalty incentives could help boost the overall conversion rate.
Optimize High-Revenue SKUs: Since Chairs and Printers are top performers in revenue, ensure these categories maintain optimal stock levels and consistent delivery service to prevent them from slipping into the "Returned" or "Cancelled" categories.
Lifecycle Bottleneck Analysis: Investigate why a significant portion of revenue remains in the "Pending" stage. Streamlining the approval or shipping process for these orders could immediately increase the realized revenue rate.

