# Ejercicio 6 Sistema Académico

```sql
CREATE DATABASE sistema_academico;
GO 

USE sistema_academico;
GO

CREATE TABLE alumno(
	matricula VARCHAR (20) NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY,

	pila_nombre VARCHAR(50) NOT NULL,

	apellido_paterno VARCHAR (50) NOT NULL,

	apellido_materno VARCHAR (50) NOT NULL,

	correo VARCHAR (100) NOT NULL 
	CONSTRAINT uq_alumno_correo
	UNIQUE
);
GO

CREATE TABLE depto(
	num_depto VARCHAR (20) NOT NULL
	CONSTRAINT pk_depto
	PRIMARY KEY,

	nombre VARCHAR (100) NOT NULL,
	
	edificio VARCHAR (50) NULL
);
GO


CREATE TABLE proyecto(
	num_proyecto VARCHAR (20) NOT NULL
	CONSTRAINT pk_proyecto
	PRIMARY KEY,

	nombre_proyecto VARCHAR (100) NOT NULL,

	presupuesto DECIMAL(12,2) NULL
	CONSTRAINT ck_proyecto_presupuesto
	CHECK (presupuesto >= 0)
);
GO


CREATE TABLE profesor (
    id_profesor VARCHAR(20) NOT NULL
    CONSTRAINT pk_profesor
    PRIMARY KEY,

    pila_nombre VARCHAR(50) NOT NULL,

    apellido_paterno VARCHAR(50) NOT NULL,

    apellido_materno VARCHAR(50),

    num_depto VARCHAR(20) NOT NULL
    CONSTRAINT fk_profesor_depto
    REFERENCES depto (num_depto)
);
GO

CREATE TABLE materia (
    clave_materia VARCHAR(20) NOT NULL
    CONSTRAINT pk_materia
    PRIMARY KEY,

    nombre_materia VARCHAR(100) NOT NULL,

    id_profesor VARCHAR(20) NOT NULL
    CONSTRAINT fk_materia_profesor
    REFERENCES profesor (id_profesor)
);
GO


CREATE TABLE alumno_tel (
    id_telefono INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_alumno_tel
    PRIMARY KEY,

    matricula VARCHAR(20) NOT NULL
    CONSTRAINT fk_alumno_tel_alumno
    REFERENCES alumno (matricula),

    numero_telefono VARCHAR(20) NOT NULL
);
GO


CREATE TABLE credencial (
    num_credencial VARCHAR(20) NOT NULL,

    fecha_inscripcion DATE NOT NULL,

    matricula VARCHAR(20) NOT NULL,

    CONSTRAINT pk_credencial
    PRIMARY KEY (num_credencial),

    CONSTRAINT uq_credencial_matricula
    UNIQUE (matricula),

    CONSTRAINT fk_credencial_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno (matricula)
);
GO


CREATE TABLE cursa (
    matricula VARCHAR(20) NOT NULL,

    clave_materia VARCHAR(20) NOT NULL,

    fecha_inscripcion DATE NOT NULL,

    calif_final DECIMAL(4,2),

    CONSTRAINT pk_cursa
    PRIMARY KEY (matricula, clave_materia),

    CONSTRAINT ck_cursa_calif_final
    CHECK (calif_final BETWEEN 0 AND 10),

    CONSTRAINT fk_cursa_alumno
    FOREIGN KEY (matricula)
    REFERENCES alumno (matricula),

    CONSTRAINT fk_cursa_materia
    FOREIGN KEY (clave_materia)
    REFERENCES materia (clave_materia)
);
GO


CREATE TABLE dependiente (
    id_dependiente INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_dependiente
    PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    fecha_naci DATE,

    parentesco VARCHAR(50),

    id_profesor VARCHAR(20) NOT NULL
    CONSTRAINT fk_dependiente_profesor
    REFERENCES profesor (id_profesor)
);
GO


CREATE TABLE participa (
    id_profesor VARCHAR(20) NOT NULL,

    num_proyecto VARCHAR(20) NOT NULL,

    fecha_inicio DATE NOT NULL,

    rol VARCHAR(50) NOT NULL,

    CONSTRAINT pk_participa
    PRIMARY KEY (id_profesor, num_proyecto),

    CONSTRAINT fk_participa_profesor
    FOREIGN KEY (id_profesor)
    REFERENCES profesor (id_profesor),

    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (num_proyecto)
    REFERENCES proyecto (num_proyecto)
);
GO
```

![DiagramaComercializadora](../../img/construccionbd/ejercicio6.png)