CREATE TABLE ogrenciler (
    id integer primary key,
    isim varchar(50),
    adres varchar(100),
    sinav_notu integer
);
-- Tabloma veri ekleme
insert into ogrenciler values(1,'Betul Kuyucu','Istanbul',80);

INSERT INTO ogrenciler (id,isim,adres,sinav_notu) values 
        (2,'Zeki Bey','Izmir', 90),
        (3,'Cemal Dogan','Trabzon',65),
        (4,'Mirac','Bursa',45),
        (5,'Yavuz Bal','Antalya',55);
		
		
		INSERT INTO ogrenciler (id,isim,sinav_notu) values
        (6,'Bilal Degirmen',95),
        (7,'Fahri Ersoz',92);
select * from ogrenciler
-- SORU1: ogrenciler tablosundaki id ve isim bilgileri ile tum recordlari getirelim :
SELECT (id,isim) FROM ogrenciler;
-- SORU2: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where sinav_notu>80
-- SORU3: Adresi Ankara olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where adres='Ankara';
insert into ogrenciler values(8,'Ali Can','Ankara',45);
-- SORU4: Sinav notu 80 ve adresi Istanbul olan ogrenci ismini listele
select isim from ogrenciler where adres='Istanbul' and sinav_notu=80;
-- SORU5: Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where sinav_notu=55 or sinav_notu=100;
select * from ogrenciler where sinav_notu in(55,100);
-- SORU6: Sinav notu 65 ve 85 arasinda olan ogrencilerin tum bilgilerini listele
select * from ogrenciler where sinav_notu between 65 and 85;
-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele
select isim,sinav_notu from ogrenciler where id not between 3 and 5;
-- SORU8: En yuksek sinav puani nedir
Select max(sinav_notu)from ogrenciler;
-- SORU9: İzmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:
select * from ogrenciler where adres='Izmir' and sinav_notu>50;
-- SORU10: Öğrenci sayısı ve ortalama sınav notu:
select count(*),avg(sinav_notu)from ogrenciler;
select count(*),Round(avg(sinav_notu))from ogrenciler;
-- SORU11: sinav_notu 55 olan satiri siliniz
delete from ogrenciler where sinav_notu=55;
-- SORU12: ismi Derya Soylu veya Cemal Dogan olan satirlari siliniz
delete from ogrenciler where isim='Derya Soylu'or isim='Cemal Dogan';
delete from ogrenciler where isim in('Derya Soylu','Cemal Dogan');
-- SORU13 : Ogrenciler tablosunn icerigini siliniz
delete from ogrenciler;
truncate table ogrenciler;
--SORU14 : Ogrenciler Tablosunu siliniz
drop table ogrenciler;




/*************************************************************
******************* ON-DELETE-CASCADE  **********************
*************************************************************

Child tabloda on delete cascade komutu yazilmazsa

1-) Child tablo silinmeden Parent tablo silinmeye calisildiginda 
		PgAdmin Eror verir. Yani Child tablo silinmeden Parent 
	    tablo silinemez
		
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda Pg Admin Eror verir. yani Child tablodaki 
		veri silinmeden Parent tablodaki veri silinemez

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
	PgAdmin Eror vermez
	
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda PgAdmin Eror vermez	Parent tablodaki veriyi 
		siler.Fakat bu durumda Child tablodaki veride silinir.
*/
CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson') ;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY (ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE	
);
INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra 0z');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlil Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

-- SORU-1 : parent2 tablosundaki tum verileri siliniz
delete from parent2;
select * from parent2;
select * from child2;
-- SORU-2 : Parent2 tablosunu silinz
drop table parent2;
drop table parent2 cascade;
--SORU-3: child2 tablosunu siliniz
drop table child2;


CREATE TABLE toptancilar
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen'); 
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203,'Erikson', 'Mehmet Gör'); 
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

CREATE TABLE malzemeler  --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT FK FOREIGN KEY (ted_vergino) REFERENCES toptancilar (vergi_no) on delete cascade
);


INSERT INTO malzemeler VALUES (201, 1001, 'Laptop', 'Asli Can'); 
INSERT INTO malzemeler VALUES (202, 1002, 'Telefon', 'Fatih Ak'); 
INSERT INTO malzemeler VALUES (202, 1003, 'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES (202, 1004, 'Laptop', 'Veli Tan');

--SORU-4: Malzemeler tablosundaki musteri_isim'i Asli Can olan kaydin malzeme_isim'ini, 
	--toptancılar tablosunda irtibat_ismi 'Adem Coş' olan kaydin sirket_ismi ile güncelleyiniz.
update malzemeler set malzeme_isim=(select sirket_ismi from toptancilar where irtibat_ismi='Adem Coş')where musteri_isim='Asli Can';
select * from malzemeler;

--SORU-5: malzeme_ismi Laptop olan kaydin musteri_isim'ini, sirket_ismi Apple'olan toptancinin 
--irtibat_isim'i ile güncelleyiniz.
update malzemeler set musteri_isim=(select irtibat_ismi from toptancilar where sirket_ismi='Apple')where malzeme_isim='Laptop';


create table arac ( 
id int,
marka varchar (30),
model varchar(30), 
fiyat int,
kilometre int, 
vites varchar(20)
);
insert into arac values (100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values (101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values (102, 'Honda', 'Civic', 400000, 15000, 'Manuel' );
insert into arac values (103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );  
insert into arac values (104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values (105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values (106, 'Bugatti', 'Veyron', 950008, 5000, 'Otomatik' );

--SORU-6: arac tablosundaki en yüksek fiyat'ı listele	
select max(fiyat)from arac;

--Soru-7: arac tablosundaki araçların toplam fiyatını bulunuz
select sum(fiyat)as toplam_fiyat from arac;
--Soru-8: arac tablosundaki fiyat ortalamalarını bulunuz
select avg(fiyat)from arac;
select round(avg(fiyat),2)as ortalama_fiyat from arac;
--Soru-9:arac tablosunda kaç tane araç olduğunu bulunuz
select count(*)from arac;




CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');

select * from meslekler;
drop table meslekler;

--Soru-10: meslekler tablosunu isime göre sıralayınız
select * from meslekler order by isim;

--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız
select * from meslekler order by maas DESC;

--Soru-12: meslekler tablosunda ismi Ali olanların maaşıni büyükten küçüğe doğru sıralayınız	
select maas from meslekler where isim='Ali' order by maas DESC;

--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz
select * from meslekler where id>5 order by id asc limit 2;

--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz
select * from meslekler order by maas desc limit 3;

