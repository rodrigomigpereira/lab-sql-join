## Lab | SQL Join
## In this lab, you will be using the Sakila database of movie rentals.

use sakila; ## Use the database sakila 

## Instructions
## List the number of films per category.

select * from category;
select * from film_category;

select category_id, count(film_id) as number_of_movies
	from film_category
		group by category_id
			order by number_of_movies DESC; 
            
select fc.category_id, c.name as category_name, count(fc.film_id) as number_of_movies
	from film_category fc
		join category c
		on fc.category_id = c.category_id
			group by category_id
				order by number_of_movies DESC;

## Display the first and the last names, as well as the address, of each staff member.

select * from staff; ## columns --- staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update
select * from address; ## columns --- address_id, address, address2, district, city_id, postal_code, phone, location, last_update 

select s.first_name, s.last_name, s.address_id, a.address
	from staff s
		join address a
		on s.address_id = a.address_id;

## Display the total amount rung up by each staff member in August 2005.

select * from payment;

SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
	FROM payment p
		JOIN staff s 
		ON p.staff_id = s.staff_id
			WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
				GROUP BY s.staff_id, s.first_name, s.last_name
					order by total_amount DESC;

## List all films and the number of actors who are listed for each film.

select * from film; ## columns --- film_id, title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update
select * from actor; ## columns --- actor_id, first_name, last_name, last_update
select * from film_actor; ## columns --- actor_id, film_id, last_update

select f.film_id, f.title, count(fa.actor_id) as number_actors_per_film
	from film f
		join film_actor fa
        on f.film_id = fa.film_id
			group by f.film_id
				order by number_actors_per_film DESC;

## Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select * from payment; ## columns --- payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
select * from customer; ## columns --- customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount_paid
	from customer c
		join payment p
        on c.customer_id = p.customer_id
			group by c.customer_id
				order by c.last_name;	

	
