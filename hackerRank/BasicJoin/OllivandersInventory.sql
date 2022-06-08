SELECT W.id, WP.age, W.coins_needed, W.power FROM Wands_Property WP
JOIN Wands W ON WP.code = W.code
WHERE WP.is_evil = 0
AND W.coins_needed = (SELECT MIN(W1.coins_needed) FROM Wands W1 JOIN Wands_Property WP1
                     ON W1.code = WP1.code WHERE WP1.is_evil = 0
                     AND W1.power = W.power
                     AND WP1.age = WP.age)
ORDER BY W.power DESC, WP.age DESC;
