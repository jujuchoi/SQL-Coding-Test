SELECT MAX(salary * months) AS 'earnings', COUNT(*) FROM Employee 
GROUP BY salary * months ORDER BY earnings DESC LIMIT 1;
