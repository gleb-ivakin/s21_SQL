 CREATE OR REPLACE FUNCTION func_minimum(
        IN arr NUMERIC[]
        )
RETURNS NUMERIC AS $$
DECLARE
        minimum NUMERIC;
  BEGIN
        SELECT MIN(value) INTO minimum
        FROM UNNEST(arr) AS value;
        RETURN minimum;
    END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);