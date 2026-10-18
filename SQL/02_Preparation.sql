-- ==================================
-- Phase 2: Data Preparation
-- ==================================

-- Select Database
use Retail_Analysis;


-- Review Transaction Amount Distribution
select
	min(total_amount) AS minimum_total_amount,
	max(total_amount) AS maximum_total_amount,
	avg(total_amount) AS average_total_amount
from retail_sales;


-- Create Age Group Column
alter table retail_sales add age_group varchar(20);


-- Populate Age Group
update retail_sales set age_group =
case
	when age between 18 and 25 then '18-25'
	when age between 26 and 35 then '26-35'
	when age between 36 and 45 then '36-45'
	when age between 46 and 55 then '46-55'
	else '56+'
end;


-- Create Month Column
alter table retail_sales add month varchar(10);


-- Populate Month
update retail_sales set month = datename(month, transaction_date);


-- Create Month Number Column
alter table retail_sales add month_number int;


-- Populate Month Number
update retail_sales set month_number = month(transaction_date);


-- Create Quarter Column
alter table retail_sales add quarter varchar(2);


-- Populate Quarter
update retail_sales set quarter =
case
	when month(transaction_date) between 1 and 3 then 'Q1'
	when month(transaction_date) between 4 and 6 then 'Q2'
	when month(transaction_date) between 7 and 9 then 'Q3'
	when month(transaction_date) between 10 and 12 then 'Q4'
end;


-- Create Order Value Group Column
alter table retail_sales add order_value_group varchar(20);


-- Populate Order Value Group
update retail_sales set order_value_group =
case
	when total_amount < 100 then 'Less than $100'
	when total_amount between 100 and 149 then '$100-$149'
	when total_amount between 150 and 499 then '$150-$499'
	when total_amount between 500 and 999 then '$500-$999'
	else '$1,000+'
end;


-- Verify New Helper Columns
select top 10
	transaction_id,
	transaction_date,

	age,
	age_group,

	total_amount,
	order_value_group,

	month,
	month_number,

	quarter
from retail_sales;


-- Validate Age Group Distribution
select age_group, count(*) AS record_count from retail_sales group by age_group order by age_group;


-- Validate Month Distribution
select
	month_number,
	month,
	count(*) AS record_count
from retail_sales
group by month_number, month
order by month_number;


-- Validate Quarter Distribution
select
	quarter,
	count(*) AS record_count
from retail_sales
group by quarter
order by quarter;


-- Validate Order Value Group Distribution
select
	order_value_group,
	count(*) AS record_count
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


-- Validate Helper Column Completeness
select
	count(*) AS total_records,
	count(age_group) AS age_group_count,
	count(month) AS month_count,
	count(month_number) AS month_number_count,
	count(quarter) AS quarter_count,
	count(order_value_group) AS order_value_group_count
from retail_sales;


-- Final Table Structure
exec sp_help retail_sales;


-- Final Record Count Validation
select count(*) AS total_records from retail_sales;


-- ==================================
-- Data Preparation Notes
-- ==================================

-- 1. Created age_group based on customer age categories for demographic analysis.
-- 2. Added month and month_number columns to support monthly trend analysis and sorting.
-- 3. Created quarter column to categorize transactions into quarterly periods.
-- 4. Reviewed transaction amount distribution before creating order value groups.
-- 5. Added order_value_group to categorize transactions based on spending range.
-- 6. Validated the distribution and completeness of all helper columns.
-- 7. Confirmed the final table structure after adding new columns.
-- 8. Verified that the total number of records remained unchanged after preparation.