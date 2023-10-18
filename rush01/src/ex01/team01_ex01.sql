/*
insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
*/

with tt1 as (select distinct b.currency_id,
        b.updated,
        first_value(c.rate_to_usd) over (partition by b.currency_id, b.updated order by (b.updated - c.updated)) t1
    from balance b
        join currency c on b.currency_id = c.id and b.updated >= c.updated),

    tt2 as (select distinct b.currency_id,
        b.updated,
        first_value(c.rate_to_usd) over (partition by b.currency_id , b.updated order by (c.updated - b.updated)) t2
    from balance b
        join currency c on b.currency_id = c.id and b.updated < c.updated),

    currencies as (select distinct coalesce(tt1.currency_id, tt2.currency_id) currency_id,
        coalesce(tt1.updated, tt2.updated) updated, tt1.t1, tt2.t2
    from tt1
        full join tt2 on tt1.currency_id = tt2.currency_id and tt1.updated = tt2.updated
    order by 1 desc, 2, 3, 4),

    currency_name as (select distinct id, name
    from currency)

select COALESCE(u.name, 'not defined')     as name,
       COALESCE(u.lastname, 'not defined') as lastname,
       cn.name                             as currency_name,
       b2.money * COALESCE(cr.t1, cr.t2)   as currency_in_usd
from balance as b2
         full join "user" u on u.id = b2.user_id
         join currency_name cn on b2.currency_id = cn.id
         join currencies cr on b2.currency_id = cr.currency_id and b2.updated = cr.updated
order by 1 desc, 2, 3;


-- Альтернативное решение
/* 
 CREATE OR REPLACE FUNCTION get_currency_in_usd(
        IN pid BIGINT,
        IN pdate TIMESTAMP,
        IN pmoney NUMERIC
        )
RETURNS NUMERIC AS $$
DECLARE
        currency_in_usd NUMERIC;
  BEGIN
        SELECT COALESCE(
               ( -- find a nearest rate_to_usd of currency at the past
                 SELECT rate_to_usd
                   FROM currency
                  WHERE id = pid
                    AND updated < pdate
                  ORDER BY updated DESC
                  LIMIT 1
               ),
               ( -- find a nearest rate_to_usd of currency at the future
                 SELECT rate_to_usd
                   FROM currency
                  WHERE id = pid
                    AND updated > pdate
                  ORDER BY updated ASC
                  LIMIT 1
               )) * pmoney
          INTO currency_in_usd 
          FROM currency;
        RETURN currency_in_usd;
    END;
$$ LANGUAGE plpgsql;

SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       currency.name AS currency_name,
       get_currency_in_usd(
         pid := b.currency_id,
         pdate := b.updated,
         pmoney := b.money
       ) AS currency_in_usd
  FROM "user"
 RIGHT JOIN balance AS b
       ON "user".id = b.user_id
  JOIN currency
       ON currency_id = currency.id
 GROUP BY "user".name,
       "user".lastname,
       currency.name,
       currency_in_usd
 ORDER BY 1 DESC, 2, 3
*/