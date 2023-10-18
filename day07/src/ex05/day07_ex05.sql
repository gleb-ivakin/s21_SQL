SELECT DISTINCT person.name AS name
  FROM person_visits
  JOIN person
       ON person_id = person.id
 ORDER BY name