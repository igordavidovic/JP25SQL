drop database if exists osnovnaskola;
create database osnovnaskola character set utf8;
use osnovnaskola;

create table radionica(
    sifra int not null primary key auto_increment,
    uciteljica int not null,
    naziv varchar(50) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int not null,
    dob int,
    spol char(1)
);

create table radionica_dijete(
    radionica int not null,
    dijete int not null
);

create table uciteljica(
    sifra int not null primary key auto_increment,
    osoba int not null,
    placa decimal(18,2),
    email varchar(50)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja date
);

alter table radionica add foreign key(uciteljica) references uciteljica(sifra);

alter table radionica_dijete add foreign key(radionica) references radionica(sifra);
alter table radionica_dijete add foreign key(dijete) references dijete(sifra);

alter table uciteljica add foreign key(osoba) references osoba(sifra);

alter table dijete add foreign key(osoba) references osoba(sifra);

insert into osoba(sifra,ime,prezime,datumrodenja) values
(null,'Vanja','Kokot',null),
(null,'Anita','Crnčević',null),
(null,'Ena','Živković',null),
(null,'Vid','Vlahović',null),
(null,'Krešimir','Vlahović',null),
(null,'Veronika','Janković',"2010-10-11"),
(null,'Daria','Janković',"2011-10-12"),
(null,'Terezija','Božić',"2010-09-23"),
(null,'Hana','Lončar',"2011-05-24"),
(null,'Zvonimir','Martinović',null),
(null,'Andrija','Filipović',null),
(null,'Sunčica','Pavičić',null),
(null,'Mario','Horvat',null),
(null,'Darijo','Horvat',null),
(null,'Dejan','Franić',null),
(null,'Jasmina','Živković',null),
(null,'Roko','Pavletić',"2011-09-14"),
(null,'Milana','Novak',"2010-04-20"),
(null,'Marin','Tadić',"2010-03-21"),
(null,'Marko','Marković',"1989-03-24"),
(null,'Marko','Horvat',null);

insert into dijete(sifra,osoba,dob,spol) values
(null,1,null,'Ž'),
(null,1,null,'Ž'),
(null,1,null,'Ž'),
(null,1,null,'M'),
(null,1,null,'M'),
(null,1,11,'Ž'),
(null,1,10,'Ž'),
(null,1,11,'Ž'),
(null,1,10,'Ž'),
(null,1,null,'M'),
(null,1,null,'M'),
(null,1,null,'Ž'),
(null,1,null,'M'),
(null,1,null,'M'),
(null,1,null,'M'),
(null,1,null,'Ž'),
(null,1,10,'M'),
(null,1,11,'Ž'),
(null,1,11,'M');

insert into uciteljica(sifra,osoba,placa,email) values
(null,20,null,null),
(null,21,6200,null);

insert into radionica(sifra,uciteljica,naziv) values
(null,1,'Likovni'),
(null,2,'Muzički');


insert into radionica_dijete(radionica,dijete) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(1,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6);