SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS 'Doctor',
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS 'Professor',
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS 'Singer',
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS 'Actor'
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME) RN
    FROM OCCUPATIONS
    ) TEMP GROUP BY TEMP.RN;
