-- DI 3.8 - Performing Subqueries

-- Find the average amount paid by the top 5 customers.
SELECT AVG(total_spent) AS total_amount_paid
FROM payment AS P
INNER JOIN (SELECT A.customer_id, A.first_name, A.last_name, C.city, D.country, SUM(E.amount) AS total_spent
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id 
	INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE C.city IN ('Tieli','Lausanne','Sullana','Patras','Jinzhou')
GROUP BY A.customer_id, A.first_name, A.last_name, C.city, D.country
ORDER BY SUM (E.amount) DESC
LIMIT 5) AS avg_paid ON P.customer_id = avg_paid.customer_id;
--ANSWER: 88.7226315789473684

-- Find out how many of the top 5 customer identified above are based within each country.
-- Final output should include "country", "all_customer_count", "top_customer_count".
-- BY TOP_CUSTOMER_COUNT
SELECT D.country,
       COUNT(A.customer_id) AS all_customer_count,
       COUNT(CASE WHEN C.city IN ('Tieli', 'Lausanne', 'Sullana', 'Patras', 'Jinzhou') THEN 1 ELSE NULL END) AS top_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY top_customer_count DESC
-- BY ALL_CUSTOMER_COUNT
SELECT D.country,
       COUNT(A.customer_id) AS all_customer_count,
       COUNT(CASE WHEN C.city IN ('Tieli', 'Lausanne', 'Sullana', 'Patras', 'Jinzhou') THEN 1 ELSE NULL END) AS top_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY all_customer_count DESC
--ANSWER:country | all_customer_count | top_customer_count
--		"China"				53				2
--		"Greece"			2				1
--		"Switzerland"		3				1
--		"Peru"				4				1
