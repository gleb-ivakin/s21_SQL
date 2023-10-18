CREATE UNIQUE INDEX idx_menu_unique 
       ON menu 
       USING BTREE (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
  FROM menu
 WHERE pizzeria_id = 3;
