--https://datalemur.com/questions/uncategorized-calls-percentage
--Difficulty: Medium
--Source: UnitedHealth

SELECT 
  ROUND(
    COUNT(CASE 
      WHEN call_category IS NULL OR call_category = 'n/a' THEN 1
      ELSE NULL
    END)*100.0/COUNT(*)
    , 1
  ) uncategorised_call_pct
FROM callers