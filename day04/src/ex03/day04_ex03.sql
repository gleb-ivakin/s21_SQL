/* Please write a SQL statement which returns missing days for persons’
visits in January of 2022. Use v_generated_dates view for that task and
sort the result by missing_date column. */

SELECT DISTINCT generated_date as missing_date
  FROM v_generated_dates
       LEFT JOIN person_visits
       ON generated_date = visit_date
 WHERE visit_date IS NULL
 ORDER BY missing_date;