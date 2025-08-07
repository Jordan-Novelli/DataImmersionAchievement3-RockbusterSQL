-- How many actors are named Ed?
SELECT COUNT (*)
FROM actor
WHERE first_name = 'Ed'
-- ANSWER: 3

-- What are the names of the columns in the payment table?
SELECT* FROM payment LIMIT 10;
-- ANSWER: payment_id, customer_id, staff_id, rental_id, amount, payment_date

-- Under the "table_name" column, what are the names of the tables that are available in the Rockbuster database?
SELECT * FROM information_schema.tables
WHERE table_schema = 'public'
AND table_type = 'BASE TABLE'
-- ANSWER: table_catalog, table_schema, table_name, table_type, self_referencing_column_name, reference_generation, user_defined_type_schema, user_defined_type_name, is_insertable_into, is_typed, commit_action 

-- How many days are most rentals kept?
SELECT rental_duration AS "rented for (in days)", COUNT(*) AS "number of films"
FROM film
GROUP BY 1
ORDER BY 2
-- ANSWER: 7 days = 191 films, 5 days = 191 films, 4 days = 203 films, 3 days = 203 films, 6 days = 212 films. Most films are rented for 6 days.