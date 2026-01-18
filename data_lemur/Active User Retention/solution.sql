--https://datalemur.com/questions/user-retention
--Difficulty: Hard
--Source: Facebook

WITH active_users AS(
  SELECT 
    *,
    EXTRACT(MONTH FROM event_date) mth,
    CASE WHEN
      EXTRACT (MONTH FROM event_date) - EXTRACT(MONTH FROM LAG(event_date) OVER (PARTITION BY user_id ORDER BY event_date)) = 1 then '1'
    END action_diff
    -- EXTRACT(MONTH FROM LAG(event_date) OVER(PARTITION BY user_id ORDER BY event_date ))
  FROM user_actions
)

SELECT 
    mth,
    count(DISTINCT user_id)
FROM active_users
WHERE action_diff IS NOT NULL
      AND mth = 7
GROUP BY 1