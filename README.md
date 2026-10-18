## Project Overview

This project explores retail transaction data to understand sales performance, identify revenue patterns and examine customer purchasing behavior.

The project uses SQL Server for data preparation and querying, Microsoft Excel for data cleaning, exploratory analysis, excel dashboard creation and Power BI for interactive data visualization.

Rather than focusing only on total revenue, the analysis examines several dimensions, including product category, customer demographics, monthly revenue trends, order value and purchasing activity across weekdays and weekends.

## Business Objectives

The main objectives of this project are to:

- Analyze overall sales performance through revenue, transaction volume, quantity sold, and average order value.
- Identify product categories that contribute the most to revenue and sales volume.
- Examine monthly revenue patterns and variations throughout the year.
- Explore customer purchasing patterns across gender and age groups.
- Compare sales performance between weekdays and weekends.
- Develop interactive dashboards that make sales information easier to understand.
- Translate analytical findings into practical business recommendations.

## Dataset

The dataset contains retail transaction records covering January to December 2023.

**Dataset details**

| Attribute | Description |
|---|---|
| Number of transactions | 1,000 |
| Time period | January–December 2023 |
| Product categories | Beauty, Clothing, Electronics |
| Customer information | Customer ID, gender, and age |
| Transaction information | Transaction date and transaction ID |
| Sales information | Quantity, price per unit, and total amount |

**Data source:** [Retail Sales Dataset on Kaggle](dataset/(https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset))

The original dataset contains transaction-level information. Additional analytical fields were prepared to support further analysis, including age groups, month, month number, quarter, order value groups and weekday/weekend classification.

The cleaned dataset is available in the `Excel/` directory.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft SQL Server | Data preparation, SQL queries, analytical views and stored procedures |
| Microsoft Excel | Data cleaning, PivotTables, exploratory analysis and dashboard development |
| Microsoft Power BI | Interactive dashboards, KPI cards, charts and slicers |
| Git and GitHub | Version control and project documentation |

## Project Workflow

### 1. Data Preparation and Cleaning

The preparation process included:

- Reviewing the original columns and data structure.
- Checking transaction dates and numeric sales fields.
- Preparing a cleaned dataset for analysis.
- Creating additional fields to support customer segmentation and time-based analysis.
- Classifying customers into age groups.
- Grouping transactions by order value.
- Classifying transaction dates as weekdays or weekends.

### 2. SQL Analysis

SQL Server was used to organize and analyze the transaction data.

The SQL workflow is divided into separate scripts for data cleaning, preparation, analysis, views, stored procedures, advanced analysis and the final report.

This structure makes the analytical process easier to follow and allows individual stages to be reviewed independently.

### 3. Excel Analysis and Dashboard

Microsoft Excel was used to explore the data through PivotTables and summarize important sales metrics.

The dashboard presents key indicators and visualizations covering monthly revenue, product category performance, customer demographics, quantity sold and weekday versus weekend revenue.

### 4. Power BI Dashboard

Power BI was used to recreate and extend the sales dashboard in an interactive format.

The report includes KPI cards, charts and slicers for product category and age group. These features allow users to explore sales patterns by selecting different segments of the data.

## Key Performance Indicators

The dashboards track five primary KPIs.

| KPI | Result | Description |
|---|---:|---|
| Total Revenue | $456,000 | Total sales amount recorded in the dataset |
| Total Transactions | 1,000 | Number of recorded transactions |
| Total Quantity Sold | 2,514 | Total units sold |
| Average Order Value | $456 | Average revenue per transaction |
| Average Customer Age | 41.4 years | Mean age of customers represented in the dataset |

Average Order Value is calculated by dividing total revenue by the number of transactions.

Average Customer Age is calculated from the customer age values recorded in the dataset.

## Key Findings

The following findings are based on the current Excel and Power BI dashboard results.

### 1. Revenue by Product Category

Electronics generated the highest revenue at **$156,905**, followed by Clothing at $155,580 and Beauty at $143,515.

The revenue contributions are relatively close across the three categories, indicating that total sales are distributed across multiple product categories rather than being concentrated in just one.

### 2. Quantity Sold by Product Category

Clothing recorded the highest sales volume at **894 units**, followed by Electronics at 849 units and Beauty at 771 units.

