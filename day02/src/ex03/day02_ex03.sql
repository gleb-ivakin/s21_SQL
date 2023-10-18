-- Let’s return back to Exercise #01, please rewrite your SQL by using the CTE
-- (Common Table Expression) pattern. Please move into the CTE part of your 
-- "day generator". The result should be similar like in Exercise #01

  WITH days_in_range AS (
       SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day') AS generate_date
       )
SELECT to_char(generate_date, 'YYYY-MM-DD') AS visit_date
  FROM days_in_range
       LEFT JOIN person_visits
       ON visit_date = generate_date AND (person_id = 1 OR person_id = 2)
       WHERE person_id IS NULL
 ORDER BY visit_date;