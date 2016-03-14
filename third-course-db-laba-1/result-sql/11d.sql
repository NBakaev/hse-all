SELECT * from customer as customer_all WHERE id = ANY 
(SELECT customer from orders WHERE supplier = 2 and price > 5000 and customer = customer_all.id)