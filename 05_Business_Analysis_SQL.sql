-- Business Question 1:
-- Which Contract Type has the highest churn?
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;


-- Which Internet Service has the highest churn?
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;


-- Which Payment Method has the highest churn?
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;


-- Does Gender affect churn?
SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Gender;

-- Do Senior Citizens churn more?
SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY SeniorCitizen;


-- Does Tech Support reduce churn?
SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;

-- Does Online Security reduce churn?
SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churn_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0/
        COUNT(*),2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY Churn_Rate DESC;

-- Do higher Monthly Charges increase churn?
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM customer_churn
GROUP BY Churn;

-- Does customer tenure affect churn?
SELECT
    Churn,
    ROUND(AVG(Tenure),2) AS Avg_Tenure
FROM customer_churn
GROUP BY Churn;

-- Revenue by Churn Status
SELECT
    Churn,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue
FROM customer_churn
GROUP BY Churn;