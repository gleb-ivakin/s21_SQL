/* Let's refresh data in our Materialized View mv_dmitriy_visits_and_eats 
from exercise #06. Before this action, please generate one more Dmitriy 
visit that satisfies the SQL clause of Materialized View except pizzeria 
that we can see in a result from exercise #06. After adding a new visit 
please refresh a state of data for mv_dmitriy_visits_and_eats. */

INSERT INTO person_visits (
       id,
       person_id,
       pizzeria_id,
       visit_date
       )
VALUES (
       ((SELECT MAX(id) from person_visits) + 1),
       (SELECT id FROM person WHERE name = 'Dmitriy'),
       (SELECT id FROM pizzeria WHERE name = 'Best Pizza'),
       '2022-01-08'
       );

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;