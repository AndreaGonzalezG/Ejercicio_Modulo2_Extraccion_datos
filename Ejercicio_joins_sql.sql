USE tienda;

-- EJERCICIO 1
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.


SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees
CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

SELECT employees.employee_number, employees.first_name, employees.last_name, customers.customer_number
FROM employees, customers
WHERE employees.employee_number = customers.sales_rep_employee_number;



-- EJERCICIO 2
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.

SELECT e.employee_number, e.first_name, e.last_name
FROM employees AS e
CROSS JOIN customers AS c 
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.employee_number
HAVING 
	COUNT(DISTINCT c.customer_number)>8;
    

-- Opcion 2
SELECT e.employee_number, e.first_name, e.last_name
FROM employees AS e, customers AS c 
WHERE e.employee_number = c.sales_rep_employee_number AND COUNT(DISTINCT c.customer_number)>8;

-- EJERCICIO 3
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.
SELECT e.first_name, e.last_name
FROM employees AS e
CROSS JOIN customers AS c 
WHERE e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.country)>1;



-- EJERCICIO 4
-- Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.

SELECT employee_number, first_name, last_name, c. customer_number 
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number; 


-- EJERCICIO 5
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
-- NOTA:  Solo me permite agrupando 
SELECT employee_number, first_name, last_name
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.employee_number, 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.customer_number)>8;

-- EJERCICIO 6
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.

SELECT first_name, last_name
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.country)>1;

-- EJERCICIO 7
-- Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).
SELECT employee_number, first_name, last_name, c.customer_number
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number;


-- EJERCICIO 8
-- Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT customer_number,customer_name, e.first_name, e.last_name
FROM employees AS e
INNER JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number;



-- EJERCICIO 9
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.

SELECT e.employee_number, e.first_name, e.last_name
FROM employees AS e
LEFT JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.employee_number, 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.customer_number) >8;



-- EJERCICIO 10
-- Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.
SELECT e.employee_number, e.first_name, e.last_name
FROM employees AS e
RIGHT JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.employee_number, 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.customer_number) >8;


-- EJERCICIO 11
-- Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.

SELECT first_name, last_name
FROM employees AS e
LEFT JOIN customers AS c 
ON e.employee_number = c.sales_rep_employee_number
GROUP BY 
    e.first_name, 
    e.last_name
HAVING 
	COUNT(DISTINCT c.country)>1;

