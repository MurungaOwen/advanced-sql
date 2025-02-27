-- Manhattan Distance Calculation Query
-- ====================================

-- Problem Description:
-- We are given a table named `STATION` that contains geographical data points on a 2D plane.
-- The task is to calculate the Manhattan Distance between two specific points and round the result to a scale of 4 decimal places.

-- Points Description:
-- 1. Point A:
--    - x1: Minimum value of Northern Latitude (LAT_N)
--    - y1: Minimum value of Western Longitude (LONG_W)
-- 2. Point B:
--    - x2: Maximum value of Northern Latitude (LAT_N)
--    - y2: Maximum value of Western Longitude (LONG_W)

-- Manhattan Distance Formula:
-- The Manhattan Distance between two points (x1, y1) and (x2, y2) is calculated as:
-- Manhattan Distance = |x1 - x2| + |y1 - y2|

-- Query Steps:
-- 1. Find the Minimum and Maximum Values of LAT_N and LONG_W
--    - x1: MIN(LAT_N)
--    - y1: MIN(LONG_W)
--    - x2: MAX(LAT_N)
--    - y2: MAX(LONG_W)
-- 2. Calculate the Manhattan Distance using the formula.
-- 3. Round the result to 4 decimal places.
SELECT ROUND(MAX(LAT_N) - MIN(LAT_N), 4) + ROUND(MAX(LONG_W) - MIN(LONG_W), 4) FROM STATION;
