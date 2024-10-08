-- ¿Qué géneros son más prevalentes en la base de datos NetflixDB? 
-- Genera una lista de los distintos géneros y la cantidad de series por cada uno.

-- Esta consulta SQL nos permite ver cuántas series hay en cada género dentro de la base de datos NetflixDB. 
-- Agrupando las series por su género y contándolas, podemos identificar cuáles géneros son más prevalentes.

SELECT genero, 
COUNT(serie_id) AS 'Cantidad de series'
FROM series
GROUP BY genero;


-- ¿Cuáles son las tres series con mayor rating IMDB y cuántos episodios tienen? 
-- Considera usar un JOIN para combinar la información de las tablas de series y episodios.

-- Con esta consulta, identificamos las tres series con el mayor rating IMDB 
-- en la base de datos y contamos cuántos episodios tiene cada una de ellas, combinando información de las tablas Series y Episodios.

SELECT Series.titulo, COUNT(Episodios.episodio_id) AS numero_de_episodios, AVG(episodios.rating_imdb) AS promedio_imdb
FROM Series
INNER JOIN Episodios ON Series.serie_id = Episodios.serie_id
GROUP BY Series.serie_id
ORDER BY promedio_imdb DESC
LIMIT 3;


-- ¿Cuál es la duración total de todos los episodios para la serie "Stranger Things"? 
-- Este análisis te permitirá entender el compromiso temporal necesario para ver una serie completa.

SELECT series.titulo AS 'Titulo de la Serie' , 
		SUM(duracion) AS duracion_total
FROM series
INNER JOIN episodios 
ON series.serie_id = episodios.serie_id
WHERE series.titulo = 'Stranger Things'
GROUP BY series.titulo;




