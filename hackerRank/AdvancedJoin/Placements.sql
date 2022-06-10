SELECT SP.Name FROM
(SELECT S.ID, S.Name, P.Salary FROM Students S JOIN Packages P ON S.ID = P.ID) AS SP
JOIN
(SELECT F.ID, F.Friend_ID, P.Salary FROM Friends F JOIN Packages P ON F.Friend_ID = P.ID) AS FP
ON SP.ID = FP.ID
WHERE SP.Salary < FP.Salary
ORDER BY FP.Salary;
