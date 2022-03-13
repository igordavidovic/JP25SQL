drop database if exists salon;
create database salon character set utf8;
use salon;

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
    cijena decimal(18,2) not null,
    trajanje int
);

alter table usluga add foreign key(djelatnica) references djelatnica(sifra);
alter table usluga add foreign key(korisnik) references korisnik(sifra);

insert into djelatnica(sifra,ime,prezime,placa) values
(null,'Jolanda','Filipović',4950.00),
(null,'Nevena','Jugovac',5400.00),
(null,'Ružica','Božić',null),
(null,'Maja','Grbić',null),
(null,'Katarina','Vukoja',5200.00),
(null,'Tanja','Milić',5000.00);

insert into korisnik(sifra,ime,prezime,brojtelefona) values
(null,'Kristina','Knežević',null),
(null,'Helena','Janković','0976540890'),
(null,'Nedeljka','Lovrić',null),
(null,'Martina','Radič',null),
(null,'Zdravka','Antić','0956565777'),
(null,'Viktorija','Tomčić','0989607878'),
(null,'Ljilja','Živković',null),
(null,'Marinela','Sjepanić',null),
(null,'Andrea','Novak',null),
(null,'Karla','Matijević','0995431000'),
(null,'Iva','Stankić',null),
(null,'Karolina','Nikolić',null);


insert into usluga(sifra,djelatnica,korisnik,naziv,cijena,trajanje) values
(null,1,1,'Mala manikura',80.00,45),
(null,2,2,'Mala manikura',80.00,45),
(null,1,3,'Express manikura',120.00,45),
(null,5,4,'Skidanje gela ili umjetnih noktiju + manikura',180.00,60),
(null,3,5,'Lakiranje bez manikure',50.00,null),
(null,6,6,'Skidanje trajnog laka s manikurom',120.00,null),
(null,2,7,'Skidanje trajnog laka bez manikure',60.00,null),
(null,4,8,'French lakiranje bez manikure',60.00,20),
(null,3,9,'Skidanje trajnog laka bez manikure',60.00,null),
(null,4,10,'French lakiranje bez manikure',60.00,20),
(null,6,11,'Skidanje gela ili umjetnih noktiju + manikura',180.00,60),
(null,5,12,'Lakiranje bez manikure',50.00,null);





