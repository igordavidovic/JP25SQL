drop database if exists urar;
create database urar character set utf8;
use urar;

create table urar(
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

create table sat(
    sifra int not null primary key auto_increment,
    korisnik int not null,
    kvar varchar(50),
    marka varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table popravak(
    sifra int not null primary key auto_increment,
    urar int not null,
    sat int not null,
    trajanje int,
    cijena decimal(18,2)
);

alter table urar add foreign key(segrt) references segrt(sifra);

alter table sat add foreign key(korisnik) references korisnik(sifra);

alter table popravak add foreign key(urar) references urar(sifra);

alter table popravak add foreign key(sat) references sat(sifra);

insert into korisnik(sifra,ime,prezime) values
(null,'Goranka','Kralj'),
(null,'Dobrilo','Kovač'),
(null,'Jasmina','Grgić'),
(null,'Milenko','Janković'),
(null,'Nikola','Petrić'),
(null,'Roko','Dragić');

insert into segrt(sifra,ime,prezime,placa) values
(null,'Gordan','Perković',4500.00);

insert into sat(sifra,korisnik,kvar,marka) values
(null,1,'Ošećena rubina','Omega'),
(null,2,'Oštećena osovina','Zenith'),
(null,3,null,'Sinn'),
(null,4,null,null),
(null,5,'Oštećena rubina',null),
(null,6,'Kvar u mehanizmu','Chopard'),
(null,1,null,'Saint');

insert into urar(sifra,ime,prezime,segrt) values
(null,'Mateo','Ivanović',1);

insert into popravak(sifra,urar,sat,trajanje,cijena) values
(null,1,1,100,250.00),
(null,1,2,120,300.00),
(null,1,3,null,150.00),
(null,1,4,90,240.00),
(null,1,5,75,120.00),
(null,1,6,null,null),
(null,1,7,150,100.00);











