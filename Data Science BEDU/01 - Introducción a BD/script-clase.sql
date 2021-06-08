USE tienda;

-- VISTA
CREATE VIEW tickets_881 AS
(SELECT v.clave, v.fecha, a.nombre producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) empleado 
FROM venta v
JOIN empleado e
  ON v.id_empleado = e.id_empleado
JOIN articulo a
  ON v.id_articulo = a.id_articulo);
  
SELECT *
FROM tickets_881;

CREATE VIEW puesto_empleado_881 AS (
	SELECT concat(e.nombre, ' ', e.apellido_paterno) empleado, p.nombre AS puesto
	FROM empleado e
	JOIN puesto p
		ON e.id_puesto = p.id_puesto
);

SELECT * 
FROM puesto_empleado_881;

CREATE VIEW articulo_empleado_881 AS (
	SELECT concat(e.nombre, ' ', e.apellido_paterno) empleado, a.nombre AS articulo_vendido
	FROM venta v
	JOIN empleado e
		ON v.id_empleado = e.id_empleado
	JOIN articulo a
		ON v.id_articulo = a.id_articulo
);

SELECT * 
FROM articulo_empleado_881;

CREATE VIEW ventas_puesto_881 AS (
	SELECT p.nombre AS puesto,  count(v.clave) as total_ventas 
	FROM venta v
	JOIN empleado e
		ON v.id_empleado = e.id_empleado
	JOIN puesto p
		ON e.id_puesto = p.id_puesto
	GROUP BY p.nombre
	ORDER BY total_ventas DESC
);
    
SELECT * 
FROM ventas_puesto_881;


-- ¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto IN
 (SELECT id_puesto
      FROM puesto
      WHERE salario > 10000);
      
-- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas) as min_venta , max(total_ventas) as max_venta
FROM (
	SELECT clave, id_empleado, count(*) total_ventas
    FROM venta
    GROUP BY clave, id_empleado
    ) AS subconsulta
GROUP BY id_empleado;

-- ¿Cuál es el nombre del puesto de cada empleado?
SELECT nombre, apellido_paterno, (
	SELECT nombre 
    FROM puesto 
    WHERE id_puesto = e.id_puesto
) as puesto
FROM empleado AS e;

use tienda;
SELECT nombre, apellido_paterno, clave as clave_venta
FROM empleado AS e
JOIN venta AS v
  ON e.id_empleado = v.id_empleado
ORDER BY clave;