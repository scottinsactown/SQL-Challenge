select * from departments;
select * from dept_employees;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- 1. List the following details of each employee: 
--- employee number, last name, first name, gender, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
from employees as emp
left join salaries as sal
on emp.emp_no = sal.emp_no;

-- 2. List employees who were hired in 1986.
select * from employees
where hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department with the following information: 
---department number, department name, the manager's employee number, 
---last name, first name, and start and end employment dates.
select dm.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name, dm.from_date, dm.to_date
from dept_manager as dm
left join employees as emp
on dm.emp_no = emp.emp_no
left join departments as dept
on dm.dept_no = dept.dept_no;

-- 4. List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
left join dept_employees as de
on emp.emp_no = de.emp_no
left join departments as dept
on de.dept_no = dept.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, including their 
---employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from departments as dept
left join dept_employees as de
on de.dept_no = dept.dept_no
left join employees as emp
on emp.emp_no = de.emp_no
where dept.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their 
---employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from departments as dept
left join dept_employees as de
on de.dept_no = dept.dept_no
left join employees as emp
on emp.emp_no = de.emp_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select count(last_name), last_name from employees
group by last_name;
