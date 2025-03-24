-- Table: Transactions

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- The table has information about incoming transactions.
-- The state column is an enum of type ["approved", "declined"].
 

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Transactions table:
-- +------+---------+----------+--------+------------+
-- | id   | country | state    | amount | trans_date |
-- +------+---------+----------+--------+------------+
-- | 121  | US      | approved | 1000   | 2018-12-18 |
-- | 122  | US      | declined | 2000   | 2018-12-19 |
-- | 123  | US      | approved | 2000   | 2019-01-01 |
-- | 124  | DE      | approved | 2000   | 2019-01-07 |
-- +------+---------+----------+--------+------------+
-- Output: 
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
-- | 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
-- | 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
CREATE TABLE Transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique transaction ID
    trans_date DATE NOT NULL,           -- Date of transaction
    country VARCHAR(50) NOT NULL,       -- Country of the transaction
    state ENUM('approved', 'declined', 'pending') NOT NULL,  -- Transaction state
    amount DECIMAL(10,2) NOT NULL       -- Transaction amount
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

SELECT 
    -- Extracts the transaction month in 'YYYY-MM' format for grouping
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    country, 
    COUNT(*) AS trans_count, 
    -- Counts only the transactions where state is 'approved'
    SUM(state = "approved") AS approved_count, 
    -- Sums up the total transaction amount in each (month, country) group
    SUM(amount) AS trans_total_amount, 

    -- Sums the transaction amounts where state is 'approved'
    -- COALESCE ensures it returns 0 if there are no approved transactions
    COALESCE(
        SUM(CASE WHEN state = "approved" THEN amount END), 
        0
    ) AS approved_total_amount 

FROM Transactions GROUP BY month, country;


