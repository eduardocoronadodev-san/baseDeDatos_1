CREATE DATABASE control_academico;
GO

USE control_academico;
GO

CREATE TABLE curso(
    numero_curso INT NOT NULL IDENTITY(1,1),
    nombre_curso VARCHAR(50) NOT NULL,
    creditos INT NOT NULL,
    CONSTRAINT pk_curso 
    PRIMARY KEY (numero_curso),
    CONSTRAINT uq_nombre_curso 
    UNIQUE (nombre_curso),
    CONSTRAINT ck_creditos_positivos 
    CHECK (creditos > 0)
);
GO

CREATE TABLE profesor(
    numero_profesor INT NOT NULL IDENTITY(1,1),
    nombre_profesor VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50),
    numero_curso INT NOT NULL,
    CONSTRAINT pk_profesor
    PRIMARY KEY (numero_profesor),
    CONSTRAINT fk_profesor_curso 
    FOREIGN KEY (numero_curso) 
    REFERENCES curso(numero_curso)
);
GO

CREATE TABLE especialidad(
    id_especialidad  INT NOT NULL IDENTITY(1,1),
    nombre_especialidad VARCHAR(50) NOT NULL,
    numero_profesor INT NOT NULL,
    CONSTRAINT pk_especialidad
    PRIMARY KEY (id_especialidad),
    CONSTRAINT uq_especialidad_nombre_especialidad
    UNIQUE (nombre_especialidad),
    CONSTRAINT fk_especialidad_profesor
    FOREIGN KEY (numero_profesor)
    REFERENCES profesor(numero_profesor)
);
GO