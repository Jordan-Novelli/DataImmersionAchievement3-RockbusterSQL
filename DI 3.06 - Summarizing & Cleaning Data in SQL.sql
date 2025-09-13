-- DI 3.6 - Summarizing & Cleaning Data in SQL
	-- Check for and clean dirty data and summarize the data.

-- Check the film table and customer table for dirty data;
-- Specifically non-uniform, duplicate, missing values.
-- FILM TABLE
SELECT title, release_year, language_id, length, rating
FROM film
GROUP BY title, release_year, language_id, length, rating
HAVING COUNT (*)>1
--ANSWER: Total rows: 0

-- CUSTOMER TABLE
SELECT first_name, last_name, email
FROM customer
GROUP BY first_name, last_name, email
HAVING COUNT (*)>1
--ANSWER: Total rows: 0

-- Calculate descriptive statistics for both the film table and the customer table
-- Find the minimum, maximum, and average values for numerical columns.
-- For non-numerical columns, calculate the mode value.
-- FILM TABLE
SELECT  MIN(rental_rate) AS Min_Rent,
		MIN(replacement_cost) AS Min_Cost,
		MAX(rental_rate) AS Max_Rent,
		MAX(replacement_cost) AS Max_Cost,
		AVG(rental_rate) AS Avg_Rent,
		AVG(replacement_cost) AS Avg_Cost,
		COUNT(rental_rate)AS Count_Rent_Values,
		COUNT(replacement_cost) AS Count_Replacement_Cost,
		COUNT(*) AS Count_rows
FROM film;
--ANSWER: min_rent | min_cost | max_rent | max_cost | avg_rent           | avg_cost             | count_rent_values | count_replacement_cost | count_rows
		-- 0.99    |  9.99    |	4.99     | 29.99    | 2.9800000000000000 | 19.9840000000000000  |        1000       |            1000        |	1000

-- CUSTOMER TABLE
SELECT MODE() WITHIN GROUP (ORDER BY email)
	AS modal_value
FROM customer;
--ANSWER: modal_value
--       "aaron.selby@sakilacustomer.org"

SELECT email,
	COUNT(*)
FROM customer
GROUP BY email
ORDER BY COUNT(*)
--ANSWER: Total rows: 599 (there are only single instances of emails.)

