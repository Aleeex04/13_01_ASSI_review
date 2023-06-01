# 13_01_ASSI_review
## Recovery from suspended blocks:

* 01_understand_databases_basic_principles(MySQL and PostgreSQL)
* 03_Introduction_to_the_Relational_Model(Relations)
* 09_Advanced_SQL_2(functions,procedures, cursors, triggers) 


The project consists of creating an equal database in both PostgreSQL and MySQL. In the SQL branch you will be able to see both the ddl of the two databases as well as the different procedures, triggers, cursors, etc... On the other hand, in the Querys-Relational-Algebra branch you will see five examples of queries both in SQL language and in relational algebra.

![Untitled](https://github.com/Aleeex04/13_01_ASSI_review/blob/main/Diagrama%20ERD.png?raw=true)

## Relaciones:

### Relación 1:N (uno a muchos):

La tabla "Profesores" tiene una relación 1:N con la tabla "Materias". Un profesor puede impartir varias materias, pero una materia solo puede ser impartida por un profesor. La clave externa se encuentra en la tabla "Materias" (columna "id_profesor") y hace referencia a la clave primaria de la tabla "Profesores" (columna "id").

La tabla "Estudiantes" tiene una relación 1:N con la tabla "Calificaciones". Un estudiante puede tener varias calificaciones, pero cada calificación pertenece solo a un estudiante. La clave externa se encuentra en la tabla "Calificaciones" (columna "id_estudiante") y hace referencia a la clave primaria de la tabla "Estudiantes" (columna "id").

La tabla "Cursos" tiene una relación 1:N con la tabla "Inscripciones". Un curso puede tener varias inscripciones, pero cada inscripción pertenece solo a un curso. La clave externa se encuentra en la tabla "Inscripciones" (columna "id_curso") y hace referencia a la clave primaria de la tabla "Cursos" (columna "id").

La tabla "Cursos" tiene una relación 1:N con la tabla "Tareas". Un curso puede tener varias tareas, pero cada tarea pertenece solo a un curso. La clave externa se encuentra en la tabla "Tareas" (columna "id_curso") y hace referencia a la clave primaria de la tabla "Cursos" (columna "id").

La tabla "Tareas" tiene una relación 1:N con la tabla "Entregas". Una tarea puede tener varias entregas, pero cada entrega pertenece solo a una tarea. La clave externa se encuentra en la tabla "Entregas" (columna "id_tarea") y hace referencia a la clave primaria de la tabla "Tareas" (columna "id").

La tabla "Estudiantes" tiene una relación 1:N con la tabla "Entregas". Un estudiante puede realizar varias entregas, pero cada entrega pertenece solo a un estudiante. La clave externa se encuentra en la tabla "Entregas" (columna "id_estudiante") y hace referencia a la clave primaria de la tabla "Estudiantes" (columna "id").

La tabla "Estudiantes" tiene una relación 1:N con la tabla "Notas". Un estudiante puede tener varias notas, pero cada nota pertenece solo a un estudiante. La clave externa se encuentra en la tabla "Notas" (columna "id_estudiante") y hace referencia a la clave primaria de la tabla "Estudiantes" (columna "id").

La tabla "Materias" tiene una relación 1:N con la tabla "Notas". Una materia puede tener varias notas, pero cada nota pertenece solo a una materia. La clave externa se encuentra en la tabla "Notas" (columna "id_materia") y hace referencia a la clave primaria de la tabla "Materias" (columna "id").

La tabla "Cursos" tiene una relación 1:N con la tabla "Horarios". Un curso puede tener varios horarios, pero cada horario pertenece solo a un curso. La clave externa se encuentra en la tabla "Horarios" (columna "id_curso") y hace referencia a la clave primaria de la tabla "Cursos" (columna "id").

La tabla "Estudiantes" tiene una relación 1:N con la tabla "Tutores". Un estudiante puede tener varios tutores, pero cada tutor pertenece solo a un estudiante. La clave externa se encuentra en la tabla "Tutores" (columna "id_estudiante") y hace referencia a la clave primaria de la tabla "Estudiantes" (columna "id").

### Relación N:N (muchos a muchos):
La tabla "Estudiantes" y la tabla "Cursos" tienen una relación N:N a través de la tabla "Inscripciones". Un estudiante puede inscribirse en varios cursos, y un curso puede tener varios estudiantes inscritos. La tabla "Inscripciones" actúa como una tabla de enlace y contiene las claves externas que hacen referencia a las claves primarias de las tablas "Estudiantes" y "Cursos".

### Relación 1:1 (uno a uno):

La tabla "Estudiantes" y la tabla "Tutores" tienen una relación 1:1. Cada estudiante puede tener un tutor asignado, y un tutor pertenece solo a un estudiante. La clave externa se encuentra en la tabla "Tutores" (columna "id_estudiante") y hace referencia a la clave primaria de la tabla "Estudiantes" (columna "id").
