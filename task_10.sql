-- Drop the table if it exists to avoid errors when re-running
DROP TABLE IF EXISTS Weather;

-- Create the Weather table
CREATE TABLE Weather (
    id INT PRIMARY KEY AUTO_INCREMENT,
    recordDate DATE NOT NULL,
    temperature INT NOT NULL
);

-- Insert sample data
INSERT INTO Weather (recordDate, temperature) VALUES
('2025-03-10', 25),
('2025-03-11', 28),
('2025-03-12', 22),
('2025-03-13', 30),
('2025-03-14', 29);

-- Find records where the temperature is higher than the previous day
WITH data AS (
    SELECT id AS Id, recordDate, temperature, 
           DATE_SUB(CAST(recordDate AS DATE), INTERVAL 1 DAY) AS prev_dates 
    FROM Weather
)
SELECT id 
FROM data AS d 
WHERE temperature > (SELECT temperature FROM data WHERE recordDate = d.prev_dates);
