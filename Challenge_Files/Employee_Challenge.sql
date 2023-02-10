-- Following SQL Module Example/PG Admin Documentation:

--DELIVERABLE ONE:

-- Use Dictinct with Orderby to remove duplicate rows
-- Retrieve emp_no, First_name and Last_name from the employees table 

SELECT emp_no, first_name, last_name
FROM employees; 

-- Retrieve title, from_date, to_date from the titles table 
SELECT title, from_date, to_date
FROM titles; 

-- Joined on the primary key, creating a new table -- retirement_titles
-- Table is exported as retirement_titles.csv
SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no) 
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no; 

-- Retrieve the employee number, first and last name and title columsn from the retirement titles table 
SELECT emp_no, first_name, last_name, title
FROM retirement_titles; 

-- Use DISTINCT_ON to get the first occurrence of the employee number for each set of rows, will use to continue to filter the date later on and then for the unique_titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, to_date
FROM retirement_titles; 

-- Filter the to_date, only keeping the date = to 9999-01-01
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, to_date
FROM retirement_titles; 
WHERE to_date = '9999-01-01'; 

-- Create a unique_titles table using INTO clause 
-- Table is exported as unique_titles.csv 
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles 
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC; 

-- Table is exported as retiring_titles.csv 
--Retrieve the # of employees by their most recent job title 
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC; 


--DELIVERABLE TWO: 
-- Retrieve the emp_no, first name, last_name and birth_date columns from the employee table -- will to start create the mentorship_eligibility table later on
SELECT emp_no, first_name, last_name, birth_date 
FROM employees; 

-- Retrieve the from_date, to_date columns from the dept_emp
SELECT emp_no, from_date, to_date
FROM dept_emp; 

-- Retrieve the title column from the titles table
select emp_no, title
FROM titles; 

-- Creating the Mentorship eligiblity table for current employees, specifically born between 1/1/65 and 12/31/65
-- Table is exported as mentorship_eligiblity.csv
-- Using DISTINCT on the statement 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, t.from_date, t.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND t.to_date = '9999-01-01'
ORDER BY e.emp_no;


-- DELIVERABLE THREE:  
-- Total amount of salary savings if all employees that are eligible, retire: 
SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date, s.salary
INTO retirement_salaries
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no)
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND ts.to_date = '9999-01-01'
ORDER BY e.emp_no; 

-- Average salaries by title 
SELECT title, AVG(salary)
FROM retirement_salaries
GROUP BY title; 

-- Total average salary
SELECT AVG(salary)
FROM retirement_salaries; 

-- Total # of employees that are above targeted retirement age range 
SELECT e.emp_no, e.first_name, e.last_name, ts.title, ts.from_date, ts.to_date
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as ts 
ON (e.emp_no = ts.emp_no) 
WHERE e.birth_date <'1952-01-01' 
ORDER BY e.emp_no; 

-- Employees who qualify for the expanded mentorship program
-- Determining Mentorship eligibility based on hiring date than birth date 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date,  t.from_date, t.to_date, t.title
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.hire_date BETWEEN '1985-01-01' AND '1995-12-31') AND (e.birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31') and t.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- Range of birth dates for potential retirement candidates
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date,  t.from_date, t.to_date, t.title
FROM employees as e
INNER JOIN titles as t
	ON  e.emp_no = t.emp_no
INNER JOIN dept_emp as d
	ON e.emp_no = d.emp_no
WHERE (e.hire_date BETWEEN '1985-01-01' AND '1995-12-31') AND (e.birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31') and t.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- Queries will be used in the summary