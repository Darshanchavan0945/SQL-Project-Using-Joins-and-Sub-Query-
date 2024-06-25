use employees;

# write a cury to get the count of all the unique names present in epm table
select(first_name), count(distinct(first_name)) as count_of_name from employees group by 1 order by 2 ;

# select all the employees whose first name starts with sanj
select * from employees where first_name like "sanj%" ;
select * from employees where first_name like "saj__" ;
select * from employees where first_name like "sh___" ;

# write a qury which add a column salary category ( lo'medium'high)
#based on the candition of salary less than 50000 'low'
#from 50000 to 75000 medium else high
select *,
case 
when salary < 50000 then 'low'
when salary between 50000 and 70000 then ' medium'
else 'high'
end as xyz
from salaries;

# eng, staff or ass eng--. entry level
# sen staff , senor engg--. mid level
#tech lead and manager -----'mgmt lvl'
select *,
case 
when title in ('engineer','staff','assistant engineer') then 'entry level'
when title in ('senior engineer', 'senior staff') then 'mid level'
when title in ('tech lead' , 'manager') then 'mgmt level'
end as xyz 
from titles;

# get the emp_no, first name , last name for all managers
select employees.emp_no,employees.first_name,employees.last_name
from employees
inner join 
dept_manager on ( dept_manager.emp_no = employees.emp_no);

# get the emp_no, first name , last name for all female managars
select e.emp_no,e.first_name,e.last_name 
from employees as e
inner join 
dept_manager as dm on ( e.emp_no = e.first_name  = e.last_name)
 where gender = 'F';

# get the first_name, lats_name, title
# for all the  employees who are either engg or asst enginer
select e.emp_no, e.first_name,e.last_name,t.title
from employees as e
inner join
titles as t on (e.emp_no = t.emp_no )
where t.title in ('engineer','assistant engineer');

# get the emp_no, first name , last name for all managers
select e.emp_no,e.first_name,e.last_name 
from employees as e
inner join
titles as t on( e.emp_no = t.emp_no)
where title in ( 'Senior Engineer' , 'Engineer') ;

# dep_manger and departments  dept_no ,dept_name and manager no
select d.dept_no , d.dept_name ,de.emp_no
from departments as d
inner join
dept_manager as de on ( d.dept_no =  de.dept_no);

# write query for finding employee number, department number, department name
select e.emp_no ,d.dept_no,d.dept_name
from employees as e
inner join
departments as d on ( e.emp_no = d.dept_no = d.dept_name );

# write a qury emp_first name , last name , avg_salary for all employees
# employees table with salarys table
select e.emp_no , e.first_name , e.last_name, s.emp_no ,
round(avg(s.salary)) as avrage_salary
from employees as e
inner join salaries as s  on (  e.emp_no =  s.emp_no )
group by 1 order by 5 desc ;

# emp_no , first name ,last name ,avg salary  only those employees who are managers # 3 charts
select e.emp_no , e.first_name , e.last_name, s.emp_no , dm.emp_no  ,
round(avg(s.salary)) as avrage_salary
from employees as e
inner join salaries     as s  on (  e.emp_no =  s.emp_no)
inner join dept_manager as dm on ( dm.emp_no = e.emp_no )
group by 1 order by 4 desc ;

# need only managers
select e.emp_no , e.first_name , e.last_name, s.emp_no , t.title  ,
round(avg(s.salary)) as avrage_salary
from employees as e
inner join salaries     as s  on (  e.emp_no =  s.emp_no)
inner join titles as t on ( t.emp_no  = e.emp_no )
where title = 'manager'
group by 1 order by 4 desc ;

# get the details( first name, last name , birth date)for all employees who are senior engineer 
#and working in production department
select e.first_name ,e.last_name , e.birth_date ,t.title
from employees as e
inner join titles as t on (e.emp_no = t.emp_no )
inner join dept_emp as dm on ( dm.emp_no = e.emp_no  )
where title = 'Senior Engineer' and  dm.dept_no = 'd004';

# same but use 4 table
select e.first_name ,e.last_name , e.birth_date ,t.title , d.dept_name
from employees as e
inner join titles as t on (e.emp_no = t.emp_no )
inner join dept_emp as dm on ( dm.emp_no = e.emp_no  )
inner join departments as d on ( d.dept_no= dm.dept_no)
where title = 'Senior Engineer' and  d.dept_name = 'production';

# emp_ni , first name , last name , birth date , avg salary 
# all employees who are senior engg and working in roduction department
select e.emp_no ,e.first_name , e.last_name , e.birth_date ,t.title, s.salary,
avg(s.salary) as avg_salary
from employees as e
inner join titles as t on(e.emp_no =t.emp_no)
inner join salaries as s on ( e.emp_no = s.emp_no )
inner join dept_emp as dm on (dm.emp_no = e.emp_no )
inner join departments as d on ( d.dept_no= dm.dept_no)
where title = 'Senior Engineer' and  d.dept_name = 'production'
group by 6;

# write a sub query to get those records to have scored marks less then marks scored by rupali
select * from marks where marks <
(select marks from marks where student_name = 'ruplai');

# emp_no , first name , last name only for the managers but not using join
select emp_no ,first_name,last_name from employees 
where emp_no in (select emp_no from dept_manager );
#or
select emp_no ,first_name,last_name from employees 
where emp_no in (select emp_no from titles where title = 'manager' );




select emp_no from employees where first_name ='saniya' and Last_name ='Kalloufi';
select dept_no from dept_emp where emp_no = (select emp_no from employees 
where first_name ='saniya' and Last_name ='Kalloufi');
select emp_no from dept_emp where dept_no = (select dept_no from dept_emp 
where emp_no = (select emp_no from employees 
where first_name ='saniya' and Last_name ='Kalloufi'));


# first name ramzi last name erde department all emp no
select emp_no from dept_emp where dept_no =(
select dept_no from dept_emp where emp_no=(
select emp_no from employees where (first_name= 'saniya' and last_name ='kalloufi')));






























