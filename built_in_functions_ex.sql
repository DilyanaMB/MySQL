use soft_uni;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'Sa%'
ORDER BY employee_id;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE '%ei%'
ORDER BY employee_id;

SELECT 
    first_name
FROM
    employees
WHERE
    department_id IN (3 , 10)
        AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    job_title NOT LIKE '%engineer%'
ORDER BY employee_id;

SELECT 
    name
FROM
    towns
WHERE
    CHAR_LENGTH(name) IN (5 , 6)
ORDER BY name;

SELECT 
    town_id, name
FROM
    towns
WHERE
    name REGEXP '^[mkbe]'
ORDER BY name;

SELECT 
    town_id, name
FROM
    towns
WHERE
    name NOT REGEXP '^[rbd]'
ORDER BY name;

CREATE VIEW v_employees_hired_after_2000 AS
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000
        order by hire_date;
        
SELECT * FROM v_employees_hired_after_2000;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;
    
use geography;

select country_name,iso_code
from countries
where country_name like '%a%a%a%'
order by country_name;

select peaks.peak_name, rivers.river_name, concat(lower(peak_name),substring(river_name,2)) as mix
from peaks, rivers
where right(peak_name,1)=left(lower(river_name),1)
order by mix;

use diablo;






