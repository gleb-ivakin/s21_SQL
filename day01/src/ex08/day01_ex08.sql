-- Please rewrite a SQL statement from exercise #07 by using NATURAL JOIN construction.
-- The result must be the same like for exercise #07.

SELECT order_date,
CONCAT(name, ' (age:', age, ')') as person_information
FROM person_order
NATURAL JOIN (SELECT id as person_id, name, age FROM person) as pers
ORDER BY order_date, person_information;