-- 1. Default % by loan type

SELECT
		Loan_type,
		ROUND(AVG(CAST(Status AS FLOAT) * 100 ), 2) AS Default_rate_percentage
FROM Loan
GROUP BY Loan_type;