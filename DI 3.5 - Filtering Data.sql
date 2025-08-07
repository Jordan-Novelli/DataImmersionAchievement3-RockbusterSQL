-- DI 3.5 - Filtering Data

-- Film title contains the word Uptown in any position
SELECT title, film_id, description
FROM film
WHERE title
LIKE '%Uptown%'
--ANSWER: "Chainsaw Uptown"	| 132 |  "A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia"
--ANSWER: "Dangerous Uptown" | 207 | "A Unbelieveable Story of a Mad Scientist And a Woman who must Overcome a Dog in California"
--ANSWER: "Uprising Uptown" | 927 |	 "A Fanciful Reflection of a Boy And a Butler who must Pursue a Woman in Berlin"
--ANSWER: "Uptown Young" | 928 | "A Fateful Documentary of a Dog And a Hunter who must Pursue a Teacher in An Abandoned Amusement Park"


-- Film length is more than 120 minutes and rental rate is more than 2.99
SELECT title, length, rental_rate, film_id, description
FROM film
WHERE length >120
AND rental_rate >2.99
--ANSWER: Total rows: 157


-- Rental duration is between 3 and 7 days (where 3 and 7 aren’t inclusive)
SELECT title, rental_duration, film_id, description
FROM film
WHERE rental_duration >3
AND rental_duration <7
--ANSWER: Total rows: 606

-- Film replacement cost is less than 14.99
SELECT title, replacement_cost, film_id, description
FROM film
WHERE replacement_cost <14.99
--ANSWER: Total rows: 249


-- Film rating is either PG or G
SELECT title, rating, film_id, description
FROM film
WHERE rating IN ('PG', 'G')
--ANSWER: Total rows: 372


--AGGREGATES CODES::
-- count of movies
-- average movie rental rate
-- maximum rental duration
-- minimum rental duration
SELECT
	COUNT (film_id) AS Count_of_Movies,
	AVG (rental_rate) AS Average_Movei_Rental_Rate,
	MIN (rental_duration) AS Minimum_Rental_Duration,
	MAX (rental_duration) AS Maximum_Rental_Duration
FROM film
WHERE rating IN ('PG', 'G')
-- ANSWER: 372 | 2.9738709677419355 | 3 | 7


-- The customer team wants to see the fields you calculated in step 3 grouped by rating. The totals in your results table should look the same but broken down by the rating column. Copy-paste your query and its output onto a new sheet.
SELECT rating, 
	COUNT (film_id) AS Count_of_Movies,
	AVG (rental_rate) AS Average_Movei_Rental_Rate,
	MIN (rental_duration) AS Minimum_Rental_Duration,
	MAX (rental_duration) AS Maximum_Rental_Duration
FROM film
GROUP BY rating
HAVING rating IN ('PG', 'G')
--ANSWER:"G"  | 178 | 2.8888764044943820 | 3 | 7
--ANSWER:"PG" | 194 | 3.0518556701030928 | 3| 7