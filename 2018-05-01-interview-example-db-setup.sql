create table example(
   pidm number(9) primary key,
   name varchar(30),
   age  number,
   ice_cream_flavor varchar(15)
);

insert into example(pidm, name, age, ice_cream_flavor) values (2348710, 'Jeyan Burns-Oorjitham', 28, 'veggie');


select * from example;