create database SBS;
use SBS;
create table sinema_bilgiler
(
sinema_no int identity(1,1),
constraint pk_sinema_no primary key(sinema_no),
sinema_Ad varchar(50),
sinema_Adres varchar(150),
sinema_tel_no varchar(11)
);
create table salon
(
salon_no int identity(1,1),
constraint pk_salon_no primary key(salon_no),
salon int,
);
create table durum --alt yazý, türkçe dublaj, 3D vb...
(
durum_id int identity(1,1),
constraint pk_durum_id primary key(durum_id),
durum varchar(40),	
);
create table film
(
film_id int identity(1,1),
constraint pk_film_id primary key(film_id),
film_ad varchar(40) not null,
film_tur varchar(30)not null,
film_acýklama varchar(800)not null,
film_sure varchar(5) not null,
film_cýkýs_tarihi date,
film_dili varchar(15) not null,
film_yapimci varchar(20) not null,
film_foto varchar(70),
film_salon int,
constraint fk_film_salon_id foreign key(film_salon) references salon(salon_no),
);

create table seans
(
seans_id int identity(1,1),
constraint pk_seans_id primary key(seans_id),
seans varchar(5),
);


create table film_seans
(
film_seans_id int identity(1,1),
constraint pk_film_seans_id primary key(film_seans_id),
filmm_id int,
constraint fk_film_seans_id foreign key(filmm_id) references film(film_id),
seans_id int,
constraint fk_seans_id foreign key(seans_id) references seans(seans_id),
durum_no int,
constraint fk_drm_no foreign key(durum_no) references durum(durum_id),
);


create table birim
(
birim_no int identity(1,1),
constraint pk_birim_no primary key(birim_no),
birim_ad nvarchar(20),
);

create table yetki
(
yetki_id int identity(1,1) primary key,
yetki_ad varchar(20),
);

create table personel
(
personel_no int identity(1,1),
constraint pk_personel_no primary key(personel_no),
personel_ad varchar(20) not null,
personel_soyad varchar(30) not null,
personel_dogum_tarihi date not null,
personel_maas int not null,
personel_tc_no varchar(11) not null,
personel_tel_no varchar(10) not null,
birim_no int,
constraint fk_birim_personel_no foreign key(birim_no) references birim(birim_no),
);
create table sifre
(
sifre_no int identity(1,1) primary key,
k_adi varchar(25),
sifre nvarchar(50),
p_no int,
constraint fk_p_no foreign key(p_no) references personel(personel_no),
yetki_no int,
constraint fk_yetki_no foreign key(yetki_no) references yetki(yetki_id)
);

create table bilet
(
bilet_no int identity(1,1),
constraint pk_bilet_no primary key(bilet_no),
sinema_id int,
constraint fk_sinema_id foreign key(sinema_id) references sinema_bilgiler(sinema_no),
film_no int,
constraint fk_film_bilet_no foreign key(film_no) references film(film_id),
tarih smalldatetime,
personel_no int,
constraint fk_personel_bilet_no foreign key(personel_no) references personel(personel_no),
salon_no int,
constraint fk_bilet_salon_no foreign key(salon_no) references salon(salon_no),
film_seans_id int,
constraint fk_film_seans_no foreign key(film_seans_id) references film_seans(film_seans_id),
);
create table alinan_koltuk
(
alinan_koltuk_no int identity(1,1) primary key,
koltuk_sýra varchar(3),
bilet_no int,
constraint fk_k_bilet_no foreign key(bilet_no) references bilet(bilet_no),
);
create table seans_salon
(
seans_salon_id int identity(1,1) primary key,
seans_id int,
constraint fk_seans_salon_id foreign key(seans_id) references seans(seans_id),
salon_no int,
constraint fk_salon_id foreign key(salon_no) references salon(salon_no),
);


