CREATE TABLE Activity (
    player_id INT NOT NULL,
    device_id INT NOT NULL,
    event_date DATE NOT NULL,
    games_played INT NOT NULL,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 10, '2024-03-01', 5),
(1, 10, '2024-03-02', 3),
(2, 11, '2024-03-01', 2),
(3, 12, '2024-03-05', 4),
(3, 12, '2024-03-06', 1);

SELECT 
    ROUND(
        COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2
    ) AS fraction
FROM Activity A
WHERE event_date = (
    SELECT DATE_ADD(MIN(event_date), INTERVAL 1 DAY) 
    FROM Activity 
    WHERE player_id = A.player_id
);

-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
-- rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least 
-- two consecutive days starting from their first login date, then divide that number by the total number of players.
