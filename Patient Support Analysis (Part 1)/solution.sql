--https://datalemur.com/questions/frequent-callers
--Difficulty: Easy
--Source: UnitedHealth


WITH 
callers_count AS(
  SELECT 
    policy_holder_id,
    COUNT(policy_holder_id) call_count
  FROM callers
  GROUP BY policy_holder_id
)

SELECT
  count(call_count)
FROM callers_count
WHERE call_count >= 3
