/* Please use SQL statement from Exercise #01 and show pizza names from pizzeria 
which are not ordered by anyone, including corresponding prices also. The result 
should be sorted by pizza name and price. The sample of output data is presented 
below. */

SELECT pizza_name,
       price,
       pizzeria.name AS pizzeria_name
  FROM menu
       JOIN pizzeria on pizzeria_id = pizzeria.id
 WHERE menu.id NOT IN (
       SELECT menu_id
       FROM person_order
       )
 ORDER BY pizza_name, price;
