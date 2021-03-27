# Introducción
## ¿Por qué django?

## ¿Cómo funciona una Web Aplication?

### Request y Respond

### Conexiones TCP / Sockets
¿Qué es un socket? 

La manera más simple de definir un socket es imaginando una llamada telefónica, en donde una persona A llama a una persona B, la persona B al contestar pregunta ¿Quién habla? a lo que la otra responde "Soy A" y una vez que se haya confirmado la identidad de ambas personas empieza el intercambio de información entre A y B. Entonces podemos entender a un socket como una llamada telefónica entre computadoras. La definicón formal de socket es la siguiente:

<img src="./img/definicion-socket.PNG">

### Puertos TCP
Podemos verlo como una extención telefónica, en donde no tenemos una dirección fija de una aplicación, pero sí hay un puerto de comunicación fija.
Para el desarrollo de aplicaciones Web se suele trabajar con el puerto 80 para el desarrollo y una vez que la aplicación se encuentra en producción se usa el protocolo 443

### Hyper Text Transfer Protocol (HTTP)
Http es el protocolo que usan los navegadores para entablar una comunicón con los servidores. Su funcionamiento se basa en que te conectas a un servidor, averiguas dónde está, envías un solo comando con un poco de datos adicionales, y luego recuperas algo, un documento, una imagen, datos o un HTML.

Analizando el contenido de una URL tenemos lo siguiente:
* Protocolo: Permite el uso de múltiples protocolos, los más comunes son HTTP, HTTPS y FTP
* Host: Es el nombre del dominio, que es una forma simbólica de llegar/llamar a la dirección de un servidor
* Documento: Muestra al usuario el documento que sse ha solicitado, en este ejemplo es "page1.html"

<img src="./img/http-ejemplo.PNG">