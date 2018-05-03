create or replace package o_rourkes_api as
   --TODO: add exceptions 
   procedure order_ingredient(
      pidm number,
      name varchar,
      kcal number,
      vitamin_score number,
      notes clob
   );
   procedure create_entree(
      pidm number,
      name varchar
   );
   procedure add_ingredient_to_entree(
      entree_pidm number,
      ingredient_pidm number
   );
   function total_kcal(entree_pidm_target number) return number;
   function avg_vitamin_score(entree_pidm_target number) return number;

end o_rourkes_api;

/

create or replace package body o_rourkes_api as
   cursor sum_of_kcal(entr_pidm number) is
      select sum(kcal)
      from o_rourkes.ingredients
      inner join o_rourkes.entree_ingredients ei
      on ingredients.pidm = ei.ingredient_pidm
      inner join o_rourkes.entrees
      on ei.entree_pidm = entrees.pidm
      where entrees.pidm = entr_pidm;
   cursor avg_of_vitamin_score(entr_pidm number) is
      select avg(vitamin_score)
      from o_rourkes.ingredients
      inner join o_rourkes.entree_ingredients ei
      on ingredients.pidm = ei.ingredient_pidm
      inner join o_rourkes.entrees
      on ei.entree_pidm = entrees.pidm
      where entrees.pidm = entr_pidm;
   procedure order_ingredient(
      pidm number,
      name varchar,
      kcal number,
      vitamin_score number,
      notes clob
   ) is
   begin
      --TODO: check for and raise exceptions
      insert into o_rourkes.ingredients(pidm, name, kcal, vitamin_score, notes) values(pidm, name, kcal, vitamin_score, notes);
   end order_ingredient;
   procedure create_entree(
      pidm number,
      name varchar
   ) is
   begin
      --TODO: check for and raise exceptions
      insert into o_rourkes.entrees(pidm, name) values(pidm, name);
   end create_entree;
   procedure add_ingredient_to_entree(
      entree_pidm number,
      ingredient_pidm number
   ) is
   begin
      --TODO: check for and raise exceptions
      insert into o_rourkes.entree_ingredients(entree_pidm, ingredient_pidm) values(entree_pidm, ingredient_pidm);
   end add_ingredient_to_entree;

   function total_kcal(entree_pidm_target number) return number is 
      result number;
   begin
      --TODO: check for and raise exceptions
      open sum_of_kcal(entree_pidm_target);
      fetch sum_of_kcal into result;
      close sum_of_kcal;
      return result;
   end total_kcal;
   function avg_vitamin_score(entree_pidm_target number) return number is
      result number;
   begin
      --TODO: check for and raise exceptions
      open avg_of_vitamin_score(entree_pidm_target);
      fetch avg_of_vitamin_score into result;
      close avg_of_vitamin_score;
      return result;
   end avg_vitamin_score;
end o_rourkes_api;
