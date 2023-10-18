CREATE INDEX idx_person_order_multi 
       ON person_order 
       USING BTREE (person_id, menu_id);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT person_id, menu_id
  FROM person_order
 WHERE person_id = 8
       AND menu_id = 19;
