-- ==================================
-- Phase 7: Final Report
-- ==================================

-- Select Database
use Retail_Analysis;


-- OVERALL BUSINESS PERFORMANCE

select

	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold,
	count(distinct customer_id) AS unique_customers,
	avg(total_amount) AS average_order_value
from retail_sales;


-- PRODUCT CATEGORY PERFORMANCE

-- Identify the product category with the highest revenue.
select top 1
	product_category,
	sum(total_amount) AS total_revenue
from retail_sales
group by product_category
order by total_revenue desc;

-- Identify the product category with the lowest revenue.
select top 1
	product_category,
	sum(total_amount) AS total_revenue
from retail_sales
group by product_category
order by total_revenue asc;

-- Identify the product category with the highest quantity sold.
select top 1
	product_category,
	sum(quantity) AS total_quantity_sold
from retail_sales
group by product_category
order by total_quantity_sold desc;


-- CUSTOMER AND DEMOGRAPHIC INSIGHTS

-- Analyze sales performance based on customer gender.
select
	gender,
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold,
	avg(total_amount) AS average_order_value
from retail_sales
group by gender
order by total_revenue desc;

-- Identify the age group with the highest revenue.
select top 1
	age_group,
	sum(total_amount) AS total_revenue
from retail_sales
group by age_group
order by total_revenue desc;

-- Analyze revenue performance across customer age groups.
select
	age_group,
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	avg(total_amount) AS average_order_value
from retail_sales
group by age_group
order by
	case
		when age_group = '18-25' then 1
		when age_group = '26-35' then 2
		when age_group = '36-45' then 3
		when age_group = '46-55' then 4
		else 5
	end;

-- Identify top customers based on total spending.
select top 10
	customer_id,
	sum(total_amount) AS total_spending,
	count(transaction_id) AS total_transactions
from retail_sales
group by customer_id
order by total_spending desc;


-- TIME-BASED SALES PERFORMANCE

-- Analyze monthly sales performance.
select
	month_number,
	month,
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold
from retail_sales
group by
	month_number,
	month
order by month_number;

-- Identify the month with the highest revenue.
select top 1
	month_number,
	month,
	sum(total_amount) AS total_revenue
from retail_sales
group by
	month_number,
	month
order by total_revenue desc;

-- Identify the month with the lowest revenue.
select top 1
	month_number,
	month,
	sum(total_amount) AS total_revenue
from retail_sales
group by
	month_number,
	month
order by total_revenue asc;

-- Analyze quarterly sales performance.
select
	quarter,
	sum(total_amount) AS total_revenue,
	sum(quantity) AS total_quantity_sold,
	count(transaction_id) AS total_transactions
from retail_sales
group by quarter
order by quarter;

-- Identify the quarter with the highest revenue.
select top 1
	quarter,
	sum(total_amount) AS total_revenue
from retail_sales
group by quarter
order by total_revenue desc;


-- ORDER VALUE ANALYSIS

-- Analyze transaction distribution by order value group.
select
	order_value_group,
	count(transaction_id) AS total_transactions,
	round(
		count(transaction_id) * 100.0 /
		(select count(*) from retail_sales),2
	) AS transaction_percentage
from retail_sales
group by order_value_group
order by transaction_percentage desc;

-- Identify order value group with the highest revenue.
select top 1
	order_value_group,
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions
from retail_sales
group by order_value_group
order by total_revenue desc;

-- Calculate revenue contribution from each order value group.
select
	order_value_group,
	sum(total_amount) AS total_revenue,
	round(
		sum(total_amount) * 100.0 /
		(select sum(total_amount) from retail_sales),2
	) AS revenue_percentage
from retail_sales
group by order_value_group
order by revenue_percentage desc;


-- REVENUE VS QUANTITY ANALYSIS

-- Compare product category revenue contribution and quantity sold.
select
	product_category,
	sum(quantity) AS total_quantity_sold,
	sum(total_amount) AS total_revenue,
	round(
		sum(total_amount) * 100.0 /
		(select sum(total_amount) from retail_sales),2
	) AS revenue_percentage
from retail_sales
group by product_category
order by total_revenue desc;


-- WEEKDAY VS WEEKEND ANALYSIS

-- Compare sales performance between weekday and weekend transactions.
select
	case
		when datepart(weekday, transaction_date) in (1,7)
		then 'Weekend'
		else 'Weekday'
	end AS sales_day_type,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold,
	sum(total_amount) AS total_revenue
from retail_sales
group by
	case
		when datepart(weekday, transaction_date) in (1,7)
		then 'Weekend'
		else 'Weekday'
	end
order by total_revenue desc;




-- ==================================
-- FINAL REPORT SUMMARY
-- ==================================

-- 1. Calculated overall business performance metrics including revenue,
-- transactions, quantity sold, customers, and average order value.
-- 2. Evaluated product category performance based on revenue and quantity.
-- 3. Analyzed customer demographic performance based on gender and age group.
-- 4. Evaluated monthly and quarterly sales trends.
-- 5. Analyzed transaction patterns based on order value groups.
-- 6. Compared revenue contribution and quantity sold across categories.
-- 7. Compared weekday and weekend sales performance.