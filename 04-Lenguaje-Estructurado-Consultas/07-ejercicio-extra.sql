--sekeccionar la base de datos 

USE NORTHWND;


-- Mostrar clientes de mexico y alemania y ademas que sean solo de Stuttgart
SELECT 
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.Country
FROM Customers AS c
WHERE c.Country = 'Mexico'
	OR
	(c.Country = 'Germany'
	AND c.City = 'Stuttgart');


SELECT 
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.Country
FROM Customers AS c
WHERE c.Country IN ( 'Mexico', 'Germany')
	  OR c.City = 'Sttudgart';



-- Mostrar las ventass realizadas en francia , bracil y belgica 
-- del 10 de julio de 1996 al 31 de diciembre de 1998 , pero que tengan region de envio 
-- para los clientes VICTE, HANAR ,SUPRD y ordenados por fecha de pedidos de las mas cercana
-- a la mas antigua 

SELECT 
	o.OrderID AS [ numero_orden],
	o.CustomerID AS cliente,
	o.ShipCountry AS pais_envio,
	o.OrderDate AS fecha,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS mes_pedido,
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS mes_pedido,
	DATEPART(YEAR, o.OrderDate) AS año_pedido

FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'Belgium' )
	AND
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31'
	AND
	o.ShipRegion is NOT NULL
	AND 
	o. CustomerID IN ('VICTE', 'HANAR' ,'SUPRD')
	ORDER BY o.OrderDate DESC;