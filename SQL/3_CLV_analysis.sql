-- 3. CLV Premium vs. Standard cardholders
-- Since the dataset lacked actual servicing and acquisition costs, I created an estimated CLV model using interest revenue, upfront fees, and expected credit loss.

SELECT
		CASE 
			WHEN Loan_limit='ncf' THEN'Premium'
			WHEN Loan_limit='cf'  THEN'Standard'
			END AS Loan_tier,
		COUNT(*) AS Total_loans,
		-- Formula i have used to solve this query: Estimated CLV = Interest revenue + Upfront charges - expected credit loss( i am assuming 30% of loan amount bank losses on default/risky customers)
		ROUND(AVG((CAST(Loan_amount AS FLOAT) * (Rate_of_interest / 100) * (Term / 12 )) + Upfront_charges - CASE WHEN Status = 1 THEN Loan_amount * 0.30 ELSE 0 END ), 2) AS Estimated_CLV
FROM Loan
GROUP BY Loan_limit;