drop database if exists djecjivrtic;
create database djecjivrtic character set utf8;
use djecjivrtic;

create table odgojnaskupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    odgajateljica int not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    odgojnaskupina int not null,
    starost int
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    strucnasprema int not null
);

create table strucnasprema(
    sifra int not null primary key auto_increment,
    stupanj varchar(50) not null,
    kratica varchar(50)
);

alter table dijete add foreign key(odgojnaskupina) references odgojnaskupina(sifra);
alter table odgojnaskupina add foreign key(odgajateljica) references odgajateljica(sifra);

alter table odgajateljica add foreign key(strucnasprema) references strucnasprema(sifra);

insert into strucnasprema(sifra,stupanj,kratica) values
(null,'Srednja stručna sprema','SSS'),
(null,'Viša stručna sprema','VŠS'),
(null,'Visoka stručna sprema','VSS');

insert into odgajateljica(sifra,ime,prezime,strucnasprema) values
(null,'Klementina','Stojanović',1),
(null,'Irena','Vlašić',2),
(null,'Martina','Martinović',3);

insert into odgojnaskupina(sifra,naziv,odgajateljica) values
(null,'Maslačak',1),
(null,'Tratinčice',2),
(null,'Ivančice',3);

insert into dijete(sifra,ime,prezime,odgojnaskupina,starost) values
(null,'Teodor','Božić',3,6),
(null,'Karmela','Kovač',2,3),
(null,'Zorica','Horvatinčić',1,4),
(null,'Oliver','Horvat',3,5),
(null,'Tereza','Horvat',2,3),
(null,'Ljuba','Janković',1,4),
(null,'Maja','Lovrić',3,6),
(null,'Ljiljana','Kralj',3,5),
(null,'Irena','Kralj',3,5),
(null,'Mirela','Radić',2,3),
(null,'Dajana','Vukoja',1,4),
(null,'Mirela','Kolarić',2,3),
(null,'Mihaela','Košar',2,3),
(null,'Mateo','Kovačević',1,4),
(null,'Valerija','Paveletić',3,5),
(null,'Valentina','Janković',1,4),
(null,'Marin','Martinović',2,3);

