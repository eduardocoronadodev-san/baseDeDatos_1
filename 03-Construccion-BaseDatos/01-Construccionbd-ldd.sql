
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
VALUES (1 ,'Panfilo', 'correo@correo.com')


INSERT INTO alumno_4
VALUES (2, 'Monico', 'correo2@correo.com');

-- PRIMARY KEY CON IDENTITY }

CREATE TABLE profesor (
	profesor_id INT NOT NULL IDENTITY (1,1),
	nombre VARCHAR(100) NOT NULL,
	edad INT NULL,
	CONSTRAINT pk_profesor
	PRIMARY KEY (pk_profesor),

);


INSERT INTO profesor 
VALUES ('German', 29),
		('Mari', 22 );


SELECT *
FROM profesor;


--RESTRICCION UNIQUE

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
	


--RESTRICCION DEFAULT
--FORMA MAS FEA DE HACERL
-- USAR SEGUNDA O TERCERA OPCION
DROP TABLE categoria;

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1), PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL UNIQUE ,
	activo BIT DEFAULT 1
);

GO

CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(30) NOT NULL
	CONSTRAINT uq_categoria_nombre UNIQUE,
	activo BIT
	CONSTRAINT df_categoria_activo 
	DEFAULT 1
	CONSTRAINT pk_categoria 
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre 
	UNIQUE (nombre)

);

GO

INSERT INTO categoria
VALUES('Carnes Frias', 1),

INSERT INTO categoria
VALUES('Carnes Frias', DEFAULT);


INSERT INTO categoria
VALUES('Carnes calientes', DEFAULT);

INSERT INTO categoria (nombre)
VALUES('Chochos');



--RESTRICCION CHECK 
--OPCION DE CONSTRUCCION 1

CREATE TABLE producto (
	producti_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL (10,2) NOT NULL CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia<=100)
	activo BIT NOT NULL DEFAULT 1 

);
GO 
--OPCION DE CONSTRUCCION 2



CREATE TABLE producto (
	producto_id INT IDENTITY(1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	precio DECIMAL (10,2) NOT NULL 
	CHECK (precio>0),
	existencia INT NOT NULL CHECK (existencia>0 AND existencia<=100),
	activo BIT NOT NULL 
	CONSTRAINT df_producto_activo
	DEFAULT 1

);
GO 

--OPCION DE CONSTRUCCION 3 
-- la unica que no se puede hacer separado es defaul ( restriccion)
CREATE TABLE producto(
	producto INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(80) NULL,
	precio DECIMAL(10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL,
	CONSTRAINT df_producto_activo
	DEFAULT 1,
		--RESTRICCION DE PK
	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id)
	--RESTRICCION UNIQUE 
	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),
	--RESTRICCION DE CHECK PRECIO
	CONSTRAINT ck_producto_precio 
	CHECK (precio>0),
	--RESTRICCION CHECK PARA EXISTENCIA 
	CONSTRAINT ck_producto_existencia
	CHECK (existencia between 1 AND 100)

);


INSERT INTO producto
VALUES('Pitufo', 200, 99, 0);



INSERT INTO producto
VALUES('Quemadita', 200, 100, DEFAULT );


INSERT INTO producto (nombre, existencia,  precio )
VALUES('Pantera rosa', 47, 80);




INSERT INTO producto
VALUES(1 'Pitufo',NULL, 200, 99, 0);


INSERT INTO producto
VALUES(2 'Quemadita',NULL, 200, 100, DEFAULT);


INSERT INTO producto (product_id, nombre, existencia,  precio )
VALUES(3, 'Pantera rosa', 47, 80);

SELECT *FROM producto;





---CREAR UNA NUVEA BASE DE DATOS LLAMADA "EMPRESA PATITO"
--CREA BASE DE DATOS

CREATE DATABASE empresa_patito;
GO

USE empresa_patito;
GO

