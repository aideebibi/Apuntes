# Agrupamientos
Contenido del archivo:
1. Funciones de agrupamiento
2. Agrupamientos
3. Referencias

## Funciones de agrupamiento
Es posible aplicar distintas funciones a los campos con el fin de agruparlos para obtener valores específicos. Para ello se tienen varias funciones, en esta sesión veremos los siguientes:

* SUM: suma todos los valores de una columna.
* COUNT: cuenta los valores de una columna.
* MIN: obtiene el valor mínimo de una columna.
* MAX: obtiene el valor máximo de una columna.
* AVG: obtiene el promedio de los valores de una columna.

Veamos algunos ejemplos:

```sql
SELECT sum(salario) AS “Salario Total”
FROM empleados
WHERE salario > 5000;
```

Esta consulta obtiene la suma de los salarios de los empleados de una empresa y sólo considera aquellos salarios mayores a 5000. La columna resultante se nombra como sum(salario), sin embargo, este nombre no es claro, por lo que la restricción AS nos permite agregar un alias a la columna y llamarla en su lugar Salario Total.

```sql
SELECT count(ocupacion) AS “Número de ocupaciones”
FROM persona;
```

Esta consulta cuenta el número de ocupaciones que hay en la columna ocupación. Es importante mencionar que la función count únicamente cuenta registros que no son nulos.

```sql
SELECT max(edad) AS “Mayor”
FROM persona;

SELECT min(edad) AS “Mayor”
FROM persona;
```
Estas consultas obtienen la edad más grande y más pequeña, respectivamente, en un conjunto de personas.

```sql
SELECT avg(calificacion) “Promedio”
FROM estudiantes
WHERE calificacion >= 6.0;
```

La consulta anterior, calcula el promedio de los estudiantes cuya calificación fue aprobatoria. Como puedes apreciar, en general, la sintaxis de una función es: **funcion(parámetros)**

En el caso de las funciones de agrupamiento, éstas sólo reciben un parámetro pues toman una columna, sin embargo existen muchas más funciones que tienen otras utilidades. Llamamos a estas funciones de agrupamientos, pues reducen los valores de una columna a un único valor.

## Agrupamientos
Ahora que sabes cómo operan las funciones de agrupamiento, estás listo para hacer tus primeros agrupamientos. Un agrupamiento, toma valores distintos de una columna y permite hacer un análisis detallado mediante las funciones de agrupamiento.

Por ejemplo, supongamos que existe una tabla que almacena la ocupación de un conjunto de personas y quisiéramos saber cuántas personas hay por cada ocupación. Bueno, pues podemos hacer un agrupamiento y auxiliarnos de la función count.

Para usar un agrupamiento, se debe usar la restricción GROUP BY que indica los campos por los cuales se realizará el agrupamiento. Los campos por los cuales se agrupará, deben aparecer en la consulta y debe haber al menos una función de agrupamiento proyectada.

```sql
SELECT ocupacion, count(*) “Total”
FROM persona
GROUP BY ocupacion;
```

El símbolo * en la función count, le indica a MySQL que se deben tomar todos los registros de la tabla. De esta forma el resultado luce como:
<img src="./img/02-agrupamientos.PNG">

## Referencias: 
(Funciones SQL)[https://www.techonthenet.com/mysql/functions/]