-- ==================================
-- Phase 1: Data Import & Cleaning
-- ==================================

-- Select Database
use Retail_Analysis;


-- Rename Table
exec sp_rename 'dbo.retail_sales_dataset', 'retail_sales';


-- Check Imported Data
select * from retail_sales;


-- Check Column Names & Data Types
exec sp_help retail_sales;


-- Preview First 10 Rows
select top 10 * from retail_sales;


-- Rename Columns
exec sp_rename 'retail_sales.Transaction_ID', 'transaction_id', 'column';
exec sp_rename 'retail_sales.Date', 'transaction_date', 'column';
exec sp_rename 'retail_sales.Customer_ID', 'customer_id', 'column';
exec sp_rename 'retail_sales.Gender', 'gender', 'column';
exec sp_rename 'retail_sales.Age', 'age', 'column';
exec sp_rename 'retail_sales.Product_Category', 'product_category', 'column';
exec sp_rename 'retail_sales.Quantity', 'quantity', 'column';
exec sp_rename 'retail_sales.Price_per_Unit', 'price_per_unit', 'column';
exec sp_rename 'retail_sales.Total_Amount', 'total_amount', 'column';


-- Verify Columns
exec sp_help retail_sales;


-- Check Duplicate Transaction ID
select transaction_id, count(*) AS duplicate_count from retail_sales group by transaction_id having count(*) > 1;


-- Check Unique Customers
select count(distinct customer_id) AS unique_customers from retail_sales;


-- Check NULL Values
select
	count(*) AS total_rows,
	count(transaction_id) AS transaction_ids,
	count(transaction_date) AS transaction_dates,
	count(customer_id) AS customer_ids,
	count(gender) AS genders,
	count(age) AS ages,
	count(product_category) AS product_categories,
	count(quantity) AS quantities,
	count(price_per_unit) AS price_per_units,
	count(total_amount) AS total_amounts
from retail_sales;


-- Check Blank Values
select * from retail_sales 
where trim(customer_id) = ''
or trim(gender) = ''
or trim(product_category) = '';


-- Check Date Range
select 
	min(transaction_date) AS earliest_transaction_date,
	max(transaction_date) AS latest_transaction_date
from retail_sales;


-- Numeric Validation
select
	min(age) AS min_age,
	max(age) AS max_age,

	min(quantity) AS min_quantity,
	max(quantity) AS max_quantity,

	min(price_per_unit) AS min_price_per_unit,
	max(price_per_unit) AS max_price_per_unit,

	min(total_amount) AS min_total_amount,
	max(total_amount) AS max_total_amount
from retail_sales;


-- Final Validation
select count(*) AS total_records from retail_sales;

select count(distinct transaction_id)
AS unique_transaction_ids
from retail_sales;

select count(distinct customer_id)
AS unique_customer_ids
from retail_sales;

select top 10 * from retail_sales;


-- ==================================
-- Cleaning Summary
-- ==================================

-- 1. Prepared and validated the dataset after import.
-- 2. Standardized column names for easier querying and analysis.
-- 3. Checked transaction IDs to ensure data uniqueness.
-- 4. Reviewed customer information and unique customer records.
-- 5. Checked missing values and incomplete records.
-- 6. Validated transaction dates and numerical attributes.
-- 7. Ensured data quality before performing business analysis.