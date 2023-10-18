/* Please register a new pizza with name “sicilian pizza” (whose id should
be calculated by formula is “maximum id value + 1”) with a price of 900 
rubles in “Domino's” restaurant (please use internal query to get identifier
of pizzeria). */

INSERT INTO menu (
       id, 
       pizzeria_id, 
       pizza_name, 
       price
       )
VALUES (
       ((SELECT MAX(id) from menu) + 1),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       'sicilian pizza',
       900
       );