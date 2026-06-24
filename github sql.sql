CREATE DATABASE bank_analysis;
USE bank_analysis;
CREATE TABLE bank_transactions (
    TransactionID VARCHAR(20),
    CustomerID VARCHAR(20),
    CustomerDOB DATE,
    CustGender CHAR(1),
    CustLocation VARCHAR(50),
    CustAccountBalance DECIMAL(12,2),
    TransactionDate DATE,
    TransactionTime TIME,
    TransactionAmount DECIMAL(12,2)
);
SELECT * FROM bank_transactions;
SELECT COUNT(*) AS transaction_amount
FROM bank_transactions;
SELECT SUM(Transactionamount) AS total_transactions
FROM bank_transactions;
SELECT avg(Transactionamount) AS total_transactions
FROM bank_transactions;

SELECT CustGender,
       COUNT(*) AS Transactions,
       SUM(TransactionAmount) AS Total_Amount
FROM bank_transactions
GROUP BY CustGender;

SELECT CustLocation,
       COUNT(*) AS Transactions,
       SUM(TransactionAmount) AS Total_Amount
FROM bank_transactions
GROUP BY CustLocation
ORDER BY Total_Amount DESC;

SELECT CustomerID,
       SUM(TransactionAmount) AS Total_Spent
FROM bank_transactions
GROUP BY CustomerID
ORDER BY Total_Spent DESC
LIMIT 10;

SELECT *
FROM bank_transactions
ORDER BY TransactionAmount DESC
LIMIT 1;

SELECT *
FROM bank_transactions
ORDER BY TransactionAmount ASC
LIMIT 1;

SELECT MONTH(TransactionDate) AS Month_No,
       SUM(TransactionAmount) AS Total_Amount
FROM bank_transactions
GROUP BY MONTH(TransactionDate)
ORDER BY Month_No;



SELECT CustomerID,
       SUM(TransactionAmount) AS Total_Spent,
       RANK() OVER (ORDER BY SUM(TransactionAmount) DESC) AS Customer_Rank
FROM bank_transactions
GROUP BY CustomerID;