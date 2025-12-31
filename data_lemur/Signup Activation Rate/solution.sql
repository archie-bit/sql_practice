--https://datalemur.com/questions/signup-confirmation-rate
--Difficulty: Medium
--Source: TikTok


WITH CTE_activation AS(
  SELECT 
    *,
    CASE signup_action
      WHEN 'Confirmed' THEN 1
      ELSE NULL
    END activation
  FROM emails e
  INNER JOIN texts t
  ON e.email_id = t.email_id
)

SELECT 
  ROUND(COUNT(activation)*1.0/COUNT(signup_action), 2)
FROM CTE_activation


--ALT Solution
SELECT 
  ROUND(COUNT(*) FILTER (WHERE signup_action = 'Confirmed')*1.0/
  COUNT(*), 2)
FROM emails e
INNER JOIN texts t
ON e.email_id = t.email_id