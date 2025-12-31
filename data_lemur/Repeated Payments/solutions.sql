--datalemur.com/questions/repeated-payments
--Difficulty: Hard
--Source: Stripe

WITH transactions_CTE AS(
  SELECT 
    *,
    LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) last_order
  FROM transactions
)

SELECT
  COUNT (*) FILTER (WHERE (EXTRACT (EPOCH FROM(transaction_timestamp - last_order))/60) >= 10) payment_count
FROM transactions_CTE