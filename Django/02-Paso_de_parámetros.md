# Paso de parámetros
En este caso analizaremos el paso de parámetros mediante la URL.

---
En el archivo de "Views.py" creamos una función que ya no tenga como parámetro solo el "request".

Por ejemplo, si queremos una página que calcule nuestra edad, podemos pasarle en la url el año en la que la queramos calcular. Entonces los parámetros de nuestra función serán: request y el año.

```python

def calculaEdad(request, anio):
    edad_actual = 22
    periodo = anio - 2021
    edad_futura = edad_actual + periodo
    documento = """<html>
        <body>
            <p>Edad actual: %s</p>
            <p>Tu edad en %s será: %s</p>
        </body>
    </html>""" %(edad_actual, anio, edad_futura)
    return HttpResponse(documento)
```

---
En el archivo de "urls.py" agregamos el path con el parámetro que vamos a recibir:

```python 
 path('calcula_edad/<int:anio>', calculaEdad),
```

Es importante que tengamos en cuenta que **todos** los parámtros que mandamos por la URL son considerados como **texto**. Entonces si queremos usar números, tenemos que realizar un **cast**.
```python 
<Cast: Parámetro>
```
De igual forma el nombre del parámetro que pongamos en el path, debe ser el **mismo** que el que hayamos puesto en la función del archivo "view.py"


