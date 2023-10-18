-- Please find all pizza names (and corresponding pizzeria names using menu 
-- table) that Denis or Anna ordered. Sort a result by both columns.

SELECT pizza_name,
       pizzeria.name as pizzeria_name
  FROM person_order
       JOIN menu ON menu_id = menu.id
       JOIN pizzeria ON pizzeria_id = pizzeria.id
       JOIN person ON person_id = person.id
 WHERE person.name IN ('Anna', 'Denis')
 ORDER BY pizza_name, pizzeria.name;