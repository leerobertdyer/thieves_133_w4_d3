-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON (
    customer.address_id=address.address_id)
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT amount, first_name, last_name
FROM payment
INNER JOIN customer ON (
    payment.customer_id=customer.customer_id
)
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);


-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT *
FROM customer
INNER JOIN address ON(
    customer.address_id=address.address_id
)
INNER JOIN city ON(
    address.city_id=city.city_id
)
INNER JOIN country ON(
    city.country_id=country.country_id
)WHERE country='Nepal';

--Added below to verify:
SELECT *
FROM country
Where country_id=66;


-- 5. Which staff member had the most
-- transactions?

SELECT DISTINCT(staff_id), COUNT(rental_id)
FROM payment
GROUP BY staff_id;


-- 6. How many movies of each rating are
-- there?

SELECT rating, COUNT(title)
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a 
-- single payment above $6.99 (Use Subqueries)

SELECT *
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);

--8. How many free rentals did our store give away?
--Didn't see this it was on a second page so when I selected all just didn't grab it lol

SELECT *
FROM payment
WHERE amount = 0;

--I'm guessing zero here. Unless the negative amounts mean something other than refunds...