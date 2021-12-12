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

alter table jelo_pice add foreign key(jelo) references jelo(sifra);
alter table jelo_pice add foreign key(pice) references pice(sifra);

alter table kategorija add foreign key(jelovnik) references jelovnik(sifra);

alter table jelo add foreign key(kategorija) references kategorija(sifra);