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
