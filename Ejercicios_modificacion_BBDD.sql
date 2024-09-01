-- Se puedo poner en una sola linea
CREATE TABLE t1 (
a INTEGER, b CHAR(10)
);

-- Renombrar tabla
ALTER TABLE t1 
RENAME TO t2;

-- Cambiar la columna a de tipo INTEGER a tipo TINYINT NOT NULL (manteniendo el mismo nombre para la columna).
ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

-- Cambiar la columna b de tipo CHAR de 10 caracteres a CHAR de 20 caracteres. Además, renombra la columna como c.
-- ALTER TABLE t2
-- MODIFY COLUMN b CHAR(20);

-- La forma anterior esta mal. Solucion: Esta forma cambia realmente las restricciones del dato
ALTER TABLE t2
CHANGE b c CHAR(20);

-- Renombrar 
ALTER TABLE t2
RENAME COLUMN b TO c;

-- Mostrar tabla
SHOW CREATE TABLE t2;

-- Añadir una nueva columna llamada d de tipo TIMESTAMP./ formato  'aaaa-MM-dd HH:mm:ss.SSSSSS'
ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

-- Eliminar columna c
ALTER TABLE t2
DROP COLUMN c;

-- Columna t3 identica a columna t2, SELECT *, se copian todas las filas y columnas de nombre_original y se insertan en nombre_nueva.
CREATE TABLE t3 LIKE t2;
-- Formato avanzado
INSERT INTO t3 SELECT * FROM t2;

-- Elimina la tabla original t2 y en otra sentencia renombra la tabla t3 como t1.
DROP TABLE IF EXISTS t2;

-- Renombra t3 como t1
ALTER TABLE t3
RENAME TO t1;


-- Ejercicio con tabla customers
DROP TABLE IF EXISTS customers_mod;

-- Copia de una tabla
CREATE TABLE customers_mod LIKE customers;

-- Insertar informacion- Debe tener la misma extensión al número de columnas
INSERT INTO customers_mod(customer_number,customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_Number, credit_limit )
VALUES (343,'Adalab','Rodriguez','Julia', '672986373','Calle Falsa 123', 'Puerta 42','Madrid','España','28000', 'España',15, 20000000 );

-- Insertar informacion-
INSERT INTO customers_mod(customer_number,customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_Number, credit_limit )
VALUES (344, 'La pegatina After','Santiago','Maricarmen', '00000000','Travesía del rave', NULL,'Palma de Mallorca', NULL ,'07005', 'España',10, 45673453);

-- Actualizar datos 5 filas
-- 12. Actualizar los datos faltantes para La pegatina After
UPDATE customers_mod 
SET address_line1 = 'Polígono Industrial de Son Castelló', 
    address_line2 = 'Nave 92', 
    city = 'Palma de Mallorca', 
    state = 'España', 
    postal_code = '28123', 
    sales_rep_employee_number = 25, 
    credit_limit = 5000000 
WHERE customer_number = 344;

-- 13. Romper tabla
UPDATE customers_mod 
SET address_line1 = 'Vamos', 
    address_line2 = 'a', 
    postal_code = 'fastidiar', 
    country = 'la tabla :)';

-- 14. Actualizar los primeros 10 clientes para que sean gestionados por la representante de ventas número 2
UPDATE customers_mod 
SET sales_rep_employee_number = 2 
WHERE customer_number IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- 15. Eliminar registros con NULL en ContactFirstName
DELETE FROM customers_mod 
WHERE contact_first_name IS NULL;

-- 16. Ejecutar un DELETE sin WHERE (¡Cuidado! Esto eliminará todos los registros de la tabla)
DELETE FROM customers_mod;




