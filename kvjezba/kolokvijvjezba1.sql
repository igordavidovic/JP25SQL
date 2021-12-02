drop database if exists vjezba1;
create database vjezba1 character set utf8;
use vjezba1;

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int not null
);

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstroventno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);

alter table zena add foreign key(sestra) references sestra(sifra);

alter table muskarac add foreign key(zena) references zena(sifra);

alter table mladic add foreign key(muskarac) references muskarac(sifra);

alter table cura add foreign key(punac) references punac(sifra);

insert into svekar(sifra,bojaociju,prstena,dukserica,lipa,eura,majica) values
(null,'Zelena',null,null,null,25.00,'Crna majica'),
(null,'Plava',null,'Crna duskerica',null,50.00,null),
(null,'Smeđa',null,'Plava dukserica',null,70.00,'Crna majica');

insert into sestra(sifra,introvertno,haljina,maraka,hlace,narukvica) values
(null,null,'Crna haljina',null,'Denim traperice',2),
(null,1,'Crvena haljina',120.00,'Crne hlače',3),
(null,0,'Crvena haljina',90.00,'Crne traperice',4);

insert into sestra_svekar(sifra,sestra,svekar) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into zena(sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(null,null,'Smeđe hlače','Klasična majica','03040003743','Zelena',null,1),
(null,null,'Denim traperice','Plava t-shirt majica','03040003710','Plava',null,2),
(null,null,'Crne traperice','Crna majica','03040003010','Zelena','Crvena haljina',3);

insert into muskarac(sifra,bojaociju,hlace,modelnaocala,maraka,zena) values
(null,'Zelena','Denim traperice',null,45.00,1),
(null,'Plava','Crne traperice',null,60.00,2),
(null,'Smeđa',null,'Aviator',25.00,3);

update cura set gustoca=15.77;

delete from mladic where kuna>15.78;

select kratkamajica from zena where hlace like '%ana%';

select a.dukserica,f.asocijalno,e.hlace
from svekar a inner join sestra_svekar b on a.sifra=b.svekar 
inner join sestra c on b.sestra=c.sifra 
inner join zena d on c.sifra=d.sestra 
inner join muskarac e on d.sifra=e.zena 
inner join mladic f on e.sifra=f.muskarac
where d.hlace like 'a%' and c.haljina like '%ba%'
order by 3 desc;

select a.haljina,a.maraka
from sestra a inner join sestra_svekar b on a.sifra=b.sestra 
where b.sestra is null;