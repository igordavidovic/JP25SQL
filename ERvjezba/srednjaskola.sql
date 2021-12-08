drop database if exists srednjaskola;
create database srednjaskola character set utf8;
use srednjaskola;

create table razred(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table ucenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja date,
    razred int not null
);

create table profesor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    placa decimal(18,2)
);

create table profesor_razred(
    profesor int not null,
    razred int not null
);

alter table profesor_razred add foreign key(profesor) references profesor(sifra);
alter table profesor_razred add foreign key(razred) references razred(sifra);

alter table ucenik add foreign key(razred) references razred(sifra);