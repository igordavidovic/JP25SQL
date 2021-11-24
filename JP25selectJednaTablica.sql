select * from smjer;

# filtriranje kolona - select lista

# * sve kolone
select * from smjer;

# nazivi kolona odvojeni zarezom
select naziv from smjer;
select naziv, cijena from smjer;
select naziv, cijena, naziv from smjer;

select *, naziv from smjer;

# konstanta
select naziv, 'Osijek', 7 from smjer;

# koloni se može dati zamjensko ime
select naziv, 'Osijek' as mjesto, 7 as mjeseci from smjer;


# izraz
select naziv, length(naziv) as duzina from smjer;





# Filtriranje redova
select * from smjer where sifra=1;

# operatori uspoređivanja: =, <, >, <=, >=, != (<>)

select * from smjer where sifra!=2;

# logički operatori: and, or i not https://introcs.cs.princeton.edu/java/71boolean/images/truth-table.png


select * from smjer where sifra>1 and sifra<3;
1 0 i 1
2 1 i 1
3 1 i 0

select * from smjer where sifra=1 or sifra=3;
1 1 ili 0
2 0 ili 0
3 0 ili 1

select * from smjer where not (sifra=1 or sifra=3);


# Ostali nama bitni operatori: like, is null, is not null, in, between

select * from osoba where ime='Filip';

select * from osoba where ime like '%f%';

select * from osoba where ime like 'f%';

select * from osoba where ime not like '%a';

select * from osoba where oib is null;
select * from osoba where oib is not null;

select * from osoba where sifra=1 or sifra=7 or sifra=12 or sifra=19;
select * from osoba where sifra in (1,7,12,19);

select * from osoba where sifra>=5 and sifra<=15;
select * from osoba where sifra between 5 and 15;


# Izlistajte prezimena i imena osoba




# baza mjesta
# odaberite sva mjesta koja se nalaze u Osječko baranjskoj
# županiji
select * from mjesto where zupanija=14;
# odaberite sva mjesta koja u sebi imaju niz znakova ac
select * from mjesto where naziv like '%ac%';
# Dodajte mjesto Programovci u Osječko baranjskoj županiji
insert into mjesto(postanskibroj,zupanija,naziv) values
(31556,14,'Programovci');

################################################
#DOMAĆA ZADAĆA: UČITATI SVE BAZE

##### baza knjiznica
# odaberite sve autore za koje ne znamo datum rođenja
select * from autor where datumrodenja is null;
# Unesite sebe kao autora
insert into autor(sifra,ime,prezime,datumrodenja) values
(20775,'Igor','Davidović',"2001-04-03");
# odaberite autore koji su rođeni na Vaš datum rođenja
# uključujući i godinu
select * from autor where datumrodenja="2001-04-03";
# odaberite autore koji se zovu kao Vi
select * from autor where ime='Igor';
# odaberite sve izdavače koji su 
# društva s ograničenom odgovornošću
select * from izdavac where naziv like '%d.o.o.%';

##### baza world
# odaberite sve zemlje iz Europe
select * from country where Continent='Europe';
# unesite mjesto Donji Miholjac
insert into city(ID,Name,CountryCode,District,Population) values
(null,'Donji Miholjac','HRV','Osijek-Baranja',9491);
# Promjenite Donji Miholjac u Špičkovinu

# Obrišite mjesto Špičkovina







