--https://datalemur.com/questions/patient-call-history
--Difficulty: Hard
--Source: UnitedHealth

WITH
days_diff AS(
  SELECT 
    policy_holder_id,
    call_date,
    (call_date- 
    LAG (call_date, 1) OVER (PARTITION BY policy_holder_id ORDER BY call_date ASC)) calls_diff
  FROM callers
)

SELECT
  COUNT(DISTINCT policy_holder_id) policy_holder_count
FROM days_diff
WHERE calls_diff <= INTERVAL '7 days'