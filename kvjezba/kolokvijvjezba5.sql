drop database if exists vjezba5;
create database vjezba5 character set utf8;
use vjezba5;

create table zarucnik(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    lipa decimal(12,8),
    indiferentno boolean not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(48) not null,
    haljina varchar(30) not null,
    asocijalno boolean,
    zarucnik int
);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(41) not null,
    maraka decimal(17,10) not null,
    asocijalno boolean,
    vesta varchar(47) not null
);

create table svekar_cura(
    sifra int not null primary key auto_increment,
    svekar int not null,
    cura int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojakose varchar(33),
    majica varchar(31),
    carape varchar(31) not null,
    haljina varchar(43),
    narukvica int,
    eura decimal(14,5) not null
);

create table punac(
    sifra int not null primary key auto_increment,
    dukserica varchar(33),
    prviputa datetime not null,
    majica varchar(36),
    svekar int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    hlace varchar(48) not null,
    nausnica int not null,
    ogrlica int,
    vesta varchar(49) not null,
    modelnaocala varchar(31) not null,
    treciputa datetime not null,
    punac int not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    majica varchar(33) not null,
    ogrlica int not null,
    carape varchar(44),
    stilfrizura varchar(42),
    punica int not null
);

alter table svekar_cura add foreign key(cura) references cura(sifra);
alter table svekar_cura add foreign key(svekar) references svekar(sifra);

alter table punac add foreign key(svekar) references svekar(sifra);

alter table punica add foreign key(punac) references punac(sifra);

alter table ostavljena add foreign key(punica) references punica(sifra);

alter table mladic add foreign key(zarucnik) references zarucnik(sifra);

insert into cura(sifra,carape,maraka,vesta) values
(null,'Crne carape',100.00,'Crna vesta'),
(null,'Sive carape',80.00,'Plava vesta'),
(null,'Crne carape',120.00,'Crvena vesta');

insert into svekar(sifra,carape,eura) values
(null,'Crne carape',25.00),
(null,'Crvene carape',15.00),
(null,'Sive carape',45.00);

insert into svekar_cura(sifra,svekar,cura) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into punac(sifra,prviputa,svekar) values
(null,'2020-10-10',1),
(null,'2021-09-23',2),
(null,'2021-03-14',3);

insert into punica(sifra,hlace,nausnica,vesta,modelnaocala,treciputa,punac) values
(null,'Crne hlace',1,'Crna vesta','Aviator','2020-10-10',1),
(null,'Crne hlace',2,'Siva vesta','Rayban','2021-03-03',2),
(null,'Crne hlace',2,'Crvena vesta','Rayban','2021-03-14',3);

update mladic set haljina='Osijek';

delete from ostavljena where ogrlica=17;

select majica from punac where prviputa is null;

select a.asocijalno,f.stilfrizura,e.nausnica 
from cura a inner join svekar_cura b on a.sifra=b.cura 
inner join svekar c on b.svekar=c.sifra 
inner join punac d on c.sifra=d.svekar 
inner join punica e on d.sifra=e.punac 
inner join ostavljena f on e.sifra=f.punica 
where d.prviputa is not null and c.majica like '%ba%'
order by 3 desc;

select a.majica,a.carape
from svekar a inner join svekar_cura b on a.sifra=b.svekar 
where b.svekar is null;