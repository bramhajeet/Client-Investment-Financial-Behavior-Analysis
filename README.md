# Client-Investment-Financial-Behavior-Analysis
This project analyzes the investment behavior and financial profiles of 1,500 clients using Excel, SQL and Power BI.  The objective was to identify investment trends, geographic patterns, income-based behavior, loan-related investment differences and high-value client segments.
The project demonstrates an end-to-end data analysis workflow:
**Data → Cleaning → Analysis → SQL → Visualization → Business Insights**
## Dataset

The dataset contains:

- 1,500 client records
- 18,000 monthly investment records
- Client demographics
- Location information
- Annual income
- Loan information
- Net worth
- Investment information
- Monthly investment amounts

The dataset was created for analytical and portfolio purposes.

# Tools & Technologies

### Excel
- Data cleaning
- Sorting and filtering
- Pivot Tables
- Pivot Charts
- SUMIF
- Aggregation and calculations
- Slicers
- Dashboard creation

### SQL
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate functions
- CASE statements
- JOINs
- Subqueries
- CTEs
- Window functions
- RANK()
- ROW_NUMBER()
- LAG()
- Month-over-month analysis

### Power BI
- Data modeling
- Relationships
- DAX measures
- KPI cards
- Interactive dashboards
- Slicers
- Trend analysis
- Geographic analysis
- Customer segmentation

# Business Questions

The analysis was designed to answer questions such as:

1. What is the total investment by state?
2. What are the top 10 cities by total investment?
3. Which month has the highest total investment?
4. What is the average investment by income group?
5. Do clients with loans invest more or less on average?
6. Who are the top 10 clients by annual investment?
7. Which states have the highest average investment per client?
8. What is the month-over-month investment growth?
9. Who is the highest-investing client in each city?
10. How do High, Medium, and Low investment clients differ?

# Excel Analysis

Excel was used for initial data preparation, exploration and dashboard creation.

### Key work performed

- Reviewed and cleaned the dataset
- Organized client and monthly investment data
- Calculated client-level investment totals
- Created PivotTables for investment analysis
- Analyzed monthly investment trends
- Compared investments across states and cities
- Segmented clients based on investment levels
- Created interactive slicers
- Built an Excel dashboard

# SQL Analysis

SQL was used for deeper analysis of the dataset.

The analysis included approximately 40+ SQL queries covering different business questions.

### Key SQL techniques used

- Aggregation using `SUM()` and `AVG()`
- `GROUP BY` and `ORDER BY`
- `JOIN`
- `CASE`
- Subqueries
- CTEs
- Window functions
- `RANK()`
- `ROW_NUMBER()`
- `LAG()`

### Examples of analysis

- Total investment by state
- Top 10 cities by investment
- Highest investment month
- Average investment by income group
- Loan vs. investment comparison
- Top 10 clients by annual investment
- State ranking
- Month-over-month investment growth
- Highest-investing client by city
- Investment-based customer segmentation

The complete SQL script is available in the `sql` folder.

# Power BI Dashboard

Power BI was used to create an interactive dashboard for communicating the main findings.

### Dashboard components

#### KPI Cards
- Total Clients
- Total Investment
- Average Investment
- Average Annual Income

#### Visualizations
- Monthly Investment Trend
- Investment by State
- Investment by Income Group
- Investment by Investment Type
- Loan vs. Investment

#### Interactive Filters
- State
- City
- Risk Profile
- Investment Type

The dashboard allows users to filter the analysis and explore different client segments.

# Key Insights

The project focuses on identifying patterns such as:

- Differences in investment behavior across geographic locations
- Relationship between income and investment levels
- Differences between clients with and without loans
- Monthly investment patterns and seasonality
- High-value clients and locations
- Characteristics of different investment segments

Specific numerical findings are available in the Excel analysis, SQL results, and Power BI dashboard.
