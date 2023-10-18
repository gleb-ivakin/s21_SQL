 CREATE OR REPLACE FUNCTION fnc_fibonacci(
        IN pstop INTEGER DEFAULT 10
        )
RETURNS SETOF INTEGER AS $$
  BEGIN
        RETURN QUERY
          WITH RECURSIVE fibonacci_numbers(num1, num2) AS (
        SELECT 0, 1
         UNION ALL
        SELECT num2, num1 + num2 FROM fibonacci_numbers
         WHERE num2 < pstop
               )
        SELECT num1 FROM fibonacci_numbers;
    END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();