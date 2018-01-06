-- Práctica Nº 2


-- 1.

SELECT P.nombre, P.apellido1, P.apellido2
FROM profesores P JOIN departamentos D ON P.departamento = D.codigo
WHERE D.codigo = 1;


-- 2.

SELECT A.codigo, A.nombre, NVL(TO_CHAR(A.practicos), 'No tiene') "CREDITOS PRACTICOS"
FROM asignaturas A, matricular M, alumnos AL
WHERE AL.nombre = 'Nicolas' AND AL.apellido1 = 'Bersabe' AND 
      AL.apellido2 = 'Alba' AND M.asignatura = A.codigo AND M.alumno = AL.dni;


-- 3. ¿?

SELECT P.nombre, P.apellido1, P.apellido2, TRUNC((SYSDATE - P.antiguedad) / 7) "NUMERO DE SEMANAS COMPLETAS",
       NEXT_DAY(SYSDATE - 1, TO_CHAR(P.antiguedad, 'Day')) "CICLO DE SEMANA COMPLETA"
FROM profesores P, departamentos D
WHERE D.codigo = 4;


-- 4.

SELECT *
FROM alumnos AL, matricular M, asignaturas A
WHERE A.nombre = 'Bases de Datos' AND M.calificacion != 'SP' AND
      A.codigo = M.asignatura AND M.alumno = AL.dni;


-- 5. ¿?

SELECT DISTINCT P.id, P.nombre, P.apellido1, P.apellido2, A.codigo, A.nombre
FROM profesores P, impartir I, asignaturas A
WHERE P.id = I.profesor AND A.codigo = I.asignatura;


--------------------------------------------------------------------------------

-- 6. -- Terminar

SELECT A1.nombre "NOMBRE1", A2.nombre "NOMBRE2"
FROM alumnos A1, alumnos A2
WHERE A1.apellido1 = A2.apellido1;


-- 7.




-- 8. -- Terminar

SELECT P1.nombre, P1.apellido1, P1.apellido2, TRUNC(MONTHS_BETWEEN(SYSDATE, P1.antiguedad)/12), 
       P2.nombre, P2.apellido1, P2.apellido2, TRUNC(MONTHS_BETWEEN(SYSDATE, P2.antiguedad)/12)
FROM profesores P1, profesores P2
WHERE P1.nrp < P2.nrp AND P1.departamento = P2.departamento AND
      ABS(MONTHS_BETWEEN(P1.antiguedad, P2.antiguedad)) < (12*2);


-- 9. -- Terminar

SELECT ella.nombre || ' ' || ella.apellido1 || ' ' || ella.apellido2 "Ella", 
       el.nombre || ' ' || el.apellido1 || ' ' || el.apellido2 "El"
FROM (alumnos ella join matricular mella on mella.alumno = ella.dni), 
     (alumnos el join matricular mel on mel.alumno = el.dni)
WHERE ella.genero = 'FEM' AND el.genero = 'MASC' AND mella.asignatura = 112 AND mel.asignatura = 112 AND 
      DECODE(mella.calificacion, 'SP', 0, 'AP', 1, 'NT', 2, 'SB', 3, 'MH', 4) > DECODE(mel.calificacion, 'SP', 0, 'AP', 1, 'NT', 2, 'SB', 3, 'MH', 4) AND 
      TO_CHAR(el.fecha_prim_matricula, 'YYYY') = TO_CHAR(ella.fecha_prim_matricula, 'YYYY') AND 
      TO_CHAR(el.fecha_prim_matricula, 'IW') = TO_CHAR(ella.fecha_prim_matricula, 'IW');


-- 10.




--------------------------------------------------------------------------------

-- 11. GitHub 5

SELECT ALUMNOS.nombre, ALUMNOS.apellido1, ALUMNOS.apellido2, ASIGNATURAS.nombre, 
       DECODE(M.calificacion, 'SP', 'Suspenso', 'AP', 'Aprobado', 'NT', 'Notable', 'SB', 'Sobresaliente', 'MH', 'Matricula de honor')
FROM alumnos ALUMNOS, asignaturas ASIGNATURAS, matricular M
WHERE MONTHS_BETWEEN(SYSDATE, ALUMNOS.fecha_nacimiento) > (22 * 12) AND 
      M.alumno = ALUMNOS.dni AND M.asignatura = ASIGNATURAS.codigo ORDER BY 
      ALUMNOS.apellido1, ALUMNOS.apellido2, ALUMNOS.nombre DESC;


-- 12. GitHub 11

SELECT nombre, apellido1, apellido2
FROM alumnos

INTERSECT

SELECT A.nombre, A.apellido1, A.apellido2
FROM alumnos A, profesores P, impartir I, matricular M
WHERE A.dni = M.alumno AND M.asignatura = I.asignatura AND 
      I.profesor = P.nrp AND P.nombre = 'Enrique' AND P.apellido1 = 'Soler' AND 
      I.turno = M.turno ORDER BY apellido1, apellido2, nombre;


