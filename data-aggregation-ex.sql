use gringotts;

SELECT 
    COUNT(id) AS `count`
FROM
    wizzard_deposits;

SELECT 
    MAX(magic_wand_size) AS `longest_magic_wand`
FROM
    wizzard_deposits;

SELECT 
    deposit_group, MAX(magic_wand_size) AS longest_magic_wand
FROM
    wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand ASC , deposit_group;

SELECT 
    deposit_group
FROM
    wizzard_deposits
GROUP BY deposit_group
HAVING MIN(magic_wand_size)
LIMIT 1;

SELECT 
    deposit_group, FORMAT(SUM(deposit_amount), 2) AS total_sum
FROM
    wizzard_deposits
GROUP BY deposit_group
ORDER BY SUM(deposit_amount);

SELECT 
    deposit_group, FORMAT(SUM(deposit_amount), 2) AS `total_sum`
FROM
    wizzard_deposits
WHERE
    magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;
 
SELECT 
    deposit_group, FORMAT(SUM(deposit_amount), 2) AS total_sum
FROM
    wizzard_deposits
WHERE
    magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum;
 
SELECT 
    deposit_group,
    magic_wand_creator,
    MIN(deposit_charge) AS min_deposit_charge
FROM
    wizzard_deposits
GROUP BY deposit_group , magic_wand_creator
ORDER BY magic_wand_creator , deposit_group;

SELECT 
    CASE
        WHEN age <= 10 THEN '[0-10]'
        WHEN age <= 20 && age > 10 THEN '[11-20]'
        WHEN age <= 40 THEN '[31-40]'
        WHEN age <= 50 THEN '[41-50]'
        WHEN age <= 60 THEN '[51-60]'
        WHEN age > 60 THEN '[61+]'
    END AS age_group,
    COUNT(age) AS wizard_count
FROM
    wizzard_deposits
GROUP BY age_group
ORDER BY age_group;

SELECT 
    LEFT(first_name, 1) AS first_letter
FROM
    wizzard_deposits
WHERE
    deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;

SELECT 
    deposit_group,
    is_deposit_expired,
    AVG(deposit_interest) AS average_interest
FROM
    wizzard_deposits
WHERE
    deposit_start_date > '1985-1-1'
GROUP BY deposit_group , is_deposit_expired
ORDER BY deposit_group DESC , is_deposit_expired;

use soft_uni;
 
SELECT 
    department_id, MIN(salary) minimum_salary
FROM
    employees
WHERE
    department_id IN (2 , 5, 7)
        AND hire_date > '2000-1-1'
GROUP BY department_id
ORDER BY department_id;
 
CREATE TABLE `high_paid_employees` AS SELECT * FROM
    employees
WHERE
    salary > 30000
GROUP BY department_id;
 
DELETE FROM high_paid_employees 
WHERE
    salary > 30000 AND manager_id = 42;
  
UPDATE high_paid_employees 
SET 
    salary = salary + 5000
WHERE
    department_id = 1 AND salary > 30000;

SELECT 
    department_id, AVG(salary) AS avg_salary
FROM
    high_paid_employees
GROUP BY department_id
ORDER BY department_id;
 
SELECT 
    department_id, MAX(salary) max_salary
FROM
    employees
GROUP BY department_id
HAVING max_salary < 30000 || max_salary > 70000
ORDER BY department_id;
 
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    manager_id IS NULL;
 
SELECT DISTINCT
    department_id,
    (SELECT DISTINCT
            `salary`
        FROM
            `employees` e
        WHERE
            e.`department_id` = `employees`.`department_id`
        ORDER BY `salary` DESC
        LIMIT 1 OFFSET 2) AS `third_highest_salary`
FROM
    `employees`
HAVING `third_highest_salary` IS NOT NULL
ORDER BY `department_id`;

SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    employees.salary > (SELECT 
            AVG(salary)
        FROM
            employees e
        WHERE
            e.department_id = employees.department_id)
ORDER BY employees.department_id , employees.employee_id
LIMIT 10;

SELECT 
    department_id, SUM(salary) total_salary
FROM
    employees
GROUP BY department_id
ORDER BY department_id;