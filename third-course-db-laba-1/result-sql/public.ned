
*
A3                !        )        0 �
customer 2Y
idint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2g
namevarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2j
addressvarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2Y
saleint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � J.
customer_pkeycustomerid" (���������0 8 RpublicX���������`h� � � � � � ����������������������������������������� � � � � � � � � � � �postgres� ����������� � � � � ����������� � � � � � � �
detail 2Y
idint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2g
namevarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2h
stockvarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2]
quantityint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2d
pricenumeric
 0: B R Z b �Default�Default�Default� ��
pg_catalog�numeric� � � J*
detail_pkeydetailid" (���������0 8 RpublicX���������`h� � � � � � ����������������������������������������� � � � � � � � � � � �postgres� ����������� � � � � ����������� � � � � � � �
orders 2]
numberint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2d
datevarchar: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2_
customerint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2_
supplierint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2[
detailint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2]
quantityint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2b
pricenumeric
 : B R Z b �Default�Default�Default� ��
pg_catalog�numeric� � � 2_

commissionint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � J-

order_pkeyordersnumber" (���������0 8 RpublicX���������`h� � � � � � ����������������������������������������� � � � � � � � � � � �postgres� ����������� � � � � ����������� � � � � � � �
supplier 2Y
idint4 0: B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � 2k
lastnamevarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2j
addressvarchar�: B R Zdefaultb �Default�Default�Default� ��
pg_catalog�varchar� � � 2_

commissionint4 : B R Z b �Default�Default�Default� ��
pg_catalog�int4� � � J.
supplier_pkeysupplierid" (���������0 8 RpublicX���������`h� � � � � � ����������������������������������������� � � � � � � � � � � �postgres� ����������� � � � � ����������� � � � � � � b
customerorderscustomer"customer*id08B JpublicRpublicX` h r	NO ACTIONz	NO ACTION� � \
detailordersdetail"detail*id08B JpublicRpublicX` h r	NO ACTIONz	NO ACTION� � b
supplierorderssupplier"supplier*id08B JpublicRpublicX` h r	NO ACTIONz	NO ACTION� � "�
	Diagram 1(0:H
F
customer�� �(�2$	SSSSSS�?PPPPPP�?�?!      �?8 Bpublic:E
C
detail(� �(�2$	SSSSSS�?PPPPPP�?�?!      �?8 Bpublic:F
D
orders�� �(�2$	SSSSSS�?PPPPPP�?�?!      �?8 Bpublic:G
E
supplier� �(�2$	SSSSSS�?PPPPPP�?�?!      �?8 Bpublic: : : J�
customer����$	�������?�������?�������?!      �? *orders2customer:customerBidJpublicRpublicXbK��� *Arial Unicode MS0:$	�������?�������?�������?!      �?@ H P J�
detail����$	�������?�������?�������?!      �? *orders2detail:detailBidJpublicRpublicXbJ��{ *Arial Unicode MS0:$	�������?�������?�������?!      �?@ H P J�
supplier����$	�������?�������?�������?!      �? *orders2supplier:supplierBidJpublicRpublicXbK��� *Arial Unicode MS0:$	�������?�������?�������?!      �?@ H P RArial Unicode MSX` h p �( 0 :
public@hPX�N` h 