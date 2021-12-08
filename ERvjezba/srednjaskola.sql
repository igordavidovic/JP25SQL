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

insert into razred(sifra,naziv) values
(null,'1.A razred'),
(null,'1.B razred'),
(null,'2. razred'),
(null,'3.A razred'),
(null,'3.B razred'),
(null,'4. razred');

insert into ucenik(sifra,ime,prezime,datumrodenja,razred) values
(null,'Igor','Davidović','2001-04-03',1),
(null,'Mario','Vatra',null,1),
(null,'Matej','Jurak',null,1),
(null,'Mateo','Tomak',null,1),
(null,'Mateja','Taman',null,1),
(null,'Teodora','Dusić',null,1),
(null,'Dorotea','Stjenak',null,1),
(null,'Ivan','Tanak',null,1),
(null,'Ivica','Dovet',null,2),
(null,'Iva','Devodek',null,2),
(null,'Ivona','Otak',null,2),
(null,'Ivanka','Tamak',null,2),
(null,'Stefan','Tomić',null,2),
(null,'Stefanela','Dendić',null,2),
(null,'Erik','Dovak',null,2),
(null,'Erika','David',null,2),
(null,'Hrvoje','Davić',null,2),
(null,'Dado','Horvat',null,3),
(null,'Tomica','Tanasić',null,3),
(null,'Vjekoslav','Mateović',null,3),
(null,'Teodor','Matanović',null,3),
(null,'Valter','Kovačević',null,3),
(null,'Zdenko','Franjić',null,3),
(null,'Verica','Juriša',null,4),
(null,'Sanjin','Vlahović',null,4),
(null,'Mario','Pavlović',null,4),
(null,'Mate','Antić',null,4),
(null,'Goranka','Blažić','2001-05-05',4),
(null,'Goran','Blažević',null,5),
(null,'Vlatko','Pavić',null,5),
(null,'Mirna','Perić',null,5),
(null,'Stana','Lončar',null,5),
(null,'Dorotea','Horvatinović',null,5),
(null,'Lovro','Horvat',null,5),
(null,'Mladenka','Matić',null,5),
(null,'Zoran','Milić',null,5);

insert into profesor(sifra,ime,prezime,email,placa) values
(null,'Ivan','Matan',null,null),
(null,'Hrvoje','Horvat',null,6500.00),
(null,'Ivona','Toranj','itoranj@skola.hr',null),
(null,'Ivana','Tesić',null,null);

insert into profesor_razred(profesor,razred) values
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2),
(2,4),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(4,1),
(4,2),
(4,3),
(4,4),
(4,5);
