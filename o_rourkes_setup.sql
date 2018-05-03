create user o_rourkes identified by fdhafdl34r98234 password expired;

create table o_rourkes.people(
  pidm number(9) primary key,
  name varchar(30),
  age  number,
  hair_color varchar(15)
)
create table o_rourkes.ingredients(
  pidm number(9) primary key,
  name varchar(30),
  kcal number(10),
  vitamin_score number(10),
  notes clob
)
create table o_rourkes.entrees(
  pidm number(9) primary key,
  name varchar(30),
  chef_pidm number(9),
  constraint fk_entrees_chef foreign key(chef_pidm) references people(pidm)
)
create table o_rourkes.favorite_entrees(
  person_pidm number(9),
  entree_pidm number(9),
  constrant pk_favorite_entrees_id(person_pidm, entree_pidm),
  constrant fk_favorite_entrees_person foreign key(person_pidm) references people(pidm),
  constrant fk_favorite_entrees_person foreign key(person_pidm) references people(pidm),
)
  

insert into o_rourkes.people(pidm, name, age, ice_cream_flavor) values (2348710, 'Jeyan Burns-Oorjitham', 28, 'Midnight Black');


select * from o_rourkes.people;

--TODO: stored proc to insert person
--TODO: stored proc to insert ingredient
--TODO: stored proc to insert entree
--TODO: stored proc to set chef for entree

--TODO: stored proc to set an ingredient for an entree
--TODO: stored proc to set an entree as a person's favorite

--TODO: function to aggregate kcal for an entree
--TODO: function to average vitamin score for an entree