--RESTRICICION DE FOREING KEY 
CREATE TABLE provedor(
	provedor_id INT NOT NULL IDENTITY(1,1),
	empresa VARCHAR(35) NOT NULL,
	direccion VARCHAR(80) NULL,
	limite_credito DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_provedor
	PRIMARY KEY (provedor_id),
	CONSTRAINT uq_provedor_a_empresa
	UNIQUE (empresa),
	--CHECK PARA LIMITE DE CREDITO 
	CONSTRAINT ck_provedor_limite_credito
	CHECK (limite_credito>0.O AND limite:credito<=100000)

);
GO

-- CON CLAVE COMPUESTA NO SE DEBE PONER IDENTITY

CREATE TABLE producto (
	fabricante_id CHAR(3) NOT NULL,
	producto_id INT NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	CONSTRAINT uq_producto_nombre
	UNIQUE,
	stock INT NOT NULL,
	CONSTRAINT ck_producto_stock
	CHECK (stock BETWEEN 1 AND 100),
	precio DECIMAL(10,2) NOT NULL,
	CONSTRAINT ck_producto_precio
	CHECK (precio>0.0),
	activo BIT NOT NULL,
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	provedor_id INT NOT NULL,
	CONSTRAINT pk_producto 
	PRIMARY KEY (fabricante_id, producto_id),
	CONSTRAINT fk_producto_provedo
	FOREIGN KEY (provedor_id) 
	REFERENCES provedor(provedor_id)
);
GO


--INTEGRADES REFERENCIALES ON DELETE Y UN UPDATE , ATION , CASCADE , SET NULL , Y SET DEFAULT 

CREATE DATABASE construccion;

USE construccion;
GO

-- NO ACTION 
-- SEFGUNDA FORMAde modo de tabla
CREATE TABLE cliente(
	cliente_is INT NOT NULL,
	CONSTRAINT pk_cliente
	PRYMARY KEY (cliente_id),
	empresa VARCHAR(20) NOT NULL,
	CONSTRAINT uq_cliente_empresa
	UNIQUE (empresa),
	direccion VARCHAR(50) NULL,
	tel VARCHAR(15) NOT NULL,
	activo BIT NOT NULL,
	create_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NULL
	SELECT SYSDATETIME();
	);
	GO


-- on delet y on update es el valor por defult 

CREATE TABLE telefono(
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR(15) NOT NULL,
	create_at DATETIME2 NOT NULL,
	CONSTRAINT df_telefono_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_telefono_id
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	);

INSERT INTO cliente
VALUES(1,'Patito de Hule', NULL, '773-def-123',1, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2,'Taqueria Mr. Linux ', '7731234567',1);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES	('773-123-4567', 1),		
		('455-123-4568', 1),
		('561-123-4569', 2);
		('773-146-2476', 2);




-- ELIMINAR CON ON DELETE EN NO ACTION
-- SE ELIMINAN PRIMERO LOS HIJOS 
DELETE FROM telefono
WHERE cliente_id = 1;
--DESPUES SE ELIMINA PADRE 
DELETE FROM cliente
WHERE cliente_id = 1;


SELECT * FROM cliente;
SELECT * FROM telefono;


-- PARA AACTUALIZAR EN ON UPDATE EN NO ACTION SE TIENE QUE ACTUALIZAR EL HIJO PRIMERO 
--(poniendolo en nulo)

UPDATE telefono
SET cliente_id = NULL,
WHERE cliente_id = 2;

UPDATE cliente
SET cliente_id = 3
WHERE cliente_id = 2;


-- actualiza el hijo con el nuevo id del padre
UPDATE telefono
SET cliente_id = 3
WHERE cliente_id IS NULL;


-- INTEGRIDAD REFERENCIAL ON DELETE Y ON UPDATE CASCADE 


DROP TABLE telefono;
	
CREATE TABLE cliente(
	cliente_is INT NOT NULL,
	CONSTRAINT pk_cliente
	PRYMARY KEY (cliente_id),
	empresa VARCHAR(20) NOT NULL,
	CONSTRAINT uq_cliente_empresa
	UNIQUE (empresa),
	direccion VARCHAR(50) NULL,
	tel VARCHAR(15) NOT NULL,
	activo BIT NOT NULL,
	create_at DATETIME2 NOT NULL 
	CONSTRAINT df_cliente_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NULL
	SELECT SYSDATETIME();
	);
	GO


