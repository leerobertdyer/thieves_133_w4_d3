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
FROM city
INNER JOIN country ON(
    city.country_id=country.country_id
)WHERE country.country='Nepal';

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