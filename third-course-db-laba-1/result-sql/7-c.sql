SELECT
"public".detail."name",
A.detail,
Sum(A.price) orders_price,
Sum(A.quantity) details_quantity,
("public".detail."quantity" - A."quantity") as balance
FROM
"public".orders  as A
INNER JOIN "public".detail ON A.detail = "public".detail."id"
WHERE
A.customer IN ((SELECT id FROM "public".customer WHERE address IN ('Автозаводский', 'Советский') )) AND
A.quantity > 2
GROUP BY A."detail", "public".detail."name", balance
