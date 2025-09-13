-- DI 3.2 - Data Storage & Structure

-- Which actor brought Rockbuster the most revenue?
Looking at the schema I would need to use inner joins and the tables labled:
  "actor"
  "film_actor"
  "inventory"
  "rental"
  "payment"
-- ANSWER: n/a

-- What language are the majority of movies in the collection?
Looking at the schema I would need to use inner joins and the tables labled:
  "language"
  "film"
  "inventory"
-- ANSWER: n/a
##The script above was left blank as these were questions that were presented before learning how to operate SQL.

  
# Below the questions posted in DI -3.02 were answered after learning more about SQL
-- Which actor brought Rockbuster the most revenue?
SELECT A.first_name, A.last_name, SUM(E.amount) AS most_revenue
FROM actor A
	INNER JOIN film_actor B ON A.actor_id = B.actor_id
	INNER JOIN inventory C ON B.film_id = C.film_id
	INNER JOIN rental D ON C.inventory_id = D.inventory_id
	INNER JOIN payment E ON D.rental_id = E.rental_id
GROUP BY A.actor_id, A.first_name, A.last_name
ORDER BY most_revenue DESC
LIMIT 10;
--ANSWER: first_name | last_name | most_revenue
			  -- Gina	      Degeneres  	3129.17
			  -- Matthew    Carrey	    2543.78
			  -- Mary       Keitel      2426.92
			  -- Scarlett   Damon	      2403.81
			  -- Walter     Torn	      2403.18
			  -- Henry      Berry       2392.36
			  -- Christian  Akroyd	    2378.97
			  -- Angela     Witherspoon	2357.11
			  -- Cameron    Zekkweger	  2322.94
			  -- Wodoy      Hoffman	    2315.92

-- What language are the majority of movies in the collection?
SELECT A.name AS majority_language,
COUNT (B.film_id) AS film_count
FROM language A
	INNER JOIN film B ON A.language_id = B.language_id
GROUP BY A.name
ORDER BY film_count DESC
LIMIT 1;
-- ANSWER: majority_language | film_count
        -- English            1000
