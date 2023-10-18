-- Please make a select statement which returns person's names (based on 
-- internal query in SELECT clause) which made orders for the menu with 
-- identifiers 13 , 14 and 18 and date of orders should equal 7th of 
-- January 2022. Please be aware with "Denied Section" before your work.

SELECT (SELECT name FROM person WHERE person.id = person_id)
FROM person_order
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07';