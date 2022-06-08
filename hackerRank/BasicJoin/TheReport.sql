SELECT 
    CASE WHEN G.Grade > 7 THEN S.Name ELSE NULL END AS Name,
    G.Grade, 
    S.Marks 
FROM Students S JOIN Grades G
ON S.Marks >= G.Min_Mark AND S.Marks <= Max_Mark 
ORDER BY 
    G.Grade DESC,
    (CASE WHEN S.Name IS NOT NULL THEN S.Name ELSE S.Marks END) ASC;
