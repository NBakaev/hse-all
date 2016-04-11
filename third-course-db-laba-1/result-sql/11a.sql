SELECT * from supplier WHERE id = ANY 
( SELECT supplier FROM orders WHERE customer = 
 				(SELECT customer FROM orders WHERE "date" = 'Апрель' ORDER BY price DESC LIMIT 1)
and "date" = 'Май'  
)
 ORDER BY commission DESC LIMIT 1