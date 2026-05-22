-- 9. Customers with loan + checking overlap

SELECT
		CASE
			WHEN Open_credit = 'opc' THEN 'Multiple Prodct'
			WHEN Open_credit = 'nopc' THEN 'Single Product'
			ELSE 'Unknown'
		END AS Portfolio_status,
		COUNT(ID) AS Total_borrowers,
		ROUND(AVG(CAST(Status AS FLOAT)) * 100, 2) AS Default_rate_percentage   -- check if having overlapping credit makes them more risky
FROM Loan
GROUP BY Open_credit
ORDER BY Total_borrowers DESC;