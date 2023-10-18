         WITH RECURSIVE fibonacci_numbers(num1, num2) AS (
       SELECT 0, 1
        UNION ALL
       SELECT num2, num1 + num2 FROM fibonacci_numbers
        WHERE num1 < 10
              )
       SELECT num1 FROM fibonacci_numbers;