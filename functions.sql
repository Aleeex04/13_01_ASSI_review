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
