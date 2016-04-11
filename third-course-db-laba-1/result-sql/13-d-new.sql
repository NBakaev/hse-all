-- выбрать потребителя у которого число заказанных уникальных деталей, 
-- не поставляемыми из сормовского района равно всему уникальному числу деталей
--    не поставляемыми из сормовского района
SELECT * from customer as all_customers WHERE
(
SELECT COUNT(DISTINCT detail) FROM orders WHERE customer = all_customers."id"
and detail in (

( SELECT DISTINCT detail from orders as orders_details WHERE
	not EXISTS (SELECT * from orders WHERE detail = orders_details.detail and supplier 
		in (SELECT id FROM supplier WHERE address = 'Сормовский' ) )  )

)
) = 

-- выбираем детали у которых нет ни одного заказа с поставщиком из сормовскиого района
-- те они не поставляют
( SELECT COUNT(DISTINCT detail) from orders as orders_details WHERE
	not EXISTS (SELECT * from orders WHERE detail = orders_details.detail and supplier 
		in (SELECT id FROM supplier WHERE address = 'Сормовский' ) )  )