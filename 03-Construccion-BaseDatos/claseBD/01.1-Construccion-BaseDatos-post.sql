
-- =====================================================
-- CREA UNA BASE DE DATOS
-- =====================================================

DROP DATABASE IF EXISTS universidad;

CREATE DATABASE universidad;

-- En PostgreSQL no existe USE.
-- En psql se utiliza:
\c universidad


-- =====================================================
-- CREAR UNA TABLA
-- =====================================================

DROP TABLE IF EXISTS alumno;

CREATE TABLE alumno (
    alumno_id INT,
    nombre VARCHAR(100),
    edad INT
);


-- =====================================================
-- CREAR NUEVA TABLA
-- =====================================================

DROP TABLE IF EXISTS alumno_2;

CREATE TABLE alumno_2 (
    alumno_id INT,
    nombre VARCHAR(100),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_nacimiento DATE,
    correo VARCHAR(45)
);


-- =====================================================
-- RESTRICCIONES
-- =====================================================

DROP TABLE IF EXISTS alumno_3;

CREATE TABLE alumno_3 (
    alumno_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(40)
);


DROP TABLE IF EXISTS alumno_4;

CREATE TABLE alumno_4 (
    alumno_id INT NOT NULL,
    nombre VARCHAR(100),
    correo VARCHAR(40),

    CONSTRAINT pk_alumno_4
        PRIMARY KEY (alumno_id)
);


INSERT INTO alumno_4
VALUES (1, 'Panfilo', 'correo@correo.com');


INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com');


SELECT *
FROM alumno_4;


-- =====================================================
-- PRIMARY KEY CON IDENTITY
-- =====================================================

DROP TABLE IF EXISTS profesor;

CREATE TABLE profesor (
    profesor_id INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NULL,

    CONSTRAINT pk_profesor
        PRIMARY KEY (profesor_id)
);


INSERT INTO profesor (nombre, edad)
VALUES
    ('German', 29),
    ('Mari', 22);


SELECT *
FROM profesor;


-- =====================================================
-- RESTRICCIÓN UNIQUE
-- =====================================================

DROP TABLE IF EXISTS materia;

CREATE TABLE materia (
    materia_id INT GENERATED ALWAYS AS IDENTITY,
    correo VARCHAR(50) NOT NULL,

    CONSTRAINT pk_materia
        PRIMARY KEY (materia_id),

    CONSTRAINT uq_materia_correo
        UNIQUE (correo)
);


INSERT INTO materia (correo)
VALUES ('correo@correo.com');


INSERT INTO materia (correo)
VALUES ('correo2@correo.com');


SELECT *
FROM materia;


-- =====================================================
-- RESTRICCIÓN DEFAULT
-- FORMA 1: RESTRICCIONES EN LAS COLUMNAS
-- =====================================================

DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    categoria_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    activo BOOLEAN DEFAULT TRUE
);


INSERT INTO categoria (nombre, activo)
VALUES ('Carnes Frias', TRUE);


INSERT INTO categoria (nombre, activo)
VALUES ('Carnes calientes', DEFAULT);


INSERT INTO categoria (nombre)
VALUES ('Chochos');


SELECT *
FROM categoria;


-- =====================================================
-- RESTRICCIÓN DEFAULT
-- FORMA 2: RESTRICCIONES CON NOMBRE
-- =====================================================

DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    categoria_id INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(30) NOT NULL,
    activo BOOLEAN,

    CONSTRAINT pk_categoria
        PRIMARY KEY (categoria_id),

    CONSTRAINT uq_categoria_nombre
        UNIQUE (nombre),

    CONSTRAINT df_categoria_activo
        DEFAULT TRUE FOR activo
);
```

> PostgreSQL no permite declarar un `DEFAULT` separado con la sintaxis `DEFAULT ... FOR columna`. Por eso, la forma correcta es colocar el `DEFAULT` dentro de la definición de la columna:

```sql
DROP TABLE IF EXISTS categoria;

