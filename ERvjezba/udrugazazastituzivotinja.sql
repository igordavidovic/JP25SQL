drop database if exists udrugazzz;
create database udrugazzz character set utf8;
use udrugazzz;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table sticenik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    ime varchar(50),
    zivotinja int not null,
    cijepljen boolean    
);

create table zivotinja(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    velicina varchar(50) not null, 
    sticenik int not null
);


alter table sticenik add foreign key(zivotinja) references zivotinja(sifra);

alter table prostor add foreign key(sticenik) references sticenik(sifra);

alter table sticenik add foreign key(osoba) references osoba(sifra);

insert into osoba(sifra,ime,prezime,placa) values
(null,'Anđela','Kovač',4500.00),
(null,'Tijana','Dragić',null),
(null,'Ljubica','Knežević',4800.00),
(null,'Krešo','Horvat',4750.00),
(null,'Vlado','Horvatinčović',null);

insert into zivotinja(sifra,vrsta) values
(null,'Pas'),
(null,'Mačka');

insert into sticenik(sifra,osoba,ime,zivotinja,cijepljen) values
(null,1,'Benjamin',1,true),
(null,2,'Bongo',1,true),
(null,1,'Aron',2,false),
(null,3,'Rex',1,false),
(null,4,'Lui',2,true),
(null,2,'Medo',1,false),
(null,5,'Nera',2,true);

insert into prostor(sifra,velicina,sticenik) values
(null,'8m2',1),
(null,'7m2',2),
(null,'6m2',3),
(null,'10m2',4),
(null,'5m2',5),
(null,'7m2',6),
(null,'9m2',7);