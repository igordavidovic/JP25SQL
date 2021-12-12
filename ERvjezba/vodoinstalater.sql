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
    kvar int not null
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

insert into segrt(sifra,ime,prezime,placa) values
(null,'Igor','Davidović',5000.00);

insert into kvar(sifra,naziv) values
(null,'Pokvarena centrifuga'),
(null,'Pokvarena mehanika'),
(null,'Pokvarena mašina');

insert into vodovodna_instalacija(sifra,naziv,kvar) values
(null,'Vodovna instalacija 1',1),
(null,'Vodovodna instalcaija 2',2),
(null,null,3);

insert into popravak(sifra,naziv,cijena,trajanje,segrt) values
(null,'Popravak centrifuge',null,null,null),
(null,'Zamjena mehanike',650.00,null,1),
(null,'Zamjena mašine',450.00,null,1);

insert into popravak_kvar(popravak,kvar) values
(1,1),
(2,2),
(3,3);