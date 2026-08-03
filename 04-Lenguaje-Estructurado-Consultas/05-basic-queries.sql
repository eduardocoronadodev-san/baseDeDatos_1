
/*===================================================================



CONSULTAS BASICAS CON SELECT 


ARCHIVO : 05-basic-queries.sql 

Descripcion: 
    Desarrollar la capacidad para construir consultas basicas mediante select 


===================================================================*/


--abir en managegment 

USE comercial_db;
/*================================


Uso del SELECT *
FROM nombre_tabla;

NOTA: asterirscoo significa todas las columas(campos) de una tabla(no tan recomendado su uso)

Por que no se recomienda utilizarlo siempre ? 

1.-Recupera informacion innecesaria 
2.-Reduce claridad de la consulta 
3.-Puede aumentar el consumo de recursos


==============================*/



--SELECCIONAR TODOS LOS REGISTROS Y CAMPOS DE LA TABLA PRODUCTOS

SELECT *
FROM productos;


-- PROYECCION 
SELECT 
    codigo,
    nombre,
    precio
FROM productos;
GO 
--ALIAS DE COLUMNA 
--UN ALIAS DE COLUMNA ES UN NOMBRE TEMPORAL ASIGNADO A UNA COLUMNA
-- DENTRO DEL RESULTADO  DE COLUMNA 


SELECT 
    codigo,
    nombre,
    precio
FROM productos;


SELECT 
    codigo AS codigo_producto,
    nombre AS nombre_producto,
    precio AS precio_producto
FROM productos;
GO


-- OTRA MANERA MISMO RESULTADO
SELECT 
    codigo AS [codigo producto],
    nombre AS [nombre producto],
    precio AS [precio producto]
FROM productos;
GO



-- OTRA MANERA MISMO RESULTADO
SELECT 
    codigo AS 'codigo producto',
    nombre AS 'nombre producto',
    precio AS 'precio producto'
FROM productos;
GO

-- OTRA MANERA MISMO RESULTADO pero no recomendado 
SELECT 
    codigo  'codigo producto',
    nombre  'nombre producto',
    precio  'precio producto'
FROM productos;
GO


-- TRIM Y UPPER 
SELECT 
    codigo AS [codigo producto],
    TRIM(UPPER(nombre)) AS 'nombre producto',
    precio AS  precio_producto
FROM productos;
GO


--ALIAS DE TABLA 
-- TAMBIEN SE PUEDE ASIGNAR UN ALIAS TEMPORAL A UNA TABLA 

--SINTAXIS 
/*===========================================================

SELECT alias_tabla.columna
FROM nombre_tabla AS alias_tabla;

============================================================*/

SELECT 
    preoductos.codigo,
    preoductos.nombre,
    productos.precio
FROM productos;

SELECT 
    p.codigo,
    p.nombre,
    p.precio
FROM productos AS p;




-- EL SISTEMA SE CONFUNDIRA POR QUE EL NOMBRE DEL CAMPO (nombre)
--es igual en las dos tablas y pasa lo mismo con foreing key
SELECT nombre
FROM categorias
INNER JOIN productos 
ON id_categoria = id_categoria;



--SOLUCION
SELECT categoria.nombre, productos.nombre
FROM categorias
INNER JOIN productos 
ON categoria.id_categoria = productos.id_categoria;
GO


--SOLUCION 2 CON ALIAS 


SELECT 
    c.id_categoria,
    c.nombre,
    p.nombre,
    p.nombre,
    p.precio,
    p.existencia
FROM categorias AS [c]
INNER JOIN productos AS [p]
ON c.id_categoria = p.id_categoria;
GO

-- igual pero con nombre 

