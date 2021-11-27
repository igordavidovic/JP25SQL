drop database if exists osnovnaskola;
create database osnovnaskola character set utf8;
use osnovnaskola;

create table radionica(
    sifra int not null primary key auto_increment,
    uciteljica int not null,
    naziv varchar(50) not null,
    trajanje time
);

create table dijete(
    sifra int not null primary key auto_increment,
    osoba int not null,
    dob varchar(50) not null,
    spol varchar(50)
);

create table radionica_dijete(
    radionica int not null,
    dijete int not null
);

create table uciteljica(
    sifra int not null primary key auto_increment,
    osoba int not null,
    placa decimal(18,2),
    email varchar(50)
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja date
);

alter table radionica add foreign key(uciteljica) references uciteljica(sifra);

alter table radionica_dijete add foreign key(radionica) references radionica(sifra);
alter table radionica_dijete add foreign key(dijete) references dijete(sifra);

alter table uciteljica add foreign key(osoba) references osoba(sifra);

alter table dijete add foreign key(osoba) references osoba(sifra);

