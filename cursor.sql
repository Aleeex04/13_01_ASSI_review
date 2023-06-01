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
