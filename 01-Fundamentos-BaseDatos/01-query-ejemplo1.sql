CREATE DATABASE bdejemplo;

USE bdejemplo;

CREATE TABLE categoria(
	id INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (id)
);

INSERT INTO categoria
VALUES(1, 'Carnes frias'),
	  (2, 'Vinos y licores');
	  
SELECT * FROM categoria; 


-- MANEJO DE VALORES NULOS 
USE bdejemplo;
GO

CREATE TABLE alumno (
	idlumno INT NOT NULL PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL,
	apellidoPaterno VARCHAR(20) NOT NULL,
	apellidoMaterno VARCHAR(20) NULL,
	fechaNaci Date NOT NULL,
	calle VARCHAR(50) NOT NULL,
	numeroInt INT,
	numeroExt INT
);

INSERT INTO alumno
VALUES (1, 'MONSERRAT', 'MUÑOZ', NULL, '2007-07-17', 'CALLE EL INFIERNO', NULL, 666 );

INSERT INTO alumno
VALUES (2, 'IRVING', 'ANDABLO', 'ISLAS', '2007-06-16', 'CALLE EL CIELO', NULL, NULL );

INSERT INTO alumno (idlumno, nombre, apellidoPaterno, fechaNaci, calle)
VALUES (3, 'Cristofer', 'Garcia', '2007-11-03', 'Conocida' );


SELECT *
FROM alumno;


-- RAZON DE CARDINALIDAD 1:N
REATE TABLE categoria2(
	categoriaId INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT pk_categoria2
	PRIMARY KEY (categoriaId)
);

CREATE TABLE producto2 (
	productoid INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(35) NOT NULL,
	existencia INT NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	categoriaiD INT,
	CONSTRAINT fk_producto2_categoria2
	FOREIGN KEY (categoriaId)
	REFERENCES categoria2(categoriaId)
);