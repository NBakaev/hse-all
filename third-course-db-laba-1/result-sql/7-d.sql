SELECT
array_to_string(array_agg("public".customer."name") , ',' ) as customers_names,
 "public".customer."address"
FROM
"public".orders
INNER JOIN "public".customer ON "public".orders.customer = "public".customer."id"
WHERE
"public".orders.detail = 
	(SELECT id from detail WHERE name = 'Молоток')
GROUP BY "public".customer."address"