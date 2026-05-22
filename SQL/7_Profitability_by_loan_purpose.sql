-- 7. Profitability by Loan Purpose

SELECT
		Loan_purpose,
		ROUND(AVG(Interest_rate_spread), 2) AS Avg_Interest_rate_spread,
		CONCAT(SUM(Upfront_charges) / 1000000, ' M') AS Total_upfront_charges_in_Millions
FROM Loan
GROUP BY Loan_purpose
ORDER BY Loan_purpose;