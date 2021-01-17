# Plantillas
Son generalmente documentos HTML y se usan para separar la parte lógica de la visual

##  ¿Cómo se usan?
1. Crear un objeto de tipo **template** y leerlo
2. Crear un **contexto**: Son los datos adicionales que pueda usar ese html, por ejemplo contenido dinámico. SIEMPRE se debe de crear el contexto aunque esté vacío.
3. **Renderizar** el objeto template. Se le debe de pasar el contexto como parámetro.

---
## Cargadores de plantillas
Un cargador de plantilla o loader nos permite cargar de forma más fácil nuestras plantillas, sin tener que expecificar toda la ruta de ésta para poder utilizarla.
Y consiste en indicarle a Django el directorio o ruta donde se van a encontrar todas nuestras plantillas. 

En el archivo "settings.py" hay una lista llamada **TEMPLATES** que guarda todo lo relacionado a las plantillas. Y en la clave **DIRS** vamos a escribir la ruta del directorio de nuestras plantillas.

```python
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['<ruta completa del directorio de las plantillas>'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]
```

Y al principio de nuestro archivo "Views.py" vamos a importar la clase que nos permite renderizar:

```python
from django.shortcuts import render
```

De esta forma al final de la función, cuando hacemos el return hacemos el renderizado de la plantilla. Su formato es el siguiente:

```python
return render(request, '<plantilla.html>', <contexto>)
```
Veamos un ejemplo:

```python
def animales(request):
    contexto = {"animal": 'perro'} 

    return render(request, 'miplantilla.html', contexto)
```


---
## Uso de variables 
Para el uso de las variables, vamos a usar el contexto. Se mandará como parte de un diccionario en sus argumentos
De modo que tengamos:
```python
contexto = Context({ "<clave>" : <variable> })
```

Y en el documento de la plantilla/vista HTML se despliega de la siguiente forma:
```html
<p>El nombre del usuario es: {{ <clave> }} </p>
```
Cabe destacar que solo se despliega **UN** valor a la vez, entonces si tuviéramos varias variables se haría de la siguiente forma:
```python
{{ <clave_1> }} {{ <clave_2> }}
```

*También sería bueno mencionar, que podemos pasar variables, clases, etc, en el contexto.*

---
## Acceso a Objetos y propiedades desde plantillas
Retomando la programación orientada a objetos, también podemos crear clases y acceder a las instancias de dicha clase.

Para esto podemos crear una clase en el mismo archivo de "Views.py".

Donde definimos a una clase Persona que tenga nombre y apellido.

```python
class Persona(object):
    # Constructor
    def __init__(self, nombre, apellido):
        self.nombre = nombre
        self.apellido = apellido
```

Creamos un objeto de tipo persona en nuestra función y la mandamos en su contexto

```python
def saludo(request):
    p1 = Persona("Pablo", "Del Valle")
    
    contexto = Context({"nombre_persona": p1.nombre, "apellido_persona":p1.apellido})

    documento = plantilla.render(contexto)

    return HttpResponse(documento)
```

---
## Llamar a métodos desde plantillas
Jerarquía u orden en llamadas des plantillas. 
Cuando django encuentra un "." (*PUNTO*) realiza la siguiente búsqueda:
1. Buscar un **diccionario** para ver si ese punto corresponde a un elemento de un diccionario.
2. Busca si es **atributo** correspondiente a una clase.
3. Busca si es un **método** correspondiente a una clase o a un objeto.
4. Revisa si ese punto es una llamada al **índice** de una lista

--
## Uso de listas en contexto y plantillas
Para el uso de una lista, se tiene que poner en el diccionario la clave y la lista. Por ejemplo:

```python
contexto = Context({"temas":["Plantillas", "Modelos", "Formularios", "Vistas", "Despliegue"]})
```

Sin embargo es más recomendable tener una variable que almacene toda la lista y mandar dicha variable al contexto:

```python
tema_lista = ["Plantillas", "Modelos", "Formularios", "Vistas", "Despliegue"]
contexto = Context({"temas": tema_lista})
```

Y al momento de visualizar la lista simplemente llamamos a la clave en el template HTML.
Sin embargo si escribimos solamente la clave, obtendremos un restulado parecido al siguiente:

["Plantillas", "Modelos", "Formularios", "Vistas", "Despliegue"]

--
## Estructuras de control de flujo en plantillas
Entonces si queremos desplegar cada uno de los elementos de la lista y darles un formato personalizado debemos de implementar in ciclo que recorra toda la lista:

