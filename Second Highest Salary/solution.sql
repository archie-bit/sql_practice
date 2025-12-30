--https://datalemur.com/questions/sql-second-highest-salary
--Difficulty: Medium
--Source: FAANG

SELECT
  salary
FROM(
  SELECT 
    employee_id,
    salary,
    ROW_NUMBER() over(ORDER BY salary DESC) ranked_salaries
  FROM employee
)t WHERE ranked_salaries = 2