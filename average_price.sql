-- Create the Prices table
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price DECIMAL(10,2),
    PRIMARY KEY (product_id, start_date)
);

-- Insert sample data
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

-- Create the UnitsSold table
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- Insert sample data for UnitsSold
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 10),
(1, '2019-03-05', 5),
(2, '2019-02-10', 8),
(2, '2019-03-01', 6);

-- Query to calculate the average price of sold units per product
SELECT 
    P.product_id,
    COALESCE(
        ROUND(
            (SUM(U.units * (SELECT price FROM Prices WHERE product_id = P.product_id AND U.purchase_date BETWEEN start_date AND end_date))) 
            / SUM(U.units), 
        2), 
    0) AS average_price
FROM Prices P 
LEFT JOIN UnitsSold U ON P.product_id = U.product_id 
GROUP BY P.product_id;


-- PROBLEM:
-- Prices of products change over time, and we need to:
-- 1. Find the price of a product on a specific date.
-- 2. Calculate the average price of units sold for each product.

-- SOLUTION:
-- We create two tables:
-- - Prices: Stores product prices for specific time periods.
-- - UnitsSold: Tracks how many units were sold on which date.
-- Then, we use SQL queries to find prices and compute the average price of sold units.
--Average selling price = Total Price of Product / Number of products sold.

