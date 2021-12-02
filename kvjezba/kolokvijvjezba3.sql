drop database if exists vjezba3;
create database vjezba3;
use vjezba3;

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno boolean not null
);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno boolean not null
);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(36),
    modelnaocala varchar(31) not null,
    prijatelj int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introventno boolean,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno boolean,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

alter table prijatelj_brat add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key(brat) references brat(sifra);

alter table punica add foreign key(snasa) references snasa(sifra);

alter table snasa add foreign key(ostavljena) references ostavljena(sifra);

alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);

alter table svekar add foreign key(cura) references cura(sifra);

insert into prijatelj(sifra,kuna,haljina,lipa,dukserica,indiferentno) values
(null,100.00,null,null,'Plava dukserica',1),
(null,200.00,null,null,null,0),
(null,200.00,'Crna haljina',null,null,1);

insert into brat(sifra,jmbag,ogrlica,ekstroventno) values
(null,null,8,0),
(null,'56785678999',2,1),
(null,null,3,0);

insert into prijatelj_brat(sifra,prijatelj,brat) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into ostavljena(sifra,kuna,lipa,majica,modelnaocala,prijatelj) values
(null,null,null,null,'Aviator',1),
(null,200.00,null,'Crna majica','Aviator',2),
(null,100.00,null,'Crvena majica','Rayban',null);

insert into snasa(sifra,kuna,eura,ostavljena) values
(null,200.00,35.00,1),
(null,100.00,20.00,2),
(null,1500.00,300.00,3);

update svekar set suknja='Osijek';

delete from punica where kratkamajica='AB';

select majica from ostavljena where lipa not in(9,10,20,30,35);

select a.ekstroventno,f.vesta,e.kuna
from brat a inner join prijatelj_brat b on a.sifra=b.brat 
inner join prijatelj c on b.prijatelj=c.sifra 
inner join ostavljena d on c.sifra=d.prijatelj 
inner join snasa e on d.sifra=e.ostavljena 
inner join punica f on e.sifra=f.snasa
where d.lipa!=91 and c.haljina like '%ba%'
order by 3 desc;

select a.haljina,a.lipa
from prijatelj a inner join prijatelj_brat b on a.sifra=b.prijatelj 
where b.prijatelj is null;