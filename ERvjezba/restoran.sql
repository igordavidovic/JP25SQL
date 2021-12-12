drop database if exists restoran;
create database restoran character set utf8;
use restoran;

create table jelovnik(
    sifra int not null primary key auto_increment,
    brojstranica int
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    jelovnik int not null
);

create table jelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kategorija int not null,
    cijena decimal(18,2)
);

create table pice(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table jelo_pice(
    jelo int not null,
    pice int not null
);

alter table jelo_pice add foreign key(jelo) references jelo(sifra);
alter table jelo_pice add foreign key(pice) references pice(sifra);

alter table kategorija add foreign key(jelovnik) references jelovnik(sifra);

alter table jelo add foreign key(kategorija) references kategorija(sifra);

insert into jelovnik(sifra,brojstranica) values
(null,10);

insert into kategorija(sifra,naziv,jelovnik) values
(null,'PIZZA',1),
(null,'JELA SA ROŠTILJA',1),
(null,'SENDVIČI',1),
(null,'MORSKI PLODOVI',1),
(null,'PLATE',1);

insert into jelo(sifra,naziv,kategorija,cijena) values
(null,'Slavonska pizza',1,50.00),
(null,'Vukovarska pizza',1,55.00),
(null,'Margharita',1,40.00),
(null,'Ćevapi',2,35.00),
(null,'Pljeskavica',2,40.00),
(null,'Gurmanska pljeskavica',2,50.00),
(null,'Pileća vješalica',2,40.00),
(null,'Ražnjići',2,30.00),
(null,'Pileći ražnjići',2,30.00),
(null,'Piletina sa žari',2,50.00),
(null,'Indeks',3,20.00),
(null,'Indeks sa mesom',3,24.00),
(null,'Indeks sa piletinom',3,25.00),
(null,'Indeks sa kulenom',3,22.00),
(null,'Oslić',4,60.00),
(null,'Fiš',4,90.00),
(null,'Plata za dve osobe',5,100.00),
(null,'Plata za četiri osobe',5,180.00),
(null,'Plata za šest osoba',5,270.00),
(null,'Plata za osam osoba',5,350.00);

insert into pice(sifra,naziv,cijena) values
(null,'Cola',16.00),
(null,'Pepsi',17.00),
(null,'Fanta',18.00),
(null,'Sprite',17.00),
(null,'Kafa',10.00),
(null,'Vukovarsko pivo',25.00),
(null,'Osiječko pivo',25.00);

insert into jelo_pice(jelo,pice) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,3),
(6,3),
(7,4),
(8,4),
(9,4),
(10,5),
(11,6),
(12,6),
(13,7);