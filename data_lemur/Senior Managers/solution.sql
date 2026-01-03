--https://datalemur.com/questions/senior-managers-reportees
--Difficulty: Hard
--Source: Google

SELECT 
  manager_name,
  COUNT(*) direct_reportees
FROM employees snmg
WHERE 
  EXISTS (
    SELECT 1
    FROM employees mg
    WHERE mg.manager_id = snmg.emp_id)
  AND 
  EXISTS(
    SELECT 1
    FROM employees ssnmg
    WHERE ssnmg.emp_id = snmg.manager_id
  )
GROUP BY manager_name
ORDER BY COUNT(*) DESC