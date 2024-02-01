# 365-careers-MySQL-course-Project
This project was from Udemy Course - _SQL - MySQL for Data Analytics and Business Intelligence_ 

## Tasks/ problems
1. Provides a breakdown between the male and female employees working in the company each year, starting from 1990.

2. Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990

3. Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.

4. Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure. Finally, visualize the obtained result-set in Tableau as a double bar chart.

## Database schema
<kbd><img width="647" alt="employees_mod schema" src="https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/2216ddb4-67d2-47ea-814e-90038907ee5c">


#### 1. Breakdown between the male and female employees working in the company each year, starting from 1990

#### Steps:
```sql
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
```

#### Findings:

_From year 1990 to 2002, the ratio of female to male employees are consistent of 2:3._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/10aa4914-a59f-4218-89b4-03b6a107573a)




#### 2. Comparison on the number of male managers to the number of female managers from different departments for each year, starting from 1990 

#### Steps:
```sql
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
```

#### Findings:

_a. From the overall Area chart below we can see blue shaded area is more than orange shaded area. This means that total male managers are more than female managers._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/3a3533bb-9f04-49b9-962f-8064ddf07081)


_b. Area chart below only filter in the Finance department. From the  chart below, we can conclude that in 1995, there are 5 male managers and 4 female managers which sum of 9 managers in Finance department._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/40c0ac9f-ccc5-495d-8e29-94e371da6881)


#### 3. Comparison on the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department 

#### Steps:
```sql
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
```



#### Findings:

_a. From the line graph below, we can conclude the average salary of male employees are more than female employees. The difference might be affected by the fact that the number of male managers is more than female managers._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/5f147e5b-b2e4-4b72-9eaa-55fb70ea12c9)


_b. Bar chart below only filter in the Finance department. From the chart below, we found that average salary both male and female employees in Finance department is 60k._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/9e8f2d76-9165-403d-af6f-b125dda8b56f)


    
#### 4. SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure. Finally, visualize the obtained result-set in Tableau as a double bar chart

#### Steps:
```sql
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
```

#### Finding:

_The double bar chart below is the average salary of employees with salary range between 50k and 90k. From the chart below, we can see that there is no significant difference on the average salary of male and female employees with selected salary range._

<kbd>![image](https://github.com/Sakinahcr/365-careers-MySQL-course-Project/assets/132161850/9ee17b3e-b85c-442f-b32a-39496f9bce2c)




**Note**: The live dashboard for this project can be found **[here]([url](https://public.tableau.com/app/profile/fatimah.sakinah/viz/Employeeanalysis_17066592726380/Dashboard1?publish=yes))**.
    

