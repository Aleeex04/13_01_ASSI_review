-- Ejemplos para la tabla "Estudiantes"
INSERT INTO Estudiantes (nombre, fecha_nacimiento, direccion, telefono, email)
VALUES ('Juan', '1998-05-15', 'Calle Principal 123', '555-1234', 'juan@example.com'),
       ('María', '1999-09-22', 'Avenida Central 456', '555-5678', 'maria@example.com'),
       ('Carlos', '2000-03-10', 'Calle Secundaria 789', '555-7890', 'carlos@example.com');

--Ejemplos para la tabla "Profesores"
INSERT INTO Profesores (nombre, especialidad, fecha_contratacion, telefono, email)
VALUES ('Pedro', 'Matemáticas', '2022-01-05', '555-1111', 'pedro@example.com'),
       ('Ana', 'Historia', '2021-08-15', '555-2222', 'ana@example.com'),
       ('Laura', 'Ciencias', '2023-02-20', '555-3333', 'laura@example.com');

-- Ejemplos para la tabla "Materias"
INSERT INTO Materias (nombre, codigo, creditos, id_profesor)
VALUES ('Matemáticas', 'MAT', 3, 1),
       ('Historia', 'HISA', 4, 2);

--Ejemplos para la tabla "Calificaciones"
INSERT INTO Calificaciones (id_estudiante, id_materia, calificacion, fecha_registro)
VALUES (1, 1, 9.5, '2023-05-15'),
       (1, 2, 8.7, '2023-05-20'),
       (2, 2, 7.8, '2023-05-18');

-- Ejemplos para la tabla "Cursos"
INSERT INTO Cursos (nombre, descripcion, fecha_inicio, fecha_fin, id_profesor)
VALUES ('Curso de Matemáticas Avanzadas', 'Curso de matemáticas', '2023-06-01', '2023-06-30', 1),
       ('Curso de Historia del Arte', 'Curso de historia del arte', '2023-07-01', '2023-07-31', 2);

-- Ejemplos para la tabla "Inscripciones"
INSERT INTO Inscripciones (id_estudiante, id_curso, fecha_inscripcion)
VALUES (1, 1, '2023-05-25'),
       (1, 2, '2023-05-27'),
       (2, 2, '2023-05-26');

-- Ejemplos para la tabla "Tareas"
INSERT INTO Tareas (id_curso, nombre, descripcion, fecha_entrega)
VALUES (1, 'Tarea 1', 'Realizar ejercicios', '2023-06-10'),
       (1, 'Tarea 2', 'Investigar', '2023-06-15');

-- Ejemplos para la tabla "Entregas"
INSERT INTO Entregas (id_tarea, id_estudiante, archivo, fecha_entrega)
VALUES (1, 1, 'tarea1.pdf', '2023-06-10'),
       (1, 2, 'tarea1.pdf', '2023-06-11'),
       (2, 1, 'tarea2.pdf', '2023-06-15');

-- Ejemplos para la tabla "Notas"
INSERT INTO Notas (id_estudiante, id_materia, nota)
VALUES (1, 1, 9),
       (1, 2, 8.5),
       (2, 2, 7.2);

-- Ejemplos para la tabla "Horarios"
INSERT INTO Horarios (id_curso, dia_semana, hora_inicio, hora_fin)
VALUES (1, 'Lunes', '09:00:00', '11:00:00'),
       (1, 'Miércoles', '09:00:00', '11:00:00'),
       (2, 'Martes', '14:00:00', '16:00:00');

-- Ejemplos para la tabla "Tutores"
INSERT INTO Tutores (nombre, telefono, email, id_estudiante)
VALUES ('Tutor 1', '222222222', 'tutor1@example.com', 1),
       ('Tutor 2', '555555555', 'tutor2@example.com', 2);
