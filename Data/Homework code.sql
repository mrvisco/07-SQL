--QRY001

Create view QRY001_emp_details as
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary
FROM Employees 
LEFT JOIN Salaries ON Employees.emp_no = Salaries.emp_no;

--QRY002

Create view QRY002_hired_1986 as
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.hire_date
FROM Employees
WHERE Employees.hire_date Like '1986%';

--QRY003

Create view QRY003_dept_mgr_list as
SELECT Departments.dept_no, Departments.dept_name, Dept_manager.emp_no, Employees.last_name, Employees.first_name, Employees.hire_date, Dept_manager.from_date, Dept_manager.to_date
FROM Departments 
INNER JOIN Dept_manager ON Departments.dept_no = Dept_manager.dept_no 
INNER JOIN Employees ON Dept_manager.emp_no = Employees.emp_no
WHERE Dept_manager.to_date not Like '9999%'

--QRY004

create view QRY004_Emp_by_dept as
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
LEFT JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
LEFT JOIN Departments ON Dept_emp.dept_no = Departments.dept_no;

--QRY005

create view QRY005 - emp_Hercules_B as
SELECT Employees.first_name, Employees.last_name
FROM Employees
WHERE Employees.first_name = 'Hercules' 
and Employees.last_name like 'B%';

--QRY006

create view QRY006_emp_sales_dept as
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
INNER JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Dept_emp.dept_no = 'd007';

--QRY007

create  view QRY007_emp_sales_dev as
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
INNER JOIN Dept_emp ON Employees.emp_no = Dept_emp.emp_no
INNER JOIN Departments ON Dept_emp.dept_no = Departments.dept_no
WHERE Dept_emp.dept_no = 'd005'
or Dept_emp.dept_no = 'd007'
ORDER BY Dept_emp.dept_no;

--QRY008

create  view QRY008_lastname_count_desc as
SELECT Employees.last_name, Count(Employees.first_name) AS CountOffirst_name
FROM Employees
GROUP BY Employees.last_name
ORDER BY Count(Employees.first_name) DESC;

--QRY009 – Bonus

create  view QRY009_bonus as
SELECT Titles.title, ROUND(AVG(Salaries.salary)) AS "AVG Salary"
FROM Titles
INNER JOIN Salaries ON Titles.emp_no = Salaries.emp_no
GROUP BY Titles.title
ORDER BY "AVG Salary" DESC;
