-- 6. The High Risk Borrower Analysis (DTI & LTV)

WITH Bucket_customer AS(
SELECT
		ID,
        Property_value,
        Rate_of_interest,
        Dtir1,
        LTV,
		CASE
			WHEN Dtir1 > 50 AND LTV > 96 THEN 'High Risk'
			WHEN Dtir1 BETWEEN 44 AND 50 AND LTV BETWEEN 91 AND 95 THEN 'Medium High Risk'
			WHEN Dtir1 BETWEEN 37 AND 43 AND LTV BETWEEN 81 AND 90 THEN 'Moderate'
			WHEN Dtir1 BETWEEN 36 AND 30 AND LTV BETWEEN 60 AND 80 THEN 'Low Risk'
			ELSE 'Excellent'
		END AS Bucket
FROM Loan
)

SELECT
		COUNT(*) AS Total_customers,
		CONCAT(SUM(Property_value) / 1000000, ' M') AS Total_property_value_in_Millions,
		ROUND(AVG(Rate_of_interest), 2) AS Avg_interest_rate,
		Bucket
FROM Bucket_customer
GROUP BY Bucket
ORDER BY Total_customers DESC;