-- 13. GitHub 18

SELECT DISTINCT alu.nombre, alu.apellido1, alu.apellido2
FROM alumnos alu, matricular m, impartir i, departamentos d, profesores p
WHERE d.nombre like 'Lenguajes y Ciencias%' AND d.codigo=p.departamento AND 
      i.profesor=p.nrp AND i.asignatura=m.asignatura AND m.alumno=alu.dni;


-- 14.




-- 15.




--------------------------------------------------------------------------------

-- 16. GitHub 7

SELECT codigo
FROM asignaturas
WHERE codigo NOT IN(SELECT asignatura
	                FROM impartir)
      ORDER BY codigo ASC;


-- 17. GitHub 9

SELECT email
FROM alumnos
WHERE email IS NOT NULL

UNION

SELECT email
FROM profesores
WHERE email IS NOT NULL;


-- 18. GitHub 10

(SELECT apellido1
FROM profesores

UNION

SELECT apellido2
FROM profesores)

INTERSECT

(SELECT apellido1
FROM alumnos

UNION

SELECT apellido2
FROM alumnos);


-- 19. GitHub 16

SELECT apellido1
FROM alumnos
WHERE apellido1 like '%ll%'

UNION

SELECT apellido2
FROM alumnos
WHERE apellido2 like '%ll%'

UNION

SELECT apellido1
FROM profesores
WHERE apellido1 like '%ll%'

UNION

SELECT apellido2
FROM profesores
WHERE apellido2 like '%ll%';


-- 20. GitHub 17

SELECT REPLACE(apellido1,'ll','y')
FROM(
	SELECT apellido1
	FROM alumnos
	WHERE apellido1 like '%ll%'
    
	UNION
    
	SELECT apellido2
	FROM alumnos
	WHERE apellido2 like '%ll%'
    
	UNION
    
	SELECT apellido1
	FROM profesores
	WHERE apellido1 like '%ll%'
    
	UNION
    
	SELECT apellido2
	FROM profesores
	WHERE apellido2 like '%ll%'
);


--------------------------------------------------------------------------------

-- 21. GitHub 12

SELECT a.nombre, i.profesor
FROM asignaturas a LEFT OUTER JOIN impartir i ON a.codigo = i.asignatura
WHERE a.creditos<>(a.teoricos+a.practicos);


-- 22. GitHub 15

SELECT p1.nombre, p1.apellido1, p1.apellido2, p2.nombre, p2.apellido1, p2.apellido2
FROM profesores p1 LEFT OUTER JOIN profesores p2 ON p1.director_tesis=p2.nrp
ORDER BY apellido1, apellido2, nombre;


-- 23. GitHub 3

SELECT 'El director de '||P1.nombre||' '||P1.apellido1||' '||P1.apellido2||' es '||P2.nombre||' '||P2.apellido1||' '||P2.apellido2, TRUNC(MONTHS_BETWEEN(SYSDATE, P2.antiguedad)/(12*6))
FROM profesores P1, profesores P2
WHERE P1.director_tesis=P2.NRP;


-- 24. GitHub 23

SELECT nombre, apellido1, apellido2, null, null, null
FROM alumnos
WHERE dni NOT IN(
	SELECT alu1.dni
	FROM (alumnos alu1 join alumnos alu2 on alu1.fecha_prim_matricula=alu2.fecha_prim_matricula)
	WHERE alu1.dni<>alu2.dni)
UNION
SELECT alu1.nombre, alu1.apellido1, alu1.apellido2, alu2.nombre, alu2.apellido1, alu2.apellido2
FROM (alumnos alu1 join alumnos alu2 on alu1.fecha_prim_matricula=alu2.fecha_prim_matricula)
WHERE alu1.dni<>alu2.dni
ORDER BY apellido1, apellido2, nombre;


-- 25.




--------------------------------------------------------------------------------

-- 26.


-- 27. GitHub 13

SELECT *
FROM (SELECT DISTINCT nombre, apellido1, apellido2
	FROM alumnos alu, matricular m
	WHERE alu.sexo='FEM'
	AND m.alumno=alu.dni
	AND m.asignatura=115)
WHERE ROWNUM<=2;


-- 28. GitHub 14

SELECT *
FROM profesores
MINUS
SELECT p1.*
FROM profesores p1, profesores p2
WHERE p1.nrp=p2.director_tesis;


-- 29. GitHub 21

SELECT DISTINCT asi.nombre, asi.codigo
FROM asignaturas asi, asignaturas aux
WHERE asi.curso=aux.curso
AND aux.creditos>asi.creditos;


-- 30. GitHub 22

SELECT nombre, codigo
FROM asignaturas
MINUS
SELECT DISTINCT asi.nombre, asi.codigo
FROM asignaturas asi, asignaturas aux
WHERE asi.curso=aux.curso
AND aux.creditos>asi.creditos;

