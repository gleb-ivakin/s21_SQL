-- Find full information about all possible pizzeria names and prices to get
-- mushroom or pepperoni pizzas. Please sort the result by pizza name and 
-- pizzeria name then. The result of sample data is below (please use the same 
-- column names in your SQL statement).

SELECT pizza_name,
       pizzeria.name AS pizzeria_name, 
       price
  FROM menu
  JOIN pizzeria ON pizzeria_id = pizzeria.id
 WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
 ORDER BY pizza_name, pizzeria_name;