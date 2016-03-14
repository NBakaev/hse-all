SELECT * from customer as all_customer WHERE EXISTS(
SELECT * from orders WHERE customer = all_customer."id"
and detail in (SELECT id from detail WHERE price > 6000)
and supplier in (select id from supplier WHERE address in ('Советский', 'Канавинский')
)
)