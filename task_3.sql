/*
File: calculate_salary_error.sql
Description: This script calculates the difference between the actual average salary and the miscalculated average salary
             (where all zeros are removed from salary values) for employees in the EMPLOYEES table. The result is rounded
             up to the next integer.
Author: Hood
*/

/*
Table: EMPLOYEES
Description: Contains employee data, including their monthly salaries.
Columns:
  - ID: Unique identifier for each employee.
  - Name: Name of the employee.
  - Salary: Monthly salary of the employee (in numeric format).
*/

/*
Problem Statement:
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table.
However, her keyboard's '0' key was broken, and she accidentally removed all zeros from the salary values
before calculating the average. This script helps find the difference between her miscalculation and the
actual average salary, rounded up to the next integer.
*/

/*
Steps:
1. Calculate the actual average salary of all employees.
2. Calculate the miscalculated average salary by removing all zeros from the salary values.
3. Find the difference between the actual average and the miscalculated average.
4. Round the difference up to the next integer.
*/

-- Query to calculate the error in Samantha's calculation
SELECT
    CEIL(
        AVG(Salary) - AVG( 
            CAST(REPLACE(CAST( Salary AS CHAR), '0', '') AS UNSIGNED)
        )
    )
FROM EMPLOYEES;
