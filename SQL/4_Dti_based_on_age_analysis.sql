-- DTI by age demographic

SELECT 
		Age,
		ROUND(AVG(Dtir1),2) as Avg_dti
FROM loan
GROUP BY Age
ORDER BY Age;