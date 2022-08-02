SELECT COUNT (rt.emp_no),
		rt.title
INTO retiring_titles
FROM Unique_titles as rt
	group by rt.title
	order by COUNT(rt.title) DESC;





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
