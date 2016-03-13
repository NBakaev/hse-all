ALTER TABLE "public"."orders"
ADD COLUMN "commission" int4 ;

UPDATE orders
set commission = P.commission from supplier as P  WHERE orders."supplier" = P."id"
