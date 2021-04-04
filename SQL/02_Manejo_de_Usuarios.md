# Habilitar historial de comandos
Para eso se debe de instalar el paquete de rlwrap, que nos va a permitir acceder al historial de comandos
```bash
sudo apt-get install rlwrap
``` 

Después editamos el siguiente archivo:
```bash
sudo nano /etc/bash.bash.rc
``` 

Al final agregamos la siguiente línea:
```bash
#alias globales
alias sqlplus='rlwrap sqlplus'
``` 

# Levantar la instancia de oracle
* Se levanta el listener: Para conexiones TCP, por ejemplo cuando estamos en una maquina remota y el server en otra. La herramientas gráficas también hacen uso del listener.
* Para levantar la instancia: 
    * Primero debemos de loggearnos, para eso hay dos opciones 
        * sqlplus / as sysdba --> aqui se usa la autenticación a nivel de SO, por eso no se escribe el usuario ni la contraseña.
        * sqlplus sys as sysdba --> aquí sí tenemos que escribir el usuario y al dar enter escribimos la contraseña.
    * Levantar la instancia: startup

# Spool
El ambiente de oracle te permite crear un spool, que funciona como una bitácora. Ayuda para ver todos los comandos realizados, se debe crear un spool cada que se inicie una sesión. 
```sql
spool <ruta_absoluta/nombre_spool.txt>  
```

Si no se cierra de forma correcta el spool, podemos perder la información que escribimos en el spool, para evitar eso debemos de escribir la siguiente instrucción antes de cerrar la sesión.
```sql
spool off
```
Si queremos continuar escribiendo en el mismo spool ejecutamos la siguiente instrucción
```sql
spool <ruta_absoluta/nombre_spool.txt> append
```

# Ejecución de un archivo sql
```sql
start <archivo>.sql
```

# Creación de usuarios
Para crear un usuario, se hace lo siguiente.
```sql
create user <nombre_usuario> identified by <contraseña> quota unlimited on users;
```
¿Qué significa todo eso?
Con la instrucción de *quota unlimited on users*, lo que se indica es que el usuario que estoy creando va a poder hacer uso de nuestro disco de forma ilimitada en el table space users. Dejarlo así puede representar un problema, pues al no tener ninguna restricción el usaurio podrá acabarse todo el espacio del disco.

Sin embargo cuando creamos un usuario se crea sin ningun permiso, entonces después de su creación se debe de poner los permisos que puede tener.
```sql
grant create session, create table to <nombre_usuario>;
```
La explicación de los permisos que le asignamos en el comando anterior es la siguiente:
* create session -> crea sesiones
* create table -> crea tablas

# Eliminación de usuarios
Para eliminar a un usuario junto con todos sus esquemas y objetos ejecutamos la siguiente instrucción:
```sql
drop user <nombre_usuario> cascade;
```

# Cambio de usuarios
Cuando necesitamos entrar a la sesión de otro usuario, podemos ejecutar el siguiente comando:
```sql
connect <nombre_usuario>
password
```
___
Nota: Todo esto está en el previo #7
Clase #26
___