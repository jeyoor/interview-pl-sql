create user o_rourkes identified by fdhafdl34r98234 password expire;
grant create any table to jeyoor848hdfne;
alter user o_rourkes quota unlimited on USERS;

create table o_rourkes.ingredients(
  pidm number(9) primary key,
  name varchar(30),
  kcal number(10),
  vitamin_score number(10),
  notes clob
);
create table o_rourkes.entrees(
  pidm number(9) primary key,
  name varchar(30)
);
create table o_rourkes.entree_ingredients(
  entree_pidm number(9),
  ingredient_pidm number(9),
  constraint pk_entree_ingredients_id primary key (entree_pidm, ingredient_pidm),
  constraint fk_entree_ingred_entree foreign key(entree_pidm) references o_rourkes.entrees(pidm),
  constraint fk_entree_ingred_ingredient foreign key(ingredient_pidm) references o_rourkes.ingredients(pidm)
);
