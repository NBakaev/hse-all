-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default",
"address" varchar(255) COLLATE "default",
"sale" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "public"."customer" VALUES ('1', 'АО ВАРЯ', 'Сормовский', '10');
INSERT INTO "public"."customer" VALUES ('2', 'ГАЗ', 'Автозаводский', '7');
INSERT INTO "public"."customer" VALUES ('3', 'МП ВЕРА', 'Канавинский', '5');
INSERT INTO "public"."customer" VALUES ('4', 'МП', 'Канавинский', '3');
INSERT INTO "public"."customer" VALUES ('5', 'АО СТАЛЬ', 'Советский', '0');

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS "public"."detail";
CREATE TABLE "public"."detail" (
"id" int4 NOT NULL,
"name" varchar(255) COLLATE "default",
"stock" varchar(255) COLLATE "default",
"quantity" int4,
"price" numeric(10,2) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of detail
-- ----------------------------
INSERT INTO "public"."detail" VALUES ('1', 'Втулка', 'Сормовский', '20000', '5000.00');
INSERT INTO "public"."detail" VALUES ('2', 'Болт', 'Сормовский', '40000', '1000.00');
INSERT INTO "public"."detail" VALUES ('3', 'Ключ гаечный', 'Канавинский', '5000', '3000.00');
INSERT INTO "public"."detail" VALUES ('4', 'Шпилька', 'Автозаводский', '10000', '900.00');
INSERT INTO "public"."detail" VALUES ('5', 'Винт', 'Сормовский', '50000', '1500.00');
INSERT INTO "public"."detail" VALUES ('6', 'Молоток', 'Канавинский', '1200', '2000.00');
INSERT INTO "public"."detail" VALUES ('7', 'Шуруп', 'Сормовский', '30000', '1200.00');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS "public"."order";
CREATE TABLE "public"."order" (
"number" int4 NOT NULL,
"date" varchar COLLATE "default",
"customer" int4 NOT NULL,
"supplier" int4 NOT NULL,
"detail" int4,
"quantity" int4,
"price" numeric(10,2)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO "public"."order" VALUES ('1', 'Январь', '5', '4', '3', '7', '21000.00');
INSERT INTO "public"."order" VALUES ('2', 'Февраль', '3', '3', '3', '2', '6000.00');
INSERT INTO "public"."order" VALUES ('3', 'Февраль', '4', '5', '4', '200', '180000.00');
INSERT INTO "public"."order" VALUES ('4', 'Март', '5', '4', '2', '50', '50000.00');
INSERT INTO "public"."order" VALUES ('5', 'Апрель', '1', '6', '7', '110', '132000.00');
INSERT INTO "public"."order" VALUES ('6', 'Апрель', '4', '4', '1', '150', '750000.00');
INSERT INTO "public"."order" VALUES ('7', 'Май', '2', '4', '6', '20', '40000.00');
INSERT INTO "public"."order" VALUES ('8', 'Июнь', '1', '3', '7', '2000', '2400000.00');
INSERT INTO "public"."order" VALUES ('9', 'Июнь', '2', '5', '7', '10000', '12000000.00');
INSERT INTO "public"."order" VALUES ('10', 'Июнь', '3', '6', '1', '5', '25000.00');
INSERT INTO "public"."order" VALUES ('11', 'Июнь', '4', '3', '3', '1', '3000.00');
INSERT INTO "public"."order" VALUES ('12', 'Июнь', '4', '4', '1', '10', '50000.00');
INSERT INTO "public"."order" VALUES ('13', 'Июль', '1', '6', '6', '3', '6000.00');
INSERT INTO "public"."order" VALUES ('14', 'Июль', '2', '1', '2', '1000', '1000000.00');
INSERT INTO "public"."order" VALUES ('15', 'Июль', '2', '2', '1', '100', '5000000.00');
INSERT INTO "public"."order" VALUES ('16', 'Июль', '5', '1', '5', '100', '15000.00');
INSERT INTO "public"."order" VALUES ('17', 'Август', '1', '4', '7', '12000', '24400000.00');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS "public"."supplier";
CREATE TABLE "public"."supplier" (
"id" int4 NOT NULL,
"lastname" varchar(255) COLLATE "default",
"address" varchar(255) COLLATE "default",
"commission" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO "public"."supplier" VALUES ('1', 'Артюхина', 'Сормовский', '4');
INSERT INTO "public"."supplier" VALUES ('2', 'Щепин', 'Приокский', '4');
INSERT INTO "public"."supplier" VALUES ('3', 'Власов', 'Канавинский', '5');
INSERT INTO "public"."supplier" VALUES ('4', 'Кузнецова', 'Советский', '5');
INSERT INTO "public"."supplier" VALUES ('5', 'Цепилева', 'Нижегородский', '3');
INSERT INTO "public"."supplier" VALUES ('6', 'Корнилов', 'Нижегородский', '6');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table detail
-- ----------------------------
ALTER TABLE "public"."detail" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD PRIMARY KEY ("number");

-- ----------------------------
-- Primary Key structure for table supplier
-- ----------------------------
ALTER TABLE "public"."supplier" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."order"
-- ----------------------------
ALTER TABLE "public"."order" ADD FOREIGN KEY ("customer") REFERENCES "public"."customer" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."order" ADD FOREIGN KEY ("supplier") REFERENCES "public"."supplier" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."order" ADD FOREIGN KEY ("detail") REFERENCES "public"."detail" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
