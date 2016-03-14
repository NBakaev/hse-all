SELECT * from detail as all_details WHERE EXISTS 
( 
SELECT detail, customer from orders WHERE quantity = 1  
and detail = all_details.id
GROUP BY detail, customer
HAVING COUNT(*) >= (SELECT count(*) from customer)
)