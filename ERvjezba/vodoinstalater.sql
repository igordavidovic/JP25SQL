drop database if exists vodoinstalater;
create database vodoinstalater character set utf8;
use vodoinstalater;

create table popravak(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    trajanje time,
    segrt int
);

create table kvar(
    sifra int not null primary key auto_increment,
    naziv varchar(50)
);

create table vodovodna_instalacija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    kvar varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table popravak_kvar(
    popravak int not null,
    kvar int not null
);

alter table popravak_kvar add foreign key(popravak) references popravak(sifra);
alter table popravak_kvar add foreign key(kvar) references kvar(sifra);

alter table vodovodna_instalacija add foreign key(kvar) references kvar(sifra);

alter table popravak add foreign key(segrt) references segrt(sifra);