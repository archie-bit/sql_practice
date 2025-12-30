--https://datalemur.com/questions/sql-third-transaction
--Difficulty: Medium
--Source: Uber

WITH ranked_transactions AS (
  SELECT 
    *,
    DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) trans_rank
  FROM transactions
)

SELECT 
  user_id,
  spend,
  transaction_date
FROM ranked_transactions
WHERE trans_rank = 3