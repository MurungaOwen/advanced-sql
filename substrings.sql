-- Step 1: Create the Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Step 2: Insert sample data
INSERT INTO Users (user_id, name)
VALUES 
    (1, 'aLice'),
    (2, 'bOB');