SELECT 
    c.id_categoria AS [#Categoria],
    c.nombre AS [Nombre Categoria],
    p.nombre AS [#Producto],
    p.nombre AS [Nombre producto],
    p.precio,
    p.existencia
FROM categorias AS [c]
INNER JOIN productos [p]
ON c.id_categoria = p.id_categoria;
GO



-- CAMPOS CALCULADOS ( DERIVADOS ) o columans calculadas 

-- UNA COLUMNA CALCULADA ES EL RESULTADO DE UNA EXPRECION 
--INCLUIDA EN LA LISTA DE SELECCION
-- NO EXISTE FISICAMENTE EN LA TABLA 

SELECT 
    p.codigo,
    p.codigo,
    p.nombre,
    p.precio,
    p.existencia * p.precio AS valor_inventario
FROM productos AS p;
GO 



/*============================================
OPERADORES ARITMETICOS EN SQL SEVER

+ SUMA
- RESTA
* MULTIPLICACION
/ DIVICION 
% MODULO
============================================*/




-- SELECCIONAR EL NOMBRE , apellido paterno , salario y simular 
-- como quedaria el salario  de cada empleado }
-- sio reciviera un aumento fijo de $1000

-- El campo se debe llamar "salario_simulado"





SELECT 
    e.nombre,
    e.apellido_paterno,
    e.apellido_materno,
    CONCAT(e.nombre,'', e.apellido_paterno,'',  e.apellido_materno) AS nombre_compelto,
    YEAR(e.fecha_ingreso) AS año_ingreso,
    MONTH(e.fecha_ingreso) AS mes_ingreso,
    DAY(e.fecha_ingreso) AS dia_ingreso,
    e.fecha_ingreso.
    e.salario
    (e.salario + 1000) AS salario_simulado
FROM empleado AS [e]; 
GO



-- Mostrar de una venta cual es su numero,
-- cantidad vendida, precio, descuento 
-- importe bruto (este se calcula (cantidad*precio)) y ademas
-- el importe con descuento (importe_bruto * descuento /100)


SELECT
    dv.id_detalle_venta AS numero_venta,
    dv.cantidad,
    dv.precio,
    dv.descuento,
    (dv.cantidad * dv.precio) AS importe_bruto,
    ((dv.cantidad * dv.precio * dv.descuento)/100.0) AS importe_descuento
FROM detalle_ventas AS dv;



--USO DE LA CLAUSULA DISTINCT

/*==============================

elimina del resultado las filas que tengan valofres repetidos en 
todas las columnas 
===============================================*/

SELECT 
    c.sexo
FROM clientes AS c;

SELECT COUNT(c.sexo) AS cantidad_sexo
FROM clientes AS c;


SELECT COUNT(DISTINCT sexo) AS numero_sexos
FROM clientes AS c;
 --o tambien puedes poner el campo 


--otro
 SELECT COUNT (DISTINCT c.sexo) AS [mujeres]

 FROM clientes 
 WHERE sexo = 'M';




 --seleccionar los dsitintos descuentos que se realizan a 
 -- las ventas 


SELECT DISTINCT(descuento) AS tipos_descuentos
FROM detalle_venta AS dv;




-- TODO: DISTINCT CON MAS DE UN CAMPO 


--CUANDO EL DISTICT SE UTILIZA CON VARIAS COLUMNAS,
--SE EVAKUA LA COMBINACION COMPLETA 


SELECT 
    id_categoria,
    id_producto
FROM productos;
GO


SELECT 
    id_cliente,
    id_empleado
FROM ventas
ORDER BY 1 DESC, 2 DESC;
GO

SELECT DISTINCT 
    id_cliente,
    id_empleado
FROM ventas
ORDER BY 1 DESC, 2 DESC;
GO


--USO DE TOP

--LIMITA LA CANTIDAD DE FILAS DE VUELTAS POR UNA CONSULTA 
--TOP LIMITA UNA CONSULTA (MUCHOS REGISTROS , SOLO QUIERO VER "100", SE LLAMA LIMIT EN OTROS GESTORES)

SELECT TOP (5)
    id_producto,
    codigo,
    nombre,
    precio
FROM productos;
ORDER BY precio DESC;

SELECT TOP(10)
    nombre 
FROM clientes;

--TOP CON EXPRESIONES CALCULADAS

SELECT 
    codigo,
    nombre,
    precio,
    existencia,
    (precio * existencia ) AS valor_inventario
FROM productos;

-- TOP CON PORCENTAJE 

--SQL SERVER PERMITE LIMITAR EL RESULTADO MIENDIOANTE UN PORCENTAJE 

SELECT TOP(10) PERCENT
    codigo,
    nombre,
    precio,
    existencia,
    (precio * existencia ) AS valor_inventario
FROM productos;

--COMBINAR DISTICT CON TOP 
SELECT DISTINCT TOP (3)
    descuento
FROM detalle_ventas;

