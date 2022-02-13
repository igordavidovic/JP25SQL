drop database if exists nakladnik;
create database nakladnik character set utf8;
use nakladnik;

create table nakladnik(
    sifra int not null primary key auto_increment,
    mjesto int not null,
    ime varchar(50) not null,
    prezime varchar(50) not null   
); 

create table djelo(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2)
);

create table nakladnik_djelo(
    nakladnik int not null,
    djelo int not null
);

create table mjesto(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    zupanija varchar(50),
    postanskibroj int(5)
);

alter table nakladnik add foreign key(mjesto) references mjesto(sifra);

alter table nakladnik_djelo add foreign key(djelo) references djelo(sifra);
alter table nakladnik_djelo add foreign key(nakladnik) references nakladnik(sifra);

insert into mjesto(sifra,naziv,zupanija,postanskibroj) values
(null,'Vukovar','Vukovarsko-srijemska',32000),
(null,'Osijek','Osječko-baranjska',31000),
(null,'Vinkovci','Vukovarsko-srijemska',32100);

insert into nakladnik(sifra,mjesto,ime,prezime) values 
(null,1,'Igor','Davidović'),
(null,2,'David','Igorović'),
(null,3,'David','Igor');

insert into djelo(sifra,naziv,cijena) values 
(null,'Djelo jedan',450.00),
(null,'Djelo dva',460.00),
(null,'Djelo tri',470.00),
(null,'Djelo četiri',480.00),
(null,'Djelo pet',490.00),
(null,'Djelo šest',550.00),
(null,'Djelo sedam',540.00),
(null,'Djelo osam',530.00),
(null,'Djelo devet',520.00),
(null,'Djelo deset',510.00),
(null,'Djelo jedanaest',500.00),
(null,'Djelo dvanaest',6000.00);

insert nakladnik_djelo(nakladnik,djelo) values 
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(2,7),
(2,8),
(3,9),
(3,10),
(3,11),
(3,12);
