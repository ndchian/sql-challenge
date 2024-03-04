--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
-- help with this code from https://stackoverflow.com/questions/14397569/filter-data-based-on-date-in-sql
SELECT first_name, last_name, hire_date
FROM employees e
WHERE (hire_date >= '1986-1-1' AND hire_date <= '1986-12-31');

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, dt.dept_name, d.emp_no, e.last_name, e.first_name
FROM dept_manager d
JOIN departments dt
ON d.dept_no = dt.dept_no
JOIN employees e
ON d.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE (last_name like 'B%') AND (first_name = 'Hercules');

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;