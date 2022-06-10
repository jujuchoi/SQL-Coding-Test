SELECT ct.contest_id, 
       ct.hacker_id,
       ct.name,
       SUM(total_submissions) AS ts,
       SUM(total_accepted_submissions) AS tas,
       SUM(total_views) AS tv,
       SUM(total_unique_views) AS tuv
FROM Contests ct 
   LEFT JOIN Colleges c ON ct.contest_id = c.contest_id
   LEFT JOIN Challenges ch ON c.college_id = ch.college_id
   LEFT JOIN 
        (SELECT challenge_id, 
                SUM(total_views) AS total_views,
                SUM(total_unique_views) AS total_unique_views  
         FROM View_Stats GROUP BY challenge_id) AS vs ON ch.challenge_id = vs.challenge_id
   LEFT JOIN 
        (SELECT challenge_id,
                SUM(total_submissions) AS total_submissions,
                SUM(total_accepted_submissions) AS total_accepted_submissions
         FROM Submission_Stats GROUP BY challenge_id) AS ss ON ch.challenge_id = ss.challenge_id
GROUP BY ct.contest_id, ct.hacker_id, ct.name
HAVING ts + tas + tv + tuv > 0
ORDER BY ct.contest_id;
