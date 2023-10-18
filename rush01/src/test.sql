SELECT COALESCE("user".name, 'not defined'),
      COALESCE(lastname, 'not defined'),
      type,
      SUM(money) AS volume,
      COALESCE(currency.name, 'not defined') AS currency_name,
      COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
      SUM(money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM "user"
RIGHT JOIN balance ON "user".id = user_id
LEFT JOIN (SELECT DISTINCT ON (id) id, name, rate_to_usd
      FROM currency
      ORDER BY id, updated DESC) AS currency ON currency_id = currency.id
GROUP BY "user".name, lastname, type, currency.name, rate_to_usd
ORDER BY 1 DESC, 2, 3
