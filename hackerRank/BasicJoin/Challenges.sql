SELECT H.hacker_id, H.name, COUNT(*) AS challenges_created FROM Hackers H JOIN Challenges C
ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING challenges_created = 
(
    SELECT MAX(sub.challenge_created) FROM (
        SELECT COUNT(*) AS challenge_created FROM Hackers H JOIN Challenges C ON H.hacker_id = C.hacker_id
    GROUP BY H.hacker_id
    ) sub
)
OR
challenges_created IN 
(
    SELECT sub.challenge_created FROM (
        SELECT hacker_id, COUNT(*) AS challenge_created FROM Challenges GROUP BY Challenges.hacker_id) sub
    GROUP BY sub.challenge_created HAVING COUNT(*) = 1
)
ORDER BY challenges_created DESC, H.hacker_id;
