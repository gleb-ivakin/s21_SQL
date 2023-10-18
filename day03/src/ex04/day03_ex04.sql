/* Please find a union of pizzerias that have orders either from women or from men. */

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name as pizzeria_name
         FROM person_order
              JOIN person ON person_id = person.id
              JOIN menu ON menu_id = menu.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'male'

       EXCEPT
          
       SELECT pizzeria.name as pizzeria_name
         FROM person_order
              JOIN person ON person_id = person.id
              JOIN menu ON menu_id = menu.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'female'
       ) AS male_visits

 UNION

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name as pizzeria_name
         FROM person_order
              JOIN person ON person_id = person.id
              JOIN menu ON menu_id = menu.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'female'

       EXCEPT

       SELECT pizzeria.name as pizzeria_name
         FROM person_order
              JOIN person ON person_id = person.id
              JOIN menu ON menu_id = menu.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'male'
       ) AS female_visits
       
 ORDER BY pizzeria_name;