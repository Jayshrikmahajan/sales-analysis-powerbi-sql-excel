use salesinsight;

-- Total sales by region
select Region, sum(Sales) as total_sales
from my_table
group by Region;


-- Top 5 Profitable Product
select Category, sum(Profit) as total_profit
from my_table
group by Category
order by total_profit desc
limit 5;



ALTER TABLE my_table
CHANGE `Order Date` order_date VARCHAR(255);

SELECT MONTH(order_date)
FROM my_table;

SELECT order_date
FROM my_table
LIMIT 10;

-- monthly sales trend
SELECT MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month,
       SUM(Sales) AS total_sales
FROM my_table
GROUP BY Month
ORDER BY Month;

SELECT DATE_FORMAT(
           STR_TO_DATE(order_date, '%d-%m-%Y'),
           '%b'
       ) AS Month,
       SUM(Sales) AS total_sales
FROM my_table
GROUP BY Month
ORDER BY MIN(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Highest discount impact
select Discount, avg(Profit)
from my_table
group by discount;
-- Higher discounts are negatively affecting profitability. 
-- Orders with discounts show average losses compared to orders without discounts.

SELECT `Customer Name`,   -- Top 10 customers
       SUM(Sales) AS total_sales
FROM my_table
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Loss making product
SELECT `Product Name`,
       SUM(Profit) AS total_profit
FROM my_table
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;

-- Shipping Mode Analysis
SELECT `Ship Mode`,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM my_table
GROUP BY `Ship Mode`;

-- segment analysis
SELECT Segment,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM my_table
GROUP BY Segment;

-- Top state
SELECT `State/Province`,
       SUM(Sales) AS total_sales
FROM my_table
GROUP BY `State/Province`
ORDER BY total_sales DESC
LIMIT 10;
