drop database if exists vodoinstalater;
create database vodoinstalater character set utf8;
use vodoinstalater;

create table vodoinstalater(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50)
);

create table popravak(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2),
    trajanje int,
    segrt int,
    vodoinstalater int not null
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
alter table popravak add foreign key(vodoinstalater) references vodoinstalater(sifra);

insert into vodoinstalater(sifra,ime,prezime,email) values
(null,'Matej','Horvat',null);

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

insert into popravak(sifra,naziv,cijena,trajanje,segrt,vodoinstalater) values
(null,'Popravak centrifuge',null,null,null,1),
(null,'Zamjena mehanike',650.00,180,1,1),
(null,'Zamjena mašine',450.00,null,1,1);

insert into popravak_kvar(popravak,kvar) values
(1,1),
(2,2),
(3,3);