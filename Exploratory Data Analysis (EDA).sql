/*==========================================================
        PHASE 3 - EXPLORATORY DATA ANALYSIS (EDA)
        Project : Customer Churn Analysis Dashboard
==========================================================*/

SELECT COUNT(*) AS Total_Customers
FROM customer_churn;

SELECT COUNT(*) AS Churn_Customers
FROM customer_churn
WHERE Churn = 'Yes';

SELECT COUNT(*) AS Retained_Customers
FROM customer_churn
WHERE Churn = 'No';

SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0
/
COUNT(*),2
) AS Churn_Rate
FROM customer_churn;

SELECT
ROUND(
SUM(CASE WHEN Churn='No' THEN 1 ELSE 0 END) * 100.0
/
COUNT(*),2
) AS Retention_Rate
FROM customer_churn;

SELECT
ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM customer_churn;

SELECT
ROUND(AVG(TotalCharges),2) AS Avg_Total_Charges
FROM customer_churn;

SELECT
ROUND(AVG(Tenure),2) AS Avg_Tenure
FROM customer_churn;

SELECT
MIN(MonthlyCharges) AS Minimum,
MAX(MonthlyCharges) AS Maximum,
ROUND(AVG(MonthlyCharges),2) AS Average
FROM customer_churn;

SELECT
MIN(Tenure) AS Minimum,
MAX(Tenure) AS Maximum,
ROUND(AVG(Tenure),2) AS Average
FROM customer_churn;

SELECT
MIN(TotalCharges) AS Minimum,
MAX(TotalCharges) AS Maximum,
ROUND(AVG(TotalCharges),2) AS Average
FROM customer_churn;