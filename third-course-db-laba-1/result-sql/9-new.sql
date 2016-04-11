ALTER TABLE "public"."orders"
ADD COLUMN "commission" int4 ;

UPDATE orders
set commission = ( P.commission / 100.0 * orders.price ) from supplier 
as P  WHERE orders."supplier" = P."id"
