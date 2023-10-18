/* Please register new visits into Domino's restaurant from Denis and Irina
on 24th of February 2022. */

INSERT INTO person_visits (
       id,
       person_id,
       pizzeria_id,
       visit_date
       )
VALUES (
       ((SELECT MAX(id) from person_visits) + 1),
       (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       '2022-02-24'
       ),
       (
       ((SELECT MAX(id) from person_visits) + 2),
       (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM pizzeria WHERE name = 'Dominos'),
       '2022-02-24'
       );