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

-- Step 3: Query to fix names (First letter uppercase, rest lowercase)
-- What does substring do?
--     heres the working SUBSTRING(word, start, end)
--     works like array slicing
--     UPPER -> converts to uppercase
--     LOWER -> converts to lowercase
    
SELECT 
    user_id,
    CONCAT(
        UPPER(SUBSTRING(name, 1, 1)), 
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;
