-- Median

SELECT DISTINCT PERCENTILE_CONT(0.5) 
    WITHIN GROUP (ORDER BY Rate_of_interest) OVER () AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Interest_rate_spread ) OVER() AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Upfront_charges) OVER() AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Property_value) OVER() AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Income) OVER() AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY LTV) OVER() AS Median
FROM Loan;

SELECT DISTINCT PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Dtir1) OVER() AS Median
FROM Loan;

-- Mode

SELECT TOP 1 Loan_limit
FROM Loan
GROUP BY Loan_limit
ORDER BY COUNT(*) DESC;

SELECT TOP 1 Approv_in_adv
FROM Loan
GROUP BY Approv_in_adv
ORDER BY COUNT(*) DESC;

SELECT TOP 1 Neg_ammortization
FROM Loan
GROUP BY Neg_ammortization
ORDER BY COUNT(*) DESC;

SELECT TOP 1 Term
FROM Loan
GROUP BY Term
ORDER BY COUNT(*) DESC;

-- Data quality Check

-- Data Quality check

SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Loan';

SELECT
		ID,
		COUNT(*)  AS Nr_of_Duplicate 
FROM Loan
GROUP BY ID
HAVING COUNT(*) > 1;

SELECT
		COUNT(*) AS Total_Rows,
		COUNT(Interest_rate_spread) AS Non_Null_Values,
		COUNT(*) - COUNT(Interest_rate_spread) AS Null_Values
FROM Loan;

SELECT
*
FROM Loan
WHERE 
		Loan_limit IS NULL
		OR Approv_in_adv IS NULL
		OR Loan_purpose IS NULL 
		OR Rate_of_interest IS NULL
		OR Property_value IS NULL
		OR Income IS NULL 
		OR Dtir1 IS NULL;

-- Data Cleaning by using mode, median

-- Run this query to clean all nulls in table

UPDATE Loan
	SET
	   Loan_limit = COALESCE(Loan_limit , 'cf'),
	   Approv_in_adv = COALESCE(Approv_in_adv, 'nopre'),
	   Loan_purpose = COALESCE(Loan_purpose, 'Unknown'),
	   Neg_ammortization = COALESCE(Neg_ammortization, 'not_neg'),
	   Age = COALESCE(Age, 'Unknown'),
	   Term = COALESCE(Term, 360.0),
	   Rate_of_interest = COALESCE(Rate_of_interest, 3.99),
	   Interest_rate_spread = COALESCE(Interest_rate_spread, 0.3904),
	   Upfront_charges = COALESCE(Upfront_charges, 2596.45),
	   Property_value = COALESCE(Property_value, 418000.0),
	   Income = COALESCE(Income, 5760.0),
	   LTV = COALESCE(LTV, 75.14),
	   Dtir1 = COALESCE(Dtir1, 39.0)
	WHERE 
		 Loan_limit IS NULL
		 OR Approv_in_adv IS NULL
		 OR Loan_purpose IS NULL 
		 OR Rate_of_interest IS NULL
		 OR Property_value IS NULL
		 OR Income IS NULL 
		 OR Dtir1 IS NULL;