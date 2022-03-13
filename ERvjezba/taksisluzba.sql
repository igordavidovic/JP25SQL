drop database if exists taksi;
create database taksi character set utf8;
use taksi;

create table vozilo(
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    marka varchar(50),
    kilometraza varchar(50),
    vozac int not null
);

create table vozac(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona varchar(50) not null
);

create table putnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona varchar(50),
    vozac int not null
);

create table voznja(
    sifra int not null primary key auto_increment,
    cijena decimal(18,2),
    trajanje int,
    relacija varchar(50) not null,
    vozilo int not null
);


create table putnik_voznja(
    putnik int not null,
    voznja int not null
);

alter table vozilo add foreign key(vozac) references vozac(sifra);

alter table putnik add foreign key(vozac) references vozac(sifra);

alter table putnik_voznja add foreign key(voznja) references voznja(sifra);
alter table putnik_voznja add foreign key(putnik) references putnik(sifra);

alter table voznja add foreign key(vozilo) references vozilo(sifra);

insert into vozac(sifra,ime,prezime,brojtelefona) values
(null,'Toni','Radić','0976546367'),
(null,'Anja','Antić','098964636763'),
(null,'Stjepan','Vuković','0995903325'),
(null,'Zora','Marković','0913257765'),
(null,'Lazar','Juriša','0957658800');

insert into vozilo(sifra,vrsta,marka,kilometraza,vozac) values
(null,'Automobil','Opel',null,1),
(null,'Automobil','Audi','137750km',2),
(null,'Minibus','Volkswagen','150091km',3),
(null,'Automobil','Volkswagen',null,4),
(null,'Automobil','Mercedes','190534km',5);

insert into voznja(sifra,cijena,trajanje,relacija,vozilo) values
(null,220.00,45,'Vukovar-Osijek',1),
(null,240.00,50,'Osijek-Vukovar',2),
(null,180.00,30,'Vukovar-Vinkovci',1),
(null,170.00,null,'Vinkovci-Vukovar',4),
(null,350.00,75,'Vukovar-Vinkovci-Vukovar',5),
(null,350.00,null,'Vinkovci-Vukovar-Vinkovci',4),
(null,750.00,null,'Vukovar-Slavonski Brod',3),
(null,480.00,null,'Požega-Vukovar',2),
(null,245.00,55,'Vukovar-Osijek',1),
(null,390.00,100,'Osijek-Požega',5);

insert into putnik(sifra,ime,prezime,brojtelefona,vozac) values
(null,'Vanja','Kokot','0987653443',1),
(null,'Anita','Crnčević',null,1),
(null,'Ena','Živković',null,2),
(null,'Vid','Vlahović',null,2),
(null,'Krešimir','Vlahović',null,2),
(null,'Veronika','Janković','0998765432',1),
(null,'Daria','Janković','0957896523',1),
(null,'Terezija','Božić','0918787900',4),
(null,'Hana','Lončar','0956700932',4),
(null,'Zvonimir','Martinović',null,5),
(null,'Andrija','Filipović',null,4),
(null,'Sunčica','Pavičić',null,4),
(null,'Mario','Horvat',null,3),
(null,'Darijo','Horvat',null,3),
(null,'Dejan','Franić',null,3),
(null,'Jasmina','Živković',null,3),
(null,'Roko','Pavletić','0917850033',3),
(null,'Milana','Novak','0978907373',3),
(null,'Marin','Tadić','0990018877',2),
(null,'Marko','Marković','0953420011',1),
(null,'Marko','Horvat',null,1);

insert into putnik_voznja(putnik,voznja) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2),
(6,3),
(7,3),
(8,4),
(9,4),
(10,5),
(11,6),
(12,6),
(13,7),
(14,7),
(15,7),
(16,7),
(17,7),
(18,7),
(19,8),
(20,9),
(21,10);