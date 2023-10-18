-- Please write a SQL statement which returns unique pizza names from the menu
-- table and orders by pizza_name column in descending mode. Please pay 
-- attention to the Denied section.

SELECT DISTINCT pizza_name
FROM menu
ORDER BY pizza_name DESC;