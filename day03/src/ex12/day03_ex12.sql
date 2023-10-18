/* Please register new orders from all persons for “greek pizza” 
by 25th of February 2022. */

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series(
                       (SELECT MAX(id) from person_order) + 1, 
                       (SELECT MAX(id) from person_order) + (SELECT MAX(id) from person)
                       ),
       generate_series(1, (SELECT MAX(id) from person)),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
       '2022-02-25'