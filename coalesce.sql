-- Imagine we have two tables: Students and Subjects.
-- We want to find out how many exams each student attended for each subject.

-- Step 1: Create the Students table 
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

-- Insert some sample students 
INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(6, 'Alex'),
(13, 'John');

-- Step 2: Create the Subjects table
CREATE TABLE Subjects (
    subject_name VARCHAR(100) PRIMARY KEY
);

-- Insert some sample subjects
INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

-- Step 3: Create the Examinations table
CREATE TABLE Examinations (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
);

-- Insert some sample exam records
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'), (1, 'Math'), (1, 'Math'),  -- Alice took Math 3 times
(1, 'Physics'), (1, 'Physics'),         -- Alice took Physics 2 times
(1, 'Programming'),                     -- Alice took Programming 1 time
(2, 'Math'),                            -- Bob took Math 1 time
(2, 'Programming'),                     -- Bob took Programming 1 time
(13, 'Math'),                           -- John took Math 1 time
(13, 'Physics'),                        -- John took Physics 1 time
(13, 'Programming');                     -- John took Programming 1 time

-- Step 4: Select the student ID, name, and subject name
-- Step 5: Use a subquery to count how many exams they attended
-- Step 6: Use COALESCE to show 0 if they didn't attend any exams
-- Step 7: CROSS JOIN makes sure every student gets every subject

SELECT 
    S.student_id,  -- The ID of the student 
    S.student_name,  -- The name of the student 
    Sub.subject_name,  -- The subject name
    COALESCE((SELECT COUNT(*) FROM Examinations E  -- Count how many times the student took this subject's exam
              WHERE E.student_id = S.student_id  -- Match the student ID
              AND E.subject_name = Sub.subject_name), 0) AS attended_exams  -- If no exams, show 0
FROM Students S
CROSS JOIN Subjects Sub  -- Make sure every student is paired with every subject 
ORDER BY S.student_id, Sub.subject_name;  -- Order nicely by student and subject

-- This will give us a table showing every student, every subject, and how many exams they attended!
