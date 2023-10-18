/* Please find all menu identifiers which are not ordered by anyone. 
The result should be sorted by identifiers. */

SELECT menu.id AS menu_id
  FROM menu
 WHERE menu.id NOT IN (
       SELECT menu_id
       FROM person_order
       )
 ORDER BY menu.id;
