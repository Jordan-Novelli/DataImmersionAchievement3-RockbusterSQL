-- DI 3.4 - Database Querying in SQL

-- REFINING YOUR QUERY:
-- You need to get some data from the “film” table and decide to use the query SELECT * FROM film.
-- You realize that only the “film_id” and “title” columns are needed. Write a new query that selects only those 2 columns
-- Compare the cost of the original query and the revised query.
SELECT * FROM film
Query complete 00:00:00.071

SELECT film_id, title
FROM film
(Query complete 00:00:00.044)

-- ORDERING THE DATA:
-- Run a query that selects every film from the “film” table, with the movies sorted by title from A to Z.
-- Then by most recent release year, and then by highest to lowest rental rate.
SELECT title, release_year
FROM film
ORDER BY title ASC

SELECT title, release_year
FROM film
ORDER BY release_year DESC

SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC

-- GROUPING DATA:
-- The strategy department has asked you the questions below.

-- What is the average rental rate for each rating category?
SELECT rating, AVG(rental_rate)
FROM film
GROUP BY rating
--ANSWER: "PG"	3.0518556701030928
--ANSWER: "R"	2.9387179487179487
--ANSWER: "G"	2.8888764044943820
--ANSWER: "PG-13"	3.0348430493273543
--ANSWER: "NC-17"	2.9709523809523810

-- What are the minimum and maximum rental durations for each rating category?
SELECT rating, MIN(rental_duration), MAX (rental_duration)
FROM film
GROUP BY rating
-- ANSWER: "PG"	3(min)	7 (max)
-- ANSWER: "R"	3(min)	7(max)
-- ANSWER: "G"	3(min)	7(max)
-- ANSWER: "PG-13"	3(min)	7(max)
-- ANSWER: "NC-17"	3(min)	7(max)

-- BONUS TASK: (Having not yet learned custom sorting)
-- Links provided for my own research purposes = https://sqlandme.com/2013/11/18/sql-server-custom-sorting-in-order-by-clause/
-- Links provided for my own research purposes= https://stackoverflow.com/questions/19196475/how-to-get-results-in-a-custom-order
-- What are the minimum and the maximum replacement costs for each rating category ordered by rating as follows: G, PG, PG-13, R, NC-17?
SELECT rating, MIN (replacement_cost), MAX(replacement_cost)
FROM film
GROUP BY rating
ORDER BY CASE WHEN rating = 'G' THEN '1'
				WHEN rating = 'PG' THEN '2'
				WHEN rating = 'PG-13' THEN '3'
				WHEN rating = 'R' THEN '4'
				ELSE 5 END ASC
