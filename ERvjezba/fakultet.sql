drop database if exists fakultet;
create database fakultet character set utf8;
use fakultet;

create table student(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datumrodenja date,
    email varchar(50)
);

create table kolegij(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    predavac varchar(50)
);

create table rok(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    datumpocetka date,
    datumkraja date
);

create table student_kolegij(
    student int not null,
    kolegij int not null
);

create table student_rok(
    student int not null,
    rok int not null
);

alter table student_kolegij add foreign key(student) references student(sifra);
alter table student_kolegij add foreign key(kolegij) references kolegij(sifra);


alter table student_rok add foreign key(student) references student(sifra);
alter table student_rok add foreign key(rok) references rok(sifra);

insert into student(sifra,ime,prezime,datumrodenja,email) values
(null,'Dejana','Horvat',null,'dejana.horvat@gmail.com'),
(null,'Nebojša','Marković',null,null),
(null,'Viktor','Grgić',"2000-10-09",'viktorgrgic@gmail.com'),
(null,'Boro','Stojanović',null,'borostojanovic@gmail.com'),
(null,'Nikola','Vinković',"1998-09-25",'nikolavinkovic@gmail.com'),
(null,'Biljana','Košar',null,null),
(null,'Luka','Pavletić',"1999-11-20",null),
(null,'Mislav','Mihaljević',"1995-05-18",null),
(null,'Davor','Antić',null,'davorantic@gmail.com'),
(null,'Maša','Šimunović',null,'masasimunovic@gmail.com'),
(null,'Nedeljka','Kovačević',"1996-06-15",null),
(null,'Olivera','Radić',"1997-05-11",null),
(null,'Cecilija','Marić',null,'cecilijamaric@gmail.com'),
(null,'Nada','Kovač',null,null),
(null,'Viktor','Božić',"1996-03-15",'viktorbozic@gmail.com'),
(null,'Ena','Branković',null,'enabrankovic@gmail.com'),
(null,'Svjetlana','Lončar',"1999-12-14",'svjetlanaloncar@gmail.com'),
(null,'Jerko','Janković',null,null),
(null,'Andreja','Mihaljević',"2000-06-03",'andrejamihaljevic@gmail.com'),
(null,'Rozika','Đurić',null,null),
(null,'Ljiljana','Kralj',"1995-10-11",null),
(null,'Leon','Dragić',null,'leondragic@gmail.com');

insert into kolegij(sifra,naziv,predavac) values
(null,'Analiza financijskih izvješća','Staša Perković'),
(null,'Algoritmi i strukture podataka',null),
(null,'Analiza poslovnih podataka','Kristofer Lučić');

insert into rok(sifra,naziv,datumpocetka,datumkraja) values
(null,'Zimski rok',"2022-01-31","2022-02-28"),
(null,'Ljetni rok',"2022-06-13","2022-07-15"),
(null,'Jesenski rok',"2022-09-20","2022-10-27");

insert into student_kolegij(student,kolegij) values
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,2),
(11,2),
(12,2),
(13,2),
(14,2),
(15,2),
(16,2),
(17,3),
(18,3),
(19,3),
(20,3),
(21,3),
(22,3);

insert into student_rok(student,rok) values
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,2),
(8,2),
(9,2),
(10,2),
(11,2),
(12,2),
(13,2),
(14,2),
(15,2),
(16,2),
(17,3),
(18,3),
(19,3),
(20,3),
(21,3),
(22,3);

