use soft_uni;

-- 1. Managers

SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    d.department_id,
    d.name AS department_name
FROM
    employees e
        JOIN
    departments d ON d.manager_id = e.employee_id
ORDER BY e.employee_id
LIMIT 5;

-- 2. Towns Addresses

select t.town_id,t.name as town_name, address_text 
from towns t
join addresses a
on t.town_id = a.town_id
where name in ('San Francisco', 'Sofia', 'Carnation')
order by town_id, address_id;

-- 3. Employees Without Managers

select e.employee_id, e.first_name, e.last_name, e.department_id, e.salary 
from employees e
right join departments d on e.department_id = d.department_id
where e.manager_id is null;

-- 4. Higher Salary

SELECT 
    COUNT(*)
FROM
    employees e
WHERE
    e.salary > (SELECT 
            AVG(e1.salary)
        FROM
            employees e1);