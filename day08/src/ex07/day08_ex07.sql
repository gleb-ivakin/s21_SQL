-- Session #1
SELECT name FROM pizzeria WHERE id = 1;
SELECT name FROM pizzeria WHERE id = 2;

-- Session #2
SELECT name FROM pizzeria WHERE id = 1;
SELECT name FROM pizzeria WHERE id = 2;

-- Session #1
BEGIN;

-- Session #2
BEGIN;

-- Session #1
UPDATE pizzeria
   SET name = 'Пицца и напиться'
 WHERE id = 1;

-- Session #2
UPDATE pizzeria
   SET name = 'Пицца-убийца'
 WHERE id = 2;

-- Session #1
UPDATE pizzeria
   SET name = 'Пицца-убийца'
 WHERE id = 2;

-- Session #2
UPDATE pizzeria
   SET name = 'Пицца и напиться'
 WHERE id = 1;

-- Session #1
COMMIT;

-- Session #2
COMMIT;

-- Session #1
SELECT name FROM pizzeria WHERE id = 1;
SELECT name FROM pizzeria WHERE id = 2;

-- Session #2
SELECT name FROM pizzeria WHERE id = 1;
SELECT name FROM pizzeria WHERE id = 2;