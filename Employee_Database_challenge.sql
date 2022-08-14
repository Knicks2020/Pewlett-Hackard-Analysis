-- A query is written and executed to create a Retirement Titles table 
-- or employees who are born between January 1, 1952 and December 31, 1955
SELECT e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
JOIN titles t on (t.emp_no = e.emp_no)
WHERE e.birth_date between '1952-01-01' and '1955-12-31'
	order by e.emp_no

-- A query is written and executed to create a Unique Titles table that contains the employee number, 
-- first and last name, and most recent title
SELECT DISTINCT ON (emp_no) emp_no, 
first_name, last_name, title, to_date
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
	order by emp_no


-- A query is written and executed to create a Retiring Titles table 
-- that contains the number of titles filled by employees who are retiring.
SELECT COUNT (rt.emp_no),
		rt.title
INTO retiring_titles
FROM Unique_titles as rt
	group by rt.title
	order by COUNT(rt.title) DESC;



-- A query is written and executed to create a Mentorship Eligibility table for current
-- employees who were born between January 1, 1965 and December 31, 1965. 
SELECT DISTINCT on (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de on (e.emp_no = de.emp_no)
JOIN titles as t on (t.emp_no = e.emp_no)
WHERE de.to_date = '9999-01-01'
	AND e.birth_date between '1965-01-01' and '1965-12-31'
		order by e.emp_no
