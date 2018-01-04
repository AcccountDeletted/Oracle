-- Relación de ejercicios - Nº 1


-- 1.

SELECT grupo, calificacion
FROM matricular
WHERE asignatura = 112;


-- 2.

SELECT id
FROM profesores
WHERE director_tesis IS NULL;


-- 3. ¿?

SELECT id
FROM profesores
WHERE director_tesis IS NULL

UNION

SELECT profesor
FROM impartir;


-- 4.

SELECT SUBSTR(nombre, 2, LENGTH(nombre))
FROM alumnos;


-- 5.

SELECT nombre
FROM asignaturas
WHERE nombre LIKE 'B%';


-- 6.

SELECT DISTINCT alumno
FROM matricular
WHERE calificacion = 'MH' OR calificacion = 'SB' OR calificacion = 'NT' OR calificacion = 'AP';

-- SELECT DISTINCT alumno
-- FROM matricular
-- WHERE calificacion IN ('MH', 'SB', 'NT', 'AP');


-- 7.

SELECT nombre, fecha_prim_matricula
FROM alumnos
WHERE LENGTH(nombre) > 5;


-- 8.

SELECT ROUND(MONTHS_BETWEEN(fecha_prim_matricula, '01/12/2013')) "TRANSCURSO DE MESES"
FROM alumnos;


-- 9.

SELECT nombre
FROM asignaturas
WHERE creditos < 10;