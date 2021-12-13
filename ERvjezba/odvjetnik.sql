drop database if exists odvjetnik;
create database odvjetnik character set utf8;
use odvjetnik;

create table odvjetnik(
    sifra int not null primary key auto_increment,
);

create table klijent(
    sifra int not null primary key auto_increment,
);

create table obrana(
    sifra int not null primary key auto_increment,
);

create table suradnik(
    sifra int not null primary key auto_increment,
);

create table odvjetnik_klijent(
    odvjetnik int not null,
    klijent int not null
);

create table suradnik_obrana(
    suradnik int not null,
    obrana int not null
);

