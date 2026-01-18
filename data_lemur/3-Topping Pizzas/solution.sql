--https://datalemur.com/questions/pizzas-topping-cost
--Difficulty: Hard
--Source: McKinsey

SELECT 
  CONCAT(tp1.topping_name, ',',tp2.topping_name, ',', tp3.topping_name) ings,
  tp1.ingredient_cost + tp2.ingredient_cost + tp3.ingredient_cost topping_total
FROM pizza_toppings tp1
JOIN pizza_toppings tp2
ON tp1.topping_name < tp2.topping_name
JOIN pizza_toppings tp3
ON tp2.topping_name < tp3.topping_name
ORDER BY topping_total DESC, ings