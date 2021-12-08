drop database if exists trgovacki;
create database trgovacki character set utf8;
use trgovacki;

create table trgovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrsta varchar(50),
    radnovrijeme varchar(50),
    sef int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table trgovina_osoba(
    trgovina int not null,
    osoba int not null
);

create table sef(
    sifra int not null primary key auto_increment,
    osoba int not null
);

alter table trgovina add foreign key(sef) references sef(sifra);

alter table sef add foreign key(osoba) references osoba(sifra);

alter table trgovina_osoba add foreign key(trgovina) references trgovina(sifra);
alter table trgovina_osoba add foreign key(osoba) references osoba(sifra);

insert into osoba(sifra,ime,prezime,placa) values
(null,'Igor','Davidović',null),
(null,'Mateo','David',null),
(null,'Matej','Točak',9000.00),
(null,'Hrvoje','Tomasović',null),
(null,'Tomislav','Lagani',null),
(null,'Zdenka','Nazar',5600.00),
(null,'Zvonimir','Varenica',null),
(null,'Zdenko','Tomas',null),
(null,'Ivan','Horvatinović',5000.00),
(null,'Ivica','Horvat',4900.00);

insert into sef(sifra,osoba) values
(null,1),
(null,2),
(null,3),
(null,4);

insert into trgovina(sifra,naziv,vrsta,radnovrijeme,sef) values
(null,'Oranica','Poljoprivredna trgovina','07-15',1),
(null,'Boso','Minimarket','07-23',2),
(null,'Ravlić','Mesnica','08-17',3),
(null,'Tokić',null,'07-15',4);

insert into trgovina_osoba(trgovina,osoba) values
(1,5),
(2,6),
(2,7),
(2,8),
(3,9),
(4,10);