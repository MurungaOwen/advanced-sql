-- creating a users table that has enum for city
CREATE TABLE IF NOT EXISTS users(
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    city ENUM("US", "CO", "IN") NOT NULL DEFAULT 'US'
);