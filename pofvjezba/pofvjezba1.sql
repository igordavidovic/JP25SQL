drop database if exists pof1;
create database pof1 character set utf8;
use pof1;

create table zarucnica(
    id int not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int not null
);

create table punac(
    id int not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int
);

create table sestra(
    id int not null primary key auto_increment,
    introventno boolean not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int not null
);

create table neprijateljica(
    id int not null primary key auto_increment,
    indiferentno boolean not null,
    modelnaocala varchar(39) not null,
    maraka decimal(12,10) not null,
    kratkamajica varchar(32) not null,
    ogrlica int
);

create table muskarac(
    id int not null primary key auto_increment,
    maraka decimal(17,7) not null,
    hlace varchar(45) not null,
    prstena int not null,
    nausnica int,
    neprijateljica int not null
);

alter table muskarac add foreign key(neprijateljica) references neprijateljica(id);











