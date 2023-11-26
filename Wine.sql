/*Q2 (A)
SELECT Winery.country, COUNT(DISTINCT Grape.variety) AS number_of_grape_varieties
FROM Grape
JOIN Wine ON Grape.id = Wine.gid
JOIN Winery ON Wine.wid = Winery.id
GROUP BY Winery.country
ORDER BY number_of_grape_varieties DESC
LIMIT 1
*/

/*Q2 (B)
SELECT AVG(Wine.price) AS average_price, AVG(Wine.points) AS average_points
FROM Wine
WHERE Wine.price >= 340
*/

/*Q2 (C)
SELECT Wine.points, Rater.name
FROM Wine
JOIN Rater ON Wine.rid = Rater.id

.....
*/