-- Documentation:
-- This query calculates the confirmation rate for each user who has signed up.
-- The confirmation rate is defined as the ratio of 'confirmed' actions to the total number of confirmations.
-- If a user has no confirmation records, the rate is set to 0.00.

-- Create table for Signups
CREATE TABLE Signups (
    user_id INT PRIMARY KEY,
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for Confirmations
CREATE TABLE Confirmations (
    id SERIAL PRIMARY KEY,
    user_id INT,
    action VARCHAR(50), -- e.g., 'confirmed', 'pending', 'failed'
    confirmation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Signups(user_id)
);

-- Insert sample data into Signups
INSERT INTO Signups (user_id, signup_date) VALUES
(1, '2024-03-01 10:00:00'),
(2, '2024-03-02 11:00:00'),
(3, '2024-03-03 12:00:00');

-- Insert sample data into Confirmations
INSERT INTO Confirmations (user_id, action, confirmation_date) VALUES
(1, 'confirmed', '2024-03-01 10:30:00'),
(1, 'confirmed', '2024-03-01 10:45:00'),
(2, 'pending', '2024-03-02 11:30:00'),
(2, 'confirmed', '2024-03-02 11:45:00'),
(3, 'failed', '2024-03-03 12:30:00');

-- Query to calculate confirmation rate
SELECT
    user_id,
    CASE
        WHEN (SELECT COUNT(*) FROM Confirmations WHERE user_id = S.user_id) = 0 THEN 0.00
        ELSE ROUND(
            (SELECT COUNT(*) FROM Confirmations WHERE user_id = S.user_id AND action = 'confirmed') / 
            (SELECT COUNT(*) FROM Confirmations WHERE user_id = S.user_id), 2)
    END AS confirmation_rate
FROM Signups S;
