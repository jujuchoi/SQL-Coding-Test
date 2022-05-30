SET @H = -1;
SELECT H.HOUR, COUNT(HOUR(AO.DATETIME)) AS 'COUNT' FROM 
(SELECT (@H := @H+1) HOUR FROM ANIMAL_OUTS WHERE @H < 23) AS H
LEFT JOIN ANIMAL_OUTS AS AO
ON H.HOUR = HOUR(AO.DATETIME)
GROUP BY H.HOUR ORDER BY H.HOUR;
