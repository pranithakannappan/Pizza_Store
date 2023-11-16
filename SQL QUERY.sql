create database pizza;
use pizza;
select count(*) from pizza_sales;
show tables;
select * from pizza_sales;

#1. Total revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

#2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

#3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

#4. Total Orders
SELECT count(DISTINCT order_id) as TOTAL_ORDERS FROM pizza_sales;

#5. Average Pizzas Per Order
SELECT SUM(quantity)  / COUNT(DISTINCT order_id) AS Avg_Pizzas_per_order
FROM pizza_sales;

#B. Hourly Trend for Total Pizzas Sold
SELECT HOUR(order_time) AS order_hour,SUM(quantity) as total_pizzas_sold
from pizza_sales
group by order_hour
order by order_hour;

#C. Weekly Trend for Orders
Select WEEK(STR_TO_DATE(order_date, '%d-%m-%Y'),1) as weekly, YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
group by weekly,order_year
order by weekly;

#D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
round(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

#E. % of Sales by Pizza Size
SELECT pizza_size,round(SUM(total_price),2) as total_revenue,
round(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

#F. Total Pizzas Sold by Pizza Category
select * from pizza_sales;
select sum(quantity),pizza_category
from pizza_sales
group by pizza_category;

#G. Top 5 Pizzas by Revenue
select sum(total_price) as TP,pizza_name
from pizza_sales
group by pizza_name
order by tp desc
limit 5;

#H. Bottom 5 Pizzas by Revenue
select sum(total_price) as TP,pizza_name
from pizza_sales
group by pizza_name
order by tp 
limit 5;

#I. Top 5 Pizzas by Quantity
select sum(quantity) as TP,pizza_name
from pizza_sales
group by pizza_name
order by tp desc
limit 5;

#J. Bottom 5 Pizzas by Quantity
select sum(quantity) as TP,pizza_name
from pizza_sales
group by pizza_name
order by tp 
limit 5;

#K. Top 5 Pizzas by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders,count(pizza_name)
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;


#L. Bottom 5 Pizzas by Total Orders
SELECT  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
limit 5;

