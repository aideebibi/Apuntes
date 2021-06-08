USE tienda;

-- empleados cuyo nombre empieza con M
SELECT *
FROM empleado
WHERE nombre LIKE 'M%';

--  empleados cuyo nombre termina con a
SELECT *
FROM empleado
WHERE nombre LIKE '%a';

-- empleados cuyo nombre empieza con M y termina con a.

SELECT *
FROM empleado
WHERE nombre LIKE 'M%a';

-- empleados que tienen la estructura M_losa.
SELECT *
FROM empleado
WHERE nombre LIKE 'M_losa';

-- Promedio de una columna:
SELECT avg(precio) promedio, count(precio) total, max(precio) maximo, 
	   min(precio) minimo, sum(precio) suma
FROM articulo;

-- ==========================================
-- ||          RETOS DE CLASE   			||  
-- ===========================================
-- RETO 1: Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
-- ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE '%Pasta%';

-- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT *
FROM articulo
WHERE nombre LIKE '%Cannelloni%';

-- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT *
FROM articulo
WHERE nombre LIKE '%-%';

-- Reto 2:
--  ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario)  promedio_salario
FROM puesto;

--  ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(nombre) articulos_pasta
FROM articulo
WHERE nombre LIKE "%pasta%";

--  ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) salario_minimo, max(salario) salario_maximo
FROM puesto;

--  ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) suma_salario
FROM  (
		SELECT salario
		FROM puesto
		ORDER BY id_puesto DESC
		LIMIT 5
) AS subconsulta;

-- RETO 3: Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
-- ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(nombre) numero_puestos
FROM puesto
GROUP BY nombre;

-- ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario)
FROM puesto
GROUP BY nombre;

-- ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) numero_ventas
FROM venta
GROUP BY id_empleado;

-- ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) numero_ventas
FROM venta
GROUP BY id_articulo;



-- NOTAS: 
-- 1. No es case sensitive
-- 2. el número de _ se sustituye por el numero de caracteres
-- 3. LIKE solo funciona con cadenas, NO con fechas