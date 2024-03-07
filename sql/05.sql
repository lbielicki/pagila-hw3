/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
i */

select f2.title
from film f1
join film_actor fa1 on (f1.film_id = fa1.film_id)
join film_actor fa2 on (fa1.actor_id = fa2.actor_id)
join film f2 on (f2.film_id = fa2.film_id)
where f1.title = 'AMERICAN CIRCUS'
order by f2.title;

