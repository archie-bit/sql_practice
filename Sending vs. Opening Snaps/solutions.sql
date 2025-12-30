--https://datalemur.com/questions/time-spent-snaps
--Difficulty: Medium
--Source: Snapchat

WITH 
time_open AS (
  SELECT
    ab.age_bucket,
    SUM(time_spent) total_open
  FROM activities act
  LEFT JOIN age_breakdown ab
  ON act.user_id = ab.user_id
  WHERE act.activity_type = 'open'
  GROUP BY ab.age_bucket
),
time_send AS (
  SELECT
    ab.age_bucket,
    SUM(time_spent) total_send
  FROM activities act
  LEFT JOIN age_breakdown ab
  ON act.user_id = ab.user_id
  WHERE act.activity_type = 'send'
  GROUP BY ab.age_bucket
)


SELECT
  ts.age_bucket,
  ROUND(total_send* 100.0/NULLIF((total_send+total_open),0) , 2),
  ROUND(total_open* 100.0/NULLIF((total_send+total_open),0) , 2)
FROM time_send ts
INNER JOIN time_open tio
ON ts.age_bucket = tio.age_bucket