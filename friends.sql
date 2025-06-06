-- Table: RequestAccepted

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | requester_id   | int     |
-- | accepter_id    | int     |
-- | accept_date    | date    |
-- +----------------+---------+
-- (requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
-- This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

-- Write a solution to find the people who have the most friends and the most friends number.

-- The test cases are generated so that only one person has the most friends.

-- The result format is in the following example.

 

-- Example 1:

-- Input: 
-- RequestAccepted table:
-- +--------------+-------------+-------------+
-- | requester_id | accepter_id | accept_date |
-- +--------------+-------------+-------------+
-- | 1            | 2           | 2016/06/03  |
-- | 1            | 3           | 2016/06/08  |
-- | 2            | 3           | 2016/06/08  |
-- | 3            | 4           | 2016/06/09  |
-- +--------------+-------------+-------------+
-- Output: 
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 3  | 3   |
-- +----+-----+
-- Explanation: 
-- The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
CREATE TABLE RequestAccepted (
    requester_id INT NOT NULL,
    accepter_id INT NOT NULL,
    accept_date DATE NOT NULL,
    PRIMARY KEY (requester_id, accepter_id)
);

--solution WITH total_requests AS (
    SELECT requester_id AS user, COUNT(*) AS total_requests
    FROM RequestAccepted
    GROUP BY requester_id
), 
total_acceptance AS (
    SELECT accepter_id AS user, COUNT(*) AS total_accepted
    FROM RequestAccepted
    GROUP BY accepter_id
), 
combined AS (
    SELECT user, total_requests, 0 AS total_accepted
    FROM total_requests
    UNION ALL
    SELECT user, 0 AS total_requests, total_accepted
    FROM total_acceptance
),
user_totals AS (
    SELECT 
        user AS id,
        SUM(total_requests) + SUM(total_accepted) AS num
    FROM combined
    GROUP BY user
)

SELECT id, num
FROM user_totals
ORDER BY num DESC
LIMIT 1;

