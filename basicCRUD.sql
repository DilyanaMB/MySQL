select  employees.id, employees.first_name, employees.last_name, employees.job_title
from hotel.employees
order by id;

select  employees.id, concat(employees.first_name, ' ', employees.last_name) as full_name, employees.job_title, employees.salary
from hotel.employees
where salary  > 1000.00
order by id;

SET SQL_SAFE_UPDATES = 0;

update employees
set salary = salary + 100
where employees.job_title='Manager' AND id IS NOT NULL;

select * from employees
where salary = (select MAX(salary) from employees);

select * from employees
where department_id =4 and salary >=1000;

delete from employees
where department_id = 1 or department_id=2;

select * from employees
order by id;