```html
    <p>Temas del curso:</p>
    <p>
        {% if temas %}
            {% for el_tema in temas %}
                <p>{{ el_tema }}</p>
            {% endfor %}
        {% else %}
            <p>No hay elementos que mostrar</p>
        {% endif %}
    </p>

```
Como podemos ver se hizo un bucle foreach, en donde recorremos la lista de la clave "temas" del contexto.

En ese if lo que hace Django es evaluar que en efecto **exista** esa variable y que además **tenga** un valor. Por lo que si la lista estuviera vácia, no entraría a ejecutar lo que hay dentro del "if". 

Notamos que las estructuras de control (if/for/while) en django van entre llaves **simples**, siguiendo el siguiente formato:
```python
    {% <bucle/condicional> %}
    {% end<bucle/condicional> %}
```

---
## Condicionales
Estos condicionales son comparadores que nos ayudan a saber si dos variables tienen el mismo valor, si son diferentes, etc.
* a == b
* a > b
* a < b
* a != b

---
## Filtros
Filtran y transforman la información. 
Los filtros se hacen utilizando la barra pipe
Podemos encadenar filtros, esto es poner un filtro después del siguiente.

```html
<p>El nombre del usuario es: {{nombre_persona|upper}} {{ apellido_persona|first|upper }}</p>
```

En este ejemplo utilizamos en la variable "nombre_persona" un filtro de tipo *UPPER* para poner en mayúsculas todas sus letras.
Y también encadenamos filtros en la variable "apellido_persona", pues primero aplicamos el filtro *FIRST* que nos muestra solo la primera letra de cada palabra y después aplicamos el filtro *UPPER*

---
## Plantillas anidadas (plantilla dentro de plantilla)
Es una técnica que se utiliza para reutilizar código html y no tener que codificar lo mismo una y otra vez.
Para hacerlo, tenemos que escribir en la plantilla principal la instrucción:

```python
{% include "<plantilla_anidada>" %}
```

Y en donde hayamos colocado esa línea, se pondrá la platilla anidada-

---
## Herencia de plantillas
Consiste en crear una plantilla padre (generalmente llamada "base"), que tendrá una estructura definida que seguirán las demás plantillas "hijas", sirve a modo de un esqueleto, en el cuál solo nos preocupamos en trabajar el bloque cambiante.

### Plantilla padre "base.html":
En la plantilla padre, debemos de especificar cuál o cuáles van a ser los contenidos cambiantes utilizando la instrucción:
```python
{% block <nombre_del_bloque> %}{% endblock %}
```
De esa forma el contenido que exista entre esas dos etiquetas, será el contenido dinámico o propio de cada plantilla hija. Veamos un ejemplo:

```html
<html>
    <head>
        <title>
            {% block title %}{% endblock %}
        </title>
    </head>
    <body>
        <h1>Django</h1>
        <h3>Curso de programación</h3>
        {% block content %}{% endblock %}
        <p>Hasta la próxima</p>
    </body>
</html>
```
En este ejemplo, creamos dos bloques de contenido que cambiarán dependiendo de cada plantilla hija, estos bloques son "title" y "content"

### Plantilla hija "cursoC.html":
Para realizar la herencia de la plantilla padre, al principio de cada plantilla hija debemos agregarle el siguiente código:

```python
{% extends "<plantilla_padre>" %}
```
Y entre cada bloque de contenido, vamos a escribir lo que queremos que se muestre, veamos un ejemplo:

```html
{% extends "base.html" %}
{% block title %} Curso C{% endblock %}
{% block content %}
    <p>Este es el curso de lenguaje C</p>
    <p>Fecha: {{fecha}} </p>
{% endblock %}
```

### View:
Cuando creemos la vista de la plantilla, **siempre** vamos a renderizar a la plantilla hija. Veamos un ejemplo:

```python
def cursoC(request):
    fecha_actual = datetime.datetime.now()
    contexto = {"fecha": fecha_actual}
    return render(request, 'cursoC.html', contexto)
```
Como podemos observar, se utilizamos a la plantilla "cursoC.html" y **NO** la plantilla "base.html". 

---
# Referencias:
* https://docs.djangoproject.com/en/2.2/ref/templates/builtins/
* https://docs.djangoproject.com/en/3.1/topics/http/shortcuts/
* Videos 5-10 de píldoras informáticas
* Outsystems
