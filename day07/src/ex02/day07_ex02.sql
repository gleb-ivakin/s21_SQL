  WITH orders AS (
SELECT pizzeria.name AS name, 
       COUNT(*) AS count,
       'order' AS action_type
  FROM person_order
       JOIN menu 
       ON menu_id = menu.id
       JOIN pizzeria
       ON pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
 ORDER BY count DESC, pizzeria.name
 LIMIT 3
       ),

       visits AS(
SELECT pizzeria.name AS name, 
       COUNT(*) AS count,
       'visit' AS action_type
  FROM person_visits
       JOIN pizzeria
       ON pizzeria_id = pizzeria.id
 GROUP BY pizzeria.name
 ORDER BY count DESC, pizzeria.name
 LIMIT 3
       )
       
SELECT name, count, action_type
  FROM orders
 UNION ALL 
SELECT name, count, action_type
  FROM visits
 ORDER BY action_type, count DESC