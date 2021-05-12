# Sesión 1: Fundamentos de SQL

1. Objetivos 🎯

    Establecer la conexión a una base de datos relacional.
    Analizar la estructura de distintas tablas en una base de datos.
    Escribir consultas básicas que permitan obtener los campos de una tabla, ordenar y limitar los resultados.

2. Contenido 📘
Bases de Datos Relacionales
---
Modelo cliente servidor:
01-clase-1

¿Qué es un schema?
Dentro de un servidor, podemos tener distintas BD. Esas distintas bd que pueden estar contenidas en el servidor son lo que MYSQL se llama SCHEMA. Cada schema se compone de tablas que pueden estar relacionadas unas cono otras. 

Cada columna tiene un tipo de dato, es decir cada columna casifica un tipo de valores
02-clase-1

Comenzaremos con la conexión a una base de datos relacional de MySQL. Las conexiones a bases de datos se llevan a cabo mediante el llamado Modelo Cliente-Servidor.

La información de una base de datos se encuentra alojada en un servidor, por lo general, una computadora de gran potencia. Para conectarnos hacemos uso de un cliente que recibe datos de la base y envía peticiones para cambiar o agregar datos.
