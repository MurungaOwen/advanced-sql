-- Table: Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
 

-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- The column 'name' has unique values.
-- Table: MovieRating

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 

-- Movies table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- MovieRating table
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    created_at DATE NOT NULL,
    PRIMARY KEY (movie_id, user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

WITH movie_rated_high AS(
    SELECT M.movie_id, title, AVG(rating) AS average FROM MovieRating MR 
    LEFT JOIN Movies M ON M.movie_id = MR.movie_id  
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY movie_id 
    ORDER  BY  AVG(rating) DESC, title LIMIT 1
), high_rating_user AS (
    SELECT U.name AS name, COUNT(*) AS total
    FROM MovieRating M 
    LEFT JOIN Users U 
    ON U.user_id = M.user_id 
    GROUP BY U.user_id ORDER BY COUNT(*) DESC, name ASC LIMIT 1
)

SELECT name AS 'results' FROM high_rating_user
UNION ALL
SELECT title AS 'results' FROM movie_rated_high;
