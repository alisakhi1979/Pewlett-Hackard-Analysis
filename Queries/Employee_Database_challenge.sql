-- Deliverable 1
SELECT e.emp_no,e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT DISTINCT ON (emp_no) emp_no ,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, from_date DESC;


CREATE TABLE retiring_titles
AS (SELECT title, COUNT(title)
	FROM unique_titles
	GROUP BY title
	ORDER BY count DESC);

-- Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_employee AS de
ON ( e.emp_no = de.emp_no)
JOIN titles AS t
ON (de.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

-- Additional query
SELECT count(emp_no), extract( year from birth_date) as yyyy
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Group by yyyy