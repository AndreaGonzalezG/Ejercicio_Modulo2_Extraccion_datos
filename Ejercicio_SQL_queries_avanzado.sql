-- Tambien puedo usar USE tienda
USE customers;

-- 1. Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.

SELECT MIN(customer_number)
FROM customers;


-- 2. Selecciona el limite de crédito medio para los clientes de España.

SELECT AVG(credit_limit) AS limiteCreditomedio
FROM customers
WHERE country = "Spain";

-- 3. Selecciona el numero de clientes en Francia.

SELECT COUNT(customer_name) AS ClienteFracia
FROM customers
WHERE country = 'France';

-- 4. Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.
SELECT  MAX(credit_limit) AS max_customer_1323
FROM customers
WHERE sales_rep_employee_number = 1323;

-- opcion 2, COMO HACER UN GRUPAL 
SELECT  MAX(credit_limit) AS max_customer_1323, customer_number, sales_rep_employee_number
FROM customers
GROUP BY customer_number
HAVING sales_rep_employee_number = 1323;

-- 5. ¿Cuál es el número máximo de empleado de la tabla customers?
SELECT MAX(sales_rep_employee_number)
FROM customers;

-- 6. Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, 
-- así como el numero de clientes distintos que tiene cada uno.

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number;

-- 7. Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) 
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) >7;

-- 8. Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
-- Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS AltoRendimiento
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) >7 ;

-- Opción  2
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number), 
CASE
	WHEN COUNT(DISTINCT customer_number)> 7 THEN  'AltoRendimiento'
	ELSE 'Normal'
END
FROM customers
GROUP BY  sales_rep_employee_number;


-- 9. Selecciona el número de clientes en cada pais.

SELECT country, COUNT(DISTINCT customer_number ) AS ClientesPais
FROM customers
GROUP BY country;

-- 10. Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT country, COUNT(DISTINCT city)
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city ) > 3;











