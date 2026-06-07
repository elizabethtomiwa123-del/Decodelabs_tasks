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


SELECT
  OrderStatus,
  COUNT(OrderID) AS Number_of_orders,
  ROUND(100.0 * COUNT(OrderID) / (SELECT COUNT(OrderID) FROM sales_data_3), 2) AS Percentage
FROM 
  sales_data_3
GROUP BY OrderStatus
ORDER BY Number_of_orders DESC;
