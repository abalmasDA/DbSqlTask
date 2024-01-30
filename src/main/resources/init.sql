CREATE DATABASE `moviesdb`;

USE moviesdb;

CREATE TABLE IF NOT EXISTS `movies`
(
    `id`         INT AUTO_INCREMENT NOT NULL,
    `title`      VARCHAR(225)       NOT NULL,
    `director`   VARCHAR(225)       NOT NULL,
    `year`       INT                NOT NULL,
    `length_min` INT                NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `boxoffice`
(
    `id`                 INT AUTO_INCREMENT NOT NULL,
    `movie_id`           INT                NOT NULL,
    `rating`             DOUBLE             NOT NULL,
    `domestic_sale`      BIGINT             NOT NULL,
    `international_sale` BIGINT             NOT NULL,
    PRIMARY KEY (`id`)
);

ALTER TABLE `boxoffice`
    ADD CONSTRAINT `fk_boxoffice_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

INSERT INTO movies (`title`, `director`, `year`, `length_min`)
VALUES ('The Green Mile', 'Frank Darabont', 1999, 189),
       ('Interstellar', 'Christopher Nolan', 2014, 169),
       ('Misery', 'Rob Reiner', 1990, 107),
       ('Joker', 'Todd Phillips', 2019, 122),
       ('The Matrix', 'Lana Wachowski', 1999, 136),
       ('Oppenheimer', 'Christopher Nolan', 2023, 192),
       ('Jupiter Ascending', 'Lana Wachowski', 2015, 125);

INSERT INTO Boxoffice (movie_id, rating, domestic_sale, international_sale)
VALUES (1, 8.6, 136801374, 286801374),
       (2, 9.5, 158742698, 257869855),
       (3, 7.8, 61000000, 161000000),
       (4, 8.5, 335451311, 738800000),
       (5, 8.7, 171474589, 427300000),
       (6, 9.0, 25789654, 52478952),
       (7, 7.1, 5825478, 45782147);