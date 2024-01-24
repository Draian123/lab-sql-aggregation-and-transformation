USE sakila;

#1.1
-- Shortest duration
SELECT MIN(length) AS min_duration
FROM film;

-- Longest duration
SELECT MAX(length) AS max_duration
FROM film;

#1.2
SELECT
  FLOOR(AVG(length) / 60) AS avg_hours,
  MOD(AVG(length), 60) AS avg_minutes
FROM film;

#2.1
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

#2.2
SELECT 
  rental_id,
  rental_date,
  MONTH(rental_date) AS rental_month,
  DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

#2.3
SELECT 
  rental_id,
  rental_date,
  CASE 
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
    ELSE 'workday'
  END AS DAY_TYPE
FROM rental
LIMIT 20;


#3
SELECT 
  title,
  IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

#4
SELECT 
  CONCAT(first_name, ' ', last_name) AS full_name,
  LEFT(email, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;


#CHALLENGE 2

#1.1
SELECT COUNT(*) AS total_films
FROM film;

#1.2
SELECT rating, COUNT(*) AS films_per_rating
FROM film
GROUP BY rating;

#1.3
SELECT rating, COUNT(*) AS films_per_rating
FROM film
GROUP BY rating
ORDER BY films_per_rating DESC;

#2.1
SELECT 
  rating,
  ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

#2.2
SELECT 
  rating,
  ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120
ORDER BY mean_duration DESC;

#3
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

