-- DI 3.7 - Joining Tables of Data

-- Find the top 10 countries for Rockbuster in terms of customer numbers.
SELECT A.customer_id, COUNT (A.customer_id), D.country
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id
GROUP BY A.customer_id, D.country
ORDER BY A.customer_id DESC
LIMIT 10;
--ANSWER: customer_id | count | country
			-- 599	        1 	"China"
			-- 598      	1	"Switzerland"
			-- 597      	1	"Peru"
			-- 596      	1	"Greece"
			-- 595       	1	"China"
			-- 594      	1	"China"
			-- 593      	1	"United States"
			-- 592      	1	"Hungary"
			-- 591      	1	"Brazil"
			-- 590      	1	"Bahrain"

-- Identify the top 10 cities that fall within the top 10 countries identified above.
SELECT A.customer_id, C.city, D.country
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id
GROUP BY A.customer_id, C.city, D.country
ORDER BY (A.customer_id) DESC 
LIMIT 10;
---ANSWER: customer_id | city  		| country
			-- 599	    "Tieli" 		"China"
			-- 598     	"Lausanne"		"Switzerland"
			-- 597      "Sullana"		"Peru"
			-- 596      "Patras"		"Greece"
			-- 595       "Jinzhou"		"China"
			-- 594      "Jining"		"China"
			-- 593      "Garden Grove"	"United States"
			-- 592      "Szkesfehrvr"	"Hungary"
			-- 591      "Juiz De Fora"	"Brazil"
			-- 590      "al-Manama"		"Bahrain"

-- Find the top 5 customers from the top 10 cities who’ve paid the highest total amounts to Rockbuster.
SELECT A.customer_id, A.first_name, A.last_name, C.city, D.country, SUM(E.amount) AS total_spent
FROM customer A
	INNER JOIN address B ON A.address_id = B.address_id
	INNER JOIN city C ON B.city_id = C.city_id
	INNER JOIN country D ON C.country_id = D.country_id 
	INNER JOIN payment E ON A.customer_id = E.customer_id
WHERE C.city IN ('Tieli','Lausanne','Sullana','Patras','Jinzhou')
GROUP BY A.customer_id, A.first_name, A.last_name, C.city, D.country
ORDER BY SUM (E.amount) DESC
LIMIT 5
--ANSWER: customer_id | first_name | last_name 	| city 			| country 		| total_spent
			-- 595		"Terrence"	"Gunderson"		"Jinzhou"	"China"			110.71
			-- 597		"Freddie"	"Duggan"		"Sullana"	"Peru"			87.77
			-- 598		"Wade"		"Delvalle"		"Lausanne"	"Switzerland"	83.78
			-- 599		"Austin"	"Cintron"		"Tieli"		"China"			78.82
			-- 596		"Enrique"	"Forsythe"		"Patras"	"Greece"		73.78
