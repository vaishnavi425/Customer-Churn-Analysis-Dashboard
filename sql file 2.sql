/*==========================================================
        PHASE 2 - DATA CLEANING
        Project : Customer Churn Analysis Dashboard
==========================================================*/

SELECT customerID,
COUNT(*) AS duplicate_count
FROM customer_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT *
FROM customer_churn
WHERE TotalCharges IS NULL;

SELECT customerID,
tenure,
MonthlyCharges,
TotalCharges
FROM customer_churn
WHERE TotalCharges = '';

SELECT COUNT(*) AS Blank_Values
FROM customer_churn
WHERE TRIM(TotalCharges) = '';

SELECT COUNT(*) AS Null_Values
FROM customer_churn
WHERE TotalCharges IS NULL;

SELECT
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN TRIM(TotalCharges) = '' THEN 1 ELSE 0 END) AS BlankTotalCharges
FROM customer_churn;

UPDATE customer_churn
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

ALTER TABLE customer_churn
MODIFY COLUMN TotalCharges DECIMAL(10,2);

SELECT DISTINCT gender
FROM customer_churn;

SELECT DISTINCT Churn
FROM customer_churn;

SELECT DISTINCT Contract
FROM customer_churn;

SELECT DISTINCT InternetService
FROM customer_churn;

SELECT DISTINCT PaymentMethod
FROM customer_churn;

SELECT gender,
COUNT(*) AS TotalCustomers
FROM customer_churn
GROUP BY gender;

SELECT Contract,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY Contract;

SELECT Churn,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY Churn;

SELECT InternetService,
COUNT(*) AS Customers
FROM customer_churn
GROUP BY InternetService;

SELECT
MIN(TotalCharges) AS Minimum,
MAX(TotalCharges) AS Maximum,
AVG(TotalCharges) AS Average
FROM customer_churn;

DESCRIBE customer_churn;