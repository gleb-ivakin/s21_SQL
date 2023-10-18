-- Please write a SQL statement which returns a list of the person names which 
-- made an order for pizza in the corresponding pizzeria. The sample result 
-- (with named columns) is provided below and yes ... please make ordering by
-- 3 columns in ascending mode.

SELECT person.name as person_name, pizza_name, pizzeria.name as pizzeria_name
FROM person_order
JOIN menu ON menu.id = menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person ON person.id = person_order.person_id
ORDER BY person.name, pizza_name, pizzeria.name;