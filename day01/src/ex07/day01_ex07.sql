-- Please write a SQL statement which returns the date of order from the person_order table 
-- and corresponding person name (name and age are formatted as in the data sample below) 
-- which made an order from the person table. Add a sort by both columns in ascending mode.

SELECT order_date,
CONCAT(name, ' (age:', age, ')') as person_information
FROM person_order
JOIN person ON person.id = person_id
ORDER BY order_date, person_information;