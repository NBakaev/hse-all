SELECT * from (
SELECT * from customer
 left OUTER JOIN 

-- 2) делаем группировку по адресу клиента, используя для группировки max(скидку) 
	(SELECT MAX(sale) max_sale_per_address from customer

where id IN 
-- 1) получаем Id клиентов кто делал заказы у поставщиков из своего района
		(	
			SELECT
			"public".customer.id
			FROM
			"public".customer ,
			"public".supplier
			INNER JOIN "public".orders ON "public".orders.customer = "public".customer."id" AND "public".orders.supplier = "public".supplier."id"

			WHERE customer.address = supplier.address
		)

GROUP BY address 
	) sub on sub.max_sale_per_address = customer.sale) P

-- 3) ТК мы делали группировку по адресу клиента из тех кто делал заказы,
-- то будут те районы где заказы не делались своим поставщикам - в этих местах  
-- max_sale_per_address будет NULL 
WHERE P.max_sale_per_address IS NOT NULL