SELECT MAx(salary * months), COUNT(*) FROM Employee 
WHERE (salary * months) = (SELECT MAX(salary*months) FROM Employee);
