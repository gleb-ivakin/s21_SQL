/* Please find a union of pizzerias that have been visited either women or men. */

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name as pizzeria_name
         FROM person_visits
              JOIN person ON person_id = person.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'male'

       EXCEPT ALL
          
       SELECT pizzeria.name as pizzeria_name
         FROM person_visits
              JOIN person ON person_id = person.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'female'
       ) AS male_visits

 UNION

SELECT pizzeria_name
  FROM (
       SELECT pizzeria.name as pizzeria_name
         FROM person_visits
              JOIN person ON person_id = person.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'female'

       EXCEPT ALL

       SELECT pizzeria.name as pizzeria_name
         FROM person_visits
              JOIN person ON person_id = person.id
              JOIN pizzeria ON pizzeria_id = pizzeria.id
        WHERE gender = 'male'
       ) AS female_visits
       
 ORDER BY pizzeria_name;