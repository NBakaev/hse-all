SELECT * from detail as all_details WHERE NOT EXISTS 
(SELECT * from orders where detail = all_details.id and customer in (SELECT id from customer as all_customers WHERE sale < 5)
)

-- SELECT * from customer as all_customers WHERE sale < 5