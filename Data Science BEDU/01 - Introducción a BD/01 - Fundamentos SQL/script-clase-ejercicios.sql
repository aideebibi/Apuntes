/*=================================================================
||	             EJERCICIOS PARA PRACTICAR                      ||
=================================================================
*/
-- Ejercicio 1. Dentro del mismo servidor de bases de datos, conéctate al esquema classicmodels.
USE classicmodels;

-- Ejercicio 2. Tabla employees: el apellido de todos los empleados.
SELECT lastName 
FROM employees;

-- Ejercicio 3. Tabla employees: el apellido, nombre y puesto de todos los empleados.
SELECT lastName, firstName, jobTitle 
FROM employees;

-- Ejercicio 4. Tabla employees: todos los datos de cada empleado.
SELECT * 
FROM employees;

-- Ejercicio 5. Tabla employees: el apellido, nombre y puesto de todos los empleados que tengan el puesto Sales Rep.
SELECT lastName, firstName, jobTitle 
FROM employees
WHERE jobTitle = "Sales Rep";

-- Ejercicio 6. Tabla employees: el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep y código de oficina 1.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE jobTitle = "Sales Rep"
	AND officeCode = 1;

-- Ejercicio 7. Tabla employees: el apellido, nombre, puesto y código de oficina de todos los empleados que tengan el puesto Sales Rep o código de oficina 1.
SELECT lastName, firstName, jobTitle, officeCode 
FROM employees
WHERE jobTitle = "Sales Rep"
	OR officeCode = 1;
    
-- Ejercicio 8. Tabla employees: el apellido, nombre y código de oficina de todos los empleados que tenga código de oficina 1, 2 o 3.
SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode IN (1, 2, 3);
    
-- Ejercicio 9. Tabla employees: el apellido, nombre y puesto de todos los empleados que tengan un puesto distinto a Sales Rep.
SELECT lastName, firstName, jobTitle 
FROM employees
WHERE jobTitle != "Sales Rep";
    
-- Ejercicio 10. Tabla employees: el apellido, nombre y código de oficina de todos los empleados cuyo código de oficina sea mayor a 5.
SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode > 5;

-- Ejercicio 11. Tabla employees: el apellido, nombre y código de oficina de todos los empleados cuyo cdigo de oficina sea menor o igual 4.
SELECT lastName, firstName, officeCode 
FROM employees
WHERE officeCode <= 4;

-- Ejercicio 12. Tabla customers: el nombre, país y estado de todos los clientes cuyo país sea USA y cuyo estado sea CA.
SELECT customerName, country, state 
FROM customers
WHERE country = "USA"
	AND state = "CA";
    
-- Ejercicio 13. Tabla customers: el nombre, país, estado y límite de crédito de todos los clientes cuyo país sea, USA, cuyo estado sea CA y cuyo límite de crédito sea mayor a 100000.
SELECT customerName, country, state, creditLimit 
FROM customers
WHERE country = "USA"
	AND state = "CA"
    AND creditLimit >100000;
    
-- Ejercicio 14. Tabla customers: el nombre y país de todos los clientes cuyo país sea USA o France.
SELECT customerName, country 
FROM customers
WHERE country IN ("USA", "FRANCE");
    
-- Ejercicio 15. Tabla customers: el nombre, pas y límite de crédito de todos los clientes cuyo país sea USA o France y cuyo límite de crédito sea mayor a 100000. Para este ejercicio ten cuidado con los paréntesis.
SELECT customerName, country, creditLimit
FROM customers
WHERE country IN ("USA", "FRANCE")
	AND creditLimit >100000;

-- Ejercicio 16. Tabla offices: el código de la oficina, ciudad, teléfono y país de aquellas oficinas que se encuentren en USA o France.
SELECT officeCode, city, phone, country
FROM offices
WHERE country IN ("USA", "FRANCE");

-- Ejercicio 17. Tabla offices: el código de la oficina, ciudad, teléfono y país de aquellas oficinas que no se encuentren en USA o France.
SELECT officeCode, city, phone, country
FROM offices
WHERE country NOT IN ("USA", "FRANCE");

-- Ejercicio 18. Tabla orders: el número de orden, número de cliente, estado y fecha de envío de todas las órdenes con el número 10165, 10287 o 10310.
SELECT orderNumber, customerNumber, status, shippedDate 
FROM orders
WHERE orderNumber IN(10165, 10287, 10310);

-- Ejercicio 19. Tabla customers: el apellido de contacto y nombre de cada cliente y ordena los resultados por apellido de forma ascendente.
SELECT contactLastName, customerName 
FROM customers
ORDER BY contactLastName ASC;
    
-- Ejercicio 20. Tabla customers: el apellido de contacto y nombre de cada cliente y ordena los resultados por apellido de forma descendente.
SELECT contactLastName, customerName 
FROM customers
ORDER BY contactLastName DESC;

-- Ejercicio 21. Tabla customers: el apellido y nombre de cada cliente y ordena los resultados por apellido de forma descendente y luego por nombre de forma ascendente.
SELECT contactLastName, customerName 
FROM customers
ORDER BY contactLastName DESC,  customerName ASC;

-- Ejercicio 22. Tabla customers: el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más alto (top 5).
SELECT contactLastName, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 5;

-- Ejercicio 23. Tabla customers: el número de cliente, nombre de cliente y el límite de crédito de los cinco clientes con el límite de crédito más bajo diferente de 0.
SELECT contactLastName, customerName, creditLimit
FROM customers
WHERE creditLimit > 0
ORDER BY creditLimit ASC
LIMIT 5;

