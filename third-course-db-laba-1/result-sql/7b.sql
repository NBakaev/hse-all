SELECT DISTINCT a.ID, a.lastname, a.commission

from (SELECT 
orders.detail, customer.name, customer.address, 
supplier.address,
supplier.lastname, supplier.commission,
supplier."id"

FROM orders
 INNER JOIN customer on orders.customer = customer.id
 INNER JOIN supplier on orders.supplier = supplier."id"

WHERE customer.address != supplier.address
and orders."date" 
 in ('Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль',
'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь')

) as a
ORDER BY a.commission asc