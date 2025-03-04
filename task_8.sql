-- practising aggregation of data from multiple tables, using joins
-- REQUIREMENTS DOCUMENTATION
-- This query is designed to retrieve company information along with the count of different types of employees.
-- The requirements for this query include:
-- 1. Finding the total number of Lead Managers, Senior Managers, Managers, and Employees for each company.
-- 2. Ensuring that all companies appear in the result, even if they have no employees in one or more categories.
-- 3. Aggregating employee counts using DISTINCT to avoid duplicate counting.
-- 4. Grouping results by company_code and founder to ensure each company appears only once.
-- 5. Sorting the results in ascending order by company_code.
SELECT 
    c.company_code, c.founder,
    COUNT(DISTINCT l.lead_manager_code) as total_lead_managers,
    COUNT(DISTINCT s.senior_manager_code) as total_senior_managers,
    COUNT(DISTINCT m.manager_code) as total_managers,
    COUNT(DISTINCT e.employee_code) as total_employees
FROM company c
LEFT JOIN Lead_Manager l ON l.company_code = c.company_code
LEFT JOIN Senior_Manager s ON s.company_code = c.company_code
LEFT JOIN Manager m ON m.company_code = c.company_code
LEFT JOIN Employee e ON e.company_code = c.company_code
GROUP BY c.company_code, c.founder ORDER BY c.company_code
