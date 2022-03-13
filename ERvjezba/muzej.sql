drop database if exists muzej;
create database muzej character set utf8;
use muzej;

create table izlozba(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    pocetak datetime,
    kustos int not null,
    sponzor int not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    izlozba int not null,
    naziv varchar(50) not null,
    umjetnik varchar(50) not null,
    razdoblje varchar(50) not null,
    sredstvo varchar(50)
);

create table kustos(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2)
);

create table sponzor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

alter table djelo add foreign key(izlozba) references izlozba(sifra);

alter table izlozba add foreign key(kustos) references kustos(sifra);
alter table izlozba add foreign key(sponzor) references sponzor(sifra);

insert into sponzor(sifra,ime,prezime) values
(null,'Martin','Nikolić'),
(null,'Valentin','Lučić'),
(null,'Nina','Medved');

insert into kustos(sifra,ime,prezime,placa) values
(null,'Marinka','Marušić',5700.00),
(null,'Dijana','Košar',null),
(null,'Branimir','Grgić',5300.00),
(null,'Ognjan','Ilić',5480.00);

insert into izlozba(sifra,naziv,pocetak,kustos,sponzor) values
(null,'TOČKA SASTAJANJA:Claude Monet','2021-10-20 19:00:00',1,1),
(null,'Paul Gauguin:U SVIJETU UMJETNOSTI','2021-10-27 16:00:00',3,2),
(null,'ENIGME:Edvard Munch','2021-11-15 18:00:00',2,3);

insert into djelo(sifra,izlozba,naziv,umjetnik,razdoblje,sredstvo) values
(null,1,'Impresija','Claude Monet','Impresionizam','Uljene boje'),
(null,1,'Umjetnički vrt u Givernyju','Claude Monet','Impresionizam',null),
(null,1,'Procvjetali makovi','Claude Monet','Moderna umjetnost',null),
(null,1,'Doručak na travi','Claude Monet','Impresionizam',null),
(null,1,'Večernji ugođaj u Veneciji','Claude Monet','Moderna umjetnost','Uljene boje'),
(null,1,'Jezero lopoča','Claude Monet','Impresionizam','Uljene boje'),
(null,1,'Lopoči','Claude Monet','Moderna umjetnost','Uljene boje'),
(null,2,'Odakle dolazimo? Što smo? Kamo idemo?','Paul Gauguin','Postimpresionizam',null),
(null,2,'Tahićanke na plaži','Paul Gauguin','Postimpresionizam',null),
(null,2,'Dvije žene s Tahitija','Paul Gauguin','Postimpresionizam','Uljene boje'),
(null,2,'Vizija nakon propovijedi','Paul Gauguin','Sintetizam','Uljene boje'),
(null,2,'Ia Orana Maria','Paul Gauguin','Postimpresionizam','Uljene boje'),
(null,2,'Kad ćeš se udati?','Paul Gauguin','Postimpresionizam','Uljene boje'),
(null,2,'Žuti Krist','Paul Gauguin','Simbolizam','Uljene boje'),
(null,3,'Anksioznost','Edvard Munch','Ekspresionizam',null),
(null,3,'Ljubav i bol','Edvard Munch','Simbolizam','Uljene boje'),
(null,3,'Pubertet','Edvard Munch','Ekspresionizam',null),
(null,3,'Ples života','Edvard Munch','Ekspresionizam',null),
(null,3,'Poljubac','Edvard Munch','Ekspresionizam',null),
(null,3,'Pepeo','Edvard Munch','Simbolizam','Uljene boje'),
(null,3,'Autoportret. Između sata i kreveta','Edvard Munch','Moderna umjetnost',null),
(null,3,'Smrt u bolesničkoj sobi','Edvard Munch','Simbolizam','Uljene boje');