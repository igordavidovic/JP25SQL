drop database if exists doktor;
create database doktor character set utf8;
use doktor;

create table doktor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    email varchar(50)
);

create table medicinskasestra(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    email varchar(50)
);

create table pacijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    mbo char(9) not null,
    oib char(11) not null
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    doktor int not null,
    pacijent int not null,
    trajanje int 
);

create table medicinskasestra_lijecenje(
    medicinskasestra int not null,
    lijecenje int not null
);

alter table lijecenje add foreign key(doktor) references doktor(sifra);
alter table lijecenje add foreign key(pacijent) references pacijent(sifra);

alter table medicinskasestra_lijecenje add foreign key(medicinskasestra) references medicinskasestra(sifra);
alter table medicinskasestra_lijecenje add foreign key(lijecenje) references lijecenje(sifra);

insert into doktor(sifra,ime,prezime,placa,email) values
(null,'Tomo','Vlahović',8000.00,'tomovlahovic@gmail.com');

insert into pacijent(sifra,ime,prezime,mbo,oib) values
(null,'Verica','Grgić','159831393','19786704597'),
(null,'Kruno','Marković','123456789','12345678900'),
(null,'Dejana','Perić','132456789','29191164634'),
(null,'Julijan','Župan','159868674','83650762066'),
(null,'Slađana','Ivanović','195324567','77514184055'),
(null,'Frano','Tomčić','135987545','94541549035'),
(null,'Vitomir','Martinović','167985434','97796486415'),
(null,'Arijana','Franjić','189944321','04105974628'),
(null,'Tomo','Dragić','178956742','58329663453'),
(null,'Toma','Lončar','165443376','64341578465');

insert into medicinskasestra(sifra,ime,prezime,placa,email) values
(null,'Gabrijela','Perić',6100.00,null),
(null,'Milica','Lončar',null,'milicaloncar@gmail.com'),
(null,'Bojana','Đurić',6400.00,null),
(null,'Slavica','Mihaljević',6200.00,'slavicamihaljevic@gmail.com');

insert into lijecenje(sifra,doktor,pacijent,trajanje) values
(null,1,1,null),
(null,1,2,50),
(null,1,3,null),
(null,1,4,null),
(null,1,5,30),
(null,1,6,40),
(null,1,7,null),
(null,1,8,null),
(null,1,9,30),
(null,1,10,45),
(null,1,3,null);


