CREATE UNIQUE INDEX idx_person_discounts_unique
       ON person_discounts 
       USING BTREE (person_id, pizzeria_id);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT person.name, pizzeria_id, discount
  FROM person_discounts
       JOIN person
       ON person_id = person.id;