-- drop database employees;
use employees;

SELECT * FROM dept_emp;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT * 
FROM dept_emp
RIGHT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date = "9999-01-01"
ORDER BY dept_emp.dept_no;

SELECT  departments.dept_name as abteilung, dept_emp.emp_no as anzahl_mitarbeiter FROM dept_emp RIGHT JOIN departments ON dept_emp.dept_no = departments.dept_no WHERE dept_emp.to_date = "9999-01-01" ORDER BY dept_emp.dept_no;

SELECT emp_no, SUM(salary) FROM salaries GROUP BY emp_no;
SELECT * FROM salaries 
LEFT JOIN employees
ON salaries.emp_no = employees.emp_no;

SELECT employees.emp_no, sum(salaries.salary), employees.gender FROM salaries LEFT JOIN employees ON salaries.emp_no = employees.emp_no GROUP BY employees.emp_no;

SELECT sum(salary) as salaries, d.dept_name as abteilung FROM salaries s INNER JOIN dept_emp de ON s.emp_no = de.emp_no INNER JOIN departments d ON de.dept_no = d.dept_no GROUP BY de.emp_no ORDER BY d.dept_no;

SELECT salary, from_date FROM salaries WHERE emp_no = 492917 ORDER BY from_date DESC;

SELECT avg(salary) as average_salary, YEAR(from_date) as year FROM salaries group by YEAR(from_date) order by YEAR(from_date);

SELECT (year(now())-year(e.birth_date)) as age, avg(s.salary) FROM employees e INNER JOIN salaries s ON e.emp_no = s.emp_no GROUP BY age ORDER BY age;