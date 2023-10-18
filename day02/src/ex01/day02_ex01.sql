-- Please write a SQL statement which returns the missing days from 1st to 10th
-- of January 2022 (including all days) for visits of persons with identifiers 
-- 1 or 2. Please order by visiting days in ascending mode.

SELECT to_char(generate_date, 'YYYY-MM-DD') AS visit_date
  FROM generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day'::INTERVAL) AS generate_date
       LEFT JOIN person_visits
       ON visit_date = generate_date 
       AND person_id BETWEEN 1 AND 2
 WHERE person_id IS NULL
 ORDER BY visit_date;