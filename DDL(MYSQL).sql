 -- Creación de la base de datos
CREATE DATABASE colegio;

-- Uso de la base de datos
USE colegio;

-- Creación de la tabla "Estudiantes"
CREATE TABLE Estudiantes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  direccion VARCHAR(200),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Creación de la tabla "Profesores"
CREATE TABLE Profesores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(100),
  fecha_contratacion DATE,
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Creación de la tabla "Materias"
CREATE TABLE Materias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  codigo VARCHAR(20),
  creditos INT,
  id_profesor INT,
  FOREIGN KEY (id_profesor) REFERENCES Profesores(id)
);

-- Creación de la tabla "Calificaciones"
CREATE TABLE Calificaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_estudiante INT,
  id_materia INT,
  calificacion FLOAT,
  fecha_registro DATE,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_materia) REFERENCES Materias(id)
);

-- Creación de la tabla "Cursos"
CREATE TABLE Cursos (
  id INT PRIMARY KEY AUTO_INCREMENT,
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
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_estudiante INT,
  id_curso INT,
  fecha_inscripcion DATE,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla "Tareas"
CREATE TABLE Tareas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_curso INT,
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  fecha_entrega DATE,
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);

-- Creación de la tabla "Entregas"
CREATE TABLE Entregas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_tarea INT,
  id_estudiante INT,
  archivo VARCHAR(100),
  fecha_entrega DATE,
  FOREIGN KEY (id_tarea) REFERENCES Tareas(id),
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id)
);

-- Creación de la tabla "Notas"
CREATE TABLE Notas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_estudiante INT,
  id_materia INT,
  nota FLOAT,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id),
  FOREIGN KEY (id_materia) REFERENCES Materias(id)
);

-- Creación de la tabla "Horarios"
CREATE TABLE Horarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_curso INT,
  dia_semana VARCHAR(20),
  hora_inicio TIME,
  hora_fin TIME,
  FOREIGN KEY (id_curso) REFERENCES Cursos(id)
);
-- Creación de la tabla "Tutores"
CREATE TABLE Tutores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(100),
  id_estudiante INT,
  FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id)
);

