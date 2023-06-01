# 13_01_ASSI_review
## Recovery from suspended blocks:
## 03_Introduction_to_the_Relational_Model

### Query 1

SQL: SELECT nombre, descripcion FROM Cursos WHERE activo = true;

Relational Algebra: π(nombre, descripcion)(σ(activo = true)(Cursos))

This query returns the name and description of the active courses.


### Query 2

SQL: SELECT nombre, fecha_nacimiento FROM Profesores;

Relational Algebra: π(nombre, fecha_nacimiento)(Profesores)

This query returns the name and date of birth of the teachers.


### Query 3

SQL: SELECT Cursos.nombre, COUNT(Inscripciones.id_estudiante) AS cantidad_estudiantes FROM Cursos LEFT JOIN Inscripciones ON Cursos.id = Inscripciones.id_curso GROUP BY Cursos.nombre;

Relational Algebra: π(Cursos.nombre, COUNT(Inscripciones.id_estudiante))(Cursos ⨝ Inscripciones)

This query displays the name and number of students enrolled in each course.


### Query 4

SQL: SELECT Profesores.nombre, Profesores.especialidad FROM Profesores INNER JOIN Materias ON Profesores.id = Materias.id_profesor;

Relational Algebra: π Profesores.nombre, Profesores.especialidad (Profesores ⨝ Materias[Profesores.id = Materias.id_profesor])

This query returns the name and major of all teachers who are assigned to at least one subject.


### Query 5

SQL: SELECT Estudiantes.nombre, Materias.nombre AS materia, Calificaciones.calificacion
FROM Calificaciones
INNER JOIN Estudiantes ON Calificaciones.id_estudiante = Estudiantes.id
INNER JOIN Materias ON Calificaciones.id_materia = Materias.id;

Relational Algebra: π Estudiantes.nombre, Materias.nombre AS materia, Calificaciones.calificacion ((Calificaciones ⨝ Estudiantes[Calificaciones.id_estudiante = Estudiantes.id]) ⨝ Materias[Calificaciones.id_materia = Materias.id])

This query displays the student's name, subject, and corresponding grade for all grades recorded.
