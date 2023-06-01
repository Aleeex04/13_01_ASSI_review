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

