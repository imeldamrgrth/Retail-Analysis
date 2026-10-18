-- ==================================
-- Phase 4: SQL Views
-- ==================================


-- Select Database
use Retail_Analysis;


-- Overall Sales Summary View
create view vw_sales_summary AS
select
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold,
	count(distinct customer_id) AS unique_customers,
	avg(total_amount) AS average_order_value
from retail_sales;


-- Monthly Revenue View
create view vw_monthly_revenue AS
select month_number,
	month,
	sum(total_amount) AS total_revenue,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold
from retail_sales
group by
	month_number,
	month;


-- Category Performance View
create view vw_category_performance AS
select product_category,
	sum(total_amount) AS total_revenue,
	sum(quantity) AS total_quantity_sold,
	count(transaction_id) AS total_transactions,
	avg(total_amount) AS average_order_value
from retail_sales
group by product_category;


-- Customer Segment View
create view vw_customer_segment AS
select age_group,
	count(distinct customer_id) AS unique_customers,
	count(transaction_id) AS total_transactions,
	sum(total_amount) AS total_revenue,
	avg(total_amount) AS average_order_value
from retail_sales
group by age_group;


-- Gender Performance View
create view vw_gender_performance AS
select gender,
	count(distinct customer_id) AS unique_customers,
	count(transaction_id) AS total_transactions,
	sum(quantity) AS total_quantity_sold,
	sum(total_amount) AS total_revenue,
	avg(total_amount) AS average_order_value
from retail_sales
group by gender;


-- Weekday Weekend Sales View
create view vw_weekday_weekend_sales AS
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
	end;


-- Test Weekday Weekend Sales View
select * from vw_weekday_weekend_sales order by total_revenue desc;


-- Final View Validation
select name AS view_name from sys.views;



-- ==================================
-- SQL View Summary
-- ==================================

-- 1. vw_sales_summary stores overall sales metrics including revenue,
-- transactions, quantity sold, unique customers, and average order value.

-- 2. vw_monthly_revenue supports monthly sales trend analysis using
-- revenue, transactions, and quantity sold.

-- 3. vw_category_performance evaluates product category performance
-- based on revenue, quantity sold, transactions, and average order value.

-- 4. vw_customer_segment analyzes customer performance across age groups
-- using customer count, transactions, revenue, and average order value.

-- 5. vw_gender_performance compares customer and sales performance
-- across different genders.

-- 6. vw_weekday_weekend_sales analyzes sales performance based on
-- weekday and weekend transaction patterns.