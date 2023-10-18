-- Please find the names of all males from Moscow or Samara cities who orders either 
-- pepperoni or mushroom pizzas (or both). Please order the result by person name in 
-- descending mode.

SELECT name
  FROM person
       JOIN person_order ON person.id = person_id
       JOIN menu ON menu_id = menu.id
 WHERE address IN ('Moscow', 'Samara')
       AND gender = 'male'
       AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
 ORDER BY name DESC;