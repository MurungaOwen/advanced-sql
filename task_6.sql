-- Euclidean Distance Calculation Query
-- ====================================

-- Problem Description:
-- We are given a table named `STATION` that contains geographical data points on a 2D plane.
-- The task is to calculate the Euclidean Distance between two specific points and format the result to display 4 decimal digits.

-- Points Description:
-- 1. Point A:
--    - x1: Minimum value of Northern Latitude (LAT_N)
--    - y1: Minimum value of Western Longitude (LONG_W)
-- 2. Point B:
--    - x2: Maximum value of Northern Latitude (LAT_N)
--    - y2: Maximum value of Western Longitude (LONG_W)

-- Euclidean Distance Formula:
-- The Euclidean Distance between two points (x1, y1) and (x2, y2) is calculated as:
-- Euclidean Distance = SQRT((x2 - x1)^2 + (y2 - y1)^2)

-- Query Steps:
-- 1. Find the Minimum and Maximum Values of LAT_N and LONG_W
--    - x1: MIN(LAT_N)
--    - y1: MIN(LONG_W)
--    - x2: MAX(LAT_N)
--    - y2: MAX(LONG_W)
-- 2. Calculate the Euclidean Distance using the formula.
-- 3. Format the result to display 4 decimal digits
WITH data as (
    SELECT MAX(LAT_N) - MIN(LAT_N) as Y, MAX(LONG_W) - MIN(LONG_W) AS X FROM STATION
)
SELECT ROUND(
    SQRT(POWER(data.X, 2) + POWER(data.Y, 2)), 4
) FROM data;