CREATE TABLE categoria (
    categoria_id INT GENERATED ALWAYS AS IDENTITY,
    nombre VARCHAR(30) NOT NULL,
    activo BOOLEAN CONSTRAINT df_categoria_activo DEFAULT TRUE,

    CONSTRAINT pk_categoria
        PRIMARY KEY (categoria_id),

    CONSTRAINT uq_categoria_nombre
        UNIQUE (nombre)
);


INSERT INTO categoria (nombre, activo)
VALUES ('Carnes Frias', TRUE);


INSERT INTO categoria (nombre, activo)
VALUES ('Carnes calientes', DEFAULT);


INSERT INTO categoria (nombre)
VALUES ('Chochos');


SELECT *
FROM categoria;


-- =====================================================
-- RESTRICCIÓN CHECK
-- OPCIÓN DE CONSTRUCCIÓN 1
-- =====================================================

DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
    producto_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    existencia INT NOT NULL CHECK (
        existencia > 0
        AND existencia <= 100
    ),
    activo BOOLEAN NOT NULL DEFAULT TRUE
);


INSERT INTO producto (nombre, precio, existencia, activo)
VALUES ('Pitufo', 200, 99, FALSE);


INSERT INTO producto (nombre, precio, existencia, activo)
VALUES ('Quemadita', 200, 100, DEFAULT);


INSERT INTO producto (nombre, existencia, precio)
VALUES ('Pantera rosa', 47, 80);


SELECT *
FROM producto;


-- =====================================================
-- RESTRICCIÓN CHECK
-- OPCIÓN DE CONSTRUCCIÓN 2
-- =====================================================

DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
    producto_id INT GENERATED ALWAYS AS IDENTITY
        CONSTRAINT pk_producto PRIMARY KEY,

    nombre VARCHAR(20) NOT NULL
        CONSTRAINT uq_producto_nombre UNIQUE,

    precio DECIMAL(10,2) NOT NULL
        CONSTRAINT ck_producto_precio CHECK (precio > 0),

    existencia INT NOT NULL
        CONSTRAINT ck_producto_existencia
        CHECK (existencia > 0 AND existencia <= 100),

    activo BOOLEAN NOT NULL
        CONSTRAINT df_producto_activo DEFAULT TRUE
);


INSERT INTO producto (nombre, precio, existencia, activo)
VALUES ('Pitufo', 200, 99, FALSE);


INSERT INTO producto (nombre, precio, existencia, activo)
VALUES ('Quemadita', 200, 100, DEFAULT);


INSERT INTO producto (nombre, existencia, precio)
VALUES ('Pantera rosa', 47, 80);


SELECT *
FROM producto;


-- =====================================================
-- RESTRICCIÓN CHECK
-- OPCIÓN DE CONSTRUCCIÓN 3
-- RESTRICCIONES SEPARADAS
-- =====================================================

DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
    producto_id INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    descripcion VARCHAR(80) NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    activo BOOLEAN NOT NULL
        CONSTRAINT df_producto_activo DEFAULT TRUE,

    -- RESTRICCIÓN DE PRIMARY KEY
    CONSTRAINT pk_producto
        PRIMARY KEY (producto_id),

    -- RESTRICCIÓN UNIQUE
    CONSTRAINT uq_producto_nombre
        UNIQUE (nombre),

    -- RESTRICCIÓN CHECK PARA PRECIO
    CONSTRAINT ck_producto_precio
        CHECK (precio > 0),

    -- RESTRICCIÓN CHECK PARA EXISTENCIA
    CONSTRAINT ck_producto_existencia
        CHECK (existencia BETWEEN 1 AND 100)
);


INSERT INTO producto
VALUES (
    1,
    'Pitufo',
    NULL,
    200,
    99,
    FALSE
);


INSERT INTO producto
VALUES (
    2,
    'Quemadita',
    NULL,
    200,
    100,
    DEFAULT
);


INSERT INTO producto (
    producto_id,
    nombre,
    existencia,
    precio
)
VALUES (
    3,
    'Pantera rosa',
    47,
    80
);


SELECT *
FROM producto;


-- =====================================================
-- CREAR BASE DE DATOS EMPRESA PATITO
-- =====================================================

\c postgres

DROP DATABASE IF EXISTS empresa_patito;

CREATE DATABASE empresa_patito;

