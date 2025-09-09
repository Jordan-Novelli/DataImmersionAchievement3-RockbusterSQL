-- DI 3.3 - SQL for Data Analysts

-- What film genres exist in the category table?
SELECT * FROM category
-- ANSWER: Action, Animation, Children, Classics, Comedy, Documentary, Drama, Family, Foreign, Games, Horror, Musci, New, Sci-Fi, Sports, Travel.

-- Add the genres: Thirller, Crime, Myster, Romance, and War.
INSERT INTO category (category_id, name)
VALUES ('17', 'Thriller')
VALUES ('18','Crime')
VALUES ('19','Mystery')
VALUES ('20','Romance')
VALUES ('21','War')
-- Each value entered separately

-- Use the select statement to find the film_id for the movie African Egg.
SELECT film_id, title
FROM film
WHERE title = 'African Egg'
-- ANSWER: film_id for African Egg 5

-- What is the category_id of the movie African Egg?
SELECT category_id, film_id
FROM film_category
WHERE film_id = '5'
-- ANSWER: category_id = 8 (family)

-- Using the update commande change the category for African Egg to Thriller in the fil_category table (not the category table).
UPDATE film_category
SET category_id = 17
WHERE film_id = 5
--ANSWER: Query returned successfully in 31 msec.

-- Delete the mystery category since there are no movies in that category.
DELETE FROM category
WHERE category_id = 19
-- ANSWER: Query returned successfully in 27 msec.
