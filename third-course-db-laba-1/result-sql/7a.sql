SELECT 
"name", sale

FROM customer
INNER JOIN orders on customer = customer."id"
WHERE 
supplier = (SELECT id from supplier WHERE lastname = 'Щепин')
and 
price > 5000