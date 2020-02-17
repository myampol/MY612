-- Data612 -- Project 1 -- Movie Ratings - SQL portion

-- Michael Y.

-- February 17, 2020
 
-- Assignment:

-- Part 1: Create the DDL for the schema

CREATE SCHEMA IF NOT EXISTS Proj1_Movies ;

USE Proj1_Movies;

DROP TABLE IF EXISTS Movies;
CREATE TABLE IF NOT EXISTS Movies 
(
    Movie_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Movie_title VARCHAR(255) NOT NULL UNIQUE KEY               -- prevent duplicate movie titles
);

DROP TABLE IF EXISTS Friends;
CREATE TABLE IF NOT EXISTS Friends 
(
    Friend_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Friend_name VARCHAR(255) NOT NULL UNIQUE KEY               -- prevent duplicate friend names
);

DROP TABLE IF EXISTS Ratings;
CREATE TABLE IF NOT EXISTS Ratings 
(
    Movie_id INT NOT NULL,
    Friend_id INT NOT NULL,
    Rating INT,   -- DO allow this to be null, because a friend might have not rated one or more films
    PRIMARY KEY (Movie_id, Friend_id)
);


-- Part 2: Insert the data into the tables

TRUNCATE TABLE Movies;
INSERT INTO Movies  (Movie_title)
VALUES
("Crazy Rich Asians"),
("Disney's Christopher Robin"),
("Mamma Mia! Here We Go Again"),
("Ocean's 8"),
("Peter Rabbit"),
("Solo: A Star Wars Story")
;

SELECT * FROM Movies;

TRUNCATE TABLE Friends;
INSERT INTO Friends  (Friend_name)
VALUES
("Alice"),
("Bob"),
("Carol"),
("Dave"),
("Eddie")
;

SELECT * FROM Friends;

TRUNCATE TABLE Ratings;
INSERT INTO Ratings (Movie_ID, Friend_ID, Rating)
VALUES
(1,1,5), -- Crazy Rich Asians, Alice
(1,2,NULL), -- Crazy Rich Asians, Bob
(1,3,4), -- Crazy Rich Asians, Carol
(1,4,NULL), -- Crazy Rich Asians, Dave
(1,5,4), -- Crazy Rich Asians, Eddie
(2,1,4), -- Disney's Christopher Robin, Alice
(2,2,3), -- Disney's Christopher Robin, Bob
(2,3,5), -- Disney's Christopher Robin, Carol
(2,4,3), -- Disney's Christopher Robin, Dave
(2,5,4), -- Disney's Christopher Robin, Eddie
(3,1,4), -- Mamma Mia! Here We Go Again, Alice
(3,2,2), -- Mamma Mia! Here We Go Again, Bob
(3,3,NULL), -- Mamma Mia! Here We Go Again, Carol
(3,4,NULL), -- Mamma Mia! Here We Go Again, Dave
(3,5,3), -- Mamma Mia! Here We Go Again, Eddie            -- I replaced a rating with "NULL" to see what happens in R
(4,1,2), -- Ocean's 8, Alice
(4,2,2), -- Ocean's 8, Bob
(4,3,3), -- Ocean's 8, Carol
(4,4,1), -- Ocean's 8, Dave
(4,5,2), -- Ocean's 8, Eddie
(5,1,4), -- Peter Rabbit, Alice
(5,2,NULL), -- Peter Rabbit, Bob
(5,3,5), -- Peter Rabbit, Carol
(5,4,4), -- Peter Rabbit, Dave
(5,5,5), -- Peter Rabbit, Eddie
(6,1,4), -- Solo: A Star Wars Story, Alice
(6,2,2), -- Solo: A Star Wars Story, Bob
(6,3,5), -- Solo: A Star Wars Story, Carol
(6,4,4), -- Solo: A Star Wars Story, Dave
(6,5,4) -- Solo: A Star Wars Story, Eddie
;

Select * from Ratings;

-- Part 3: Formulate a join query that will retrieve the data in the desired format
-- (use this SQL statement to pull the data into R, once we can get the connection to work)

-- join using "Where" syntax
Select M.Movie_title, F.Friend_name, R.Rating
From Movies as M, Friends as F, Ratings as R
Where (M.Movie_id = R.Movie_ID AND F.Friend_id = R.Friend_ID);

-- join using "JOIN ON" syntax
select M.Movie_title, F.Friend_name, R.Rating 
from Ratings as R
join Movies as M on (M.Movie_ID = R.Movie_ID)
Join Friends as F on (F.Friend_ID = R.Friend_ID);
