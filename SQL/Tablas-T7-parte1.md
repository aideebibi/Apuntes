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
spool */ruta/absoluta/nombre_spool.txt*  
```

Si no se cierra de forma correcta el spool, podemos perder la información que escribimos en el spool, para evitar eso debemos de escribir la siguiente instrucción antes de cerrar la sesión.
```sql
spool off
```
Si queremos continuar escribiendo en el mismo spool ejecutamos la siguiente instrucción
```sql
spool */ruta/absoluta/nombre_spool.txt* append
```

# Creación de usuarios
```sql
create user <nombre_usuario> identified as <contraseña> quota unlimited on users;
```
¿Qué significa todo eso?

