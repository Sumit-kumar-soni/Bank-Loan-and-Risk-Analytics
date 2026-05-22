-- 5. YoY deposit volumes across branches
-- My insigth is the North region demonstrated the strongest approval quality with the lowest default rate (22.51%), while the North-East region showed the highest credit risk with a 30.45% default rate.

SELECT
		year as YoY,
		Region as Bank_region,
		COUNT(ID) AS Total_applications,
		SUM(CAST(Loan_amount AS FLOAT)) AS  Total_volume,
		ROUND(AVG(CAST(loan_amount AS FLOAT)), 2) AS Avg_loan_size,
		ROUND(AVG(CAST(Status AS FLOAT)) * 100 , 2) AS Default_rate_percenatge   -- checking approval quality in each region. That was North region approves better quality borrowers
FROM Loan
GROUP BY Region, Year
ORDER BY Total_volume DESC;