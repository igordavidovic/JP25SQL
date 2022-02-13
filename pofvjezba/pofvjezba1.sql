drop database if exists pof1;
create database pof1 character set utf8;
use pof1;

create table zarucnica(
    id int not null primary key auto_increment,
    stilfrizura varchar(40),
    prstena int not null,
    gustoca decimal(14,5),
    modelnaocala varchar(35) not null,
    nausnica int not null
);

create table punac(
    id int not null primary key auto_increment,
    modelnaocala varchar(39),
    treciputa datetime,
    drugiputa datetime,
    novcica decimal(14,6) not null,
    narukvica int
);

create table sestra(
    id int not null primary key auto_increment,
    introventno boolean not null,
    carape varchar(41),
    suknja varchar(40),
    narukvica int not null
);

create table neprijateljica(
    id int not null primary key auto_increment,
    indiferentno boolean not null,
    modelnaocala varchar(39) not null,
    maraka decimal(12,10) not null,
    kratkamajica varchar(32) not null,
    ogrlica int
);

create table muskarac(
    id int not null primary key auto_increment,
    maraka decimal(17,7) not null,
    hlace varchar(45) not null,
    prstena int not null,
    nausnica int,
    neprijateljica int not null
);

alter table muskarac add foreign key(neprijateljica) references neprijateljica(id);

delimiter $$
create function inti(broj int) returns varchar(255)
begin
	if broj between 950 and 5098
	then 
	return broj;
	else
	return 'Broj nije između 950 i 5098';
	end if;
end;
$$ 
delimiter ;

delimiter $$
create procedure unosZarucnica() 
begin
	for i in 1..56872
	do
	insert into zarucnica(id,prstena,modelnaocala,nausnica) values
	(null,1,'Rayban',i);
	end for; 
end;
$$ 
delimiter ;

delimiter $$
create trigger unos_punca after insert on zarucnica for each row 
begin 
	insert into punac (id,modelnaocala,treciputa,drugiputa,novcica,narukvica) values 
    (null,null,null,null,15.00,null),
	(null,null,null,null,20.00,null);
end;
$$ 
delimiter ;

delimiter $$
create function zadatak1(broj int) returns varchar(255)
begin
	if broj between 1076 and 4697
	then 
	return broj;
	else
	return 'Broj nije između 1076 i 4697';
 	end if;
end;
$$ 
delimiter ;

delimiter $$
create procedure zadatak2()
begin
	for i in 1..24064
	do
	insert into sestra(id,introventno,carape,suknja,narukvica) values(null,true,null,null,i);
	end for;
end;
$$ 
delimiter ;

delimiter $$
create trigger zadatak3 after insert on sestra for each row
begin
	insert into neprijateljica (id,indiferentno,modelnaocala,maraka,kratkamajica,ogrlica) values
	(null,true,'Ray',18.2,'Crna',null),
	(null,false,'Ban',20.19,'Crvena',null);
end;
$$ 
delimiter ;





