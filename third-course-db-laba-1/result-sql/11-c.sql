SELECT * from customer WHERE sale < ANY (SELECT sale from customer ) 
and id IN (
SELECT customer from orders WHERE supplier in (
SELECT id from supplier WHERE address = 'Канавинский'
)
)