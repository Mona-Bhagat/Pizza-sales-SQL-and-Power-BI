

select * from dbo.pizza_sales

select * from dbo.pizza_sales

--Total revenue 

select SUM(quantity * unit_price) as Total_revenue from dbo.pizza_sales

--Average order value

select SUM(TOTAL_PRICE) / APPROX_COUNT_DISTINCT(order_id) as Average_order_value from dbo.pizza_sales

--Total Pizzas sold

select SUM(quantity) as Total_Pizza_sold from dbo.pizza_sales

--Average Pizzas per order

select CAST(cast(sum (quantity) as decimal(10,2))/ cast(count(Distinct order_id) as decimal(10,2)) as decimal(10,2))
from dbo.pizza_sales

--chart data for daily trend 

select DATENAME(dw, order_date) as order_day, COUNT(Distinct order_id) as total_daily_orders
from dbo.pizza_sales

group by DATENAME(dw, order_date)

--chart data for monthly trend 


select DATENAME(MONTH, order_date) as order_month, COUNT(Distinct order_id) as total_monthly_orders
from dbo.pizza_sales

group by DATENAME(MONTH, order_date)


--percent sales as per Pizza Category

select pizza_category, cast(sum(Total_price) as Decimal (10,2)) as Total_sales, CAST(SUM(total_price) * 100  as decimal (10,2))/ (select SUM(total_price) from pizza_sales where MONTH(order_date) = 1) as PCT_Sales_by_category

from pizza_sales
where MONTH(order_date) = 2
group by pizza_category
order by PCT_Sales_by_category


--Max seling pizza

select top 5 pizza_name, SUM(total_price) as highest_selling_pizza from dbo.pizza_sales
group by pizza_name
order by highest_selling_pizza desc

--lowest seling pizza

select top 5 pizza_name, cast(SUM(total_price) as decimal(10,2))  lowest_selling_pizzarev from dbo.pizza_sales
group by pizza_name
order by lowest_selling_pizzarev


