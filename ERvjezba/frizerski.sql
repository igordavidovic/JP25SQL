drop database if exists frizerski;
create database frizerski character set utf8;
use frizerski;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    brojtelefona varchar(50)
);

create table usluga(
    sifra int not null primary key auto_increment,
    djelatnica int not null,
    korisnik int not null,
    naziv varchar(50) not null,
    cijena decimal (18,2) not null,
    trajanje int
);

alter table usluga add foreign key(djelatnica) references djelatnica(sifra);
alter table usluga add foreign key(korisnik) references korisnik(sifra);

insert into djelatnica(sifra,ime,prezime,placa) values
(null,'Ana','Marija',null),
(null,'Jana','Stojanović',null),
(null, 'Tihana','Pavić',4589.99),
(null,'Đurđica','Dragić',4759.99),
(null, 'Renata','Stankić',4599.99);

insert into korisnik(sifra,ime,prezime,brojtelefona) values
(null,'Teodor','Dragić',null),
(null,'Monika','Knežević',null),
(null,'Siniša','Perko',null),
(null,'Valerija','Mihaljević','0989656765'),
(null,'Dejan','Kovač','0994568787'),
(null,'Vikor','Petrić','0913434562'),
(null,'Marija','Antić',null),
(null,'Renato','Jerković',null),
(null,'Helena','Perković','0953420912'),
(null,'Denis','Vukoja',null);

insert into usluga(sifra,djelatnica,korisnik,naziv,cijena,trajanje) values
(null,1,1,'Šišanje i frizura',80.00,null),
(null,3,2,'Minival i frizura',210.00,120),
(null,5,3,'Šišanje i frizura',80.00,150),
(null,2,4,'Vjenčana frizura',250.00,null),
(null,1,5,'Šišanje djece do 5 godina',50.00,null),
(null,4,6,'Brijanje',60.00,null),
(null,3,7,'Pramenovi i frizura',220.00,120),
(null,4,8,'Šišanje s mašinicom jednolično',50.00,null),
(null,2,9,'Bojanje i frizura',180.00,45),
(null,5,10,'Brijanje',60.00,25);