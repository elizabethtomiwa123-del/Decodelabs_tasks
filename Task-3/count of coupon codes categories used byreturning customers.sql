WITH ReturningCustomers AS (
    -- Step 1: Identify customers with more than 1 order
    SELECT CustomerID
    FROM sales_data_3
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
)
-- Step 2: Count coupon usage only for those specific customers
SELECT 
    Couponcode, 
    COUNT(*) AS Total_Usage
FROM sales_data_3
WHERE CustomerID IN (SELECT CustomerID FROM ReturningCustomers)
GROUP BY Couponcode
ORDER BY Total_Usage DESC
