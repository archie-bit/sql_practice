--https://datalemur.com/questions/reactivated-users
--Difficulty: Hard
--Source: Facebook

WITH user_logins_counted AS(
  SELECT 
    *,
    EXTRACT(MONTH FROM login_date) AS mth,
    LAG (EXTRACT (MONTH FROM login_date)) OVER (PARTITION BY user_id ORDER BY login_date ASC) last_login
  FROM user_logins
)

SELECT
  *
FROM(
  SELECT
    mth,
    COUNT(*) FILTER (
      WHERE last_login IS NULL OR
      mth - last_login > 1
    ) reactivated_users
  FROM user_logins_counted
  GROUP BY mth
)t 
WHERE reactivated_users > 0
ORDER BY mth;

