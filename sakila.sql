se sakila;
-- 1 List all actors.
select * from actor;

-- 2 Find the surname of the actor with the forename 'John'.
select * from actor where first_name = "John";

-- 3 Find all actors with surname 'Neeson'.
select * from actor where last_name = "Neeson";

-- 4 Find all actors with ID numbers divisible by 10.
select * from actor where (select actor_id % 10 =0);

-- 5 What is the description of the movie with an ID of 100?
select description from film where film_id = 100;

-- 6 Find every R-rated movie.
select * from film where rating ="R";
-- 7 Find every non-R-rated movie.
select * from film where rating !="R";
-- 8 Find the ten shortest movies.
select title, length from film order by length asc limit 10;
-- 9 Find the movies with the longest runtime, without using LIMIT.
select title, length from film order by length desc;
-- 10 Find all movies that have deleted scenes.
select title, special_features from film where special_features like "%Deleted Scenes%";
-- 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
select last_name from actor
group by last_name
having count(last_name)=1
order by last_name desc;

-- 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
select last_name, count(last_name) as Freq from actor
group by last_name
having count(last_name)>1
order by (select count(last_name) from actor order by count(last_name) )desc;
-- 13 Which actor has appeared in the most films?
select concat(actor.first_name," ", actor.last_name) as full_name,  count(film.film_id) as film_stared from film
left join film_actor
on film.film_id = film_actor.actor_id
left join actor
on film_actor.actor_id = actor.actor_id
group by full_name
having full_name is not null
order by film_stared desc limit 10 
; 


-- 14 When is 'Academy Dinosaur' due?
select * from rental
left join customer
on rental.customer_id = customer.customer_id
left join inventory
on rental.inventory_id = inventory.inventory_id
left join film
on inventory.film_id = film.film_id
where film.title ="Academy Dinosaur" and return_date is null;

-- 15 What is the average runtime of all films?
select round(avg(length)) as average_duration  from film;

-- 16 List the average runtime for every film category.
select category.name , round(avg(length)) as Average_Duration from category
left join film_category
on category.category_id = film_category.category_id
left join film
on film_category.film_id = film.film_id
group by category.name;

-- 17 List all movies featuring a robot.
select * from film where description like "%robot%";

-- 18 How many movies were released in 2010?
select count(*) from film
where release_year = '2010';
-- 19 Find the titles of all the horror movies.
select film.title, category.name from category
left join film_category
on category.category_id = film_category.category_id
left join film
on film_category.film_id = film.film_id
where category.name ="Horror";

-- 20 List the full name of the staff member with the ID of 2.
select concat(first_name, " ", last_name) as Full_name from customer
where customer_id= 2;

-- 21 List all the movies that Fred Costner has appeared in.
select actor.first_name, actor.last_name ,film.title from film
left join film_actor
on film.film_id = film_actor.film_id
left join actor
on film_actor.actor_id = actor.actor_id
where first_name = "Fred" and last_name = "Costner";

-- 22 How many distinct countries are there?
select distinct(country) from country;

-- 23 List the name of every language in reverse-alphabetical order.
select * from language
order by name desc;

-- 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
select first_name, last_name ,concat(first_name," ",last_name) as full_name from customer
where last_name like "%son"
order by first_name asc;
-- 25 Which category contains the most films?
select category.name, count(film.film_id) as Films from film
left join film_category
on film.film_id = film_category.film_id
left join category
on
 film_category.category_id = category.category_id
 group by category.name
 order by Films desc ; 
