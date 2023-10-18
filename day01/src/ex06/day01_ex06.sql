-- Let's return our mind back to exercise #03 and change our SQL statement to return person 
-- names instead of person identifiers and change ordering by action_date in ascending mode 
-- and then by person_name in descending mode. Please take a look at a data sample below.

SELECT order_date as action_date,
(SELECT name FROM person WHERE person.id = person_id) as person_name
FROM person_order
INTERSECT
SELECT visit_date as action_date,
(SELECT name FROM person WHERE person.id = person_id) as person_name
FROM person_visits
ORDER BY action_date ASC, person_name DESC;