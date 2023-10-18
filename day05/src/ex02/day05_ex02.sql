-- CREATE INDEX idx_person_name 
--        ON person 
--        USING BTREE (UPPER(name));

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT visit_date, person.name
  FROM person_visits
       JOIN person
       ON person_id = person.id