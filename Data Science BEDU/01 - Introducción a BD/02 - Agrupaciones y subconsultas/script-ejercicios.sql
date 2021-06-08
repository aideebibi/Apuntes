/*=================================================================
||	             EJERCICIOS PARA PRACTICAR                      ||
=================================================================
*/
USE classicmodels;

-- Ejercicio 1. Número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con A
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'A%';

-- Ejercicio 2. Número de empleado, apellido y nombre de todos los empleados cuyo apellido termina con on.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName LIKE '%on';

-- Ejercicio 3. Número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE '%on%';

-- Ejercicio 4. Número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen seis letras e inician con G.
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'G_____';

-- Ejercicio 5. Número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B
SELECT employeeNumber, lastName, firstName
FROM employees
WHERE lastName NOT LIKE '%B';

-- Ejercicio 6. Código de producto y nombre de los productos cuyo código incluye la cadena _20
SELECT productCode, productName
FROM products
WHERE productCode LIKE '%_20%';

-- Ejercicio 7. Total de cada orden.
SELECT orderNumber, sum(priceEach) total_orden
FROM orderdetails
GROUP BY orderNumber;

-- Ejercicio 8. Número de órdenes por año.
SELECT year(orderDate) anio, count(*) as num_ordenes
FROM orders
GROUP BY anio;

-- Ejercicio 9. Apellido y nombre de los empleados cuya oficina está ubicada en USA
SELECT lastName, firstName
FROM employees
WHERE officeCode IN (
    SELECT officeCode 
    FROM offices 
    WHERE country = 'USA'
);

-- Ejercicio 10. Número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount = (
    SELECT max(amount) 
    FROM payments
);

-- Ejercicio 11. Número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount > (
    SELECT avg(amount) 
    FROM payments);

-- Ejercicio 12. Nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (
    SELECT customerNumber
    FROM orders
);

-- Ejercicio 13. Máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT max(quantityOrdered) as max_prod, min(quantityOrdered) as min_prod, avg(quantityOrdered) as prom_prod
FROM orderdetails;

-- Ejercicio 14. Número de órdenes que hay por cada estado.
SELECT count(*) as num_ordenes, status
FROM orders
GROUP BY status;