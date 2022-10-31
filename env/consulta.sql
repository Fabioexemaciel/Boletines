SELECT a.Nombre, a.Apellido, c.anio, c.div FROM ALUMNOS AS a LEFT JOIN CURSOS AS c ON a.Curso = c.id
SELECT m.nombre, r.rubrica FROM ASIGNATURAS AS a
LEFT JOIN MATERIAS AS m
ON a.materia = m.id
LEFT JOIN RUBRICASXMATERIA AS rxm
ON m.id = rxm.materia
LEFT JOIN RUBRICAS AS R
ON rxm.rubrica = r.id
