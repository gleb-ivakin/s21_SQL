/* Please write a SQL statement which returns a list of pizzerias which Andrey
visited but did not make any orders. Please order by the pizzeria name. */

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name AS pizzeria_name
         FROM person_visits
              JOIN person ON person_id = person.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE person.name = 'Andrey'
       ) AS andrey_visits

EXCEPT

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name AS pizzeria_name
        FROM person_order
             JOIN person ON person_id = person.id
             JOIN menu ON menu_id = menu.id
             JOIN pizzeria ON pizzeria_id = pizzeria.id
       WHERE person.name = 'Andrey'
       ) AS andrey_orders

 ORDER BY pizzeria_name;