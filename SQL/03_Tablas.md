# Creación de tablas
En Oracle es posible crear 2 categorías de tablas principales:
*   Relational tables. Representa la estructura básica (formato tabular) para almacenar datos.
*   Object tables. Los tipos de datos de cada columna son tipos de datos personalizados: Object data types. Para efectos del curso, se revisan solo tablas relacionales. Por ejemplo un tipo de dato "Persona" cuyos atributos sean "nombre" y "apellidos" del tipo varchar.

La sintaxis general para crear una tabla es la siguiente
```sql
create [ global temporary] table [< schema >.]<table_name>(
    <column_name>{
        [ 
            <datatype>[<size1>[, <size2>]] [default <default_value>] 
            [encrypt <encryption_specs>] [<column_constraint>, ...] 
        ] 
        | as < expression > virtual, ... [<table_or_column_constraint>, ...]
        [physical_properties>]
    } 
) [on commit {delete | preserve} rows]
```

Por ejemplo vamos a crear una tabla sencilla:
```sql
create table empleado_simple(
    empleado_id number(10,0) not null,
    nombre varchar2(40) not null
);
```
Cuando creamos unn atribut por defecto es nulo, por eso si no queremos que sea nulo debemos de especificarlo. Por buenas prácticas al final se debe crear un comentario que haga alusión a la función de dicha tabla, de esta forma las tablas quedan documentadas
```sql
comment on table empleado_simple is 'Mi primera tabla de empleados';
```
# Organización de almacenamiento
En Oracle, el almacenamiento de los datos puede organizarse con las siguientes características:
* **Ordinarias (Heap organized table):** Representa el tipo más común en el que los registros no se guardan en algún orden el particular. La tabla creada anteriormente representa una tabla de este tipo.
* **Indexadas (Indexed- organized tables):** Los registros se ordenan con base a los valores de la PK. (Normalmente no se usa mucho esta opción)
* **Tablas externas:** Son tablas de solo **lectura** y todas sus columnas deben de ser **nulas**. La definición de su estructura o metadatos son almacenados en el diccionario de datos, pero los datos se encuentran en una fuente externa a la base de datos, por ejemplo, en archivos de texto: archivos CSV, etc. Las ventajas de este tipo de tablas es que nos permite analizar datos externos a las bd y que podemos hacer op tipo join y combinarlos con datos de la bd.
* **Tablas temporales:** Una tabla temporal contiene datos que existen únicamente durante la existencia de una transacción o de una sesión.
