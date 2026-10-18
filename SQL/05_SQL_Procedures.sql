-- ==================================
-- Phase 5: Stored Procedures
-- ==================================

-- Select Database
use Retail_Analysis;


-- Overall Sales Summary Procedure
create procedure sp_sales_summary as
begin
	select
		sum(total_amount) AS total_revenue,
		count(transaction_id) AS total_transactions,
		sum(quantity) AS total_quantity_sold,
		count(distinct customer_id) AS unique_customers,
		avg(total_amount) AS average_order_value
	from retail_sales;
end;


-- Sales by Category Procedure
create procedure sp_sales_by_category as
begin
	select
		product_category,
		sum(total_amount) AS total_revenue,
		sum(quantity) AS total_quantity_sold,
		count(transaction_id) AS total_transactions,
		avg(total_amount) AS average_order_value
	from retail_sales
	group by product_category
	order by total_revenue desc;
end;


-- Sales by Date Range Procedure
create procedure sp_sales_by_date_range
	@start_date date,
	@end_date date
as
begin
	select
		sum(total_amount) AS total_revenue,
		count(transaction_id) AS total_transactions,
		sum(quantity) AS total_quantity_sold,
		count(distinct customer_id) AS unique_customers,
		avg(total_amount) AS average_order_value
	from retail_sales
	where transaction_date between @start_date and @end_date;
end;


-- Execute Stored Procedures
exec sp_sales_summary;
exec sp_sales_by_category;
exec sp_sales_by_date_range 
'2023-01-01',
'2024-01-01';


-- Verify Created Stored Procedures
select name AS procedure_name from sys.procedures;




-- ==================================
-- Stored Procedure Summary
-- ==================================

-- 1. sp_sales_summary provides overall sales metrics including revenue,
-- transactions, quantity sold, unique customers, and average order value.

-- 2. sp_sales_by_category analyzes sales performance across product
-- categories.

-- 3. sp_sales_by_date_range provides sales analysis based on a selected
-- transaction date range.

-- 4. All stored procedures were executed and validated successfully.