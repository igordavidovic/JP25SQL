drop database if exists odvjetnik;
create database odvjetnik character set utf8;
use odvjetnik;

create table odvjetnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table klijent(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table obrana(
    sifra int not null primary key auto_increment,
    odvjetnik int not null,
    klijent int not null
);

create table suradnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);


create table suradnik_obrana(
    suradnik int not null,
    obrana int not null
);

alter table suradnik_obrana add foreign key(suradnik) references suradnik(sifra);
alter table suradnik_obrana add foreign key(obrana) references obrana(sifra);

alter table obrana add foreign key(odvjetnik) references odvjetnik(sifra);
alter table obrana add foreign key(klijent) references klijent(sifra);

insert into suradnik(sifra,ime,prezime) values
(null,'Hrvoje','Horvat'),
(null,'Matej','Horvatinović'),
(null,'Ivan','Horvat'),
(null,'Matija','Bunačić');

insert into odvjetnik(sifra,ime,prezime) values
(null,'Igor','Davidović');

insert into klijent(sifra,ime,prezime,oib) values
(null,'Hrvoje','Horvat',null),
(null,'Ivo','Bunaljčić','01345679004'),
(null,'Dorotea','Doma','14567904433'),
(null,'Ivica','Novak',null),
(null,'Mateja','Terezić','32457700889');

insert into obrana(sifra,odvjetnik,klijent) values
(null,1,1),
(null,1,2),
(null,1,3),
(null,1,4),
(null,1,5);

insert into suradnik_obrana(suradnik,obrana) values
(1,1),
(2,1),
(3,2),
(4,2),
(1,3),
(2,4),
(3,4),
(1,5);