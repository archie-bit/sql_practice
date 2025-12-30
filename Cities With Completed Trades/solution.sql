--https://datalemur.com/questions/completed-trades
--Difficulty: Easy
--Source: Robinhood

SELECT
 u.city,
 count(*)
FROM trades t
LEFT JOIN users u
ON t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY u.city
ORDER BY count(order_id) DESC
LIMIT 3