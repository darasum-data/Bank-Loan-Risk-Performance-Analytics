Bank Loan Risk & Performance Analysis 🏦📊
Project Overview

This project provides a comprehensive analysis of a bank's lending operations. Using a combination of SQL for data processing and Power BI for visualization, the project tracks key performance indicators (KPIs) like loan application volume, funded amounts, and repayment status. The primary goal is to distinguish between "Good" and "Bad" loans to help the bank manage credit risk and optimize lending strategies.

🛠️ Tech Stack

Database: SQL Server (Data Cleaning, Analysis, and Validation)

Visualization: Power BI Desktop

Data Source: CSV/Excel (Bank Loan Data)

Knowledge Domain: Banking & Finance (Credit Risk)

📖 Table of Contents

Business Problem

Data Architecture

Key Performance Indicators (KPIs)

SQL Analysis Highlights

Dashboard Features

Insights & Recommendations

🎯 Business Problem

The bank needs a clear way to monitor the health of its loan portfolio. Key questions addressed:

What is our total exposure (Funded Amount) versus what we have recovered?

How do loan applications trend month-over-month?

What is the percentage of "Bad Loans" (Charged Off) and how does it impact profitability?

Which states and loan purposes are driving the most volume?

🏗️ Data Architecture

The project follows an end-to-end data pipeline:

Domain Research: Understanding the loan lifecycle (Application -> Evaluation -> Disbursement -> Monitoring).

SQL Extraction: Writing complex queries to calculate MTD, PMTD, and MoM metrics.

Data Modeling: Connecting SQL datasets to Power BI.

Visualization: Creating interactive dashboards for Executive, Tactical, and Operational views.

📈 Key Performance Indicators (KPIs)

Total Loan Applications: 38.6K (MTD: 4.3K)

Total Funded Amount: $435.8M

Total Amount Received: $473.1M

Average Interest Rate: 12.0%

Average DTI (Debt-to-Income): 13.3%

Good Loan %: 86.2% | Bad Loan %: 13.8%

💻 SQL Analysis Highlights

Detailed SQL scripts can be found in the /SQL_Queries folder.

Example: Calculating Good vs. Bad Loan Metrics

code
SQL
download
content_copy
expand_less
-- Identifying Bad Loan percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

Example: Monthly Trend Analysis

code
SQL
download
content_copy
expand_less
SELECT 
    MONTH(issue_date) AS Month_Number, 
    DATENAME(MONTH, issue_date) AS Month_Name, 
    COUNT(id) AS Total_Applications
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY Month_Number;
📊 Dashboard Features

The Power BI report consists of three specialized views:

1. Executive Summary

Focuses on high-level KPIs and risk assessment. It includes "Good vs. Bad Loan" gauges and a status grid comparing DTI and Interest Rates.

2. Portfolio Overview

A tactical view using:

Line Chart: Monthly lending trends.

Filled Map: Regional analysis by State.

Tree Map: Home ownership distribution.

Donut Chart: Loan term distribution (36 vs 60 months).

3. Detailed View

An operational table allowing for row-level auditing of individual loan records, filtered by Grade, Purpose, and State.

💡 Insights & Recommendations

Risk Premium: Bad loans have a higher average interest rate (13.88%) than good loans (11.64%), showing the bank's risk-based pricing is active.

Seasonality: Lending activity peaks in Q4, particularly in December ($58M received).

Top Purpose: "Debt Consolidation" accounts for the vast majority of loans, suggesting a need for specialized consolidation products.

Stability: Borrowers with 10+ years of employment are the most frequent applicants, indicating a stable target demographic.

🚀 How to Use

Clone the Repo: git clone https://github.com/your-username/bank-loan-analysis.git

Database Setup: Execute the .sql scripts in your SQL Server environment to create the necessary views.

Power BI: Open the .pbix file. Update the data source settings to point to your SQL Server or the provided CSV.

Contact

[Your Name]
[Your LinkedIn Profile] | [Your Portfolio Website]
Data Analyst | SQL & Power BI Specialist