\c empresa_patito


-- =====================================================
-- RESTRICCIÓN DE FOREIGN KEY
-- TABLA PROVEEDOR
-- =====================================================

DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS proveedor;

CREATE TABLE proveedor (
    proveedor_id INT GENERATED ALWAYS AS IDENTITY,
    empresa VARCHAR(35) NOT NULL,
    direccion VARCHAR(80) NULL,
    limite_credito DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_proveedor
        PRIMARY KEY (proveedor_id),

    CONSTRAINT uq_proveedor_empresa
        UNIQUE (empresa),

    -- CHECK PARA LÍMITE DE CRÉDITO
    CONSTRAINT ck_proveedor_limite_credito
        CHECK (
            limite_credito > 0.0
            AND limite_credito <= 100000
        )
);


-- =====================================================
-- CON CLAVE COMPUESTA NO SE DEBE PONER IDENTITY
-- =====================================================

DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
    fabricante_id CHAR(3) NOT NULL,
    producto_id INT NOT NULL,

    nombre VARCHAR(20) NOT NULL,

    stock INT NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    activo BOOLEAN NOT NULL
        CONSTRAINT df_producto_activo DEFAULT TRUE,

    proveedor_id INT NOT NULL,

    CONSTRAINT pk_producto
        PRIMARY KEY (fabricante_id, producto_id),

    CONSTRAINT uq_producto_nombre
        UNIQUE (nombre),

    CONSTRAINT ck_producto_stock
        CHECK (stock BETWEEN 1 AND 100),

    CONSTRAINT ck_producto_precio
        CHECK (precio > 0.0),

    CONSTRAINT fk_producto_proveedor
        FOREIGN KEY (proveedor_id)
        REFERENCES proveedor (proveedor_id)
);


-- 1. CREAR UNA BASE DE DATOS 
CREATE DATABASE construccion;

-- NOTA: Conéctate a la base de datos 'construccion' en tu cliente SQL antes de continuar.

-- ===========================================================================
-- PARTE 1: NO ACTION (Comportamiento por defecto)
-- ===========================================================================

-- CREAR TABLA PADRE: cliente
CREATE TABLE cliente(
    cliente_id INT NOT NULL, -- Corregido: cliente_is -> cliente_id
    empresa VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NULL,
    tel VARCHAR(15) NOT NULL,
    activo BOOLEAN NOT NULL, -- En Postgres se usa BOOLEAN en vez de BIT
    create_at TIMESTAMP NOT NULL DEFAULT NOW(), -- DATETIME2 -> TIMESTAMP, SYSDATETIME() -> NOW()
    update_at TIMESTAMP NULL, -- Se eliminó el "SELECT SYSDATETIME()" erróneo
    CONSTRAINT pk_cliente PRIMARY KEY (cliente_id), -- Corregido: PRYMARY -> PRIMARY
    CONSTRAINT uq_cliente_empresa UNIQUE (empresa)
);


