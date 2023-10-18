/* Please write a SQL statement which returns a list of pizza names, pizza prices, 
pizzerias names and dates of visit for Kate and for prices in range from 800 to 
1000 rubles. Please sort by pizza, price and pizzeria names. */

SELECT pizza_name,
       price,
       pizzeria.name AS pizzeria_name,
       visit_date
  FROM person_visits AS pv
       JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
       JOIN menu ON pizzeria.id = menu.pizzeria_id
       JOIN person ON pv.person_id = person.id
 WHERE person.name = 'Kate'
       AND price BETWEEN 800 AND 1000
 ORDER BY pizza_name, price, pizzeria_name;