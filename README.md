
# 🏦 Bank Loan Risk & Performance Analysis

## 📌 Project Overview

This project delivers a comprehensive analysis of a bank’s loan portfolio to evaluate lending performance and credit risk. By combining **SQL** for data transformation and analysis with **Power BI** for visualization, the project tracks critical loan metrics and classifies loans into **Good** and **Bad** categories.

The primary objective is to help stakeholders understand portfolio health, identify risk patterns, and support data-driven lending decisions.

---

## 🛠️ Tech Stack

- **Database:** SQL Server  
  *(Data cleaning, transformation, KPI calculations)*  
- **Visualization:** Power BI Desktop  
- **Data Source:** CSV / Excel (Bank Loan Dataset)  
- **Domain Knowledge:** Banking & Finance (Credit Risk Analysis)

---

## 📖 Table of Contents

- Business Problem  
- Data Architecture  
- Key Performance Indicators (KPIs)  
- SQL Analysis Highlights  
- Dashboard Features  
- Insights & Recommendations  
- How to Use  

---

## 🎯 Business Problem

The bank requires a reliable and transparent way to monitor the health of its loan portfolio. This project answers key business questions such as:

- What is the total funded loan amount compared to total repayments received?
- How do loan applications and funding amounts change month over month?
- What percentage of loans are classified as **Bad Loans (Charged Off)**, and how do they affect profitability?
- Which states and loan purposes contribute the most to lending volume?

---

## 🏗️ Data Architecture

The project follows an end-to-end analytics workflow:

1. **Domain Research**  
   Understanding the loan lifecycle (Application → Evaluation → Approval → Disbursement → Monitoring).

2. **SQL Processing**  
   Writing optimized SQL queries to calculate KPIs such as MTD, PMTD, and MoM metrics.

3. **Data Modeling**  
   Preparing clean, analysis-ready datasets for Power BI consumption.

4. **Visualization**  
   Designing interactive dashboards for executive, analytical, and operational use.

---

## 📈 Key Performance Indicators (KPIs)

- **Total Loan Applications:** 38.6K (MTD: 4.3K)  
- **Total Funded Amount:** $435.8M  
- **Total Amount Received:** $473.1M  
- **Average Interest Rate:** 12.0%  
- **Average Debt-to-Income (DTI):** 13.3%  
- **Good Loans:** 86.2%  
- **Bad Loans:** 13.8%

---

## 💻 SQL Analysis Highlights

All SQL scripts are available in the `/SQL_Queries` folder.

### Example: Good vs. Bad Loan Percentage

```sql
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;
````

### Example: Monthly Loan Application Trend

```sql
SELECT
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id) AS Total_Applications
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY Month_Number;
```

---

## 📊 Dashboard Features

The Power BI report includes three focused dashboards:

### 1️⃣ Executive Summary
![Executive Summary Dashboard](assets/summary_dashboard.jpg)
* High-level KPIs
* Good vs. Bad Loan comparison
* Loan status performance grid
* Risk indicators using Interest Rate and DTI

### 2️⃣ Portfolio Overview

* **Line Chart:** Monthly lending trends
* **Filled Map:** Regional analysis by state
* **Tree Map:** Home ownership distribution
* **Donut Chart:** Loan term comparison (36 vs 60 months)

### 3️⃣ Detailed View

* Row-level loan records
* Filters by loan grade, purpose, and state
* Designed for auditing and operational analysis

---

## 💡 Insights & Recommendations

* **Risk-Based Pricing:**
  Bad loans carry a higher average interest rate (13.88%) compared to good loans (11.64%), indicating active risk-adjusted pricing.

* **Seasonality:**
  Loan activity peaks in Q4, with December showing the highest repayment volume.

* **Loan Purpose Concentration:**
  Debt consolidation dominates loan demand, suggesting opportunities for tailored consolidation products.

* **Borrower Stability:**
  Applicants with 10+ years of employment represent the most stable and frequent borrower segment.

---

## 🚀 How to Use

1. **Clone the Repository**

```bash
git clone https://github.com/darasum-data/Bank-Loan-Risk-Performance-Analytics.git
```

2. **Database Setup**
   Execute the SQL scripts in SQL Server to create required tables and views.

3. **Power BI Dashboard**
   Open the `.pbix` file and update the data source connection to SQL Server or the provided CSV files.

---

## 📬 Contact

**Dara Sum**
Data Analyst | SQL & Power BI
<a href="https://www.linkedin.com/in/darasum-data" target="_blank" 
   style="display: inline-block; padding: 10px 20px; background-color: #0A66C2; 
          color: white; text-decoration: none; border-radius: 5px; font-weight: bold;">
  Connect on LinkedIn
</a>


```
