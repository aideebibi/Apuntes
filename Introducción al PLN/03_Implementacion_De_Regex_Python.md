# Implementación de Regex con python
Para cada uno de los ejemplos presentados, se tomará en consideración que previamente a la ejecución de cada uno de ellos se agregó la biblioteca "re"
```python
import re
```
## Funciones
Como lo vimos previamente, la función match se usa para encontrar patrones al inicio de un String u oración. Esto se implementa de la siguiente forma:

```python
string = "tiger is the national animal of India"
pattern = "tiger"

res = re.match(pattern, string)
print(res)

>> <re.Match object; span=(0,5), match='tiger'>
```

Lo que dice el resultado es que match ha encontrado dicho patrón. Por ejemplo si buscamos un patrón que no se encuentra dentro del String pasaría lo siguiente:

```python
string = "tiger is the national animal of India"
pattern = "lion"

res = re.match(pattern, string)
print(res)

>> None
```
Ahora si queremos buscar un patrón que se encuentra en cualquier parte de la oración, tendremos que usar la función search:

```python
string = "tiger is the national animal of India"
pattern = "national"

res = re.search(pattern, string)
print(res)

>> <re.Match object; span=(13,21), match='national'>
```

Y si queremos ver de forma explícita lo que se ha encontrado, imprimimos la variable de la siguiente forma:

```python
print(res.group(0))

>> national
```

Ahora, muchas veces tenemos un patrón que se repite de forma constante en nuestra oración. Si ese fuera el caso usaremos la función findall, que devolverá una lista con todos los elementos encontrados, por ejemplo:

```python
string = "tiger is the national animal of India and national sport is Hockey"
pattern = "national"

res = re.findall(pattern, string)
print(res)

>> ['national', 'national']
```
Pero si queremos saber la posición en donde se encuentran esos elementos usaremos la función finditer, que nos devolverá el índice de dichos patrones.

```python
string = "tiger is the national animal of India and national sport is Hockey"
pattern = "national"

res = re.finditer(pattern, string)
print(res)

>> <callable_iterator object at 0x00000257E95203C8>
```

A simple vista no podremos entender lo que nos está devolviendo porque es un objeto de tipo iterador, por lo que debemos de iterar en éste para saber su contenido:

```python
string = "tiger is the national animal of India and national sport is Hockey"
pattern = "national"

res = re.finditer(pattern, string)
for i in res:
    print(i.start())

>> 13
>> 42
```

Lo que nos regresa es la posición en donde empiezan estos patrones, dentro del texto.

## Wild cards
Ahora veamos el uso de wild cards:

```python
string = "Ron was born on 12-09-1992 and he was admitted to school on 15-12-199"
pattern = "\d{2}-\d{2}-\d{4}"

res = re.findall(pattern, string)
print(res)

>> ['12-09-1992', '15-12-199']
```