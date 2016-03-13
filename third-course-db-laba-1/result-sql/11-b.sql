select id, name, "price" from detail where id IN (

SELECT detail from orders WHERE detail IN (

select id  from detail as P
 WHERE price = ANY ( SELECT price from detail WHERE id <> P."id")

) and supplier in ( SELECT id from supplier WHERE address = 'Советский' )
 and commission >= ALL (SELECT commission from supplier WHERE address = 'Советский')
) limit 1 OFFSET 1