drop database if exists restoran;
create database restoran character set utf8;
use restoran;

create table jelovnik(
    sifra int not null primary key auto_increment,
    brojstranica varchar(50)
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