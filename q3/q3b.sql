SELECT movie.title FROM movie
WHERE movie.id NOT IN
    (SELECT movie.id
    FROM checkout_item
    INNER JOIN movie ON movie.id = checkout_item.movie_id);
