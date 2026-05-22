-- 8. The Fair Lending Demographics Check

SELECT
		Age,
		Loan_purpose,
		ROUND(AVG(Rate_of_interest), 2) AS Avg_interest_rate
FROM Loan
WHERE Age != 'Unknown' AND Loan_purpose != 'Unknown'
GROUP BY Age, Loan_purpose
ORDER BY Avg_interest_rate DESC;