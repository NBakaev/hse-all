SELECT
array_to_string(array_agg(customer."name"), ', ') as customer_names,
customer.address
FROM

customer WHERE id in (
SELECT customer from orders WHERE orders.detail = (SELECT id from detail WHERE name = 'Молоток')
)

GROUP BY customer.address