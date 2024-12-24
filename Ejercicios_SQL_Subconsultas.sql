USE tienda;

-- 1. Calcula el numero de clientes por cada ciudad.

-- OPCION CON SUBCONSULTA
SELECT city, 
       (SELECT COUNT(customer_number) -- selecciono que cuente número de distintos clientes que son de la misma ciudad 
        FROM customers AS c2
        WHERE c2.city = c1.city) AS cantidad_clientes
FROM customers AS c1
GROUP BY city;

-- OPCION 2
SELECT city, COUNT(customer_number) -- selecciono que cuente número de distintos clientes que son de la misma ciudad 
FROM customers
GROUP BY city;


-- EJERCICIO 2: Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.

SELECT city
FROM (
    SELECT city, COUNT(customer_number) AS customer_cantidad
    FROM customers
    GROUP BY city
) AS clientes_ciudad
ORDER BY customer_cantidad DESC
LIMIT 1;

-- Opcion 2

SELECT city
FROM customers
GROUP BY city
HAVING COUNT(customer_number) = (
    SELECT MAX(customer_count)
    FROM (
        SELECT COUNT(customer_number) AS customer_count
        FROM customers
        GROUP BY city
    ) AS subquery
);



-- EJERCICIO 3: Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.



SELECT customer_number, contact_first_name, contact_last_name
FROM customers
WHERE city IN (
    SELECT c1.city
    FROM customers AS c1
    GROUP BY c1.city
    HAVING COUNT(customer_number) = (
        SELECT MAX(customer_count)
        FROM ( SELECT COUNT(c2.customer_number) AS customer_count
            FROM customers AS c2
            GROUP BY c2.city
        ) AS subquery
    ));
    
    
    -- NOTA Consulta en subconsulta: La subconsulta busca la ciudad con el mayor número de clientas, lo que se compara con el campo city en la tabla customers.
    -- EJERCICIOS EN CLASE
    
    -- QUIERO TODOS LOS PRODUCTOS CUYO PRECIO ES MENOR A LOS PRECIOS DE MOTORCYCLE 
    
    SELECT *
    FROM products
    WHERE buy_price < ALL( SELECT buy_price
		FROM products
		WHERE product_line = 'Motorcycles');