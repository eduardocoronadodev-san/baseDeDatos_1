
-- ALTER 

CREATE DATABASE escuelita;
GO

USE escuelita;
GO

CREATE TABLE alumno(
    alumno_id INT IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15),

    CONSTRAINT pk_alumno
    PRIMARY KEY (alumno_id)
);

-- Agregar una columna a una tabla existente COMMENT

ALTER TABLE alumno 
ADD telefono VARCHAR(20);
GO


-- Agregar varias columnas a la vez a una tabla existente }

ALTER TABLE alumno
ADD 
curp CHAR(18),
rfc CHAR(13);

-- Modificar el tipo de dato 
ALTER TABLE alumno 
ALTER COLUMN
telefono VARCHAR(30) NOT NULL;
GO



-- AGREGAR U7NA PRIMARY KEY 
CREATE TABLE alumno2(
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15),

);


ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (alumno_id);



CREATE TABLE carrera(
    carrera_id INT IDENTITY(1,1),
    CONSTRAINT pk_carrera
    PRIMARY KEY (carrera_id),
    nombre VARCHAR(10) NOT NULL
);


-- AGREGAR UN CAMPO PARA FOREING  KEY EN ALUMNO

ALTER TABLE alumno 
ADD
carrera_id INT;

-- AGREGAR RESTRICCION FOREING KEY 

ALTER TABLE alumno
ADD CONSTRAINT fk_alumno_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera (carrera_id)
ON DELETE CASCADE 
ON UPDATE NO ACTION;


-- AGREGAR CAMPO EDAD A LA TABLA ALUMNO COMMENT

ALTER TABLE alumno 
ADD 
edad INT;

-- AGREGAR UNA RESTRICCION CHECK 

ALTER TABLE alumno 
ADD CONSTRAINT ck_alumno_edad
CHECK (edad>=18);
GO

-- TODO CONTINUAR CON RESTRICCIONES DEFAULT 

ALTER TABLE alumno
ADD activo BIT NOT NULL;
GO 



SELECT * FROM alumno;


ALTER TABLE alumno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1 
FOR activo;



--ELIMINAR RESTRICCIONES


EXECUTE sp_help alumno;


--consulta para coiniocer los tiupo s y nombres de las restricciones de una tabl.a COMMENT


SELECT
    o.name AS nombreRestriccion,
    o.type_desc AS tipo_restriccion 
FROM sys.objects AS o 
WHERE o.parent_object_id = OBJECT_ID('alumno')
AND o.type IN ('PK', 'F','UQ', 'C', 'D')
ORDER BY o.type_desc;
GO

--ELIMINAR UN PK 
ALTER TABLE alumno 
DROP CONSTRAINT pk_alumno ;


-- ELIMINAR UN CHECK

ALTER TABLE alumno 
DROP CONSTRAINT ck_alumno_edad ;

-- ELIMINAR UN UNIQUE 



--agregp un primero por que no tengo 

ALTER TABLE alumno 
ADD matricula  VARCHAR(12) NOT NULL;


ALTER TABLE alumno 
ADD CONSTRAINT uq_alumno_matricula
UNIQUE (matricula);

ALTER TABLE alumno 
DROP CONSTRAINT uq_alumno_matricula ;


-- ELIMINAR EL DEFAULT 

ALTER TABLE alumno
DROP CONSTRAINT df_alumno_activo; 



-- ELIMINAR LA FK

ALTER TABLE alumno
DROP CONSTRAINT fk_alumno_carrera;

-- DROP (ELIMINA OBJETOS COMPLETOS )



-- MUESTRA LAS TABLAS DE LABASE DE DATOS COMMENT
SELECT name 
FROM sys.tables;

DROP TABLE alumno;
GO

DROP TABLE alumno2;
GO 

DROP TABLE carrera;
GO 

USE master;
GO

DROP TABLE escuelita;
GO 

SELECT *FROM alumno 

