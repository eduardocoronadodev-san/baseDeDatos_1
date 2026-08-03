# Ejercicio 1 Clinica
```sql
CREATE DATABASE clinica;
GO

USE clinica;
GO

CREATE TABLE paciente(
    num_paciente INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(15) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT pk_paciente 
        PRIMARY KEY (num_paciente)
);
GO

CREATE TABLE expediente(
    num_expediente INT NOT NULL IDENTITY(1,1),
    fecha_apertura DATE NOT NULL,
    tipo_sangre VARCHAR(3) NOT NULL,
    num_paciente INT NOT NULL,
    CONSTRAINT pk_expediente 
        PRIMARY KEY (num_expediente),
        UNIQUE (num_paciente),  
    CONSTRAINT fk_expediente_paciente 
        FOREIGN KEY (num_paciente) 
        REFERENCES paciente(num_paciente)
);
GO
```
![Ejercicio1_construccion](../img/construccionbd/ejercicio1.png)
