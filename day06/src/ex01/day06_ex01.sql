INSERT INTO person_discounts

  WITH discount_info AS (
SELECT person_id, pizzeria_id, 
       CASE 
       WHEN COUNT(person_id) = 1 THEN 10.5
       WHEN COUNT(person_id) = 2 THEN 22
       ELSE 30 
       END AS discount
  FROM person_order
       JOIN menu
       ON menu_id = menu.id
 GROUP BY person_id, pizzeria_id
 ORDER BY person_id, pizzeria_id, discount
)

SELECT ROW_NUMBER() OVER () AS id,
       person_id, pizzeria_id, discount
  FROM discount_info