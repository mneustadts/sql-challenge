--Data analysis

--List details of each employee

select Employees.employ_num, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.gender, 
	Salaries.salary
from Employees
inner join Salaries on
Employees.employ_num = Salaries.employ_num
;
--List employees who were hired in 1986.

select * from employees
where DATE_PART('year',hire_date) = 1986
order by employ_num
;
--List the manager and subsequent info

select t1.dept_num,
	t3.dept_name,
	t1.employ_num,
	t2.first_name,
	t2.last_name,
	t1.from_date,
	t1.to_date
from dept_manager as t1
join employees as t2 on
t1.employ_num = t2.employ_num
join departments as t3
on t3.dept_num = t1.dept_num
;
--List  employee number, last name, first name, and department name.

select t1.employ_num,
	t1.last_name,
	t1.first_name,
	t3.dept_name
from employees as t1
join dept_employ as t2
on t1.employ_num = t2.employ_num
join departments as t3
on t3.dept_num = t2.dept_num
;
--List all employees whose first name is Hercules Last name B

select * from employees
where first_name = 'Hercules' and last_name like 'B%'
; 
--List all employees in the Sales department

select t1.employ_num
	, t1.last_name
	, t1.first_name
	, t3.dept_name
from employees as t1
join dept_employ as t2
on t1.employ_num = t2.employ_num
join departments as t3
on t3.dept_num = t2.dept_num
where t3.dept_name = 'Sales'
;
--List all employees in Sales and Development

select t1.employ_num
	, t1.last_name
	, t1.first_name
	, t3.dept_name
from employees as t1
join dept_employ as t2
on t1.employ_num = t2.employ_num
join departments as t3
on t3.dept_num = t2.dept_num
where t3.dept_name = 'Sales' or t3.dept_name = 'Development'
;

select last_name, count (last_name) as name_ct
from employees
group by last_name
order by name_ct desc
;