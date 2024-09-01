
USE solucion_ejercicios2;


#Ejercicio1
CREATE TABLE Empleadas_solucion (
	id_empleada INT, 
	-- diferente al anterior el salario le pusimos FLOAT
	salario FLOAT, 
	nombre VARCHAR(50), 
	apellido VARCHAR(100),
	pais CHAR(3)
    );
-- Restriccion edad mayor de 16 años
CREATE TABLE personas_solucion (
	id_empleada INT NOT NULL, 
	-- diferente al anterior el salario le pusimos FLOAT
	salario FLOAT, 
	nombre VARCHAR(50), 
	apellido VARCHAR(100) NOT NULL,
	pais CHAR(3),
    edad INT,
	ciudad varchar(255) DEFAULT 'Madrid',
    CHECK (edad > 16) 
    );
    
    -- Empleadas
CREATE TABLE solucion_empleadas1 (
	id_empleada INT  auto_increment, 
	salario FLOAT, 
	nombre VARCHAR(50) , 	
	apellido VARCHAR(50), 
	pais  CHAR(3), 
	PRIMARY KEY (id_empleada)
);

CREATE TABLE solucion_empleadas_en_proyecto(
	id_proyecto INT, 
    id_empleada_en_pyr INT, 
	PRIMARY KEY (id_empleada_en_pyr, id_proyecto),
	CONSTRAINT fk_empleadas_proyecto
	FOREIGN KEY (id_empleada_en_pyr)
	REFERENCES solucion_empleadas1 (id_empleada) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);