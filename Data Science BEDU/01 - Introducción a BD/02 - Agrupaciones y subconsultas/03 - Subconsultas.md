# Subconsultas
Una subconsulta consiste de consultas que incluyen otras consultas en su interior. Una subconsulta puede aparecer en la parte SELECT, en la parte FROM o en la parte WHERE de una consulta. Veamos algunos ejemplos.

```sql
SELECT nombre, correo
FROM contactos
WHERE direccion IN 
       (SELECT direccion
        FROM ubicaciones
        WHERE codigo_postal = ‘01060’);
```

Esta consulta consta de una subconsulta, que se ejecuta primero. De esta forma, primero obtenemos todas las direcciones que se encuentran dentro del código postal 01060 y con los resultados obtenidos (un tabla), filtramos aquellos contactos que viven en esas direcciones.

```sql
SELECT (Calificacion / Alumnos) AS “Promedio”
FROM 
   (SELECT sum(calif) AS “Calificacion”, count(*) AS “Alumnos”
    FROM alumnos) AS subconsulta;
```

En esta consulta tomamos las columnas resultantes de la subconsulta. En este tipo de consultas MySQL pide poner un nombre a la subconsulta para poder referenciar, en caso de que sea necesario. Esta consulta primero calcula la suma de las calificaciones y el total de alumnos de una tabla y posteriormente se usan estos datos para calcular el promedio.

Notamos también que es posible usar operaciones aritméticas, como es el caso de la suma, resta, división y multiplicación.