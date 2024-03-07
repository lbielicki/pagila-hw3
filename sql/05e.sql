/* 
 * You've decided that you don't actually like ACADEMY DINOSAUR and AGENT TRUMAN,
 * and want to focus on more movies that are similar to AMERICAN CIRCUS.
 * This time, however, you don't want to focus only on movies with similar actors.
 * You want to consider instead movies that have similar categories.
 *
 * Write a SQL query that lists all of the movies that share 2 categories with AMERICAN CIRCUS.
 * Order the results alphabetically.
 *
 * NOTE:
 * Recall that the following query lists the categories for the movie AMERICAN CIRCUS:
 * ```
 * SELECT name
 * FROM category
 * JOIN film_category USING (category_id)
 * JOIN film USING (film_id)
 * WHERE title = 'AMERICAN CIRCUS';
 * ```
 * This problem should be solved by a self join on the "film_category" table.
 */
SELECT
    f1.title
FROM
    category c1
JOIN
    film_category fc ON c1.category_id = fc.category_id
JOIN
    film f1 ON fc.film_id = f1.film_id
WHERE
    c1.name IN (
        SELECT
            name
        FROM
            category
        JOIN
            film_category USING (category_id)
        JOIN
            film USING (film_id)
        WHERE
            title = 'AMERICAN CIRCUS'
    )
GROUP BY
    f1.title
HAVING
    COUNT(f1.title) >= 2
    AND f1.title NOT IN ('ACADEMY DINOSAUR', 'AGENT TRUMAN')
ORDER BY
    f1.title;

