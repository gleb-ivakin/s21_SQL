-- Let’s find identifiers of persons, who visited and ordered some pizza on 
-- the same day. Actually, please add ordering by action_date in ascending 
-- mode and then by person_id in descending mode.

SELECT order_date as action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date as action_date, person_id
FROM person_visits
ORDER BY action_date ASC, person_id DESC;