/*=========================================================


 Un join permite conboinar información de dos o más tablas 
  utilizando una informacion entre ellas 

=============================================================*/

USE NORTHWND;





SELECT*
FROM Employees;

SELECT
	ProductID AS numero_producto,
	ProductName AS nombre_producto,
	UnitPrice AS precio,
	UnitsInStock AS existencia,

	(p.UnitPrice * p.UnitsInStock AS valor_inventario,
	CategoryID AS numero_categoria,
	CategoryName AS nombre_categoria 
FROM Products AS p
INNER JOIN
Categories AS c
ON c.CategoryID = p.CategoryID
INNER JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID;



SELECT 
    ProductID AS [numero_producto],
    ProductName AS [nombre_producto],
    UnitPrice AS [precio],
    UnitsInStock AS [existencia],
    (p.UnitPrice * p.UnitsInStock) AS [valor_inventario],
    c.CategoryID AS [numero_categoria],
    c.CategoryName AS [nombre_categoria],
    s.CompanyName AS [nombre_proveedor]
FROM Products AS p
INNER JOIN 
Categories AS c
ON c.CategoryID = p.CategoryID
INNER JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID
WHERE p.UnitsInStock<>0
    AND c.CategoryName IN ('Seafood', 'Confections', 'Beverages')
    AND p.ProductName LIKE 'C%'
ORDER BY valor_inventario ASC;

-- Seleccionar los datos de los clientes que han hecho pedidos 
-- mostrando el numero de cliente , el nombre del cliente (companyName)
-- numeor de order , la fecha de orden 

SELECT 
    o.OrderID AS [numero_orden],
    o.OrderDate AS [fecha_orden],
    UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
    UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
    DATEPART(YEAR, o.OrderDate ) AS [año_orden],
    o.CustomerID AS [numero_cliente],
    c.CompanyName AS [nombre_cliente]
FROM Orders AS o
INNER JOIN 
Customers AS c
ON c.CustomerID = o.customerID;


-- Seleccioanr ademas del cliente al que se le vendieron los productos ,
-- quermemos saber el nombre del empleado en formato FULLNAME, 
-- que atendio el pedido
SELECT 
    o.OrderID AS [numero_orden],
    o.OrderDate AS [fecha_orden],
    UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS [mes_orden],
    UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS [dia_orden],
    DATEPART(YEAR, o.OrderDate ) AS [año_orden],
    o.CustomerID AS [numero_cliente],
    c.CompanyName AS [nombre_cliente],
    CONCAT(e.FirstName,'', e.LastName) AS nombre_empleado
FROM Orders AS o
INNER JOIN 
Customers AS c
ON c.CustomerID = o.customerID
INNER JOIN 
Employees AS e
ON c.CustomerID = o.customerID
