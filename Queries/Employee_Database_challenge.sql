-- Deliverable 1 The Number of Retiring Employees by Title
-- DROP TABLE retirement_titles ;
-- Create retirement_titles table
SELECT e.emp_no,
    e.first_name,
e.last_name,
    ti.title,
    ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
SELECT * FROM retirement_titles ;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
-- INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, 
	to_date DESC;
	
-- Title count from unigue titles
-- SELECT COUNT(emp_no) FROM unique_titles;
SELECT title, COUNT(emp_no) As "count"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Deliverable 2 The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp_no) e.emp_no, 
	e.first_name, 
	e.last_name,  
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date BETWEEN '9999-01-01' AND '9999-01-01' )
	ORDER BY emp_no ;

SELECT * FROM mentorship_eligibility ;



























	