CREATE TABLE telefono(
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR(15) NOT NULL,
	create_at DATETIME2 NOT NULL,
	CONSTRAINT df_telefono_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_telefono_id
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE NO CASCADE
	ON UPDATE NO CASCADE
	);


SELECT * FROM cliente;INSERT INTO cliente
VALUES(1,'Patito de Hule', NULL, '773-def-123',1, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2,'Taqueria Mr. Linux ', '7731234567',1);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES	('773-123-4567', 1),		
		('455-123-4568', 1),
SELECT * FROM telefono;

INSERT INTO cliente
VALUES(1,'Patito de Hule', NULL, '773-def-123',1, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2,'Taqueria Mr. Linux ', '7731234567',1);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES	('773-123-4567', 1),		
		('455-123-4568', 1),
		('561-123-4569', 2)

--ELIMINAR EN ON DELETE CASCADE 

-- ELIMINAR AL PADRE 

DELETE FROM cliente
WHERE cliente_id = 1;

--ACTUALIZAR ON UIPDATE CASCADE 
UPDATE cliente 
SET cliente_id = 10
WHERE cliente_id =1;




DROP TABLE telefono;


-- ON DELETE ON UPDATE , SET NULL
-- la foreing key debe ser null
CREATE TABLE telefono(
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR(15) NOT NULL,
	create_at DATETIME2 NOT NULL,
	CONSTRAINT df_telefono_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_telefono_id
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
	);



INSERT INTO cliente (empresa, tel, activo )
VALUES (11,'Bimbo', '566788999',1 )
INSERT INTO cliente
VALUES(1,'Patito de Hule', NULL, '773-def-123',1, DEFAULT, DEFAULT);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(2,'Taqueria Mr. Linux ', '7731234567',1);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES	('773-123-6567', 11),		
		('455-123-3568', 11),
		('773-123-4567', 11),		
		('455-123-4538', 3);




SELECT * FROM cliente;

DELETE FROM cliente
WHERE cliente_id = 11;


-- lo hace nulo 
UPDATE cliente
SET cliente_id = 15
WHERE cliente_id = 3;


--ON DELETE  CON IUPDATE SET NULL

DROP TABLE telefono;
GO

CREATE TABLE telefono(
	telefono_id INT IDENTITY(1,1),
	numero_telefono VARCHAR(15) NOT NULL,
	create_at DATETIME2 NOT NULL,
	CONSTRAINT df_telefono_create_at
	DEFAULT SYSDATETIME(),
	update_at DATETIME2 NOT NULL
	CONSTRAINT df_telefono_update_at
	DEFAULT SYSDATETIME(),
	cliente_id INT
	CONSTRAINT df_telefono_cliente_id 
	DEFAULT 0,
	CONSTRAINT pk_telefono
	PRIMARY KEY (telefono_id),
	CONSTRAINT uq_telefono_numero_telefono
	UNIQUE (numero_telefono),
	CONSTRAINT ck_telefono_telefono_id
	CHECK (numero_telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	CONSTRAINT fk_telefono_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES cliente(cliente_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
	);

INSERT INTO cliente (cliente_id, empresa, tel, activo)
VALUES(3 ,'Mostrador', '6671234567',1);


INSERT INTO telefono (tel, cliente_id)
VALUES('7731234567',10);

INSERT INTO telefono(numero_telefono, cliente_id)
VALUES	('773-123-6567', 10),		
		('455-123-3568', 10),
		('773-123-4567', 10),		
		('455-123-4538', 15);



ON DELETE FROM cliente
WHERE cliente_id = 10;
-- telefonos apareceran en 0 



UPDATE cliente
SET cliente_id = 17
WHERE cliente_id = 15;
-- cliente de id de tabla telefono se cambio a 0 

SELECT * FROM cliente;
SELECT * FROM telefono;



--git status 
--git add .
-- git commit 
-- se termino de crear tablas, restricciones, unique, primary key, 
-- check, foreing key, (ON DELETE, ON UPDATE CASCADE, SET NULL , SET DEFULT 
-- Y NO ACTION) utilizando nombrenclatura snake_case
--

antes de crear el otro archivo en carpeta 