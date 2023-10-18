/* Please write a SQL statement which satisfies a formula (R - S)∪(S - R).
Where R is the person_visits table with filter by 2nd of January 2022, 
S is also person_visits table but with a different filter by 6th of 
January 2022. Please make your calculations with sets under the person_id
column and this column will be alone in a result. The result please sort
by person_id column and your final SQL please present in v_symmetric_union
database view. */

CREATE VIEW v_symmetric_union AS

  WITH r AS (
       SELECT person_id
         FROM person_visits
        WHERE visit_date = '2022-01-02'
       ),
       s AS (
       SELECT person_id
         FROM person_visits
        WHERE visit_date = '2022-01-06'
       )

(SELECT person_id
  FROM r 
EXCEPT
SELECT person_id
  FROM s)

 UNION

(SELECT person_id
  FROM s
EXCEPT
SELECT person_id
  FROM r)

ORDER BY person_id;