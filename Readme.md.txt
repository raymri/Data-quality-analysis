# Customer Data Quality Dashboard (PostgreSQL + Power BI)

This project simulates a small B2B customer and orders database with realistic data quality issues (missing tax IDs, invalid emails, orphan orders, stale customers). I generate synthetic data, load it into PostgreSQL, quantify issues using SQL, and surface the results through a two-page Power BI dashboard: an executive overview and a detailed breakdown of invalid contact emails by account status and industry.

## Tech Stack

- Python – synthetic data generation and CSV creation
- PostgreSQL – database schema, data load, and data quality checks
- SQL – completeness, validity, duplicate, and referential integrity queries
- Power BI – overview and details dashboards with KPIs, charts, and slicers
- Excel/CSV – intermediate data inspection and exports

## Data Model

- `customers` – stores customer master data such as customer name, account status, industry, email, phone, tax_id, and created date
- `orders` – contains order-level records linked to customers, with some intentionally orphan orders that do not match any customer_id
- `owners` / `public_owners` – optional sales owner or account owner information used for realism
- Data quality issues are deliberately injected: missing tax IDs for some active customers, invalid email formats, duplicate customers, and orders without matching customers

## Data Quality Checks (SQL)

- Count of active customers missing tax_id
- Count of customers with invalid email formats (e.g., missing `@` or domain)
- Count of duplicate customers based on customer name and email combination
- Count of orders without a matching customer (orphan orders)
- Counts of inactive or stale customers based on last_updated date
- Issue counts summarized by account status and industry


## Power BI Dashboard

### Page 1 – Data Quality Overview

- KPIs: Total Customers, Active Customers Missing Tax ID, Invalid Customer Emails, Orders Without Matching Customers
- Slicer: account_status filter applied to the whole page
- Chart: Customers by Account Status to show overall distribution of the customer base

### Page 2 – Data Quality Details

- Chart: Invalid Contact Emails by Account Status, with data labels for each bar
- Table: Invalid Contact Emails summarized by account_status, including totals
- Slicer: Industry filter to see which industries have the highest concentration of invalid emails

## How to Run

- Clone or download the repository
- Create the PostgreSQL database and tables using the SQL scripts
- Load the generated CSV files into PostgreSQL
- Run the SQL queries to validate and quantify data quality issues
- Open the Power BI `.pbix` file and reconnect it to the local PostgreSQL source if needed

## Final Notes

- The dashboard is designed for local evaluation and demonstration of SQL plus Power BI integration
- If PostgreSQL connection settings differ on another machine, update the data source configuration in Power BI before refresh
- The project focuses on identifying measurable data quality issues and presenting them in a clear dashboard format








