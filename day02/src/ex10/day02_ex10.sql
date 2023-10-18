-- Please find the names of persons who live on the same address. Make sure that the result
-- is ordered by 1st person, 2nd person's name and common address.

SELECT p1.name AS person_name1,
       p2.name AS person_name2,
       p1.address AS common_address
  FROM person p1
       JOIN person p2 ON p1.address = p2.address
 WHERE p1.name < p2.name   -- лексикографическое сравнение для исключения дубликатов
 ORDER BY p1.name, p2.name, p1.address;