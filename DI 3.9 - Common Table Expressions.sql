-- DI 3.9 - Common Table Expressions
-- Answer the questions from task 3.8 using CTE.

-- Find the average amount paid by the top 5 customers.
WITH Top_5_Customers AS
	(SELECT A.customer_id, A.first_name, A.last_name, SUM(E.amount) AS total_spent
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id 
	INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE C.city IN ('Tieli','Lausanne','Sullana','Patras','Jinzhou')
GROUP BY A.customer_id, A.first_name, A.last_name
ORDER BY SUM (E.amount) DESC
LIMIT 5)
SELECT AVG(total_spent)
FROM Top_5_Customers;
--ANSWER: 86.9720000000000000

-- Find out how many of the top 5 customer identified above are based within each country.
-- Final output should include "country", "all_customer_count", "top_customer_count".
WITH Top_5_Customer_Country AS
(SELECT D.country,
       COUNT(A.customer_id) AS all_customer_count,
       COUNT(CASE WHEN C.city IN ('Tieli', 'Lausanne', 'Sullana', 'Patras', 'Jinzhou') THEN 1 ELSE NULL END) AS top_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
GROUP BY D.country
ORDER BY top_customer_count DESC)
SELECT country, all_customer_count, top_customer_count
FROM Top_5_Customer_Country
--ANSWER:country | all_customer_count | top_customer_count
--		"China"				53				2
--		"Greece"			2				1
--		"Switzerland"		3				1
--		"Peru"				4				1