SELECT submission_date,
       (SELECT COUNT(DISTINCT hacker_id)
        FROM Submissions as S1
        WHERE S1.submission_date = S.submission_date AND
        (SELECT COUNT(DISTINCT S2.submission_date) FROM
         Submissions as S2
         WHERE S2.hacker_id = S1.hacker_id AND S2.submission_date < S.submission_date) = 
        DATEDIFF(S.submission_date, '2016-03-01')
        ),
        (SELECT hacker_id 
         FROM Submissions AS S1
         WHERE S1.submission_date = S.submission_date
         GROUP BY hacker_id
         ORDER BY COUNT(submission_id) DESC, hacker_id LIMIT 1) AS id,
         (SELECT name FROM Hackers WHERE hacker_id = id)
FROM
    (SELECT DISTINCT submission_date FROM submissions) AS S
GROUP BY submission_date;
