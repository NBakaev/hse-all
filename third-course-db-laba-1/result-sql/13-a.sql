-- выбрать всех клиентов где есть 
-- поставщик с районом советский И есть заказ 
-- с этим поставщиком и клиентом и стоимость детали больше 6000
-- Union - объединяет для каждого района
SELECT * from customer WHERE EXISTS (

SELECT * from supplier WHERE address = 'Советский' and EXISTS
  (SELECT * from orders WHERE supplier = supplier."id" 
	AND customer = customer."id" and detail in (SELECT id from detail WHERE price > 6000)
	)
)

 UNION

 (
SELECT * from customer WHERE EXISTS (

SELECT * from supplier WHERE address = 'Канавинский' and EXISTS
  (SELECT * from orders WHERE supplier = supplier."id" 
	AND customer = customer."id" and detail in (SELECT id from detail WHERE price > 6000)
	)
)
)