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