The category with the highest quantity sold is not the category with the highest revenue. This illustrates why revenue and sales volume should be analyzed together.

### 3. Monthly Revenue Trends

Revenue varied throughout 2023.

- May recorded the highest monthly revenue at **$53,150**.
- September recorded the lowest monthly revenue at $23,620.
- Revenue increased from September to October, reaching $46,580.

These fluctuations highlight the importance of monitoring monthly performance. However, the available dataset alone does not establish the reasons behind the changes.

### 4. Customer Demographics

Customers aged 46–55 contributed the highest revenue among the age groups, with $100,690.

Customers aged 56 and above contributed $80,410, the lowest revenue among the five age groups.

Female customers accounted for $232,840 in revenue, compared with $223,160 from male customers. The difference between the two groups was $9,680.

These results describe revenue distribution within the dataset and should not be interpreted as evidence of differences in customer profitability or purchasing preferences without further analysis.

### 5. Weekday vs. Weekend Performance

Weekdays generated $318,585 in revenue across 712 transactions, while weekends generated $137,415 across 288 transactions.

Weekdays therefore accounted for approximately 69.9% of total revenue, compared with 30.1% on weekends.

This difference provides a starting point for examining how transaction activity is distributed throughout the week. It does not, by itself, demonstrate that individual weekday transactions are more valuable.

### 6. Order Value Distribution

Transactions in the $1,000-and-above order value group contributed $286,800 in total revenue.

This indicates that the highest order value group accounts for a substantial portion of the recorded revenue. Further investigation would be needed to understand how transaction frequency, quantity, and product mix contribute to this result.

## Business Recommendations

Based on the observed patterns, the following actions could be explored.

### 1. Monitor Category-Level Performance

Track revenue and quantity sold separately for each product category. This can help identify changes in demand and determine whether revenue growth comes from higher sales volume or differences in transaction value.

### 2. Investigate Monthly Revenue Fluctuations

Review the months with the highest and lowest revenue alongside transaction counts, quantities sold, and order values. Additional historical data would help establish whether these patterns recur.

### 3. Explore Customer Segmentation

Use age group and gender to explore differences in purchasing behavior. Before developing targeted campaigns, examine transaction frequency, average order value, and product category preferences within each segment.

### 4. Evaluate Weekday and Weekend Activity

Compare transaction counts, average order value, and quantity sold across weekdays and weekends. The results can inform decisions about promotional timing and operational planning.

### 5. Examine High-Value Transactions

Investigate the transactions contributing to the $1,000-and-above group. Understanding their product mix and quantities could help identify patterns associated with higher transaction values.

These recommendations are exploratory. Their effectiveness should be evaluated using additional data and measurable business outcomes before implementation.

## Repository Structure

```text
Retail-Analysis/
├── dataset/
│   └── retail_sales_dataset.csv
├── Excel/
│   ├── Results.xlsx
│   ├── retail_cleaned.csv
│   └── retail_cleaned.xlsx
├── Images/
│   ├── Excel_Retail_Analysis.jpg
│   └── Power_BI_Retail_Analysis.jpg
├── Power BI/
│   └── Retail_Analysis.pbix
├── SQL/
│   ├── 01_Import_&_Cleaning.sql
│   ├── 02_Preparation.sql
│   ├── 03_Analysis.sql
│   ├── 04_SQL_Views.sql
│   ├── 05_SQL_Procedures.sql
│   ├── 06_Advanced_BA.sql
│   └── 07_Final_Report.sql
└── README.md
```

## How to Use This Project

### Prerequisites

- Microsoft SQL Server and SQL Server Management Studio (SSMS).
- Microsoft Excel.
- Power BI Desktop, if reviewing the Power BI report file.

### Getting Started

1. Clone or download this repository.
2. Review the original dataset in the `dataset/` directory.
3. Open the cleaned data files in `Excel/` to inspect the prepared dataset and dashboard results.
4. Open the SQL scripts in numerical order to review the data preparation and analytical workflow.
5. Execute the SQL scripts in SQL Server after adjusting database and file paths to match your local environment.
6. Open the Power BI report file if it is included in the repository.

**Note:** SQL scripts may require adjustments to database names, table names, import paths and execution order depending on your local SQL Server configuration.
