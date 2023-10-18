/* Please register new orders from Denis and Irina on 24th of February 2022
 for the new menu with “sicilian pizza”. */

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (
       ((SELECT MAX(id) from person_order) + 1),
       (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
       '2022-02-24'
       ),
       (
       ((SELECT MAX(id) from person_order) + 2),
       (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
       '2022-02-24'
       );