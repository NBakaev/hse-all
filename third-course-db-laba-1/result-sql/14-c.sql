SELECT * from (
SELECT * from customer
 left OUTER JOIN (SELECT MAX(sale) max_sale_per_address from customer
where id IN (

SELECT
"public".customer.id
FROM
"public".customer ,
"public".supplier
INNER JOIN "public".orders ON "public".orders.customer = "public".customer."id" AND "public".orders.supplier = "public".supplier."id"

WHERE customer.address = supplier.address
)
GROUP BY address ) sub on sub.max_sale_per_address = customer.sale) P
WHERE P.max_sale_per_address IS NOT NULL