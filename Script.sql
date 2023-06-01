 -- Creación de la tabla "Estudiantes"
CREATE TABLE Estudiantes (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  direccion VARCHAR(200),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Creación de la tabla "Profesores"
CREATE TABLE Profesores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(100),
  fecha_contratacion DATE,
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Creación de la tabla "Materias"
CREATE TABLE Materias (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  codigo VARCHAR(20),
  creditos INT,
  id_profesor INT,
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id)
);

-- Creación de la tabla "Calificaciones"
CREATE TABLE Calificaciones (
  id SERIAL PRIMARY KEY,
  id_estudiante INT,
  id_materia INT,
  calificacion FLOAT,
  fecha_registro DATE,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_materia) REFERENCES Materias(id)
);

-- Creación de la tabla "Cursos"
CREATE TABLE Cursos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  fecha_inicio DATE,
  fecha_fin DATE,
  id_profesor INT,
  activo BOOLEAN DEFAULT true, 
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id)
);

-- Creación de la tabla "Inscripciones"
CREATE TABLE Inscripciones (
  id SERIAL PRIMARY KEY,
  id_estudiante INT,
  id_curso INT,
  fecha_inscripcion DATE,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla "Tareas"
CREATE TABLE Tareas (
  id SERIAL PRIMARY KEY,
  id_curso INT,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  fecha_entrega DATE,
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla "Entregas"
CREATE TABLE Entregas (
  id SERIAL PRIMARY KEY,
  id_tarea INT,
  id_estudiante INT,
  archivo VARCHAR(100),
  fecha_entrega DATE,
  FOREIGN KEY (id_tarea) REFERENCES Tareas(id),
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id)
);

-- Creación de la tabla "Notas"
CREATE TABLE Notas (
  id SERIAL PRIMARY KEY,
  id_estudiante INT,
  id_materia INT,
  nota FLOAT,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_materia) REFERENCES Materias(id)
);

-- Creación de la tabla "Horarios"
CREATE TABLE Horarios (
  id SERIAL PRIMARY KEY,
  id_curso INT,
  dia_semana VARCHAR(20),
  hora_inicio TIME,
  hora_fin TIME,
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla "Tutores"
CREATE TABLE Tutores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100),
  id_estudiante INT,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id)
);

----------------------------------------------------------------

--Cursor para obtener el nombre y la especialidad de todos los profesores:
CREATE OR REPLACE FUNCTION obtener_profesores()
RETURNS SETOF Profesores AS $$
DECLARE
    profesor Profesores%ROWTYPE;
    cursor_profesores CURSOR FOR SELECT nombre, especialidad FROM Profesores;
BEGIN
    OPEN cursor_profesores;
    LOOP
        FETCH cursor_profesores INTO profesor.nombre, profesor.especialidad;
        EXIT WHEN NOT FOUND;
        RETURN NEXT profesor;
    END LOOP;
    CLOSE cursor_profesores;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: SELECT * FROM obtener_profesores();


--Cursor para obtener todas las tareas y sus fechas de entrega de un curso:
CREATE OR REPLACE FUNCTION obtener_tareas_curso(curso_id INT)
RETURNS SETOF Tareas AS $$
DECLARE
    tarea Tareas%ROWTYPE;
    cursor_tareas CURSOR FOR SELECT * FROM Tareas WHERE id_curso = curso_id;
BEGIN
    OPEN cursor_tareas;
    LOOP
        FETCH cursor_tareas INTO tarea;
        EXIT WHEN NOT FOUND;
        RETURN NEXT tarea;
    END LOOP;
    CLOSE cursor_tareas;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: SELECT * FROM obtener_tareas_curso(1);

----------------------------------------------------------------
-- Función para obtener el promedio de calificaciones de un estudiante en todas las materias:

CREATE OR REPLACE FUNCTION obtener_promedio_estudiante(estudiante_id INT)
RETURNS FLOAT AS $$
DECLARE
    promedio FLOAT;
BEGIN
    SELECT AVG(calificacion) INTO promedio
    FROM Calificaciones
    WHERE id_estudiante = estudiante_id;
    
    RETURN promedio;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: SELECT obtener_promedio_estudiante(1);

--Función para contar el número de estudiantes inscritos en un curso:

CREATE OR REPLACE FUNCTION contar_estudiantes_curso(curso_id INT)
RETURNS INT AS $$
DECLARE
    cantidad_estudiantes INT;
BEGIN
    SELECT COUNT(*) INTO cantidad_estudiantes
    FROM Inscripciones
    WHERE id_curso = curso_id;
    
    RETURN cantidad_estudiantes;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: SELECT contar_estudiantes_curso(1);

----------------------------------------------------------------
--Procedimiento para actualizar la dirección de un estudiante:

CREATE OR REPLACE PROCEDURE actualizar_direccion_estudiante(estudiante_id INT, nueva_direccion VARCHAR)
AS $$
BEGIN
    UPDATE Estudiantes
    SET direccion = nueva_direccion
    WHERE id = estudiante_id;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: CALL actualizar_direccion_estudiante(1, 'Calle Principal 321');


--Procedimiento para asignar un profesor a una materia:
CREATE OR REPLACE PROCEDURE asignar_profesor_materia(materia_id INT, profesor_id INT)
AS $$
BEGIN
    UPDATE Materias
    SET id_profesor = profesor_id
    WHERE id = materia_id;
END;
$$ LANGUAGE plpgsql;

--EJEMPLO: CALL asignar_profesor_materia(1, 1);

----------------------------------------------------------------
--Trigger para actualizar la fecha de registro de una calificación antes de insertarla:
CREATE OR REPLACE FUNCTION actualizar_fecha_registro()
RETURNS TRIGGER AS $$
BEGIN
    NEW.fecha_registro := current_date;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER actualizacion_fecha_registro
BEFORE INSERT ON Calificaciones
FOR EACH ROW
EXECUTE FUNCTION actualizar_fecha_registro();

--EJEMPLO: INSERT INTO Calificaciones (id_estudiante, id_materia, calificacion) VALUES (1, 1, 8.5);

--Trigger para desactivar un curso cuando se elimina su último estudiante inscrito:
CREATE OR REPLACE FUNCTION desactivar_curso()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Cursos
    SET activo = false
    WHERE id = OLD.id_curso
    AND NOT EXISTS (
        SELECT 1
        FROM Inscripciones
        WHERE id_curso = OLD.id_curso
        AND id != OLD.id
    );
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER desactivar_curso_trigger
AFTER DELETE ON Inscripciones
FOR EACH ROW
EXECUTE FUNCTION desactivar_curso();

--Este trigger está diseñado para desactivar un curso en la tabla "Cursos" 
--cuando todas las inscripciones relacionadas con ese curso han sido eliminadas. 

