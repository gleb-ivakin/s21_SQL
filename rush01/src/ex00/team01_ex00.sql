SELECT COALESCE("user".name, 'not defined') AS name,
       COALESCE(lastname, 'not defined') AS lastname,
       b.type AS type,
       SUM(b.money) AS volume,
       COALESCE(currency.name, 'not defined') AS currency_name,
       COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
       SUM(b.money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
  FROM "user"
 RIGHT JOIN balance AS b
       ON "user".id = b.user_id
  LEFT JOIN (
       SELECT DISTINCT ON (id) id, name, rate_to_usd
       FROM currency
       ORDER BY id, updated DESC
       ) AS currency ON b.currency_id = currency.id
 GROUP BY "user".name,
       "user".lastname,
       b.type,
       currency.name,
       currency.rate_to_usd
 ORDER BY 1 DESC, 2, 3