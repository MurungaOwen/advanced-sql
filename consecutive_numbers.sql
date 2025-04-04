-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column starting from 1.
 

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.
CREATE TABLE Logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num VARCHAR(255) NOT NULL
);

INSERT INTO Logs (num) VALUES 
('1'),
('1'),
('1'),
('2'),
('1'),
('2'),
('2');

WITH ordered AS(
    SELECT 
        id,
        num,
        LEAD(id, 1) OVER(PARTITION BY num ORDER BY id) AS next_id,
        LEAD(id, 2) OVER(PARTITION BY num ORDER BY id) AS two_steps_id
    FROM Logs
)
SELECT 
    DISTINCT num AS ConsecutiveNums
FROM ordered WHERE next_id = id + 1 AND two_steps_id = id + 2;
