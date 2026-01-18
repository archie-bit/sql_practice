--https://datalemur.com/questions/median-search-freq
--Difficulty: Hard
--Source: Google


WITH RECURSIVE table_populate(searches, num_users, ndx) AS(
  SELECT 
    searches,
    num_users,
    1
  FROM search_frequency 
  UNION ALL
  SELECT
    t.searches,
    t.num_users,
    tp.ndx + 1
  FROM search_frequency t
  JOIN table_populate tp
  ON t.searches = tp.searches
  AND tp.ndx + 1 <= t.num_users
  )
  
SELECT
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY searches)
FROM table_populate