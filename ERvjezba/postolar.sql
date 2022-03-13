drop database if exists postolar;
create database postolar character set utf8;
use postolar;

create table postolar(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    segrt int not null
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table obuca(
    sifra int not null primary key auto_increment,
    korisnik int not null,
    vrsta varchar(50),
    velicina int
);

create table popravak(
    sifra int not null primary key auto_increment,
    postolar int not null,
    obuca int not null,
    trajanje int,
    cijena decimal(18,2)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);



alter table obuca add foreign key(korisnik) references korisnik(sifra);

alter table postolar add foreign key(segrt) references segrt(sifra);

alter table popravak add foreign key(postolar) references postolar(sifra);
alter table popravak add foreign key(obuca) references obuca(sifra);

insert into korisnik(sifra,ime,prezime) values
(null,'Žarko','Marković'),
(null,'Davorin','Lučić'),
(null,'Javor','Martinović'),
(null,'Jela','Herceg'),
(null,'Antonio','Perić'),
(null,'Doris','Mlakar'),
(null,'Gabriela','Ilić');


insert into segrt(sifra,ime,prezime,placa) values
(null,'Antonijo','Jugovac',4750.00);

insert into obuca(sifra,korisnik,vrsta,velicina) values
(null,1,'Čizme',45),
(null,2,'Cipele',43),
(null,3,'Tenisice',42),
(null,4,'Sportske tenisice',null),
(null,5,'Čizme',40),
(null,6,'Tenisice',null),
(null,7,'Papuče',null);

insert into postolar(sifra,ime,prezime,segrt) values
(null,'Zdenko','Knežević',1);

insert into popravak(sifra,postolar,obuca,trajanje,cijena) values
(null,1,1,40,80.00),
(null,1,2,null,null),
(null,1,3,110,110.00),
(null,1,4,null,null),
(null,1,5,null,35.00),
(null,1,6,70,50.00),
(null,1,7,null,null),
(null,1,5,null,80.00),
(null,1,4,90,null);