SELECT detail, AVG(quantity) from orders 
WHERE detail in (select id from detail WHERE price > 10000)
GROUP BY detail