SELECT H.hacker_id, H.name FROM Submissions S
                  JOIN Hackers H ON S.hacker_id = H.hacker_id
                  JOIN Challenges C ON S.challenge_id = C.challenge_id
                  JOIN Difficulty D ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score AND D.difficulty_level = C.difficulty_level
GROUP BY H.hacker_id, H.name
HAVING COUNT(H.hacker_id) > 1
ORDER BY COUNT(H.hacker_id) DESC, H.hacker_id;
