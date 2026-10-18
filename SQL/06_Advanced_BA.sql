-- ==================================
-- Phase 6: Advanced Business Analysis
-- ==================================


-- Select Database
use Retail_Analysis;


-- CTE - MONTHLY REVENUE ANALYSIS
with monthly_revenue AS
(
	select
		month_number,
		month,
		sum(total_amount) AS monthly_revenue
	from retail_sales
	group by
		month_number,
		month
)
select top 1
	month_number,
	month,
	monthly_revenue
from monthly_revenue
order by monthly_revenue desc;


-- PRODUCT CATEGORY RANKING
with category_revenue AS
(
	select
		product_category,
		sum(total_amount) AS total_revenue
	from retail_sales
	group by product_category
)
select
	product_category,
	total_revenue,
	dense_rank() over
	(order by total_revenue desc) AS revenue_rank
from category_revenue
order by revenue_rank;


-- CUSTOMER RANKING
with customer_spending AS
(
	select
		customer_id,
		sum(total_amount) AS total_spending

	from retail_sales

	group by customer_id
)
select
	customer_id,
	total_spending,
	dense_rank() over
	(order by total_spending desc) AS spending_rank
from customer_spending
order by spending_rank;


-- RUNNING TOTAL
with monthly_revenue AS
(
	select
		month_number,
		month,
		sum(total_amount) AS monthly_revenue
	from retail_sales
	group by
		month_number,
		month
)
select
	month_number,
	month,
	monthly_revenue,
	sum(monthly_revenue) over
	(order by month_number) AS cumulative_revenue
from monthly_revenue
order by month_number;


-- REVENUE CONTRIBUTION
with category_revenue AS
(
	select
		product_category,
		sum(total_amount) AS total_revenue
	from retail_sales
	group by product_category
)
select
	product_category,
	total_revenue,
	round(
		total_revenue * 100.0 /
		sum(total_revenue) over (),2
	) AS revenue_percentage
from category_revenue
order by revenue_percentage desc;


-- MONTHLY PERFORMANCE COMPARISON
with monthly_revenue AS
(
	select
		month_number,
		month,
		sum(total_amount) AS monthly_revenue
	from retail_sales
	group by
		month_number,
		month
)
select
	month_number,
	month,
	monthly_revenue,
	lag(monthly_revenue) over
	(order by month_number) AS previous_month_revenue,
	monthly_revenue -
	lag(monthly_revenue) over
	(order by month_number) AS revenue_difference
from monthly_revenue
order by month_number;


-- TOP 5 CUSTOMER ANALYSIS
with customer_spending AS
(
	select
		customer_id,
		sum(total_amount) AS total_spending
	from retail_sales
	group by customer_id
),
ranked_customers AS
(
	select
		customer_id,
		total_spending,
		dense_rank() over
		(order by total_spending desc) AS spending_rank
	from customer_spending
)
select
	customer_id,
	total_spending,
	spending_rank
from ranked_customers
where spending_rank <= 5
order by spending_rank;



-- ==================================
-- Advanced BA Summary
-- ==================================

-- 1. Used CTEs to simplify complex analysis queries.
-- 2. Used window functions for ranking and comparison analysis.
-- 3. Calculated cumulative revenue trends using SUM OVER.
-- 4. Measured revenue contribution by product category.
-- 5. Compared monthly revenue changes using LAG function.
-- 6. Identified top customers based on spending performance.