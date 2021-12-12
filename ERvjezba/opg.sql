drop database if exists opg;
create database opg character set utf8;
use opg;

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    djelatnik int not null,
    cijena decimal(18,2)
);

create table sirovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table proizvod_sirovina(
    proizvod int not null,
    sirovina int not null
);

alter table proizvod_sirovina add foreign key(proizvod) references proizvod(sifra);
alter table proizvod_sirovina add foreign key(sirovina) references sirovina(sifra);

alter table proizvod add foreign key(djelatnik) references djelatnik(sifra);

insert into djelatnik(sifra,ime,prezime,placa) values
(null,'Igor','Davidović',5000.00),
(null,'Hrvoje','Horvat',null),
(null,'Ivan','Horvatinović',5500.00);

insert into sirovina(sifra,naziv) values
(null,'Svježe jaje'),
(null,'Sol'),
(null,'Morska sol'),
(null,'Orah'),
(null,'Badem'),
(null,'Kokos'),
(null,'Pšenica'),
(null,'Šećer');

insert into proizvod(sifra,naziv,djelatnik,cijena) values 
(null,'Kokosovo mlijeko',1,100.00),
(null,'Mlijeko od badema',1,100.00),
(null,'Tjestenina ',1,100.00),
(null,'Rezanci za juhu',2,100.00),
(null,'Brašno',2,100.00),
(null,'Kokosovo vrhnje',3,100.00),
(null,'Badem vrhnje',3,100.00);

insert into proizvod_sirovina(proizvod,sirovina) values
(1,6),
(1,8),
(2,5),
(2,8),
(3,1),
(3,2),
(4,1),
(4,2),
(5,7),
(6,6),
(7,5);