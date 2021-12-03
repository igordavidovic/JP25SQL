drop database if exists vjezba4;
create database vjezba4 character set utf8;
use vjezba4;

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introventno boolean,
    kuna decimal(14,10)
);

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    introventno boolean,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

alter table zena_mladic add foreign key(mladic) references mladic(sifra);
alter table zena_mladic add foreign key(zena) references zena(sifra);

alter table punac add foreign key(ostavljen) references ostavljen(sifra);

alter table snasa add foreign key(zena) references zena(sifra);

alter table becar add foreign key(snasa) references snasa(sifra);

alter table prijatelj add foreign key(becar) references becar(sifra);

insert into zena(sifra,suknja,prstena) values
(null,'Crna suknja',1),
(null,'Crvena suknja',2),
(null,'Crna suknja',3);

insert into mladic(sifra,vesta) values
(null,'Crna vesta'),
(null,'Crvena vesta'),
(null,'Plava vesta');

insert into snasa(sifra,haljina,zena) values
(null,'Crna haljina',1),
(null,'Plava haljina',2),
(null,'Crvena haljina',3);

insert into becar(sifra,kratkamajica,bojaociju,snasa) values
(null,'Crna majica','Zelena',1),
(null,'Crna majica','Plava',2),
(null,'Crvena majica','Smeđa',3);

insert into zena_mladic(sifra,zena,mladic) values
(null,1,1),
(null,2,2),
(null,3,3);

update punac set majica='Osijek';

delete from prijatelj where prstena>17;

select haljina from snasa where treciputa is null;

select a.nausnica,f.jmbag,e.kratkamajica 
from mladic a inner join zena_mladic b on a.sifra=b.mladic 
inner join zena c on b.zena=c.sifra 
inner join snasa d on c.sifra=d.zena 
inner join becar e on d.sifra=e.snasa 
inner join prijatelj f on e.sifra=f.becar 
where d.treciputa is not null and c.lipa!=29
order by 3 desc;

select a.lipa,a.prstena
from zena a inner join zena_mladic b on a.sifra=b.zena 
where b.zena is null;