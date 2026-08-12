CREATE DATABASE empresa_empleados;
GO

USE empresa_empleados;
GO

CREATE TABLE puesto (
    clave_puesto INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nivel_jerarquico VARCHAR(50),
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2)
);
GO

CREATE TABLE departamento (
    clave_departamento INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ubicacion VARCHAR(100),
    presupuesto DECIMAL(12,2),
    jefe_departamento INT NULL
);
GO

CREATE TABLE sucursal (
    clave_sucursal INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ciudad VARCHAR(60),
    estado VARCHAR(60),
    telefono VARCHAR(20)
);
GO

CREATE TABLE empleado (
    numero_empleado INT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    curp VARCHAR(18),
    telefono VARCHAR(20),
    clave_departamento INT NOT NULL,
    clave_puesto INT NOT NULL,
    clave_sucursal INT NOT NULL,
    jefe_empleado INT NULL,
    CONSTRAINT fk_empleado_departamento FOREIGN KEY (clave_departamento)
        REFERENCES departamento (clave_departamento),
    CONSTRAINT fk_empleado_puesto FOREIGN KEY (clave_puesto)
        REFERENCES puesto (clave_puesto),
    CONSTRAINT fk_empleado_sucursal FOREIGN KEY (clave_sucursal)
        REFERENCES sucursal (clave_sucursal),
    CONSTRAINT fk_empleado_jefe FOREIGN KEY (jefe_empleado)
        REFERENCES empleado (numero_empleado)
);
GO

ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_jefe
FOREIGN KEY (jefe_departamento)
REFERENCES empleado (numero_empleado);
GO

CREATE TABLE proyecto (
    clave_proyecto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto DECIMAL(12,2)
);
GO

CREATE TABLE participa (
    numero_empleado INT NOT NULL,
    clave_proyecto INT NOT NULL,
    rol VARCHAR(80),
    horas INT,
    CONSTRAINT pk_participa PRIMARY KEY (numero_empleado, clave_proyecto),
    CONSTRAINT fk_participa_empleado FOREIGN KEY (numero_empleado)
        REFERENCES empleado (numero_empleado),
    CONSTRAINT fk_participa_proyecto FOREIGN KEY (clave_proyecto)
        REFERENCES proyecto (clave_proyecto)
);
GO

CREATE TABLE capacitacion (
    clave_capacitacion INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
GO

CREATE TABLE asiste (
    numero_empleado INT NOT NULL,
    clave_capacitacion INT NOT NULL,
    fecha DATE,
    calificacion DECIMAL(5,2),
    estado VARCHAR(30),
    CONSTRAINT pk_asiste PRIMARY KEY (numero_empleado, clave_capacitacion),
    CONSTRAINT fk_asiste_empleado FOREIGN KEY (numero_empleado)
        REFERENCES empleado (numero_empleado),
    CONSTRAINT fk_asiste_capacitacion FOREIGN KEY (clave_capacitacion)
        REFERENCES capacitacion (clave_capacitacion)
);
GO