-- ==================================
-- Phase 3: SQL Analysis
-- ==================================

-- Select Database
use Retail_Analysis;



-- OVERALL BUSINESS PERFORMANCE


-- calculate the total revenue generated from all transactions.
select sum(total_amount) AS total_revenue from retail_sales;


-- count the total number of transactions recorded in the dataset.
select count(transaction_id) AS total_transactions from retail_sales;


-- calculate the total quantity of products sold across all transactions.
select sum(quantity) AS total_quantity_sold from retail_sales;


-- count the total number of unique customers in the dataset.
select count(distinct customer_id) AS unique_customers from retail_sales;


-- calculate the average revenue generated per transaction.
select avg(total_amount) AS average_order_value from retail_sales;


-- calculate the average number of products purchased per transaction.
select avg(quantity) AS average_quantity_per_transaction from retail_sales;




-- SALES BY PRODUCT CATEGORY

-- analyze total revenue contribution from each product category.
select product_category, sum(total_amount) AS total_revenue
from retail_sales
group by product_category
order by total_revenue desc;


-- compare product categories based on total quantity sold.
select product_category, sum(quantity) AS total_quantity_sold
from retail_sales
group by product_category
order by total_quantity_sold desc;


-- analyze transaction volume across different product categories.
select product_category, count(transaction_id) AS total_transactions
from retail_sales
group by product_category
order by total_transactions desc;


-- compare average order value between product categories.
select product_category, avg(total_amount) AS average_order_value
from retail_sales
group by product_category
order by average_order_value desc;




-- MONTHLY SALES PERFORMANCE

-- analyze monthly revenue trends to identify sales patterns over time.
select month_number, month, sum(total_amount) AS total_revenue
from retail_sales
group by month_number, month
order by month_number;


-- analyze monthly transaction volume and purchasing activity.
select month_number, month, count(transaction_id) AS total_transactions
from retail_sales
group by month_number, month
order by month_number;


-- identify the month with the highest revenue performance.
select top 1 month_number, month, sum(total_amount) AS total_revenue
from retail_sales
group by month_number, month
order by total_revenue desc;


-- identify the month with the lowest revenue performance.
select top 1 month_number, month, sum(total_amount) AS total_revenue
from retail_sales
group by month_number, month
order by total_revenue asc;




-- QUARTERLY PERFORMANCE

-- analyze revenue performance across different quarters.
select quarter, sum(total_amount) AS total_revenue
from retail_sales
group by quarter
order by quarter;


-- compare total quantity sold across quarterly periods.
select quarter, sum(quantity) AS total_quantity_sold
from retail_sales
group by quarter
order by quarter;


-- identify the quarter with the highest revenue contribution.
select top 1 quarter, sum(total_amount) AS total_revenue
from retail_sales
group by quarter
order by total_revenue desc;




-- GENDER ANALYSIS

-- analyze revenue contribution based on customer gender.
select gender, sum(total_amount) AS total_revenue
from retail_sales
group by gender
order by total_revenue desc;


-- compare transaction activity between customer genders.
select gender, count(transaction_id) AS total_transactions
from retail_sales
group by gender
order by total_transactions desc;


-- compare average order value across customer genders.
select gender, avg(total_amount) AS average_order_value
from retail_sales
group by gender
order by average_order_value desc;


-- analyze quantity sold based on customer gender.
select gender, sum(quantity) AS total_quantity_sold
from retail_sales
group by gender
order by total_quantity_sold desc;




-- AGE GROUP ANALYSIS

-- analyze revenue contribution from different customer age groups.
select age_group, sum(total_amount) AS total_revenue
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


-- compare transaction volume across customer age groups.
select age_group, count(transaction_id) AS total_transactions
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


-- identify the age group with the highest revenue contribution.
select top 1age_group, sum(total_amount) AS total_revenue
from retail_sales
group by age_group
order by total_revenue desc;


-- compare average spending per transaction across age groups.
select age_group, avg(total_amount) AS average_order_value
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




-- CUSTOMER ANALYSIS

-- identify top customers based on total spending.
select top 10 customer_id, sum(total_amount) AS total_spending
from retail_sales
group by customer_id
order by total_spending desc;


-- analyze transaction frequency and spending behavior of top customers.
select top 10 customer_id,
	count(transaction_id) AS total_transactions,
	sum(total_amount) AS total_spending
from retail_sales
group by customer_id
order by total_spending desc;


-- calculate the average spending value across customers.
select avg(customer_total_spending) AS average_spending_per_customer
from
	(select customer_id, 
	sum(total_amount) AS customer_total_spending
	from retail_sales
	group by customer_id) 
	AS customer_spending;




-- ORDER VALUE ANALYSIS

-- analyze transaction distribution across different order value groups.
select order_value_group, count(transaction_id) AS total_transactions
from retail_sales
group by order_value_group
order by
	case
		when order_value_group = 'Less than $100' then 1
		when order_value_group = '$100-$149' then 2
		when order_value_group = '$150-$499' then 3
		when order_value_group = '$500-$999' then 4
		else 5
	end;


-- calculate the percentage contribution of each order value group.
select order_value_group, count(transaction_id) AS total_transactions,
	round
		(count(transaction_id) * 100.0 /
		(select count(*) from retail_sales),2) 
		AS transaction_percentage
from retail_sales
group by order_value_group
order by transaction_percentage desc;


-- identify the order value group generating the highest revenue.
select top 1 order_value_group, sum(total_amount) AS total_revenue
from retail_sales
group by order_value_group
order by total_revenue desc;




-- TOP PERFORMING TRANSACTIONS

-- identify the highest-value transactions based on revenue.
select top 10
	transaction_id,
	transaction_date,
	customer_id,
	product_category,
	quantity,
	total_amount
from retail_sales
order by total_amount desc;


-- identify transactions with the highest quantity purchased.
select top 10
	transaction_id,
	transaction_date,
	customer_id,
	product_category,
	quantity,
	total_amount
from retail_sales
order by quantity desc;




-- REVENUE VS QUANTITY ANALYSIS

-- classify customers based on their total spending value.
select product_category,
	sum(quantity) AS total_quantity_sold,
	sum(total_amount) AS total_revenue,
	round
		(sum(total_amount) * 100.0 /
		(select sum(total_amount) from retail_sales),2)
		AS revenue_percentage
from retail_sales
group by product_category
order by total_revenue desc;


-- identify transactions with the highest quantity purchased.
select product_category,
	avg(price_per_unit) AS average_price,
	sum(quantity) AS total_quantity_sold,
	sum(total_amount) AS total_revenue
from retail_sales
group by product_category
order by total_revenue desc;




-- WEEKDAY VS WEEKEND ANALYSIS

-- compare sales performance between weekday and weekend transactions.
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
-- RETAIL SALES ANALYSIS SUMMARY
-- ==================================

-- 1. Analyzed overall sales performance including revenue, transactions, and quantity sold.
-- 2. Evaluated sales performance across different product categories.
-- 3. Reviewed monthly and quarterly sales trends.
-- 4. Compared sales performance based on customer gender and age group.
-- 5. Identified top customers based on spending and transaction activity.
-- 6. Analyzed transaction distribution based on order value groups.
-- 7. Identified top-performing transactions based on revenue and quantity.
-- 8. Compared revenue contribution against product quantity sold.
-- 9. Analyzed sales performance between weekdays and weekends.