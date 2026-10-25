
-- 1. Total Sales and Profit
SELECT ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders;

-- 2. Category-wise Sales
SELECT Category, ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 3. Top 10 Products
SELECT "Product Name", ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4. Monthly Sales
SELECT Year, Month, ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- 5. Top 10 Customers
SELECT "Customer ID", ROUND(SUM(Sales), 2) AS Total_Spending
FROM orders
GROUP BY "Customer ID"
ORDER BY Total_Spending DESC
LIMIT 10;

-- 6. Repeat Customers
SELECT COUNT(*) AS Repeat_Customers
FROM (
    SELECT "Customer ID"
    FROM orders
    GROUP BY "Customer ID"
    HAVING COUNT(DISTINCT "Order ID") > 1
);

-- 7. Region-wise Profit
SELECT Region, ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;

-- 8. Average Order Value
SELECT ROUND(AVG(Order_Total), 2) AS Average_Order_Value
FROM (
    SELECT "Order ID", SUM(Sales) AS Order_Total
    FROM orders
    GROUP BY "Order ID"
);
