SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT pizza_name, pizzeria.name as pizzeria_name
  FROM menu
       JOIN pizzeria
       ON pizzeria_id = pizzeria.id;