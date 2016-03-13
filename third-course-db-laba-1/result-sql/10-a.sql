SELECT * from (

SELECT
"public".orders.detail,
"public".customer."name",
COUNT(*) as count_all
FROM
"public".orders
INNER JOIN "public".customer ON "public".orders.customer = "public".customer."id"
WHERE
"public".orders.detail IN (2, 5)

GROUP BY "public".orders.detail, "public".customer."name"
) as P WHERE P.count_all >= 2