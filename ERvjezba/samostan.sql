drop database if exists samostan;
create database samostan;
use samostan;

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    nadredeni int not null,
    vjera varchar(50) not null
);

create table nadredeni(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table posao(
    sifra int not null primary key auto_increment,
    opis varchar(50) not null
);

create table svecenik_posao(
    svecenik int not null,
    posao int not null
);

alter table svecenik_posao add foreign key(svecenik) references svecenik(sifra);
alter table svecenik_posao add foreign key(posao) references posao(sifra);

alter table svecenik add foreign key(nadredeni) references nadredeni(sifra);

insert into posao(sifra,opis) values
(null,'Jutarnja molitva'),
(null,'Podnevna molitva'),
(null,'Večernja molitva'),
(null,'Čišćenje prostorija'),
(null,'Razmatranje prostorija'),
(null,'Šivanje'),
(null,'Košnja trave');

insert into nadredeni(sifra,ime,prezime) values
(null,'Boro','Javor'),
(null,'Fran','Zdenko'),
(null,'Ratimir','Davor'),
(null,'Slaven','Veselko');

insert into svecenik(sifra,ime,prezime,nadredeni,vjera) values
(null,'Vid','Silvijo',1,'Kršćanska katolička'),
(null,'Vedran','Zlatan',2,'Kršćanska katolička'),
(null,'Fran','Krunoslav',3,'Kršćanska katolička'),
(null,'Želimir','Tin',4,'Kršćanska katolička'),
(null,'Sanjin','Jadranko',3,'Kršćanska katolička'),
(null,'Milenko','Neven',2,'Kršćanska katolička'),
(null,'Zvonimir','Nikša',4,'Kršćanska katolička'),
(null,'Krunoslav','Grga',1,'Kršćanska katolička');

insert into svecenik_posao(svecenik,posao) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,6),
(7,5),
(6,4),
(5,3),
(4,2),
(3,1),
(2,4),
(1,7);