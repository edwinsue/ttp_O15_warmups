--Which are the 10 longest R rated movies?

SELECT title
FROM film
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10

-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT title
FROM film
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10 
OFFSET 10

--How many films are as long as the longest film?
-- RETURN an exact number

SELECT COUNT(*)
FROM film
WHERE length = (SELECT MAX(length) FROM film)

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery

WITH r_movie_sorted AS (
	SELECT * 
	FROM film
	ORDER BY length DESC, title ASC)
	
SELECT title, length
FROM r_movie_sorted
LIMIT 10

--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"

SELECT title, LENGTH(description) as descrip_len
FROM film 
WHERE rating IN ('G','PG','PG-13')
ORDER BY descrip_len DESC

-- How many unique release_years are there in the dvd rental database?
-- Return an exact number

SELECT COUNT(DISTINCT release_year)
FROM film