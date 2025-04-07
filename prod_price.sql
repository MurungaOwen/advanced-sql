-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
WITH data AS(
    SELECT
        product_id,
        COALESCE(
            MAX(CASE WHEN change_date <= '2019-08-16' THEN change_date END)
        , 0) AS our_date
    FROM Products 
    GROUP BY product_id
)

SELECT
    product_id,
    CASE
        WHEN our_date = 0 THEN 10
        ELSE (
            SELECT new_price FROM Products WHERE product_id = d.product_id AND change_date = our_date
        )
    END AS price
FROM data d;
