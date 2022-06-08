SELECT MS.hacker_id, H.name, SUM(MS.score) AS totalScore FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS score FROM Submissions
    GROUP BY hacker_id, challenge_id
) AS MS JOIN Hackers H ON MS.hacker_id = H.hacker_id
GROUP BY MS.hacker_id, H.name
HAVING totalScore > 0
ORDER BY totalScore DESC, MS.hacker_id;
