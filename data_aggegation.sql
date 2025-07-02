use restaurant;

select department_id, 
count(department_id) as number_of_employees
from employees
group by department_id
order by department_id;

select department_id,
round(avg(salary),2) as `Average Salary`
from employees
group by department_id;

select department_id, 
round(min(salary),2) as `Min Salary`
from employees
group by department_id
having  min(salary) >800;

SELECT 
    COUNT(p.name) AS `count`
FROM
    products p
        JOIN
    categories c ON p.category_id = c.id
WHERE
    p.category_id = 2 AND p.price > 8;
    
SELECT 
    category_id AS Category_id,
    FORMAT(AVG(price), 2) AS `Average Price`,
    FORMAT(MIN(price), 2) AS `Cheapest Product`,
    FORMAT(MAX(price), 2) AS `Most Expensive Product`
FROM
    products
GROUP BY category_id;

