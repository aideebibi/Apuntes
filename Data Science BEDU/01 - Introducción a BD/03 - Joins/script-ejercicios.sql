/*=================================================================
||	             EJERCICIOS PARA PRACTICAR                      ||
=================================================================
*/
USE classicmodels;

-- Para estas consultas usa INNER JOIN

-- Ejercicio 1. Obtén la cantidad de productos de cada orden.
SELECT o.orderNumber, sum(od.quantityOrdered) as cantidad_productos
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

-- Ejercicio 2. Obtén el número de orden, estado y costo total de cada orden.
SELECT o.orderNumber, o.status, sum(od.quantityOrdered * od.priceEach) as total
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.status;

-- Ejercicio 3. Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
SELECT o.orderNumber, o.requiredDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
-- Ejercicio 4. Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
SELECT o.orderNumber, p.productName, p.MSRP, od.priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;

-- Para estas consultas usa LEFT JOIN  
-- Ejercicio 5. Obtén el número de cliente, nombre de cliente, número de orden y estado de cada orden hecha por cada cliente. 
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber;
  
-- Ejercicio 6. Obtén los clientes que no tienen una orden asociada.
SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN orders o
  ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

-- Ejercicio 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, es decir, los clientes asociados a cada empleado.
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM employees e
LEFT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p 
ON p.customerNumber = c.customerNumber
ORDER BY c.customerName, p.checkNumber;

-- Ejercicio 8
-- Ejericio 8.5
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
FROM customers c
RIGHT JOIN orders o
ON c.customerNumber = o.customerNumber;

-- Ejericio 8.6
SELECT c.customerNumber, c.customerName
FROM customers c
RIGHT JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

-- Ejericio 8.7
SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount
FROM employees e
RIGHT JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments 
ON payments.customerNumber = c.customerNumber
ORDER BY c.customerName, p.checkNumber;

-- Ejercicio 9. Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
-- Ejercicio 9.1. Obtén la cantidad de productos de cada orden.
CREATE VIEW productos_orden_881 AS
SELECT o.orderNumber, sum(od.quantityOrdered) as cantidad_productos
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;

SELECT * FROM productos_orden_881;

-- Ejercicio 9.2. Obtén el número de orden, estado y costo total de cada orden.
CREATE VIEW estado_orden_881 AS
SELECT o.orderNumber, o.status, sum(od.quantityOrdered * od.priceEach) as total
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber, o.status;

SELECT * FROM estado_orden_881;

-- Ejercicio 9.3. Obtén el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza.
CREATE VIEW orden_detalles_881 AS
SELECT o.orderNumber, o.requiredDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
FROM orders o
JOIN orderdetails od
  ON o.orderNumber = od.orderNumber
JOIN products p
  ON od.productCode = p.productCode;
  
SELECT * FROM orden_detalles_881;
