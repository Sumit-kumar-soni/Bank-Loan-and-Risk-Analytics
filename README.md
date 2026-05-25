# Bank Loan Default & Risk Analytics Dashboard 🏦📊

## Project Overview
This project is an end-to-end data analytics solution designed to evaluate mortgage portfolio risk, identify high-risk borrowers, and calculate estimated customer lifetime value. The goal was to build a tool that a Chief Risk Officer (CRO) or Underwriting Manager could use to make data-driven lending decisions.

## Tech Stack Used
* **Database Management:** SQL Server (Data extraction, cleaning, and handling `NULL` values via financial median/mode imputation)
* **Data Visualization & BI:** Power BI
* **Calculations & Logic:** SQL `CASE` statements, Aggregations, and DAX (Data Analysis Expressions)

## Key Business Questions Answered
1. **The DTI Risk Curve:** At what exact Debt-to-Income (DTI) percentage does a borrower's likelihood of default spike?
2. **Portfolio Profitability:** Which loan products (Jumbo vs. Conforming, Purchase vs. Refinance) drive the highest estimated Lifetime Value (CLV)?
3. **Cross-Selling Impact:** Do customers with overlapping credit lines (multiple active products) pose a higher or lower risk to the bank?
4. **Predictive Triggers:** Using AI Decomposition, which combination of credit bureau type and loan purpose yields the highest default rate?

## The Data Model & Preparation
* Processed **148,000+ rows** of raw mortgage application data.
* Utilized SQL Staging Tables to safely import flat files and assign strict `INT` and `FLOAT` data types for financial accuracy.
* Addressed data skewness by utilizing the **Median** for continuous financial variables (Income, Property Value) and the **Mode / 'Unknown' tags** for categorical variables to prevent algorithmic bias.

## Files Included
* `Banking_Risk_Queries.sql`: The SQL scripts containing the advanced risk logic, DTI bucketing, and CLV calculations.
* `Bank Loan Report.pbix`: The final Power BI project file containing the data model and interactive canvas.
* `Dashboard_Screenshots/`: High-resolution images of the final dashboard pages (Executive Summary, Risk Matrix, and Profitability).

<img width="1920" height="1031" alt="Bank Loan Report" src="https://github.com/user-attachments/assets/b002486b-311b-49f8-88b4-59ac9aefb9a1" />
