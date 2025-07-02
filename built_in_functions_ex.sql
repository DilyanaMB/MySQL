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
    ORDER BY hire_date;
        
SELECT 
    *
FROM
    v_employees_hired_after_2000;

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;
    
use geography;

SELECT 
    country_name, iso_code
FROM
    countries
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY country_name;

SELECT 
    peaks.peak_name,
    rivers.river_name,
    CONCAT(LOWER(peak_name),
            SUBSTRING(river_name, 2)) AS mix
FROM
    peaks,
    rivers
WHERE
    RIGHT(peak_name, 1) = LEFT(LOWER(river_name), 1)
ORDER BY mix;

use diablo;

SELECT 
    name, DATE_FORMAT(start, '%Y-%m-%d') AS start
FROM
    games g
WHERE
    YEAR(start) IN (2011 , 2012)
ORDER BY start;

SELECT 
    user_name,
    SUBSTRING_INDEX(email, '@', - 1) AS `email provider`
FROM
    users
ORDER BY `email provider` , user_name;

SELECT 
    user_name, ip_address
FROM
    users
WHERE
    ip_address REGEXP '^.{3}.1.*..{3}$'
ORDER BY user_name;

SELECT 
    name AS game,
    CASE
        WHEN HOUR(start) >= 0 && HOUR(start) < 12 THEN 'Morning'
        WHEN HOUR(start) >= 12 && HOUR(start) < 18 THEN 'Afternoon'
        WHEN HOUR(start) > 18 THEN 'Evening'
    END AS `part of the day`,
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration > 3 && duration <= 6 THEN 'Short'
        WHEN duration > 6 && duration <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS duration
FROM
    games;

use orders;

SELECT 
    product_name,
    order_date,
    ADDDATE(order_date, INTERVAL 3 DAY) AS pay,
    ADDDATE(order_date, INTERVAL 1 MONTH) AS deliver_due
FROM
    orders;