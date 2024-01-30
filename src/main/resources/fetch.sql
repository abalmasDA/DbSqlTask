-- select operations:
SELECT `title`
FROM `movies`; -- find the title of each film

SELECT `director`
FROM `movies`; -- find the director of each film

SELECT `title`, `director`
FROM `movies`; -- find the title and director of each film

SELECT `title`, `year`
FROM `movies`; -- find the title and year of each film

SELECT *
FROM `movies`;
-- find all the information about each film


-- condition operation:
SELECT * -- find the movies released in the years between 2000 and 2019
FROM `movies`
WHERE `year` BETWEEN 2000 AND 2019;

SELECT *
FROM `movies` -- find the movies not released in the years between 2000 and 2019
WHERE `year` < 2000
   OR `year` > 2019;

SELECT `title`, `year` -- find the movies and their year released in years (1990, 2010, 2019)
FROM `movies`
WHERE `year` IN (1990, 2010, 2019);

SELECT *
FROM `movies` -- find the movies with title starting with either "M", "I", or "P":
WHERE `title` LIKE 'M%'
   OR `title` LIKE 'I%'
   OR `title` LIKE 'P%';


-- filtering and sorting:
SELECT DISTINCT `director` -- list all directors ordered (alphabetically) without duplicates for movies after 2005
FROM `movies`
WHERE `year` > 2005
ORDER BY `director` ASC;


-- JOINs:
SELECT m.`title`, -- find title, domestic_sale, international_sales for each movie
       b.`domestic_sale`,
       b.`international_sale`
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`;

SELECT m.`title`, -- find title, director, rating of each movie where international_sales > domestic_sales
       m.`director`,
       b.`rating`
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`
WHERE b.`international_sale` > b.`domestic_sale`;

SELECT m.`title`, b.`rating` -- list all the movies by their ratings in descending order
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`
ORDER BY b.`rating` DESC;

SELECT m.`title`,
       (b.`domestic_sale` + b.`international_sale`) AS `combined_sales` -- list all movies titles and their combined sales
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`;

SELECT m.`title`, m.`year` -- list all movies that were released on even number years
FROM `movies` m
WHERE `year` % 2 = 0;

SELECT m.`director`, -- find director, the number of movies and average rating each director has directed
       COUNT(m.`id`)   AS `number_of_movies`,
       AVG(b.`rating`) AS `average_rating`
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`
GROUP BY m.`director`;

SELECT m.`director`,
       SUM(b.`domestic_sale`)      AS `total_domestic_sales`, -- find director, the total domestic and international sales made by each director
       SUM(b.`international_sale`) AS `total_international_sales`
FROM `movies` m
         JOIN `boxoffice` b ON m.`id` = b.`movie_id`
GROUP BY m.`director`;