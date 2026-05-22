-- 2. Credit utilization vs. default

SELECT
		Dtir1 AS Dti_bucket,
		ROUND(AVG(CAST(Status AS FLOAT)) * 100, 2) AS Default_rate_percentage,
		COUNT(ID) AS Total_loans_in_bucket
FROM Loan
GROUP BY Dtir1
ORDER BY Dti_bucket;