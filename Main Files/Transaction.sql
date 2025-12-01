use banking_db;

/* Total Credit Amount */
SELECT concat(ROUND(SUM(Amount) / 1000000, 2),' M') AS Total_Credit_Amount_Million
FROM banking_transactions
WHERE Transaction_Type = 'Credit';

/* Total Debit Amount */
SELECT concat(ROUND(SUM(Amount) / 1000000, 2),' M') AS Total_Debit_Amount_Million
FROM banking_transactions
WHERE Transaction_Type = 'Debit';

/* Credit to Debit Ratio */
SELECT 
    SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) /
    NULLIF(SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END), 0) 
    AS Credit_Debit_Ratio
FROM banking_transactions;

/* Net Transaction Amount */
SELECT concat(ROUND(
    (SUM(CASE WHEN Transaction_Type = 'Credit' THEN Amount ELSE 0 END) -
     SUM(CASE WHEN Transaction_Type = 'Debit' THEN Amount ELSE 0 END)) / 1000000, 2
),' M') AS Net_Transaction_Amount_Million
FROM banking_transactions;

/* Account Activity Ratio */
SELECT Customer_ID, COUNT(*) * 1.0 / NULLIF(AVG(Balance), 0) AS Account_Activity_Ratio
FROM banking_transactions
GROUP BY Customer_ID;

/* Total Transaction Amount by Branch */
SELECT Branch, concat(ROUND(SUM(Amount) / 1000000, 2),' M') AS Total_Amount_Million
FROM banking_transactions
GROUP BY Branch
ORDER BY Total_Amount_Million DESC;


/* Transaction Volume by Bank */
SELECT Bank_Name, concat(ROUND(SUM(Amount) / 1000000, 2),' M') AS Total_Amount_Million
FROM banking_transactions
GROUP BY Bank_Name
ORDER BY Total_Amount_Million DESC;

/* Branch Transaction Growth */
SELECT Branch, Transaction_Year, Transaction_Month,
       ROUND(SUM(Amount) / 1000000, 2) AS Monthly_Amount_Million,
       ROUND(LAG(SUM(Amount)) OVER (PARTITION BY Branch ORDER BY Transaction_Year, Transaction_Month) / 1000000, 2) AS Prev_Month_Million,
       ROUND(
           (SUM(Amount) - LAG(SUM(Amount)) OVER (PARTITION BY Branch ORDER BY Transaction_Year, Transaction_Month)) * 100.0 /
           NULLIF(LAG(SUM(Amount)) OVER (PARTITION BY Branch ORDER BY Transaction_Year, Transaction_Month), 0), 2
       ) AS Growth_Percentage
FROM banking_transactions
GROUP BY Branch, Transaction_Year, Transaction_Month
ORDER BY Branch, Transaction_Year, Transaction_Month;

/* High-Risk Transaction Flag */
SELECT *, CASE WHEN Amount > 3000 THEN 'High-Risk' ELSE 'Normal' END AS Risk_Flag
FROM banking_transactions;

/* High-Risk Transaction Count */

SELECT CASE WHEN Amount > 4000 THEN 'High-Risk' ELSE 'Normal' END AS Risk_Flag,
COUNT(*) AS Transaction_Count
FROM banking_transactions
GROUP BY CASE WHEN Amount > 4000 THEN 'High-Risk' ELSE 'Normal' END;











