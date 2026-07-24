/*==========================================================
        PHASE 5 - ADVANCED SQL ANALYSIS
        Project : Customer Churn Analysis Dashboard
==========================================================*/

SELECT
    customerID,
    MonthlyCharges,
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Value'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Value'
        ELSE 'High Value'
    END AS Customer_Segment
FROM customer_churn;


SELECT
CASE
    WHEN MonthlyCharges <35 THEN 'Low Value'
    WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Value'
    ELSE 'High Value'
END AS Customer_Segment,
COUNT(*) AS Total_Customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0
/
COUNT(*),2) AS Churn_Rate
FROM customer_churn
GROUP BY Customer_Segment
ORDER BY Churn_Rate DESC;


SELECT
CASE
WHEN tenure <=12 THEN 'New Customer'
WHEN tenure BETWEEN 13 AND 36 THEN 'Regular Customer'
WHEN tenure >36 THEN 'Loyal Customer'
END AS Customer_Type,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY Customer_Type;


SELECT
CASE
WHEN tenure<=12 THEN 'New Customer'
WHEN tenure BETWEEN 13 AND 36 THEN 'Regular Customer'
ELSE 'Loyal Customer'
END AS Customer_Type,
COUNT(*) AS Total_Customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100.0/
COUNT(*),2)
AS Churn_Rate
FROM customer_churn
GROUP BY Customer_Type
ORDER BY Churn_Rate DESC;


SELECT
Contract,
ROUND(SUM(TotalCharges),2)
AS Revenue
FROM customer_churn
GROUP BY Contract
ORDER BY Revenue DESC;


SELECT
customerID,
Contract,
MonthlyCharges,
TotalCharges
FROM customer_churn
ORDER BY TotalCharges DESC
LIMIT 10;


SELECT
customerID,
TotalCharges,
RANK() OVER(
ORDER BY TotalCharges DESC
) AS Customer_Rank
FROM customer_churn;


WITH RankedCustomers AS (
SELECT
customerID,
TotalCharges,
RANK() OVER(
ORDER BY TotalCharges DESC
) AS Customer_Rank
FROM customer_churn
)
SELECT *
FROM RankedCustomers
WHERE Customer_Rank<=5;


SELECT
ROUND(
SUM(TotalCharges),2
)
AS Revenue_Lost
FROM customer_churn
WHERE Churn='Yes';


SELECT
customerID,
tenure,
MonthlyCharges,
CASE
WHEN tenure<=12
AND MonthlyCharges>70
THEN 'High Risk'
WHEN tenure<=24
THEN 'Medium Risk'
ELSE 'Low Risk'
END
AS Risk_Category
FROM customer_churn;