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

**Data source:** [Retail Sales Dataset on Kaggle](https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)

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

- **Revenue by Category:** Electronics generated the highest revenue ($156,905), followed by Clothing ($155,580) and Beauty ($143,515).
- **Sales Volume:** Clothing recorded the highest quantity sold, with 894 units.
- **Monthly Performance:** Revenue peaked in May at $53,150 and reached its lowest point in September at $23,620.
- **Customer Demographics:** Customers aged 46–55 contributed the highest revenue among age groups ($100,690).
- **Sales by Day Type:** Weekdays contributed 69.9% of total revenue, compared with 30.1% on weekends.
- **Order Value:** Transactions in the $1,000-and-above order value group contributed $286,800 in revenue.

## Business Recommendations

- **Monitor Product Categories:** Track revenue and quantity sold together to understand category performance.
- **Investigate Monthly Trends:** Examine transaction volume and order values during high- and low-revenue months.
- **Explore Customer Segments:** Analyze purchasing patterns across age groups and gender to identify potential customer segments.
- **Review Sales Timing:** Compare weekday and weekend transaction patterns when evaluating promotional opportunities.
- **Analyze High-Value Transactions:** Examine product mix and quantities within high-value orders to understand their contribution to revenue.

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

## Project Setup & Execution

### Prerequisites

- Microsoft SQL Server and SQL Server Management Studio (SSMS).
- Microsoft Excel.
- Power BI Desktop, if reviewing the Power BI report file.

### Steps to Reproduce

1. Clone or download this repository.
2. Review the original dataset in the `dataset/` directory.
3. Open the cleaned data files in `Excel/` to inspect the prepared dataset and dashboard results.
4. Open the SQL scripts in numerical order to review the data preparation and analytical workflow.
5. Execute the SQL scripts in SQL Server after adjusting database and file paths to match your local environment.
6. Open the Power BI report file if it is included in the repository.

**Note:** SQL scripts may require adjustments to database names, table names, import paths and execution order depending on your local SQL Server configuration.
