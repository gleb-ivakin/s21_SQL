  WITH orders AS (
SELECT pizzeria.name AS name, 
       COUNT(*) AS count
  FROM person_order
       JOIN menu 
       ON menu_id = menu.id
       JOIN pizzeria
       ON pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
 ORDER BY count DESC, pizzeria.name
       ),

       visits AS(
SELECT pizzeria.name AS name, 
       COUNT(*) AS count
  FROM person_visits
       JOIN pizzeria
       ON pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
 ORDER BY count DESC, pizzeria.name
       )
       
SELECT orders.name AS name,
       orders.count + visits.count AS total_count
  FROM orders
  JOIN visits
       ON orders.name = visits.name
 WHERE orders.name = visits.name
 ORDER BY total_count DESC, name
