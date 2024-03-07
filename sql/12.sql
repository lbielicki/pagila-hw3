/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */
WITH recent_rentals AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(*) FILTER (WHERE cat.name = 'Action') AS action_count,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY r.rental_date DESC) AS row_num
    FROM
        customer c
    JOIN
        rental r ON c.customer_id = r.customer_id
    JOIN
        inventory i ON r.inventory_id = i.inventory_id
    JOIN
        film f ON i.film_id = f.film_id
    JOIN
        film_category fc ON f.film_id = fc.film_id
    JOIN
        category cat ON fc.category_id = cat.category_id
    GROUP BY
        c.customer_id, c.first_name, c.last_name, r.rental_date
)
SELECT
    customer_id,
    first_name,
    last_name
FROM
    recent_rentals
WHERE
    row_num <= 5
GROUP BY
    customer_id, first_name, last_name
HAVING
    SUM(action_count) >= 4
ORDER BY customer_id;

