create table ogrenciler (
id integer primary key,
isim varchar(50),
adres varchar(100),
sinav_notu integer
);
insert into ogrenciler values(1,'Betul Koyuncu','İstanbul',80);
insert into ogrenciler(id,isim,adres,sinav_notu) values
(2,'Zeki Demir','İzmir',90),
(3,'Cemal Doğan', 'Trabzon',100),
(4,'Nazlı Nazan AVCI','Aksaray',95),
(5,'Miraç Demir', 'Bursa',65),
(6,'Yavuz BAl','Antalya',55);

select * from ogrenciler;

---soru1: ogrenciler tablosundaki id ve isim bilgileri ile tüm kayıtları getirelim
select id, isim from ogrenciler;

--soru2: sınav notu 80 den büyük olan öğrencilerin tüm bilgilerini getirelim.
select * from ogrenciler where sinav_notu > 80;

--soru3: Adresi Ankara olan öğrencilerin tüm bilgilerini getirelim.
select * from ogrenciler where adres='Ankara'

-- bir kayıt ekleyelim
insert into ogrenciler values(7,'Ali Gümüş','Ankara',100);

--soru4: Sınav notu 80 olan ve adresi İstanbul olan öğrncileri listeleyelim.
select * from ogrenciler where sinav_notu =80 and adres='İstanbul';

--soru5: Sınav notu 55 veya 100 olan öğrencilerin tüm bilgilerini getirelim.
select * from ogrenciler where sinav_notu = 55 or sinav_notu =100;
select * from ogrenciler where sinav_notu in( 55, 100);

--soru6: sınav notu 65 ile 95 arasında olan öğrencilerin tüm bilgilerini getirelim.
select * from ogrenciler where sinav_notu between 65 and 95;

--soru7: id si 3 ve 6 arasında olmayan  öğrencilerin tüm bilgilerini getirelim.
select * from ogrenciler where id not between 3 and 6;

--soru8: En yüksek sınav puanı nedir?
select max(sinav_notu) from ogrenciler;

--soru9: İzmir de yaşayan ve sınav notu 50 den büyük olan tüm bilgilerini getirelim.
select * from ogrenciler where adres='İzmir' and sinav_notu > 50;

--soru10: Öğrenci sayısı ve ortalama sınav notu:
select count(*), avg(sinav_notu) from ogrenciler;
select count(*), round(avg(sinav_notu),0) from ogrenciler;

--soru11: Sınav notu 55 olan satırı siliniz.
delete from ogrenciler where sinav_notu=55;
select * from ogrenciler;

--soru12: İsmi Zeki Demir veya Miraç Demir olan kayıtları silin.
delete from ogrenciler where isim='Zeki Demir' or isim='Miraç Demir';

--soru13: Öğrenciler tablosunun içeriğini siliniz
delete from ogrenciler;

--soru14: Öğrenciler tablosunu siliniz

drop table ogrenciler;