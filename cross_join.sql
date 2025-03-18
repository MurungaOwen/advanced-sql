-- Cross join finds cartesian product of the two table 
--- imagine we have 2 tables Student table and course table and each student takes all the subject we find cartesian product (CROSS JOIN)
-- If TableA has 3 rows and TableB has 4 rows, the result will have 3 × 4 = 12 rows.

-- Creating Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Creating Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

INSERT INTO Courses (course_id, course_name) VALUES
(1, 'Math'),
(2, 'Physics');

-- Using CROSS JOIN to generate all possible student-course combinations
SELECT 
    S.student_id, 
    S.student_name, 
    C.course_name
FROM Students S
CROSS JOIN Courses C;

-- Expected Output:
-- student_id | student_name | course_name
-- --------------------------------------
-- 1         | Alice       | Math
-- 1         | Alice       | Physics
-- 2         | Bob         | Math
-- 2         | Bob         | Physics
