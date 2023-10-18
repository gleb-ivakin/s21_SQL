SELECT person.name AS name, pizza_name, price,
       FLOOR(price * ((100 - discount) / 100)) AS discount_price,
       pizzeria.name AS pizzeria_name
  FROM person_order AS po
       JOIN person
         ON po.person_id = person.id
       JOIN menu
         ON menu_id = menu.id
       JOIN person_discounts AS pd
         ON po.person_id = pd.person_id
        AND menu.pizzeria_id = pd.pizzeria_id
       JOIN pizzeria
         ON menu.pizzeria_id = pizzeria.id
 ORDER BY person.name, pizza_name