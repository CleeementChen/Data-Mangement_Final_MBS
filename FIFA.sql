/*Q1 (A)
SELECT Club.club_name, AVG(Player.defending) as average_defending_rating
FROM Player
JOIN Club ON Player.club_team_id = Club.cid
JOIN Defending ON Player.pid = Defending.did
GROUP BY Club.club_name
ORDER BY average_defending_rating DESC
*/
/*Q1 (B)
SELECT Player.short_name, Club.club_name, calculated.attacking_rating
FROM Player
JOIN Club ON Player.club_team_id = Club.cid
JOIN (
    SELECT aid, (crossing + finishing + heading_accuracy + short_passing + volleys) / 5 AS attacking_rating
    FROM Attacking
) AS calculated ON Player.pid = calculated.aid
WHERE calculated.attacking_rating > 80
*/
/*Q1 (C)
SELECT Club.cid, Club.club_name
FROM Club
JOIN Player ON Club.cid = Player.club_team_id
GROUP BY Club.cid, Club.club_name
HAVING AVG(Player.shooting) >= (
    SELECT AVG(Player.shooting)
	FROM Player
	JOIN Club ON Player.club_team_id = Club.cid
	WHERE Club.club_name = 'AC Milan'
)
*/