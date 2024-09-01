
USE ejercicios_2;

#Ejercicio1
CREATE TABLE Empleadas (
id_empleada INT, 
salario INT, 
nombre VARCHAR(50), 
apellido VARCHAR(50),
pais VARCHAR(50));

CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid'
);

#Ejercicio2
CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
	edad INT,
    CONSTRAINT mayor_edad CHECK (edad > 16) ,
    ciudad varchar(255) DEFAULT 'Madrid'
);

#Ejercicio3
CREATE TABLE Empleadas1 (
id_empleada INT NOT NULL auto_increment, 
salario INT default NULL, 
nombre varchar(50) NOT NULL, 	
apellido varchar(50) NOT NULL, 
pais  varchar(50) default 'España', 
PRIMARY KEY (id_empleada)
);

CREATE TABLE IF NOT EXISTS empleadas_en_proyecto(
id_proyecto INT NOT NULL,  
id_empleada INT NOT NULL, 
PRIMARY KEY (id_proyecto),
CONSTRAINT fk_empleadas_en_proyecto_Empleadas1
FOREIGN KEY (id_empleada)
REFERENCES Empleadas1 (id_empleada) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Solucion ejercicios 
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