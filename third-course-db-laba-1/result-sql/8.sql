UPDATE orders
set price = (orders.price * (1 - (P.sale / 100.0) ) )
FROM orders as all_orders
INNER JOIN "public".customer as P ON all_orders."customer" = P."id";

SELECT * FROM orders