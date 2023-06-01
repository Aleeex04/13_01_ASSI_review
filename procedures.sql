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
