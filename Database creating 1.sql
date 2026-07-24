/*=========================================================
PHASE 1 : DATABASE SETUP
=========================================================*/

-- Create Database
CREATE DATABASE customer_churn_db;
USE customer_churn_db;

CREATE TABLE customer_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(5)
);

DESCRIBE customer_churn;

SELECT COUNT(*) AS total_rows
FROM customer_churn;

SELECT *
FROM customer_churn
LIMIT 10;

SELECT *
FROM customer_churn
ORDER BY customerID
LIMIT 10;

SELECT COUNT(*) AS Total_Customers
FROM customer_churn;