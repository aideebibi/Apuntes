/*================================================================
||	  Parte I: Configuración de Bases Relacionales               ||
==================================================================
*/

-- CONEXIÓN A LA BASE DE DATOS --
CREATE DATABASE IF NOT EXISTS BD_GABY;
USE BD_GABY;

-- Creación de tablas --
CREATE TABLE IF NOT EXISTS users (
   user_id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);


/*================================================================
||	    Reto 1: Realizando operaciones con tablas               ||
==================================================================
*/
-- 1. Definir los campos y tipos de datos para la tabla movies haciendo uso de los archivos movies.dat y README
CREATE TABLE IF NOT EXISTS movies (
   movie_id INT PRIMARY KEY, 
   title VARCHAR(100), 
   genre VARCHAR(100)
);

-- 2. Definir los campos y tipos de datos para la tabla ratings haciendo uso de los archivos ratings.dat y README.
CREATE TABLE IF NOT EXISTS ratings (
   user_id INT,
   movie_id INT,
   rating INT, 
   time_stamp BIGINT,

   FOREIGN KEY (user_id) REFERENCES users(user_id),
   FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
);

