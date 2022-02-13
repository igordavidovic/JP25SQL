drop database if exists nakladnik;
create database nakladnik character set utf8;
use nakladnik;

create table nakladnik(
    sifra int not null primary key auto_increment,
    mjesto int not null,
    ime varchar(50) not null,
    prezime varchar(50) not null   
); 

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table nakladnik_djelo(
    nakladnik int not null,
    djelo int not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupanija varchar(50),
    postanskibroj int(5)
);

alter table nakladnik add foreign key(mjesto) references mjesto(sifra);

alter table nakladnik_djelo add foreign key(djelo) references djelo(sifra);
alter table nakladnik_djelo add foreign key(nakladnik) references nakladnik(sifra);
