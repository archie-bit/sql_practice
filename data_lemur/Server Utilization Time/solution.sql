--https://datalemur.com/questions/total-utilization-time
--Difficulty: Hard
--Source: Amazon

WITH CTE_server AS(
  SELECT 
    *,
  LAG(status_time) OVER (PARTITION BY server_id ORDER BY status_time) prev_time
  FROM server_utilization
)

SELECT 
  ROUND(EXTRACT(
    EPOCH FROM SUM(CASE 
    WHEN session_status = 'stop' THEN (status_time - prev_time) 
    END)) / 86400) AS diff_days
FROM
  CTE_server