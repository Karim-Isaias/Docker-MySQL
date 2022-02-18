SELECT * FROM film;
UPDATE film SET release_year = 2006 WHERE film_id = 5;
UPDATE film SET release_year = 2006 WHERE film_id = 6;

-- -------------------------------------------------------------------------------------------------

SELECT a.first_name AS Actor, f.title AS Film
FROM film_actor AS fa
INNER JOIN film AS f
ON fa.film_id = f.film_id
INNER JOIN actor AS a
ON fa.actor_id = a.actor_id
ORDER BY a.first_name ASC;

-- --------------------------------------------------------------------------------------------------

SELECT a.first_name AS Actor_FName, a.last_name AS Actor_LName, COUNT(fa.film_id) AS Films
FROM film_actor AS fa
INNER JOIN actor AS a
ON fa.actor_id = a.actor_id
GROUP BY fa.actor_id
ORDER BY a.first_name ASC;

-- --------------------------------------------------------------------------------------------------

UPDATE film SET language_id = 2 WHERE film_id = 2;
UPDATE film SET language_id = 3 WHERE film_id = 3;
UPDATE film SET language_id = 4 WHERE film_id = 4;
UPDATE film SET language_id = 5 WHERE film_id = 5;
UPDATE film SET language_id = 6 WHERE film_id = 6;
UPDATE film SET language_id = 2 WHERE film_id = 8;
UPDATE film SET language_id = 2 WHERE film_id = 9;
UPDATE film SET language_id = 2 WHERE film_id = 10;
UPDATE film SET language_id = 4 WHERE film_id = 11;
UPDATE film SET language_id = 6 WHERE film_id = 12;
UPDATE film SET language_id = 4 WHERE film_id = 13;


SELECT l.name AS Language, COUNT(f.title) AS Movies
FROM film AS f
INNER JOIN language AS l
ON f.language_id = l.language_id
GROUP BY f.language_id
ORDER BY l.language_id ASC;

-- --------------------------------------------------------------------------------------------------

SELECT * FROM film;

SELECT AVG(replacement_cost) AS Average_Replacement_Cost FROM film;

-- --------------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE update_film(IN id int, IN language int)
BEGIN
UPDATE film
SET language_id = language WHERE film_id = id;
END //

DELIMITER ;

CALL update_film(1, 5);
