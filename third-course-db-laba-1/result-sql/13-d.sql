SELECT * from customer as all_customers WHERE EXISTS 
( SELECT customer, detail from orders WHERE customer = all_customers.id and detail
in 
(SELECT id from detail as all_details WHERE NOT EXISTS 
( SELECT detail from orders WHERE supplier not in (SELECT id from supplier WHERE address = 'Сормовский' )
and detail = all_details.id
 )
)
GROUP BY customer, detail
HAVING count(*) >= (SELECT count(*) from detail as all_details WHERE NOT EXISTS 
( SELECT detail from orders WHERE supplier not in (SELECT id from supplier WHERE address = 'Сормовский' )
and detail = all_details.id
 )
)

 )

