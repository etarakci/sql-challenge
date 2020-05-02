--1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.
-- DB: employees & salaries
-- CREATE VIEW emp_sal AS
SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary
	FROM employees as e
	LEFT JOIN salaries as s ON e.emp_no=s.emp_no;
	
--2. List employees who were hired in 1986.
SELECT * FROM employees 
	WHERE hire_date > '1985-12-31' AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
	FROM dept_manager AS dm
	LEFT JOIN employees AS e ON dm.emp_no = e.emp_no
	LEFT JOIN departments AS d ON dm.dept_no = d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM dept_emp AS de
	LEFT JOIN employees AS e ON e.emp_no = de.emp_no
	LEFT JOIN departments AS d ON de.dept_no = d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
	WHERE first_name = 'Hercules' AND 
	last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departments AS d
	LEFT JOIN dept_emp AS de ON d.dept_no = de.dept_no
	LEFT JOIN employees AS e ON de.emp_no = e.emp_no
	WHERE d.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departments AS d
	LEFT JOIN dept_emp AS de ON d.dept_no = de.dept_no
	LEFT JOIN employees AS e ON de.emp_no = e.emp_no
	WHERE d.dept_name='Sales' OR d.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name,
	COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC;




