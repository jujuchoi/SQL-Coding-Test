SELECT F1.X, F1.Y FROM
Functions F1 JOIN Functions F2
ON F1.X = F2.Y AND F1.Y = F2.X
GROUP BY F1.X, F1.Y
HAVING COUNT(F1.X) > 1 OR F1.X < F1.Y 
ORDER BY F1.X;
