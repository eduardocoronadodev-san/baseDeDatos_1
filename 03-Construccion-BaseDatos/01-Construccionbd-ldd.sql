
-- CREA UNA BASE DE DATOS 

CREATE DATABASE universidad;
GO

-- utilizar de lase de datos 
USE universidad;
GO 

--crear una tabla 
CREATE TABLE alumno(
alumno_id INT,
nombre VARCHAR(100),
edad INT
); 
GO
--abrir object explorer y aparecen tus tablas 


--crea nueva tabla 

CREATE TABLE alumno_2(
	alumno_id INT,
	nombre VARCHAR(100),
	apellido_paterno VARCHAR(50),
	apellido_materno VARCHAR(50),
	fecha_nacimiento DATE,
	correo VARCHAR(45)
);
--RESTRICCIONES
CREATE TABLE alumno_3(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(100),
	correo VARCHAR(40),
	
);

CREATE TABLE alumno_4(
	alumno_id INT NOT NULL,
	nombre VARCHAR(100),
	correo VARCHAR(40),
	CONSTRAINT pk_alumno_4
	PRIMARY KEY (alumno_id)
);




INSERT INTO aulumno_4 
VALUES (1 'Panfilo', 'correo@correo.com')


INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com');

-- PRIMARY KEY CON IDENTITY }

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(100) NOT NULL,
	edad INT NULL,
	CONSTRAINT pk_profesor,
	PRIMARY KEY (pk_profesor),

);


INSER INTO profesor 
VALUES ('German', 29, ),
		('Mari', 22 );


SELECT *
FROM profesor;


--RESTRICCION UNIQ

CREATE TABLE materia(
	materia_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	correo VARCHAR(50) NOT NULL,
	CONSTRAINT pk_materia_2
	PRIMARY KEY(materia_id),
	CONSTRAINT uq_materia_2_correo
	UNIQUE(correo)
);


INSERT INTO materia_2
VALUES('correo@correo.com');

INSERT INTO materia_2
VALUES('correo2@correo.com');
	

##hacer comit al final de todo
## git status 
##git add .
##git status
##git commit 
"Se realizo la documentacion de los tipós de lenguaje SQL 
y sus comando correspoondiente, ademas se comenzo la creacion de tablas 
con SQL-LDD. Se realizaron los constraints de dominio , valores nulos,
primary key y unique , asi como los campos identity"
(guardas)
(cierra)

## git log 
(cierra)

