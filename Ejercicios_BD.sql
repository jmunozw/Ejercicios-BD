-- 1) Devuelve todas las películas
SELECT * FROM movies;

-- 2) Devuelve todos los géneros existentes
SELECT * FROM genres;

-- 3) Devuelve la lista de todos los estudios de grabación que estén activos
SELECT * FROM studios WHERE STUDIO_ACTIVE=1;

-- 4) Devuelve una lista de los 20 últimos miembros en anotarse al videoclub
SELECT * FROM MEMBERS ORDER BY MEMBER_DISCHARGE_DATE  DESC LIMIT 20

--5) Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor. (NO HECHO)
SELECT * FROM MOVIES

-- 6) Devuelve las películas del año 2000 en adelante que empiecen por la letra A.
SELECT * FROM MOVIES
WHERE
		YEAR (MOVIE_LAUNCH_DATE) >= 2000 AND
		MOVIE_NAME LIKE 'A%';
	

-- 7) Devuelve los actores nacidos un mes de Junio
SELECT 	* FROM 	ACTORS WHERE MONTH (ACTOR_BIRTH_DATE ) = 06
	
-- 8) Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos.
SELECT * FROM ACTORS 
WHERE 
	MONTH (ACTOR_BIRTH_DATE) <> 06 AND 
	ACTOR_DEAD_DATE IS NULL


-- 9) Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos
SELECT
	DIRECTOR_NAME,
	AGE
FROM
	(
	SELECT
		DIRECTOR_NAME,
		DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) AS "AGE",
		DIRECTOR_DEAD_DATE
	FROM
		DIRECTORS)
WHERE
	AGE <= 50
	AND DIRECTOR_DEAD_DATE IS NULL


-- 10) Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido
SELECT 
	ACTOR_NAME,
	AGE
FROM (
	SELECT 
		ACTOR_NAME,
		DATEDIFF(YEAR, ACTOR_BIRTH_DATE, TODAY())AS "AGE",
		ACTOR_DEAD_DATE
	FROM ACTORS)
WHERE
	AGE <= 50 AND ACTOR_DEAD_DATE IS NOT NULL