Nueva evaluación:
1. Un examen
2. Solo un primer proyecto

Temario actualizado:
* Tema 3 y 4 y luego el proyecto de cifrador por flujo 
* Temas 6.1 y 6.2, las demás son temas extra 

# Block Ciphers

## Anteriormente..
Hay dos tipos de cifrados modernos los de flujo y los de bloque. 
* Flujo: Aplican funciones no lineales (and, or) y se sifran bit a bit. La desventaja es que son propensos a muchos ataques y no se utilzan en conexiones a internet
* Bloque: A su clasificación:
    * Llave privada:Actualmente se usa AES. Hacen encriptación de forma local
    * Llave pública: 

## Cifrado por bloque
lo que hacen es que dependiendo de la cantidad que se quiere cifrar, cad algoritmo a a determinar un tamaño de entrada del bloque que va a recibir, generalmente es 2^n. Se cifran y lo interesnate es que la salida es exactamente del mismo tamañao, de manera que: ```tamaño de entrada = tamaño de salida```
Y en la mayoría de los casos la llave también será del mismo tamaño. Entonces cuando se dice que el cifrado es de 64 bist, implicaría que el tamaño de entrada, de salida y la llave es de 64 bits.
Hay que recordar que estos cifrados son **simétricos**, de modo que se usa la misma llave para cifrar o descifrar.
Lo que las hace difíciles de romper es que utulizan funciones no lineales.

## Modelo general de los cifradores por bloque
Dependiendo del tamaño del mensaje que se tenga, se va a separar el mensaje en N bloques. 

## Modelo general de los descifradores por bloque
Se invierte el proceso que se realizó en el cifrado. 
> Nota: Recordemos que en criptografía se usa mucho el XOR porque la inversa del XOR es el mismo XOR 

## Cifrador Feistel
Todos los cifradores que tengan la siguiente estructura se conocen como cirador Feistel:
1. Reciben un mensaje 
2. Función no lineal
3. XOR

Y lo interesante es que se puede aplicar tantas veces como se necesite/quiera, es por eso que al final de la imagen se ve la salida de forma cruzada. La ventaja es que la función es la misma y solo se debe aplicar el proceso inverso, mejorando la eficiencia de los programas. Este modelo se vuelve la base del Data Encryption Standard (DES)

### Pasos a seguir para hacer un cifrador Feistel
1. Se recive un bloque de N bits
2. Se divide el bloque a la mitad (N/2)
3. Existe una sola función (F) no lineal
4. Cada entrada (N/2) será procesada por la función
5. La salida es permutada.
6. Mínimo se necesitan dos rondas, por el caso en que no se llegara a terminar de cifrar los bloques.

### Ejemplo
mod 27 porque son las 27 letras del alfabeto español.

En este ejemplo estamos siguiendo el siguiente cifrador: 
En donde solamente vamos a hacer la sustitución y permutación sobre el bloque izquierdo.

Como podemos notar solamente los bloques de la izquierda son cifrados, es por eso que necesitamos hacer una **segunda ronda** para cifrar los bloques que se encontraban del lado derecho. Y una vez que se tengan todos los bloques se concatenan y esa sería la salida. 
Pero ¿qué pasaría si la división de caracteres es no es simétrico? Por ejemplo un bloque de 4 letras y el otro de 2 letras. En esos casos cada algoritmo va a determinar como rellenar ese espacio en blanco.  A ese relleno se les llama **offsets**.

## Algoritmo DES
> Nota: Este algoritmo ya no se usa, pues fue vulnerado.
Este algortimo utiliza un cifrado tipo Feistel
Usa una **caja S** que es un tipo de permutación por matrices.
Para explicar el funcionamiento de este algoritmo emplearemos un ejemplo.

Es un algoritmo que recive un mensaje de 64 bits, y lo separa en dos bloques de 32 bits.
La llave también es de 64 bits.

**Paso 1:** Lo primero que se debe hacer es que debemos manipular las llaves. Para esto se lleva a cabo el "Round key" se necesita una llave diferente por cada ronda, en este algoritmo son 16 rondas, por lo tanto se generan 16 llaves, basadas en la llave original. Y se hace de acuerdo a una tabla de permutación establecida por el algoritmo, en esta tabla no aparecen los 64 bits, solo se usarán 56 bits, generando la llave K+. 

Esa llave K+ se divide en dos bloques C0 y D0. Ahora ya se pueden generar las 16 llaves que necesitamos, basándose una en la anterior. Para generar esas llaves nos vamos a basar en el número de rotaciones izquierdas.  

Una vez creadas las 16 llaves volvemos a usar una tabla de permutación, ahora reduciendo las llaves a 48 bits. 

**Paso 2:** Lo que se hace en el mensaje es una permutación incial (IP), basada en una tabla de permutación establecida por el algoritmo, es importante notar que aquí NO perdemos ningún bit. Y ahora procedemos a hacer las 16 iteraciones o rondas. Esto se denota de la siguiente forma 

``` 
Ln = Rn-1
Rn = Ln-1 + F(Rn-1, Kn)
``` 

