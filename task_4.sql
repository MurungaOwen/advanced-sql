/*
Description: This script calculates the maximum earnings (salary * months) for employees in the Employee table
             and counts how many employees have earnings equal to the maximum.
Author: Hood
*/

/*
Table: Employee
Description: Contains employee data, including the number of months worked and their monthly salary.
Columns:
  - employee_id: Unique identifier for each employee.
  - name: Name of the employee.
  - months: Number of months worked.
  - salary: Monthly salary of the employee.
*/

SELECT MAX(salary* months) AS max_earnings, 
(
    SELECT COUNT(*) FROM Employee WHERE salary * months = (SELECT MAX(salary* months) FROM Employee)
) AS total_employees
FROM Employee
