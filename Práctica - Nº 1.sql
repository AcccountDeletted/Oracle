-- Práctica - Nº 1


-- 1.

SELECT nombre, apellido1, apellido2
FROM profesores
WHERE departamento = 1;


-- 2.

SELECT nombre, apellido1, apellido2
FROM profesores
WHERE departamento != 3;

-- SELECT nombre, apellido1, apellido2
-- FROM profesores
-- WHERE departamento <> 3;


-- 3. ¿?

SELECT nombre, apellido1, apellido2
FROM profesores
WHERE email LIKE '%lcc.uma.es';


-- 4.

SELECT nombre
FROM alumnos
WHERE email IS NULL;


-- 5.

SELECT nombre, creditos, ROUND(teoricos / creditos * 100, 2) "PROPORCION DE TEORIA", ROUND(practicos / creditos * 100, 2) "PROPORCION DE PRACTICAS"
FROM asignaturas
WHERE curso = 3;


-- 6.

SELECT alumno, calificacion
FROM matricular
WHERE asignatura = 112 ORDER BY alumno;


-- 7.

SELECT nombre, hombres + mujeres "SUMA DE HOMBRES Y MUJERES"
FROM municipio;


-- 8.

SELECT CONCAT('El alumno ', CONCAT(nombre, ' no dispone de correo.'))
FROM alumnos
WHERE email IS NULL;

-- SELECT 'El alumno ' || nombre || ' no dispone de correo.'
-- FROM alumnos
-- WHERE email IS NULL;


-- 9.

SELECT nombre, apellido1, apellido2
FROM profesores
WHERE antiguedad < TO_DATE('01/01/1990', 'DD/MM/YYYY');


-- 10.

SELECT nombre, apellido1, apellido2
FROM profesores
WHERE MONTHS_BETWEEN(SYSDATE, fecha_nacimiento) / 12 < 30;


-- 11.

SELECT UPPER(nombre) "NOMBRE", UPPER(apellido1) "APELLIDO1", UPPER(apellido2) "APELLIDO2", TRUNC(MONTHS_BETWEEN(SYSDATE, antiguedad) / 36) "TRIENIOS ACUMULADOS"
FROM profesores
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, antiguedad) / 36) > 3;


-- 12.

SELECT REPLACE(nombre, 'Bases', 'Almacenes') "NOMBRE"
FROM asignaturas
WHERE nombre LIKE '%Bases de Datos%';


-- 13.

SELECT nombre, NVL(TO_CHAR(creditos), 'NO ASIGNADO') "CREDITOS"
FROM asignaturas
WHERE caracter LIKE 'O_';


-- 14.

SELECT nombre
FROM alumnos
WHERE MONTHS_BETWEEN(SYSDATE, fecha_prim_matricula) < 2;


-- 15.

SELECT nombre
FROM alumnos
WHERE MONTHS_BETWEEN(fecha_prim_matricula, fecha_nacimiento) / 12 < 18;


-- 16.

SELECT nombre
FROM alumnos
WHERE TO_CHAR(fecha_prim_matricula, 'D') = 1;
