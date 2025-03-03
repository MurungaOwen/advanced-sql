-- **********************************
-- SQL Script: Sum Population of Asian Cities
-- Description: Calculates the total population of all cities
--              where the continent is 'Asia'.
-- **********************************

-- CITY Table Structure (for reference)
-- ------------------------------------
-- | Column      | Type        | Description                      |
-- |------------|------------|----------------------------------|
-- | ID         | INT        | Unique identifier for each city  |
-- | Name       | VARCHAR(255)| Name of the city                |
-- | CountryCode| CHAR(3)    | Foreign key referencing COUNTRY.Code |
-- | Population | INT        | Population of the city          |

-- COUNTRY Table Structure (for reference)
-- ----------------------------------------
-- | Column     | Type         | Description                     |
-- |-----------|-------------|---------------------------------|
-- | Code      | CHAR(3)     | Unique country code (Primary Key) |
-- | Name      | VARCHAR(255)| Name of the country           |
-- | Continent | VARCHAR(255)| Continent the country belongs to |

-- Query: Calculate the total population of cities in Asian countries
SELECT SUM(CITY.POPULATION) FROM COUNTRY LEFT JOIN CITY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Asia';
