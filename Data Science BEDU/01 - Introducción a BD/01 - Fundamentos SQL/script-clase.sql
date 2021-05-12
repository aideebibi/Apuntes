# SHOW DATABASES; -- Muestra las bd alojadas en el sevidor
USE tienda; -- Se ha seleccionado la bd de tienda
/*
SHOW TABLES; -- Muestra las tablas de la bd seleccionada
DESCRIBE articulo; -- Muestra la estructura de la tabla 
DESCRIBE  empleado;
DESCRIBE puesto;
DESCRIBE venta;
*/

/*
=================================================================
||	                       FILTROS                             ||
=================================================================
*/
SELECT * FROM empleado
	WHERE apellido_paterno = 'Risom';
    
SELECT * FROM empleado
	WHERE id_puesto >= 100
	AND id_puesto <= 200;
    
-- La instrucción "IN" funciona como un conjunto de "or" 
SELECT * FROM empleado
	WHERE id_puesto IN(100, 200, 250);
    
-- La instrucción BETWEEN funciona como un rango
SELECT * FROM empleado
	WHERE id_puesto BETWEEN 100 and 150;

-- ¿Cuál es el nombre de los empleados con el puesto 4?
SELECT nombre FROM empleado
	WHERE id_puesto = 4;

-- ¿Qué puestos tienen un salario mayor a $10,000?
SELECT * FROM puesto
	WHERE salario > 10000;
    
-- ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100?
SELECT * FROM articulo
	WHERE precio > 1000
    AND iva >100;
    
-- ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?
SELECT * FROM venta
	WHERE id_articulo IN (135, 963)
    AND id_empleado IN(835, 369);
  
  
/*
=================================================================
||	              ORDENAMIENTOS Y LIMITES                       ||
=================================================================
*/
SELECT * FROM puesto
ORDER BY salario DESC;

-- Usando la base de datos tienda, escribe una consulta que permita obtener el top 5 de puestos por salarios.
SELECT * FROM puesto
ORDER BY salario DESC
LIMIT 5;