-- CREAR TABLA HIJO: telefono
CREATE TABLE telefono(
    telefono_id INT GENERATED BY DEFAULT AS IDENTITY, -- IDENTITY(1,1) -> GENERATED AS IDENTITY
    numero_telefono VARCHAR(15) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT NOW(),
    update_at TIMESTAMP NOT NULL DEFAULT NOW(),
    cliente_id INT,
    CONSTRAINT pk_telefono PRIMARY KEY (telefono_id),
    CONSTRAINT uq_telefono_numero_telefono UNIQUE (numero_telefono),
    -- Corregido: En Postgres se usa el operador ~ para evaluar expresiones regulares tipo [0-9]
    CONSTRAINT ck_telefono_numero_telefono CHECK (numero_telefono ~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'),
    CONSTRAINT fk_telefono_cliente FOREIGN KEY (cliente_id)
        REFERENCES cliente(cliente_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

-- INSERTAR DATOS
-- Nota: En Postgres para el tipo BOOLEAN usamos TRUE / FALSE o '1' / '0'
INSERT INTO cliente
VALUES(1, 'Patito de Hule', NULL, '773-123-1234', TRUE, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2, 'Taqueria Mr. Linux ', '7731234567', TRUE);

-- Insertar usando la lista de columnas (requerido porque telefono_id se autogenera)
-- Corregido: Se unificaron los inserts y se quitó un punto y coma intermedio
INSERT INTO telefono(numero_telefono, cliente_id)
VALUES  ('773-123-4567', 1),        
        ('455-123-4568', 1),
        ('561-123-4569', 2),
        ('773-146-2476', 2);


-- ELIMINAR CON ON DELETE EN NO ACTION
-- Se eliminan primero los hijos 
DELETE FROM telefono WHERE cliente_id = 1;
-- Después se elimina el padre 
DELETE FROM cliente WHERE cliente_id = 1;

SELECT * FROM cliente;
SELECT * FROM telefono;


-- ACTUALIZAR CON ON UPDATE EN NO ACTION
-- Modificamos primero al hijo (dejándolo huérfano temporalmente)
-- Corregido: Se quitó una coma extra antes de WHERE
UPDATE telefono SET cliente_id = NULL WHERE cliente_id = 2;

-- Actualizamos el ID del padre
UPDATE cliente SET cliente_id = 3 WHERE cliente_id = 2;

-- Vinculamos al hijo de nuevo con el nuevo ID del padre
UPDATE telefono SET cliente_id = 3 WHERE cliente_id IS NULL;



-- ===========================================================================
-- PARTE 2: ON DELETE Y ON UPDATE CASCADE
-- ===========================================================================

-- Limpiamos las tablas anteriores para recrearlas con CASCADE
DROP TABLE IF EXISTS telefono;
DROP TABLE IF EXISTS cliente;
    
CREATE TABLE cliente(
    cliente_id INT NOT NULL,
    empresa VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NULL,
    tel VARCHAR(15) NOT NULL,
    activo BOOLEAN NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT NOW(),
    update_at TIMESTAMP NULL,
    CONSTRAINT pk_cliente PRIMARY KEY (cliente_id),
    CONSTRAINT uq_cliente_empresa UNIQUE (empresa)
);

CREATE TABLE telefono(
    telefono_id INT GENERATED BY DEFAULT AS IDENTITY,
    numero_telefono VARCHAR(15) NOT NULL,
    create_at TIMESTAMP NOT NULL DEFAULT NOW(),
    update_at TIMESTAMP NOT NULL DEFAULT NOW(),
    cliente_id INT,
    CONSTRAINT pk_telefono PRIMARY KEY (telefono_id),
    CONSTRAINT uq_telefono_numero_telefono UNIQUE (numero_telefono),
    CONSTRAINT ck_telefono_numero_telefono CHECK (numero_telefono ~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'),
    CONSTRAINT fk_telefono_cliente FOREIGN KEY (cliente_id)
        REFERENCES cliente(cliente_id)
        -- Corregido: La sintaxis correcta es CASCADE (no lleva la palabra "NO")
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insertamos datos nuevamente
INSERT INTO cliente
VALUES(1, 'Patito de Hule', NULL, '773-123-1234', TRUE, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2, 'Taqueria Mr. Linux ', '7731234567', TRUE);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES  ('773-123-4567', 1),        
        ('455-123-4568', 1),
        ('561-123-4569', 2);

SELECT * FROM cliente;
SELECT * FROM telefono;


-- PRUEBA DE ELIMINAR EN ON DELETE CASCADE 
-- Al eliminar al Padre (cliente_id = 1), Postgres eliminará AUTOMÁTICAMENTE 
-- todos sus teléfonos asociados en la tabla 'telefono'.
DELETE FROM cliente WHERE cliente_id = 1;


-- PRUEBA DE ACTUALIZAR EN ON UPDATE CASCADE 
-- Al cambiar el ID del Padre (cliente_id = 2 pasará a ser 10), Postgres
-- actualizará AUTOMÁTICAMENTE la columna cliente_id de sus teléfonos hijos a 10.
UPDATE cliente 
SET cliente_id = 10
WHERE cliente_id = 2; -- Cambiado a 2 porque el cliente 1 ya lo borramos arriba

-- Verifica los cambios automáticos
SELECT * FROM cliente;
SELECT * FROM telefono;
