/*
 * Compute the country with the most customers in it. 
 */

SELECT c.country
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country c ON ct.country_id = c.country_id
GROUP BY c.country
ORDER BY count(*) DESC
LIMIT 1;
