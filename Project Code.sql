#problem 1 - provides a breakdown between the male and female employees working in the company each year, starting from 1990. 

SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS number_of_employee
FROM
    t_employees e
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY calendar_year, e.gender
HAVING calendar_year >= 1990;

#problem 2 - Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.

SELECT 
    d.dept_name,
    e.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    ee.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >=ee.calendar_year AND YEAR(dm.from_date) <= ee.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) ee
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON d.dept_no = dm.dept_no
        JOIN
    t_employees e ON e.emp_no = dm.emp_no
WHERE
    dm.from_date > '1990-01-01'
ORDER BY dm.emp_no, calendar_year;

# problem 3 - Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.

SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY calendar_year;


#problem 4- Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure. Finally, visualize the obtained result-set in Tableau as a double bar chart.

DROP procedure IF exists filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN 
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS average_salary
FROM
    t_employees e
        JOIN
    t_salaries s ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON de.dept_no = d.dept_no
WHERE
    s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY e.gender , d.dept_name;
END $$

DELIMITER ;


CALL filter_salary(50000, 90000);














