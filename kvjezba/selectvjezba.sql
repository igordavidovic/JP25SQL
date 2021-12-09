select * from rental;

update rental set rental_date='2005-05-23 21:55:00' where rental_id=2;

update rental set return_date='2005-05-30 20:05:00' where rental_id=2;

select * from customer;

update customer set first_name='MARYA' where customer_id=1;

select * from address;

update address set address='50 MySakila Drive' where address_id=1;

select address_id from staff;

update staff set address_id=1 where staff_id=1; 

delete from address where address_id=9;

select * from customer;
select address_id from customer;

delete from customer where address_id=9;

select * from payment;

select * from payment where customer_id=5;

delete from payment where customer_id=5;

select * from rental where customer_id=5;

delete from rental where customer_id=5;

select title from nicer_but_slower_film_list;

select title,'Vukovar',8 from nicer_but_slower_film_list;

select title,'Vukovar' as place_of_origin,8 as review_score from nicer_but_slower_film_list;

select title,length(title) as length_of_title from nicer_but_slower_film_list;

select * from nicer_but_slower_film_list where FID=1;

select * from nicer_but_slower_film_list where FID!=2;

select * from nicer_but_slower_film_list where FID<25;

select * from nicer_but_slower_film_list where FID>200;

select * from nicer_but_slower_film_list where FID>50 and FID<100;

select * from nicer_but_slower_film_list where FID=40 or FID=50;

select * from nicer_but_slower_film_list where not(FID=2 or FID=5);

select * from nicer_but_slower_film_list where title='ACADEMY DINOSAUR';

select * from nicer_but_slower_film_list where title like '%ac%';

select * from nicer_but_slower_film_list where title like 'q%';

select * from nicer_but_slower_film_list where title like '%w';

select * from nicer_but_slower_film_list where title not like '%a%';

select * from nicer_but_slower_film_list where actors is not null;

select * from nicer_but_slower_film_list where FID=5 or FID=80 or FID=100 or FID=150;

select * from nicer_but_slower_film_list where FID in(100,500,800,1000);

select * from nicer_but_slower_film_list where FID>50 and FID<150;

select * from nicer_but_slower_film_list where FID between 50 and 150;

select concat(a.first_name,' ',a.last_name) as actor_name,c.title as movies_featured_in
from actor a inner join film_actor b on a.actor_id=b.actor_id
inner join film c on b.film_id=c.film_id;

select concat(a.first_name,' ',a.last_name) as actor_name,c.title as movies_featured_in
from actor a inner join film_actor b on a.actor_id=b.actor_id
inner join film c on b.film_id=c.film_id
where a.first_name like '%PE%';

select concat(a.first_name,' ',a.last_name) as actor_name,c.title as movies_featured_in
from actor a inner join film_actor b on a.actor_id=b.actor_id
inner join film c on b.film_id=c.film_id
where c.title='ANGELS LIFE';

select c.title,c.description
from category a inner join film_category b on a.category_id=b.category_id
inner join film c on b.film_id=c.film_id
where a.name='Action';

select c.title,c.description
from category a inner join film_category b on a.category_id=b.category_id
inner join film c on b.film_id=c.film_id
where a.name='Action' or c.rating='NC-17'
order by 1 desc;