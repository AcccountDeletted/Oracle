-- Práctica - Nº 2


-- 1.

SELECT P.nombre, P.apellido1, P.apellido2
FROM profesores P JOIN departamentos D ON P.departamento = D.codigo
WHERE D.codigo = 1;


-- 2.

SELECT A.codigo, A.nombre, NVL(TO_CHAR(A.practicos), 'No tiene') "CREDITOS PRACTICOS"
FROM asignaturas A, alumnos AL, matricular M
WHERE AL.nombre = 'Nicolas' AND AL.apellido1 = 'Bersabe' AND AL.apellido2 = 'Alba' AND M.alumno = AL.dni AND M.asignatura = A.codigo;
