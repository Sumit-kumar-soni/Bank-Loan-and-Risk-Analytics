-- 10. Triggers preceding fraud flags

SELECT 
    Credit_type AS Credit_bureau_type,
    Loan_purpose,
    COUNT(ID) AS Total_defaults_triggered,
    ROUND(
        (CAST(COUNT(ID) AS FLOAT) / 
        (SELECT COUNT(*) FROM Loan ld2 
         WHERE ld2.credit_type = Loan.credit_type 
         AND ld2.loan_purpose = Loan.loan_purpose)
        ) * 100, 2) AS Actual_default_rate_percentage  -- To see the OVERALL default rate for this combination to ensure it's actually risky

FROM Loan
WHERE Status = 1                                       -- Only looking at the "Bad" accounts
GROUP BY Credit_type, Loan_purpose
ORDER BY Total_defaults_triggered DESC;